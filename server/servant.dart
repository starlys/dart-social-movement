import 'dart:async';
import 'dart:math';
import 'twotier/wtypes.dart';
import 'misc_lib.dart';
import 'date_lib.dart';
import 'diff_lib.dart';
import 'conv_lib.dart';
import 'query_clause_builder.dart';
import 'proposal_lib.dart';
import 'permissions.dart';
import 'clean_deleter.dart';
import 'twotier/wlib.dart';
import 'api_globals.dart';
import 'authenticator.dart';
import 'database.dart';
import 'image_lib.dart';
import 'config_settings.dart';

///exposed public API methods
@ApiClass(version: 'v1')
class Servant {

  ///bounce back the given code/message
  /// verify with: http://localhost:8083/servant/v1/HelloWorld?errorCode=x&errorMessage=y
  @ApiMethod(method: 'GET', path: 'HelloWorld')
  APIResponseBase helloWorld({String errorCode, String errorMessage}) {
    return new APIResponseBase()
      ..ok = 'Y'
      ..errorCode = errorCode
      ..errorMessage = errorMessage;
  }

  //check credentials, and return some extra info if valid
  @ApiMethod(method: 'POST', path: 'Authenticate')
  Future<AuthenticateResponse> authenticate(APIRequestBase args) async {
    AuthenticateResponse r = new AuthenticateResponse();
    AuthInfo ai = await Authenticator.authenticateForAPI(args);

    //require login
    Authenticator.ensureLoggedIn(ai, r.base);
    if (!r.base.isOK) return r;

    //fill in response
    r.userId = ai.id;
    r.publicName = ai.publicName;
    r.isSiteAdmin = ai.isSiteAdmin ? 'Y' : 'N';
    r.nick = ai.nick;
    return r;
  }

  //get all categories matching kind; no authentication
  @ApiMethod(method: 'POST', path: 'CategoryQuery')
  Future<CategoryQueryResponse> categoryQuery(CategoryQueryRequest args) async {
    CategoryQueryResponse r = new CategoryQueryResponse();
    await Database.safely('CategoryQuery', r.base, (db) async {
      r.categories = new List<CategoryItemResponse>();
      await for (Row row in db.query('select * from category where kind=@k order by title',
        {'k': args.kind})) {
        var item = new CategoryItemResponse()
          ..id = row.id
          ..parentId = row.parent_id
          ..title = row.title
          ..description = row.description;
        r.categories.add(item);
      }
    });
    return r;
  }

  //save a category (new, edited, or reparented)
  @ApiMethod(method: 'POST', path: 'CategorySave')
  Future<APIResponseBase> categorySave(CategorySaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be site admin
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureSiteAdmin(ai, r);
    if (!r.isOK) return r;

    await Database.safely('CategorySave', r, (db) async {
      //get referenced parent in sister mode
      int parentOfRef = null;
      if (args.referenceMode == 'S'){
        parentOfRef = await MiscLib.queryScalar(db, 'select parent_id from category where id=${args.referenceId}');
      }

      //create or update
      if (args.catId != null && args.catId > 0) {
        //update
        String sql = 'update category set kind=@k,title=@t,description=@d';
        if (args.referenceMode == 'C') sql += ',parent_id=${args.referenceId}';
        if (args.referenceMode == 'S') sql += ',parent_id=${parentOfRef}'; //null ok
        sql += ' where id=${args.catId}';
        await db.execute(sql, {'k':args.kind, 't':args.title, 'd':args.description});
      } else {
        //create
        String sql = 'insert into category(parent_id,kind,title,description)values(@p,@k,@t,@d)';
        int parentId = null;
        if (args.referenceMode == 'C') parentId = args.referenceId;
        if (args.referenceMode == 'S') parentId = parentOfRef;
        await db.execute(sql, {'p':parentId, 'k':args.kind, 't':args.title, 'd':args.description});
      }
    });
    return r;
  }

  //delete a category and relink all references
  @ApiMethod(method: 'POST', path: 'CategoryDelete')
  Future<APIResponseBase> categoryDelete(CategoryDeleteRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be site admin
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureSiteAdmin(ai, r);
    if (!r.isOK) return r;

    await Database.safely('CategoryDelete', r, (db) async {
      //get parent cat (which is null if top level)
      int catToDelete = args.catId;
      int parentOfDeleted = await MiscLib.queryScalar(db, 'select parent_id from category where id=${catToDelete} and kind=@k',
        {'k': args.kind});

      //get whether deleting cat has projects or resources
      int countProjects = (await MiscLib.queryScalar(db, 'select count(*) from project where category_id=${catToDelete}') ?? 0);
      int countResources = (await MiscLib.queryScalar(db, 'select count(*) from resource where category_id=${catToDelete}') ?? 0);

      //fail if has proj/resources and is top level (it wouldn't be possible to reparent
      // those records)
      if (parentOfDeleted == null && (countProjects > 0 || countResources > 0))
        throw new Exception('Cannot delete top level category that has projects or resources');

      //fail if this is the only cat left
      int countOtherCats = (await MiscLib.queryScalar(db, 'select count(*) from category where kind=@k and id<>${catToDelete}',
        {'k': args.kind}) ?? 0);
      if (countOtherCats == 0) throw new Exception('Cannot delete last category');

      //relink child categories
      await db.execute('update category set parent_id=${parentOfDeleted} where parent_id=${catToDelete}');

      //relink child projects and resources
      if (args.kind == 'P') {
        await db.execute('update project set category_id=${parentOfDeleted} where category_id=${catToDelete}');
      }
      if (args.kind == 'R') {
        await db.execute('update resource set category_id=${parentOfDeleted} where category_id=${catToDelete}');
      }

      //delete
      await db.execute('delete from category where id=${catToDelete}');
    });
    return r;
  }

  //move projects/resources from one category to another
  @ApiMethod(method: 'POST', path: 'CategoryMoveContents')
  Future<APIResponseBase> categoryMoveContents(CategoryMoveContentsRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be site admin
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureSiteAdmin(ai, r);
    if (!r.isOK) return r;

    //process args.relatedIds to make sure it's in the right format (prevent sql
    // injection)
    //List<int> ids = args.relatedIds.split(',').map((s) => int.parse(s.trim())).where((i) => i > 0).toList();
    String inClause = args.relatedIds.join(',');

    await Database.safely('CategoryMoveContents', r, (db) async {
      //relink projects and resources
      if (args.kind == 'P') {
        await db.execute('update project set category_id=${args.catId} where id in (${inClause})');
      }
      if (args.kind == 'R') {
        await db.execute('update resource set category_id=${args.catId} where id in (${inClause})');
      }
    });
    return r;
  }

  //full text search in convs and posts
  @ApiMethod(method: 'POST', path: 'ConvQuery')
  Future<ConvQueryResponse> convQuery(ConvQueryRequest args) async {
    ConvQueryResponse r = new ConvQueryResponse();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r.base);
    if (!r.base.isOK) return r;

    //process args (prevent sql injection)
    String searchTerm = args.term.replaceAll('\'', '');

    await Database.safely('ConvQuery', r.base, (db) async {
      await ConvLib.find(db, ai.id, searchTerm, r);
    });
    return r;
  }

  ///get conv and post detail;
  /// if conv was recommended/invited, can have side effect of changing staus
  @ApiMethod(method: 'POST', path: 'ConvGet')
  Future<ConvGetResponse> convGet(ConvGetRequest args) async {
    ConvGetResponse r = new ConvGetResponse();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r.base);
    if (!r.base.isOK) return r;

    await Database.safely('ConvGet', r.base, (db) async {
      //function to load joinRow
      Row joinRow = null;
      Future loadJoinRow() async {
        List<Row> joinRows = await db.query('select status,"like",bookmarked,read_position from conv_xuser where conv_id=${args.convId} and xuser_id=${ai.id}').toList();
        joinRow = joinRows.length > 0 ? joinRows[0] : null;
      };

      //get conv record and conv_xuser record if any
      Row convRow = await MiscLib.querySingleChecked(db, 'select project_id,event_id,title,open,from_conv_id,open,post_max_size,xuser_daily_max,last_activity,delete_time from conv where id=${args.convId}', 'Conversation does not exist');
      int projectId = convRow.project_id; //null ok
      int eventId = convRow.event_id; //null ok
      await loadJoinRow();

      //if was invited, treat opening the conv as an implicit acceptance of the
      // invite
      if (joinRow != null && joinRow.status == 'I') {
        db.execute('update conv_xuser set status=\'J\' where conv_id=${args.convId} and xuser_id=${ai.id}');
        await loadJoinRow();
      }

      //figure read position, and whether it is at the beginning or not
      DateTime earliestTime = WLib.utc1970();
      DateTime readPosition = earliestTime;
      bool anySkipped = false; //true if un unread mode, the returned list of posts omits those already read
      if (joinRow != null) {
        readPosition = joinRow.read_position;
        if (readPosition.isAfter(earliestTime) && args.mode == 'U') anySkipped = true;
        //This is not a valid test because the read position could be on the 2nd
        // post; wait to solve this problem until we have post sequence numbers
      }

      //look in project or event to determine if user is manager/owner
      bool isManager = await Permissions.isConvManager(db, ai.id, projectId, eventId);

      //get title/pane key of parent proj/event
      if (eventId != null) {
        r.parentTitle = await MiscLib.queryScalar(db, 'select title from event where id=${eventId}');
        r.parentPaneKey = 'event/${eventId}';
      }
      if (projectId != null) {
        r.parentTitle = await MiscLib.queryScalar(db, 'select title from project where id=${projectId}');
        r.parentPaneKey = 'project/${projectId}';
      }

      //set flags based on whether conv is visible
      //But if not visible, it's not an error: still include title in output
      List<int> invisibleConvIds = await ConvLib.invisibleConvs(db, [args.convId], ai.id);
      bool isVisible = invisibleConvIds.length == 0;

      //get posting permissions, or null
      RestrictionInfo postPermissions = null;
      if (isVisible && joinRow != null) {
          postPermissions = await Permissions.getConvPostPermissions(ApiGlobals.config, db, ai.id, args.convId, convRow);
      }

      //load posts
      List<Row> postRows = null;
      if (isVisible) {
        DateTime time1 = WLib.wireToDateTime(args.rangeFromWDT), time2 = WLib.wireToDateTime(args.rangeToWDT);
        if (args.mode == 'U') time2 = readPosition;
        postRows = await ConvLib.selectPosts(db, args.convId, ai.id, projectId,
          first: args.mode != 'R',
          betweenTimes: args.mode == 'R',
          afterTime2: args.mode == 'U',
          all: args.mode == 'A',
          time1: time1, time2: time2);
        if (postRows.length == 1) anySkipped = false;
      }

      //set top level items in output
      r.isManager = isManager ? 'Y' : 'N';
      r.isJoined = 'N';
      r.readPositionWDT = WLib.dateTimeToWire(readPosition);
      r.title = convRow.title;
      r.anySkipped = anySkipped ? 'Y' : 'N';
      r.replyAllowed = 'N';
      r.replyAllowedDesc = '';
      DateTime deleteTime = convRow.delete_time;
      r.deleteMessage = convRow.open == 'Y'
        ? (deleteTime != null ? 'Will be closed on ${DateLib.formatSoonDate(deleteTime)}' : 'Open')
        : 'Closed';
      r.like = 'N';
      r.bookmarked = 'N';
      if (joinRow != null) {
        if (joinRow.status == 'J') r.isJoined = 'Y';
        r.like = joinRow.like;
        r.bookmarked = joinRow.bookmarked;
      }
      if (postPermissions != null && r.isJoined == 'Y') {
        r.replyAllowed = postPermissions.allowedNow ? 'Y' : 'N';
        r.replyAllowedDesc = postPermissions.explanation;
        r.replyMaxLength = postPermissions.charLimit;
      }

      //copy rows into output structure
      r.posts = new List<ConvGetPostItem>();
      DateTime utcNow = WLib.utcNow();
      if (postRows != null) {
        for (Row postRow in postRows) {
          ConvGetPostItem p = new ConvGetPostItem();
          r.posts.add(p);
          p.id = postRow.id;
          p.authorId = postRow.author_id;
          p.authorNick = postRow.nick;
          p.avatarUrl = ImageLib.getAvatarUrl(p.authorId, postRow.avatar_no);//null ok
          p.createdAtWDT = WLib.dateTimeToWire(postRow.created_at);
          p.createdAtReadable = DateLib.formatDateTime(postRow.created_at, ai.timeZoneName);
          p.ago = DateLib.ago(utcNow.difference(postRow.created_at));
          p.ptext = postRow.ptext;
          p.imageUrl = postRow.has_image == 'Y' ? ImageLib.getPostImageUrl(p.id) : null;
          ConvLib.setCollapseMode(p, postRow, isManager);
        }
      }

      //if conv was recommended, then opening the conv is an implicit "quit"
      // because if the user does nothing else, it should not be recommended
      // again
      if (joinRow != null && joinRow.status == 'R') {
        db.execute('update conv_xuser set status=\'Q\' where conv_id=${args.convId} and xuser_id=${ai.id}');
      }
    });
    return r;
  }

  ///get conv rules (for editing)
  @ApiMethod(method: 'POST', path: 'ConvGetRules')
  Future<ConvGetRulesResponse> convGetRules(ConvGetRulesRequest args) async {
    ConvGetRulesResponse r = new ConvGetRulesResponse();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r.base);
    if (!r.base.isOK) return r;

    await Database.safely('ConvGetRules', r.base, (db) async {
      //get from conv
      Row convRow = await MiscLib.querySingleChecked(db, 'select project_id,event_id,post_max_size,xuser_daily_max,title from conv where id=${args.convId}', 'Conversation does not exist');
      int projectId = convRow.project_id; //null ok
      int eventId = convRow.event_id; //null ok

      //must be manager (the info is public, so this check isn't really necessary)
      bool isManager = await Permissions.isConvManager(db, ai.id, projectId, eventId);
      if (!isManager) throw new Exception('Only managers can edit conversation rules.');

      r.postMaxSize = convRow.post_max_size;
      r.userDailyMax = convRow.xuser_daily_max;
      r.title = convRow.title;
    });
    return r;
  }

  ///create new conv or update conv;
  /// the project or event ID must be set for a new blank conv, unless it is
  /// spawned from a post, in which case this method figures out the parent
  /// relationships
  @ApiMethod(method: 'POST', path: 'ConvSave')
  Future<APIResponseBase> convSave(ConvSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ConvSave', r, (db) async {
      bool isNew = args.convId == null || args.convId == 0;
      //int authorId = ai.id;

      //preliminarily, if spawning, get parent keys and author from the source conv
      //and ignore the proj or event that was passed in
      if (args.openingPostId != null) {
        Row openingPostRow = await MiscLib.querySingle(db, 'select author_id,conv_id from conv_post where id=@p',
          {'p': args.openingPostId});
        if (openingPostRow == null) throw new Exception('Source post does not exist');
        //authorId = openingPostRow.author_id;
        Row convRow = await MiscLib.querySingle(db, 'select project_id,event_id from conv where id=${openingPostRow.conv_id}');
        if (convRow == null) throw new Exception('Conversation does not exist');
        args.projectId = convRow.project_id; //null ok
        args.eventId = convRow.event_id; //null ok
      }

      //update existing conv
      if (!isNew) {
        //overwrite proj/event keys from existing conv (they cant be changed)
        Row convRow = await MiscLib.querySingleChecked(db, 'select project_id,event_id from conv where id=${args.convId}', 'Conversation does not exist');
        args.projectId = convRow.project_id; //null ok
        args.eventId = convRow.event_id; //null ok

        //for existing conv, must be manager
        bool isManager = await Permissions.isConvManager(db, ai.id, args.projectId, args.eventId);
        if (!isManager) throw new Exception('Only managers can edit conversations rules.');

        //update
        await db.execute('update conv set title=@t, xuser_daily_max=@m, post_max_size=@p',
          {'t': args.title, 'm': args.userDailyMax, 'p': args.postMaxSize});

      } else { //create new conv
        //user must be joined to parent record
        if (! (await Permissions.isConvCreatable(db, ai.id, args.projectId, args.eventId)))
          throw new Exception('Conversations can be created only if you are a member of the project or event.');

        //create
        DateTime now = WLib.utcNow();
        int convId = await MiscLib.queryScalar(db, 'insert into conv(project_id,event_id,title,open,from_conv_id,post_max_size,xuser_daily_max,created_at,last_activity,activity_flag)'
          'values(${args.projectId},${args.eventId}, @t, \'Y\', ${args.fromConvId}, ${args.postMaxSize}, ${args.userDailyMax}, @d1, @d2, \'N\')'
          'returning id',
          {'t': args.title, 'd1': now, 'd2': now}
          );
        r.newId = convId;

        //join creator to conversation
        await ConvLib.writeConvUser(db, convId, ai.id, 'J', 'I');

        //copy opening post if spawning conv from an existing post
        if (args.openingPostId != null) {
          List<Row> templatePost = await db.query('select author_id,ptext,tw_position,has_image from conv_post where id=@i',
            {'i': args.openingPostId}).toList();
          if (templatePost.length > 0) {
            int authorId = templatePost[0].author_id;
            String ptext = templatePost[0].ptext;
            bool hasImage = templatePost[0].has_image == 'Y';
            int twPosition = templatePost[0].tw_position;
            String newPostId = await ConvLib.writeConvPost(db, convId, authorId, ptext, twPosition, hasImage, WLib.utcNow());
            if (hasImage)
              await ImageLib.duplicatePostImage(args.openingPostId, newPostId);
          }
        }
      }
    });
    return r;
  }

  ///get limited extra info about a post (which would be too inefficient to get in ConvGet)
  @ApiMethod(method: 'POST', path: 'ConvPostGet')
  Future<ConvPostGetResponse> convPostGet(ConvPostGetRequest args) async {
    ConvPostGetResponse r = new ConvPostGetResponse();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r.base);
    if (!r.base.isOK) return r;

    await Database.safely('ConvPostGet', r.base, (db) async {
      //get info from the post
      Row postRow = await MiscLib.querySingle(db, 'select conv_id,author_id,created_at from conv_post where id=@i', {'i': args.postId});
      if (postRow == null) throw new Exception('Post does not exist');
      int convId = postRow.conv_id;
      int authorId = postRow.author_id;

      //get info from the author
      Row authorRow = await MiscLib.querySingle(db, 'select avatar_no,timezone from xuser where id=${authorId}');
      if (authorRow != null) {
        r.avatarUrl = ImageLib.getAvatarUrl(authorId, authorRow.avatar_no);
        r.createdAtReadable = DateLib.formatDateTime(postRow.created_at, authorRow.timezone) + ' (${authorRow.timezone})';
      }

      //get info from the conv
      Row convRow = await MiscLib.querySingleChecked(db, 'select project_id,event_id,post_max_size,xuser_daily_max from conv where id=${convId}', 'Conversation does not exist');
      int projectId = convRow.project_id; //null ok
      int eventId = convRow.event_id; //null ok

      //get info about the author in relation to the project
      r.throttleDescription = '';
      if (projectId != null) {
        Row projectUserRow = await MiscLib.querySingleChecked(db, 'select spam_count from project_xuser where project_id=${projectId} and xuser_id=${authorId}', 'User is not joined to project');
        int spamCount = projectUserRow.spam_count;
        RestrictionInfo ri = Permissions.spamCountToRestrictions(ApiGlobals.config, spamCount);
        if (ri.restrictionLevel > 0)
          r.throttleDescription = 'User is permitted one post every ${ri.restDays} day(s).';
      }

      //if current user is proj manager, load censoring info
      bool canCensor = await Permissions.isConvManager(db, ai.id, projectId, eventId);
      r.canCensor = canCensor ? 'Y' : 'N';
      if (canCensor) {
        List<Row> reactionRows = await db.query('select created_by,reaction,reason from conv_post_xuser where conv_post_id=@i',
          {'i': args.postId}).toList();
        List<String> reasons = new List<String>();
        int inappropriateCount = 0;
        for (Row reactionRow in reactionRows) {
          if (reactionRow.created_by == ai.id) r.reaction = reactionRow.reaction;
          if (reactionRow.reaction == 'X') ++inappropriateCount;
          String reason = reactionRow.reason;
          if (reason != null && !reason.isEmpty) reasons.add(reason);
        }
        r.allReasons = reasons.join('; ');
        if (inappropriateCount < 2) r.canCensor = 'N'; //can censor only if manager and post has 2 downvotes
      }
    });
    return r;
  }

  ///save a new post, or censor or delete  post
  @ApiMethod(method: 'POST', path: 'ConvPostSave')
  Future<APIResponseBase> convPostSave(ConvPostSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ConvPostSave', r, (db) async {
      await MiscLib.touchUser(db, ai.id);

      //get info about existing post
      int authorId = null;
      if (args.postId != null) {
        Row postRow = await MiscLib.querySingle(db, 'select conv_id,author_id from conv_post where id=@i', {'i': args.postId});
        if (postRow == null) throw new Exception('Post does not exist');
        args.convId = postRow.conv_id;
        authorId = postRow.author_id;
      }

      //get info from the conv
      Row convRow = await ConvLib.getConvRow(db, args.convId);
      int projectId = convRow.project_id; //null ok
      int eventId = convRow.event_id; //null ok

      //if deleting, allow if user is author
      if (args.delete == 'Y') {
        if (ai.id != authorId) throw new Exception('You cannot delete another user\'s post.');
        await CleanDeleter.deletePost(db, args.postId);
      }

      //if censoring, user must be manager
      else if (args.censored == 'C') {
        bool canCensor = await Permissions.isConvManager(db, ai.id, projectId, eventId);
        if (canCensor) {
          await db.execute('update conv_post set ptext=\'Post was deleted by a manager\', censored=\'C\' where id=@i',
            {'i': args.postId});
        }
      }

      //if storing new post..
      else if (args.postId == null) {
        authorId = ai.id;

        //check permissions
        await Permissions.checkConvPostPermissions(ApiGlobals.config, db, ai.id, args.convId, convRow, projectId, args.ptext.length);

        //write it
        args.triggerWarning = args.triggerWarning ?? '';
        String ptextWithWarning = args.triggerWarning + (args.ptext ?? '');
        int twPosition = args.triggerWarning.length;
        if (twPosition == 0) twPosition = null;
        DateTime createdAt = WLib.utcNow();
        await ConvLib.writeConvPost(db, args.convId, authorId, ptextWithWarning, twPosition, false, createdAt);

        //update conv activity
        await db.execute('update conv set last_activity=@t, activity_flag=\'Y\' where id=${args.convId}',
          {'t': createdAt});

        //update this user's read position (in the simple case, this means it won't
        // show the post as unread to them, as long as there weren't intervening
        // posts)
        if (args.lastKnownWDT != null) {
          await ConvLib.smartUpdateReadPosition(db, args.convId, authorId, createdAt, WLib.wireToDateTime(args.lastKnownWDT));
        }
      }
    });
    return r;
  }

  ///save a new post with an image
  @ApiMethod(method: 'POST', path: 'ConvPostImageSave')
  Future<APIResponseBase> convPostImageSave(ConvPostImageSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ConvPostImageSave', r, (db) async {
      //get info from the conv
      Row convRow = await ConvLib.getConvRow(db, args.convId);
      int projectId = convRow.project_id; //null ok

      //check permissions
      await Permissions.checkConvPostPermissions(ApiGlobals.config, db, ai.id, args.convId, convRow, projectId, args.ptext.length);

      //write it
      String postId = await ConvLib.writeConvPost(db, args.convId, ai.id, args.ptext, null, true, WLib.utcNow());
      await ImageLib.savePostImage(postId, args.imageBytes);
    });
    return r;
  }

  ///save reaction to a post
  @ApiMethod(method: 'POST', path: 'ConvPostUserSave')
  Future<APIResponseBase> convPostUserSave(ConvPostUserSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ConvPostUserSave', r, (db) async {
      //must be joined to conv (not checked because low security risk)

      //delete, update or insert conv_post_xuser
      if ((args.reaction ?? '').length == 0) {
        await db.execute('delete from conv_post_xuser where conv_post_id=@i and created_by=${ai.id}',
          {'i': args.postId});
      } else {
        int nrows = await db.execute('update conv_post_xuser set reaction=@r,reason=@why where conv_post_id=@i and created_by=${ai.id}',
          {'r': args.reaction, 'why': args.reason, 'i': args.postId});
        if (nrows == 0) {
          await db.execute('insert into conv_post_xuser(conv_post_id,created_by,reaction,reason,processed)'
            ' values(@i,${ai.id},@r,@why,\'N\')',
            {'r': args.reaction, 'why': args.reason, 'i': args.postId});
        }
      }
    });
    return r;
  }

  ///save read position
  @ApiMethod(method: 'POST', path: 'ConvSetReadPosition')
  Future<APIResponseBase> convSetReadPosition(ConvSetReadPositionRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ConvSetReadPosition', r, (db) async {
      await ConvLib.smartUpdateReadPosition(db, args.convId, ai.id, WLib.wireToDateTime(args.positionWDT), null);
    });
    return r;
  }

  ///join, quit, or update likes for a conv
  @ApiMethod(method: 'POST', path: 'ConvUserSave')
  Future<ConvUserSaveResponse> convUserSave(ConvUserSaveRequest args) async {
    ConvUserSaveResponse r = new ConvUserSaveResponse();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r.base);
    if (!r.base.isOK) return r;

    //what is being attempted?
    bool isQuitting = args.status == 'Q';
    bool isUpdatingPrefs = args.like != null || args.bookmarked != null;
    bool isJoining = args.status == 'J';

    await Database.safely('ConvUserSave', r.base, (db) async {
      //if quitting or updating prefs, do that only
      if (isQuitting || (isUpdatingPrefs && !isJoining)) {
        QueryClauseBuilder builder = new QueryClauseBuilder();
        if (isQuitting) {
          builder.add('status=\'Q\'');
        }
        if (args.like != null) {
          builder.add('"like"=@l', name:'l', value:args.like);
        }
        if (args.bookmarked != null) {
          builder.add('bookmarked=@b', name:'b', value:args.bookmarked);
        }
        String sql = 'update conv_xuser set ' + builder.updateClause
          + ' where conv_id=${args.convId} and xuser_id=${ai.id}';
        await db.execute(sql, builder.paramsMap);
        return r;
      }

      //if joining..
      else if (isJoining) {
        //get allowed maximums for participation
        JoinInfo permissions = await Permissions.getConvJoinPermissions(db, ai.id, args.convId);

        //join or request joining based on permissions
        if (permissions.mayJoin) {
          await ConvLib.join(db, ai.id, args.convId, permissions);
          r.action = 'J';
        } else if (permissions.mayRequest) {
          await ConvLib.writeConvUser(db, args.convId, ai.id, 'A', 'N');
          await ProposalLib.proposeJoinConv(db, ai.id, ai.nick, permissions.projectId, args.convId);
          r.action = 'R';
        } else {
          r.action = 'X';
        }
      }
    });
    return r;
  }

  ///get all root docs; no authentication
  @ApiMethod(method: 'POST', path: 'DocQuery')
  Future<DocQueryResponse> docQuery(DocQueryRequest args) async {
    DocQueryResponse r = new DocQueryResponse();
    if (args.mode != 'R') throw new Exception('unknown mode');
    await Database.safely('DocQuery', r.base, (db) async {
      r.docs = new List<DocQueryItem>();
      String sql = 'select id, title from doc where project_id in (select id from project where kind=\'R\') order by title';
      await for (Row row in db.query(sql)) {
        var item = new DocQueryItem()
          ..id = row.id
          ..title = row.title;
        r.docs.add(item);
      }
    });
    return r;
  }

  ///get all projects matching criteria
  @ApiMethod(method: 'POST', path: 'DocGet')
  Future<DocGetResponse> docGet(DocGetRequest args) async {
    DocGetResponse r = new DocGetResponse()
      ..isProjectManager = 'N';
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok
    String timeZoneName = ai != null ? ai.timeZoneName : null;

    await Database.safely('DocGet', r.base, (db) async {
      //get info about doc (but don't load text yet)
      String whereClause = 'id=${args.docId}';
      if (args.specialCode != null && args.specialCode.length < 50)
        whereClause = 'special_code=\'${args.specialCode}\'';
      Row docRow = await MiscLib.querySingleChecked(db, 'select id,title,project_id,revision_no from doc where ${whereClause}', 'Document does not exist');
      args.docId = docRow.id;
      r.docId = args.docId;
      r.projectId = docRow.project_id;
      if (r.projectId == ApiGlobals.rootProjectId) r.projectId = null;
      r.title = docRow.title;
      int latestRevisionNo = docRow.revision_no;

      //get info about associated project (must be logged in and joined to proj for this)
      if (r.projectId != null) {
        Authenticator.ensureLoggedIn(ai, r.base);
        if (!r.base.isOK) throw new Exception('You must be logged in to request a project document');
        String kind = await Permissions.getProjectUserKind(db, ai.id, r.projectId);
        if (Permissions.isProjectUserKindIn(kind, testForManager: true))
          r.isProjectManager = 'Y';
        bool isJoined = Permissions.isProjectUserKindIn(kind);
        if (!isJoined) throw new Exception('You are not part of this project');
        Row projRow = await MiscLib.querySingleChecked(db, 'select title from project where id=${r.projectId}', 'Project does not exist');
        r.projectTitle = projRow.title;
      }

      //load doc and html diff
      DocDiffInfo info = await DiffLib.load(db, args.docId, args.revisionNo, true);
      r.body = info.after;
      String before = info.before ?? '';
      String after = info.after ?? '';
      r.htmlDiff = DiffLib.buildReviewHtml(before, after);
      r.createdAt = DateLib.formatDateTime(info.afterCreatedAt, timeZoneName); //WLib.dateTimeToWire(info.afterCreatedAt);
      r.proposalId = info.beforeProposalId;

      //load last 100 versions
      r.verList = new List<DocGetVersionItem>();
      if (args.getVerList == 'Y') {
        List<Row> revRows = await db.query('select revision_no,created_at from doc_revision where doc_id=${args.docId} limit 100 order by revision_no desc').toList();
        for (Row revRow in revRows) {
          var i = new DocGetVersionItem()
            ..revisionNo = revRow.revision_no
            ..createdAt = DateLib.formatDateTime(revRow.created_at, timeZoneName); // WLib.dateTimeToWire(revRow.created_at);
          r.verList.add(i);
        }
      }

      //include information about whether the user may edit
      r.allowSave = 'Y';
      if (latestRevisionNo != info.afterRevNo) {
        r.allowSave = 'N';
        r.reasonNotEditable = 'You cannot edit an old version; you must open the latest version to be able to edit.';
      }
      if (r.projectId == null) {
        //check for active proposals on this root doc
        int proposalCount = await MiscLib.queryScalar(db, 'select count(*) from proposal where active=\'Y\' and doc_id=${args.docId}');
        if (proposalCount > 0) {
          r.allowSave = 'N';
          r.reasonNotEditable = 'You cannot edit the document now because there is a proposal for another edit awaiting a decision';
        }
      }
    });
    return r;
  }

  //create or update a document
  @ApiMethod(method: 'POST', path: 'DocSave')
  Future<APIResponseBase> docSave(DocSaveRequest args) async {
    assert(args.docId != null);
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('DocSave', r, (db) async {
      //for project docs: preliminary steps
      if (args.projectId != null) {
        //must be joined to the project
        String kind = await Permissions.getProjectUserKind(db, ai.id, args.projectId);
        if (!Permissions.isProjectUserKindIn(kind))
          throw new Exception('You are not part of this project');

        //if retitling, ensure is manager then retitle and exit
        if (args.retitleMode == 'R' && args.docId != 0) {
          if (!Permissions.isProjectUserKindIn(kind, testForManager: true))
            throw new Exception('Only project managers can retitle documents.');
          await db.execute('update doc set title=@t where id=${args.docId} and project_id=${args.projectId}', {'t': args.title});
          return;
        }
      }

      //load existing doc; exit if documents are identical
      String committedBody = null;
      DocDiffInfo diffInfo = null;
      if (args.docId != 0) {
        diffInfo = await DiffLib.load(db, args.docId, null, false);
        committedBody = diffInfo.after;
        if (committedBody == args.body) throw new Exception('There are no changes to the document; cannot save');
      }

      //project docs:
      if (args.projectId != null) {
        int linkId = null; //doc to link to in notification

        //create it if new
        if (args.docId == 0) {
          linkId = await DiffLib.saveNewDocument(db, args.projectId, args.title, args.body);
          r.newId = linkId;
        }

        //if project doc exists..
        else {
          //if latest ver is blank and is revision 1 then just update it to the
          // 1st real version and don't save any history
          if (diffInfo.afterRevNo == 1 && (committedBody ?? '').length == 0) {
            await db.execute('update doc set body=@b where id=${args.docId} and project_id=${args.projectId}',
            {'b': args.body});
          }

          //otherwise this is a real revision
          else {
            await DiffLib.reviseDocument(db, args.docId, args.title, args.body, null, args.projectId);
          }
          linkId = args.docId;
        }

        //notify project managers (except current user) that the doc was created
        // or changed
        List<int> projectManagers = await MiscLib.getProjectManagers(db, args.projectId);
        for (int uid in projectManagers) {
          if (uid == ai.id) continue;
          await MiscLib.notify(db, uid, 'A project document was created or changed',
            linkText: args.title, linkKey: 'doc/${linkId}');
        }
      }//end project docs

      //root docs
      else {
        if (args.docId == 0) throw new Exception('Cannot create new root document'); //they have to exist in the database by manual means
        String changeHtml = DiffLib.buildReviewHtml(diffInfo.after, args.body);
        await ProposalLib.proposeRootDocumentChange(ApiGlobals.config, db, ai.id, args.docId, args.title, args.summary,
          changeHtml, args.body);
      }
    });
    return r;
  }

  //roll back a project document to the previous version
  @ApiMethod(method: 'POST', path: 'DocRollback')
  Future<APIResponseBase> docRollback(DocRollbackRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('DocRollback', r, (db) async {
      //rights checks
      Row docRow = await MiscLib.querySingleChecked(db, 'select project_id,revision_no,title from doc where id=${args.docId}', 'Document does not exist');
      int projectId = docRow.project_id;
      if (projectId == null) throw new Exception('Only project documents can be rolled back');
      if (docRow.revision_no != args.revisionNo) throw new Exception('Another user modified the document at the same time; this version cannot be rolled back');
      bool isManager = await Permissions.isConvManager(db, ai.id, projectId, null);
      if (!isManager) throw new Exception('Only project managers can roll back documents');

      //roll back
      DiffLib.unreviseDocument(db, args.docId, args.revisionNo);

      //notify project managers (except current user) that the doc was rolled back
      List<int> projectManagers = await MiscLib.getProjectManagers(db, projectId);
      for (int uid in projectManagers) {
        if (uid == ai.id) continue;
        await MiscLib.notify(db, uid, 'A project document change was rolled back',
          linkText: docRow.title, linkKey: 'doc/${args.docId}');
      }
    });
    return r;
  }

  ///get all events matching criteria
  @ApiMethod(method: 'POST', path: 'EventQuery')
  Future<EventQueryResponse> eventQuery(EventQueryRequest args) async {
    EventQueryResponse r = new EventQueryResponse();
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok
    String tzName = null;
    if (ai != null) tzName = ai.timeZoneName;

    await Database.safely('EventQuery', r.base, (db) async {
      //convert dates to utc range; note that the wire format is in UTC but the
      // user entered some date and expects that to reflect midnight in local
      // time on that date
      assert(args.dateFrom != null && args.dateTo != null);
      DateTime preciseFrom = DateLib.unpackConvertDateEntry(args.dateFrom, tzName);
      DateTime preciseTo = DateLib.unpackConvertDateEntry(args.dateTo, tzName).add(new Duration(days: 1));

      //build query
      QueryClauseBuilder builder = new QueryClauseBuilder();
      builder.add('event.start_time>=@d1', name: 'd1', value: preciseFrom);
      builder.add('event.start_time<@d2', name: 'd2', value: preciseTo);
      if (args.title != null) builder.add('lower(event.title) like @ti', name: 'ti', value: '%${args.title.toLowerCase()}%');
      if ((args.miles ?? 0) > 0 && args.lat != null && args.lon != null) {
        builder.add('milesbetween(point(${args.lon},${args.lat}), point(event.lon,event.lat))<${args.miles}');
        //postgres <@> operator doesn't work through the driver, so the function exists only for that purpose
      }
      String sql = 'select event.id,event.title,event.description,event.start_time,event.created_by,xuser.avatar_no,xuser.nick'
        ' from event inner join xuser on event.created_by=xuser.id'
        ' where ${builder.whereClause} order by start_time limit 100';

      List<Row> rows = await db.query(sql, builder.paramsMap).toList();

      //fill in r.events
      r.events = new List<EventItemResponse>();
      for (Row row in rows) {
        var item = new EventItemResponse()
          ..id = row.id
          ..title = row.title
          ..startTime = DateLib.formatDateTime(row.start_time, tzName)
          ..creatorId = row.created_by
          ..creatorNick = row.nick;
        r.events.add(item);
      }
    });
    return r;
  }

  ///get single event
  @ApiMethod(method: 'POST', path: 'EventGet')
  Future<EventGetResponse> eventGet(EventRequest args) async {
    EventGetResponse r = new EventGetResponse();
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok
    String tzName = null;
    if (ai != null) tzName = ai.timeZoneName;

    await Database.safely('EventGet', r.base, (db) async {
      //load from event and xuser
      String sql = 'select event.*, xuser.nick, xuser.avatar_no'
        ' from event inner join xuser on event.created_by=xuser.id'
        ' where event.id=${args.eventId}';
      Row eventRow = await MiscLib.querySingleChecked(db, sql, 'Event does not exist');
      r
        ..title = eventRow.title
        ..description = eventRow.description
        ..duration = eventRow.duration
        ..location = eventRow.location
        ..creatorId = eventRow.created_by
        ..creatorNick = eventRow.nick
        ..creatorAvatarUrl = ImageLib.getAvatarUrl(eventRow.created_by, eventRow.avatar_no)
        ..lat = eventRow.lat.toString()
        ..lon = eventRow.lon.toString()
        ;
      DateTime startTime = eventRow.start_time;
      r.startTimeU = DateLib.packUtcDateEntry(startTime, tzName);
      r.startTimeR = DateLib.formatDateTime(startTime, tzName);
      DateTime createTime = eventRow.created_at;
      r.createdAtR = DateLib.formatDateTime(createTime, tzName);
      r.isCreator = (ai != null && ai.id == r.creatorId) ? 'Y' : 'N';

      //load from event_xuser
      List<Row> userRows = await db.query('select xuser_id,nick,avatar_no,public_name,event_xuser.status,event_xuser.status_desc from event_xuser inner join xuser on event_xuser.xuser_id=xuser.id where event_xuser.event_id=${args.eventId}').toList();
      r.users = new List<EventGetUserResponse>();
      for (Row row in userRows) {
        var item = new EventGetUserResponse()
          ..userId = row.xuser_id
          ..nick = row.nick
          ..publicName = row.public_name
          ..avatarUrl = ImageLib.getAvatarUrl(row.xuser_id, row.avatar_no)
          ..status = row.status
          ..statusDesc = row.status_desc;
        r.users.add(item);
      }

      //load from convs linked to event
      List<Row> convRows = await db.query('select id,open,title,last_activity from conv where event_id=${args.eventId}').toList();
      r.convs = new List<EventGetConvResponse>();
      for (Row row in convRows) {
        var item = new EventGetConvResponse()
          ..id = row.id
          ..open = row.open
          ..title = row.title
          ..lastActivity = WLib.dateTimeToWire(row.last_activity);
        r.convs.add(item);
      }

    });
    return r;
  }

  ///create or update event
  @ApiMethod(method: 'POST', path: 'EventSave')
  Future<APIResponseBase> eventSave(EventSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();
    assert(args.eventId != null);
    double lat = double.parse(args.lat);
    double lon = double.parse(args.lon);

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('EventSave', r, (db) async {
      DateTime startTimeUtc = DateLib.unpackConvertDateEntry(args.startTime, ai.timeZoneName);

      //new event
      if (args.eventId == 0) {
        await ProposalLib.proposeNewEvent(db, ai.id, args.title, args.description,
          startTimeUtc, args.duration, lat, lon, args.location);
      }

      else {//existing event
        //get some existing values
        Row eventRow = await MiscLib.querySingleChecked(db, 'select created_by,start_time from event where id=${args.eventId}', 'Event does not exist');
        bool startChanged = startTimeUtc.millisecondsSinceEpoch != eventRow.start_time.millisecondsSinceEpoch;

        //must be the owner to update
        if (eventRow.created_by != ai.id)
          throw new Exception('Only the creator of an event can update it');

        //save changes
        await db.execute('update event set title=@t,description=@d,start_time=@s,duration=@du,'
          'lat=${args.lat},lon=${args.lon},location=@lo'
          ' where id=${args.eventId}',
          {'t': args.title, 'd': args.description, 's': startTimeUtc, 'du': args.duration,
          'lo': args.location});

        //if start time changed, notify everyone of the change
        if (startChanged) {
          String body = 'The event "${args.title}" changed to a new time. It now starts at ';
          String sql = 'select xuser.id,timezone from event_xuser inner join xuser on event_xuser.xuser_id=xuser.id where event_xuser.event_id=${args.eventId} and event_xuser.status=\'A\'';
          await for(Row userRow in db.query(sql)) {
            try {
              String formattedStartTime = DateLib.formatDateTime(startTimeUtc, userRow.timezone)
                + ' (shown in your time zone: ${userRow.timezone})';
              await MiscLib.notify(db, userRow[0], body + formattedStartTime,
                linkText: args.title, linkKey: 'event/${args.eventId}');
            } catch (ex) {} //on tz conversion error, don't notify that one person
          }
        }
      }
    });
    return r;
  }

  ///delete event
  @ApiMethod(method: 'POST', path: 'EventDelete')
  Future<APIResponseBase> eventDelete(EventRequest args) async {
    APIResponseBase r = new APIResponseBase();
    assert(args.eventId != null);

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('EventDelete', r, (db) async {
      //get some existing values
      Row eventRow = await MiscLib.querySingleChecked(db, 'select created_by,start_time from event where id=${args.eventId}', 'Event does not exist');

      //must be the owner to delete
      if (eventRow.created_by != ai.id)
        throw new Exception('Only the creator of an event can delete it');

      //delete
      await CleanDeleter.deleteEvent(db, args.eventId);
    });
    return r;
  }

  ///for an event save whether the authenticated user is coming or not
  @ApiMethod(method: 'POST', path: 'EventUserSave')
  Future<APIResponseBase> eventUserSave(EventUserSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();
    assert(args.eventId != null);

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('EventUserSave', r, (db) async {
      //update or create record
      var params = {'s': args.status, 'sd': args.statusDesc};
      int count = await db.execute('update event_xuser set status=@s, status_desc=@sd where event_id=${args.eventId} and xuser_id=${ai.id}',
        params);
      if (count == 0) {
        await db.execute('insert into event_xuser(event_id,xuser_id,status,status_desc)values(${args.eventId},${ai.id},@s,@sd)',
          params);
      }
    });
    return r;
  }

  ///get all projects matching criteria
  @ApiMethod(method: 'POST', path: 'ProjectQuery')
  Future<ProjectQueryResponse> projectQuery(ProjectQueryRequest args) async {
    ProjectQueryResponse r = new ProjectQueryResponse();
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok

    await Database.safely('ProjectQuery', r.base, (db) async {
      //build query: note 2 versions of sql for logged in and not logged in
      QueryClauseBuilder builder = new QueryClauseBuilder();
      builder.add('project.kind=\'P\'');
      if (args.catId != null) builder.add('category_id=${args.catId}');
      if (args.title != null) builder.add('lower(title) like @t', name:'t', value: '%${args.title.toLowerCase()}%');
      if (builder.count < 2) throw new Exception('must search on at least one criterion');
      String sql = 'select id,title,leadership,privacy,important_count,\'N\',description from project'
        ' where ${builder.whereClause} limit 100';
      if (ai != null) {
        sql = 'select id,title,leadership,privacy,important_count,project_xuser.kind,description from project'
          ' left join project_xuser on project.id=project_xuser.project_id and xuser_id=${ai.id}'
          ' where ${builder.whereClause} limit 100';
      }

      List<Row> rows = await db.query(sql, builder.paramsMap).toList();

      //define converting a row to a sortable value
      int rowToSortValue(r) {
        //combine kind and important into a number with higher negative values = better
        int importants = r[4];
        String kind = r[5]; //note if not logged in, kind is always 'N'
        int big = 0 - max(importants, 9999);
        if (kind == 'M') big -= 30000;
        else if (kind == 'A') big -= 20000;
        else if (kind != null) big -= 10000;
        return big;
      };

      //sort by kind(manager,active,other), subsort by important_count
      rows.sort((Row a, Row b) {
        return rowToSortValue(a).compareTo(rowToSortValue(b));
      });

      //fill in r.projects
      r.projects = new List<ProjectQueryItem>();
      for (Row row in rows) {
        var item = new ProjectQueryItem()
          ..projectId = row[0]
          ..title = row[1]
          ..leadership = row[2]
          ..privacy = row[3]
          ..description = row[6];
        r.projects.add(item);
      }
    });
    return r;
  }

  ///get one project for display, with related proposals, convs, docs
  @ApiMethod(method: 'POST', path: 'ProjectGet')
  Future<ProjectGetResponse> projectGet(ProjectGetRequest args) async {
    ProjectGetResponse r = new ProjectGetResponse();

    //allow not logged in (but if logged in, behaves better)
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    String tzName = ai != null ? ai.timeZoneName : null;

    await Database.safely('ProjectGet', r.base, (db) async {
      //load project info
      Row projectRow = await MiscLib.querySingleChecked(db, 'select active,leadership,privacy,title,description,category_id from project where id=${args.projectId}', 'Project does not exist');
      r.active = projectRow.active;
      r.leadership = projectRow.leadership;
      r.privacy = projectRow.privacy;
      r.title = projectRow.title;
      r.description = projectRow.description;
      r.categoryId = projectRow.category_id;

      //load this user's status in project (if logged in)
      r.userKind = 'N';
      if (ai != null) {
        r.userKind = await Permissions.getProjectUserKind(db, ai.id, args.projectId);
      }
      bool isJoined = r.userKind == 'M' || r.userKind == 'A' || r.userKind == 'V' || r.userKind == 'O';
      bool canViewDetails = isJoined || (r.privacy == 'P' || r.privacy == 'A');

      //hide some things if not allowed
      if (!canViewDetails) {
        r.description = '';
      }

      //load child records
      r.proposals = await db.query('select id,active,title,created_at from proposal where project_id=${args.projectId} order by created_at desc')
        .map((row) => new ProjectProposalItem()
        ..id = row.id
        ..active = row.active
        ..title = row.title
        ..createdAt = DateLib.formatDateTime(row.created_at, tzName)
        ).toList();
      r.convs = await db.query('select id,open,title,last_activity from conv where project_id=${args.projectId} order by last_activity desc')
        .map((row) => new ProjectConvItem()
        ..id = row.id
        ..open = row.open
        ..title = row.title
        ..lastActivity = DateLib.formatDateTime(row.last_activity, tzName)
        ).toList();
      r.docs = await db.query('select id,title from doc where project_id=${args.projectId} order by title')
        .map((row) => new ProjectDocItem()
        ..id = row.id
        ..title = row.title
        ).toList();
    });
    return r;
  }

  ///create or update project
  @ApiMethod(method: 'POST', path: 'ProjectSave')
  Future<APIResponseBase> projectSave(ProjectSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ProjectSave', r, (db) async {
      //new project
      if (args.projectId == 0) {
        await ProposalLib.proposeNewProject(db, ai.id, args.leadership, args.privacy,
          args.title, args.description, args.categoryId);
      }

      else {//existing
        //must be a project manager to update
        String userKind = await Permissions.getProjectUserKind(db, ai.id, args.projectId);
        if (!Permissions.isProjectUserKindIn(userKind, testForManager: true))
          throw new Exception('Only managers can update projects');

        //cannot change democratic projects to fixed
        if (args.leadership == 'F') {
          String oldleadership = await MiscLib.queryScalar(db, 'select leadership from project where id=${args.projectId}');
          if (oldleadership == 'D') throw new Exception('Cannot change a democratic project to fixed leadership.');
        }

        //save changes
        await db.execute('update project set leadership=@l,privacy=@p,category_id=${args.categoryId},title=@t,description=@d'
          ' where id=${args.projectId}',
          {'l':args.leadership, 'p':args.privacy, 't':args.title, 'd':args.description});
      }
    });
    return r;
  }

  ///get info about users in a project
  @ApiMethod(method: 'POST', path: 'ProjectUserQuery')
  Future<ProjectUserQueryResponse> projectUserQuery(ProjectUserQueryRequest args) async {
    final int pageSize = 100;
    ProjectUserQueryResponse r = new ProjectUserQueryResponse();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r.base);
    if (!r.base.isOK) return r;

    await Database.safely('ProjectUserQuery', r.base, (db) async {
      //get project info
      Row projectRow = await MiscLib.querySingleChecked(db, 'select privacy,leadership,title from project where id=${args.projectId}', 'Project does not exist');
      String privacy = projectRow.privacy;
      bool isPrivate = privacy == 'I' || privacy == 'R';
      r.projectTitle = projectRow.title;

      //determine rights; must be joined to view private project members
      String userKind = await Permissions.getProjectUserKind(db, ai.id, args.projectId);
      bool isJoined = Permissions.isProjectUserKindIn(userKind);
      bool isManager = Permissions.isProjectUserKindIn(userKind, testForManager: true);
      if (isPrivate && !isJoined) throw new Exception('Only members can query users in private projects');
      r.editable = isManager && projectRow.leadership == 'F' ? 'Y': 'N';

      //construct optional where clause and params
      Map<String, dynamic> params = new Map<String, dynamic>();
      String extraWhere = '';
      if (args.name != null && args.name.length > 0) {
        extraWhere = 'and (public_name like @pn or nick like @n)';
        params['pn'] = args.name;
        params['n'] = args.name;
      }

      //construct query with criteria
      int startAtRow = args.resultPage * pageSize;
      String sql = 'select xuser_id,project_xuser.kind,public_name,nick,avatar_no,spam_count,'
        ' (select kind from project_xuser_xuser where project_id=${args.projectId} and owner_id=${ai.id} and about_id=project_xuser.xuser_id) as votekind'
        ' from project_xuser inner join xuser on project_xuser.xuser_id=xuser.id'
        ' where project_id=${args.projectId} ${extraWhere}'
        ' order by nick limit ${pageSize} offset ${startAtRow}';

      //loop results
      r.users = new List<ProjectUserItem>();
      await for (Row row in db.query(sql, params)) {
        if (row.kind == 'N') continue; //as if never joined
        ProjectUserItem u = new ProjectUserItem()
          ..userId = row.xuser_id
          ..kind = row.kind
          ..nick = row.nick
          ..publicName = row.public_name
          ..voteKind = row.votekind;
        u.avatarUrl = ImageLib.getAvatarUrl(u.userId, row.avatar_no);
        RestrictionInfo spamInfo = Permissions.spamCountToRestrictions(ApiGlobals.config, row.spam_count);
        if (spamInfo.restrictionLevel > 0) {
          u.throttle = 'User may post every ${spamInfo.restDays} days (max ${spamInfo.charLimit} chars)';
        }
        r.users.add(u);
      }

      //assume that if the query yielded 100 rows, there are probably more
      r.completeLoad = r.users.length < pageSize ? 'Y' : 'N';
    });
    return r;
  }

  ///quit or downgrade own role in project, or change another member's role
  @ApiMethod(method: 'POST', path: 'ProjectUserSave')
  Future<APIResponseBase> projectUserSave(ProjectUserSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ProjectUserSave', r, (db) async {
      //collect rights and current role
      bool editingSelf = ai.id == args.userId;
      String thisUserKind = await Permissions.getProjectUserKind(db, ai.id, args.projectId);
      bool isManager = Permissions.isProjectUserKindIn(thisUserKind, testForManager: true);
      String aboutUserKind = await Permissions.getProjectUserKind(db, args.userId, args.projectId);
      bool aboutUserJoined = Permissions.isProjectUserKindIn(aboutUserKind);
      if (!aboutUserJoined) throw new Exception('User is not a member, so cannot change role.');
      JoinInfo permissions = await Permissions.getProjectJoinPermissions(db, args.userId, args.projectId);

      //general role update function
      Future writeRole(String kind) async {
          await db.execute('update project_xuser set kind=@k where project_id=${args.projectId} and xuser_id=${args.userId}',
            {'k':kind});
      }

      //general rights check function
      void checkAllowed(bool allowed) {
        if (!allowed) throw new Exception('You cannot change the role of this user.');
      }

      //if quitting, leave all convs in project
      if (args.kind == 'N') {
        checkAllowed(isManager || editingSelf);
        await db.execute('update conv_xuser set status=\'Q\' where (select project_id from conv where id=conv_xuser.conv_id)=${args.projectId} and xuser_id=${ai.id}');
        await writeRole('N');
      }

      //if downgrading to observer
      if (args.kind == 'O') {
        checkAllowed(isManager || editingSelf);
        await writeRole('O');
      }

      //if up/downgrading to visitor
      if (args.kind == 'V') {
        bool canChangeSelfToVisitor = permissions.maxProjectUserKind == 'V'
          || permissions.maxProjectUserKind == 'A' || permissions.maxProjectUserKind == 'M';
        checkAllowed(isManager || (editingSelf && canChangeSelfToVisitor));
        await writeRole('V');
      }

      //if up/downgrading to active
      if (args.kind == 'A') {
        bool canChangeSelfToActive = permissions.maxProjectUserKind == 'A' || permissions.maxProjectUserKind == 'M';
        checkAllowed(isManager || (editingSelf && canChangeSelfToActive));
        await writeRole('A');
      }

      //if upgrading to manager
      if (args.kind == 'M') {
        checkAllowed(isManager);
        await writeRole('M');
      }

      //if we downgraded a manager, check if there are any managers left
      if (aboutUserKind == 'M') {
        int numManagers = await MiscLib.queryScalar(db, 'select count(*) from project_xuser where project_id=${args.projectId} and kind=\'M\'') ?? 0;
        if (numManagers == 0) {
          //no managers left, so make project democratic;
          //the worker process will eventually assign leaders and notify them
          await db.execute('update project set leadership=\'D\' where id=${args.projectId}');
        }
      }
    });
    return r;
  }

  //record a vote for/against another user taking leadership in a project
  @ApiMethod(method: 'POST', path: 'ProjectUserUserSave')
  Future<APIResponseBase> projectUserUserSave(ProjectUserUserSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ProjectUserUserSave', r, (db) async {
      //check current user is joined to project
      bool isJoined = await Permissions.isJoinedToProject(db, ai.id, args.projectId);
      if (!isJoined) throw new Exception('You can only vote if you are a member of the project.');

      //can't vote for self
      if (ai.id == args.aboutId) throw new Exception('Cannot vote for yourself.');

      //store vote
      int count = await db.execute('update project_xuser_xuser set kind=@k where project_id=${args.projectId} and owner_id=${ai.id} and about_id=${args.aboutId}',
        {'k': args.kind});
      if (count == 0) {
        await db.execute('insert into project_xuser_xuser(project_id,owner_id,about_id,kind)values(${args.projectId},${ai.id},${args.aboutId},@k)',
          {'k': args.kind});
      }
    });
    return r;
  }

  //get all proposals matching inputs; no authentication
  @ApiMethod(method: 'POST', path: 'ProposalQuery')
  Future<ProposalQueryResponse> proposalQuery(ProposalQueryRequest args) async {
    ProposalQueryResponse r = new ProposalQueryResponse();
    await Database.safely('ProposalQuery', r.base, (db) async {
      //build query
      QueryClauseBuilder where = new QueryClauseBuilder();
      if (args.mode == 'P') {
        assert(args.projectId != null);
        where.add('active=\'Y\'');
        where.add('kind=\'PROJ\'');
        where.add('project_id=${args.projectId}')        ;
      } else if (args.mode == 'S') {
        assert(args.year != null);
        where.add('active=\'N\'');
        where.add('kind=\'SYS\'');
        where.add('extract(year from created_at)=${args.year}');
      } else  {//active root/sys
        where.add('active=\'Y\'');
        where.add('(kind=\'ROOT\' or kind=\'SYS\')');
      }

      //load matching rows
      List<Row> proposalRows = await db.query('select id,title,kind from proposal where ${where.whereClause} order by created_at',
        where.paramsMap).toList();
      r.items = new List<ProposalQueryItem>();
      for (Row row in proposalRows) {
        var item = new ProposalQueryItem()
          ..id = row.id
          ..title = row.title
          ..kind = row.kind;
        r.items.add(item);
      }
    });
    return r;
  }

  //get details on one proposal
  @ApiMethod(method: 'POST', path: 'ProposalGet')
  Future<ProposalGetResponse> proposalGet(ProposalGetRequest args) async {
    ProposalGetResponse r = new ProposalGetResponse();
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);//null ok
    await Database.safely('ProposalGet', r.base, (db) async {
      //get row
      Row row = await MiscLib.querySingleChecked(db, 'select * from proposal where id=${args.proposalId}', 'Proposal does not exist');

      //convert to output format
      r.kind = row.kind;
      r.active = row.active;
      r.eligible = row.eligible;
      r.title = row.title;
      r.summary = row.summary;
      r.summaryHtml = row.summary_html;
      r.dtext = row.dtext;
      r.timeout = WLib.dateTimeToWire(row.timeout);
      r.deleteTime = WLib.dateTimeToWire(row.delete_time);
      r.winningOption = row.winning_option;
      r.createdBy = row.created_by;
      r.projectId = row.project_id;
      r.docId = row.doc_id;

      //get info on creator
      Row userRow = await MiscLib.userRowForAvatars(db, r.createdBy);
      r.createdByNick = userRow.nick;
      r.createdByAvatarUrl = ImageLib.getAvatarUrl(r.createdBy, userRow.avatar_no);

      //unpack options and votes maps
      r.options = new List<ProposalOptionItem>();
      Map<String, String> optionsMap = row.options;
      Map<String, int> countMap = row.vote_counts;
      optionsMap.forEach((opt, desc) {
        int optN = int.parse(opt);
        var item = new ProposalOptionItem() ..optionNo = optN ..optionDesc = desc ..voteCount = 0;
        if (countMap != null && countMap.containsKey(opt))
          item.voteCount = countMap[opt];
        r.options.add(item);
      });

      //load this user's vote and eligibility
      r.myEligible = 'N';
      if (ai != null) {
        bool canVote = await ProposalLib.isEligibleToVote(db, ai.id, ai.isSiteAdmin, row);
        if (canVote) {
          r.myEligible = 'Y';
          r.myVote = await MiscLib.queryScalar(db, 'select vote from proposal_xuser where proposal_id=${args.proposalId} and xuser_id=${ai.id}');
        }
      }

      //format description of voting period
      if (r.active == 'Y')
        r.statusDescription = 'Voting is open until ' + DateLib.formatSoonDate(row.timeout);
      else if (row.delete_time != null)
        r.statusDescription = 'Voting closed; proposal to be deleted on ' + DateLib.formatSoonDate(row.delete_time);
      else
        r.statusDescription = 'Voting closed';
    });
    return r;
  }

  ///create new proposal (use only for the proposal kinds that users create directly);
  /// for PROJ type only, returns newId
  @ApiMethod(method: 'POST', path: 'ProposalSave')
  Future<APIResponseBase> proposalSave(ProposalSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ProposalSave', r, (db) async {
      //call methods in proposalLib based on the kind
      if (args.kind == 'PROJ') {
        bool isJoined = await Permissions.isJoinedToProject(db, ai.id, args.projectId);
        if (!isJoined) throw new Exception('Only project members can create a proposal');
        int proposalId = await ProposalLib.proposeInProject(db, ai.id, args.projectId, args.eligible, args.title,
          args.summary, args.options, args.days);
        r.newId = proposalId;
      }
      else if (args.kind == 'SYS') {
        await ProposalLib.proposeSystemChange(ApiGlobals.config, db, ai.id, args.title, args.summary, args.options);
      }
    });
    return r;
  }

  ///delete proposal
  @ApiMethod(method: 'POST', path: 'ProposalDelete')
  Future<APIResponseBase> proposalDelete(ProposalGetRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ProposalDelete', r, (db) async {
      //get info on proposal to check rights
      Row row = await MiscLib.querySingleChecked(db, 'select created_by,kind from proposal where id=${args.proposalId}', 'Proposal does not exist');
      if (ai.id != row.created_by) throw new Exception('You can only delete your own proposal');
      String kind = row.kind;
      bool canDeleteKind = kind == 'PROJ' || kind == 'ROOT' || kind == 'SYS';
      if (!canDeleteKind) throw new Exception('You cannot delete that kind of proposal');

      //delete
      await ProposalLib.delete(db, args.proposalId, true);
    });
    return r;
  }

  ///record vote for proposal
  @ApiMethod(method: 'POST', path: 'ProposalUserSave')
  Future<APIResponseBase> proposalUserSave(ProposalUserSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ProposalUserSave', r, (db) async {
      //check eligibility
      Row proposalRow = await MiscLib.querySingleChecked(db, 'select kind,created_by,project_id,eligible from proposal where id=${args.proposalId}', 'Proposal does not exist');
      bool canVote = await ProposalLib.isEligibleToVote(db, ai.id, ai.isSiteAdmin, proposalRow);
      if (!canVote) throw new Exception('You are not eligible to vote on this proposal');

      //vote
      await ProposalLib.vote(db, args.proposalId, ai.id, args.vote);
    });
    return r;
  }

  ///get all 3 kinds of push queue items: notifications, unreads, and
  /// suggestions. May return error code 'FREQ' if too frequent
  @ApiMethod(method: 'POST', path: 'PushQueueGet')
  Future<PushQueueGetResponse> pushQueueGet(PushQueueGetRequest args) async {
    PushQueueGetResponse r = new PushQueueGetResponse();
     bool isFull = args.depth == 'F';

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r.base);
    if (!r.base.isOK) return r;

    //prevent frequent calling for same nick on multiple windows or machines
    if (ai.lastPushQueueGetUtc.add(new Duration(seconds:30)).isAfter(WLib.utcNow())) {
      r.base.errorCode = 'FREQ';
      r.base.errorMessage = 'PushQueueGet requests are too frequent';
      r.base.ok = 'N';
      r.fullModeStatus = 'T';
      return r;
    }
    ai.lastPushQueueGetUtc = WLib.utcNow();
    r.items = new List<PushQueueItem>();

    await Database.safely('PushQueueGet', r.base, (db) async {
      //load all notifications
      List<Row> notifRows = await db.query('select id,body,link_text,link_key from xuser_notify where xuser_id=${ai.id} order by created_at').toList();
      for (Row row in notifRows) {
        var i = new PushQueueItem() ..kind = 'N'
          ..why = 'G'
          ..sid = row.id
          ..text = row.body
          ..linkText = row.link_text
          ..linkPaneKey = row.link_key;
        r.items.add(i);
      }

      //load all unreads
      List<Row> convRows = await db.query('select conv.id as c_id,conv.title as c_title, project_xuser.kind as p_kind,'
        ' event.created_by as e_created_by,conv_xuser.status'
        ' from ((conv inner join conv_xuser on conv.id=conv_xuser.conv_id)'
        ' left join project_xuser on conv.project_id=project_xuser.project_id and project_xuser.xuser_id=${ai.id})'
        ' left join event on conv.event_id=event.id'
        ' where conv_xuser.position_flag=\'U\' and conv_xuser.status=\'J\' and conv_xuser.xuser_id=${ai.id}').toList();

      //sort unreads by projects I manage, events I posted, all others
      // (subsorted by conv.id, which is the order of when conversations started)
      int compareConvRows(Row a, Row b) {
         bool aManager = a.p_kind == 'M', bManager = b.p_kind == 'M';
         if (aManager && !bManager) return 1;
         if (bManager && !aManager) return -1;
         bool aMyEvent = a.e_created_by == ai.id, bMyEvent = b.e_created_by == ai.id;
         if (aMyEvent && !bMyEvent) return 1;
         if (bMyEvent && !aMyEvent) return -1;
         return a.c_id.compareTo(b.c_id);
      }
      convRows.sort(compareConvRows);

      //copy unreads to output
      for (Row row in convRows) {
        var i = new PushQueueItem() ..kind = 'U'
          ..why = 'G'
          ..iid = row.c_id
          ..linkText = row.c_title
          ..linkPaneKey = 'conv/' + row.c_id.toString();
        r.items.add(i);
      }

      //load suggestions less often
      if (isFull) {
        await MiscLib.touchUser(db, ai.id);

        //load proposals user is eligible to vote on but has not voted on
        DateTime now = WLib.utcNow();
        List<Row> proposalRows = await db.query('select id,kind,eligible,title,project_id,'
          'created_by,'
          '(select vote from proposal_xuser where proposal_id=proposal.id and xuser_id=${ai.id}) as vote'
          ' from proposal where active=\'Y\' and timeout>@now',
          {'now': now}).toList();
        int includedNEW = 0; //count of kind=NEW records included
        for (Row row in proposalRows) {
          //skip if already voted
          if (row.vote != null) continue;

          //eligible?
          bool isEligible = await ProposalLib.isEligibleToVote(db, ai.id, ai.isSiteAdmin, row);
          if (!isEligible) continue;

          //for kind=NEW only include up to 5 to spread the load among site
          // admins
          if (row.kind == 'NEW') {
            if (includedNEW >= 5) continue;
            ++includedNEW;
          }

          //convert to output
          var i = new PushQueueItem() ..kind = 'S'
            ..why = 'V'
            ..iid = row.id
            ..linkText = row.title
            ..linkPaneKey = 'proposal/' + row.id.toString();
          r.items.add(i);
        }

        //load invited, recommended, and bookmarked convs
        List<Row> suggestRows = await db.query('select conv.id as c_id,conv.title as c_title,conv_xuser.status,conv_xuser.bookmarked'
          ' from conv inner join conv_xuser on conv.id=conv_xuser.conv_id'
          ' where conv_xuser.xuser_id=${ai.id}'
          ' and (conv_xuser.status=\'I\' or conv_xuser.status=\'R\' or bookmarked=\'Y\')').toList();

        //copy invited, recommended, and bookmarked convs to output in separate
        // groups to maintain ordering
        void copy1(Row row, String kind, String why) {
          var i = new PushQueueItem()
            ..kind = kind
            ..why = why
            ..iid = row.c_id
            ..linkText = row.c_title
            ..linkPaneKey = 'conv/' + row.c_id.toString();
          r.items.add(i);
        }
        for (Row row in suggestRows.where((r) => r.status == 'I')) //invited
          copy1(row, 'S', 'I');
        for (Row row in suggestRows.where((r) => r.status == 'R')) //recommended
          copy1(row, 'S', 'R');
        for (Row row in suggestRows.where((r) => r.bookmarked == 'Y')) //bookmarked
          copy1(row, 'B', 'G');

      }//if full
    });
    return r;
  }

  //get all resources matching criteria
  @ApiMethod(method: 'POST', path: 'ResourceQuery')
  Future<ResourceQueryResponse> resourceQuery(ResourceQueryRequest args) async {
    ResourceQueryResponse r = new ResourceQueryResponse();
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok
    bool isSiteAdmin = ai != null && ai.isSiteAdmin;

    await Database.safely('ResourceQuery', r.base, (db) async {
      //sort order: mine first, then sorted by importance
      String sortClause = 'important_count desc';
      if (ai != null) sortClause = '(case when xuser_id=1 then 0 else 1 end),' + sortClause;

      QueryClauseBuilder builder = new QueryClauseBuilder();
      if (args.categoryId != null) builder.add('category_id=${args.categoryId}');
      if (args.title != null) builder.add('lower(title) like @t', name:'t', value: '%${args.title.toLowerCase()}%');
      if (args.kind != null && args.kind.length > 0) builder.add('kind=@k', name:'k', value: args.kind);
      //if (builder.count < 1) throw new Exception('must search on at least one criterion');
      if (!isSiteAdmin) builder.add('visible=\'Y\'');
      String sql = 'select id,title,description,url from resource where ${builder.whereClause} order by ${sortClause} limit 100';
      List<Row> rows = await db.query(sql, builder.paramsMap).toList();

      //fill in r.items
      r.items = new List<ResourceItem>();
      for (Row row in rows) {
        var item = new ResourceItem()
          ..id = row.id
          ..title = row.title
          ..description = row.description
          ..url = row.url;
        r.items.add(item);
      }
    });
    return r;
  }

  ///get one resource
  @ApiMethod(method: 'POST', path: 'ResourceGet')
  Future<ResourceGetResponse> resourceGet(ResourceGetRequest args) async {
    ResourceGetResponse r = new ResourceGetResponse();
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok
    bool isSiteAdmin = ai != null && ai.isSiteAdmin;
    r.isSiteAdmin = isSiteAdmin ? 'Y' : 'N';

    await Database.safely('ResourceGet', r.base, (db) async {
      //load from resource
      String sql = 'select category_id,title,url,important_count,description,kind,created_at,visible,xuser_id'
        ',(select nick from xuser where id=resource.xuser_id) as nick'
        ' from resource where id=${args.id}';
      Row resourceRow = await MiscLib.querySingleChecked(db, sql, 'Resource does not exist');
      r.categoryId = resourceRow.category_id;
      r.userId = resourceRow.xuser_id;
      r.importantCount = resourceRow.important_count;
      r.title = resourceRow.title;
      r.description = resourceRow.description;
      r.createdAt = DateLib.formatDateTime(resourceRow.created_at);
      r.visible = resourceRow.visible;
      r.kind = resourceRow.kind;
      r.url = resourceRow.url;
      r.isCreator = (ai != null && r.userId == ai.id) ? 'Y' : 'N';
      r.nick = resourceRow.nick;

      //load from resource_xuser
      r.userKind = null; //meaning, there is no record
      if (ai != null) {
        String sql = 'select kind from resource_xuser where resource_id=${args.id} and xuser_id=${ai.id}';
        r.userKind = await MiscLib.queryScalar(db, sql); //may be null
      }
    });
    return r;
  }

  ///save a resource
  @ApiMethod(method: 'POST', path: 'ResourceSave')
  Future<APIResponseBase> resourceSave(ResourceSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ResourceSave', r, (db) async {
      //for new resources, store proposal and exit
      bool isNew = args.id == 0;
      if (isNew) {
        await ProposalLib.proposeNewResource(db, ai.id, args.kind, args.title, args.description, args.url, args.categoryId);
        return r;
      }

      //get owner of resource being modified
      int ownerId = await MiscLib.queryScalar(db, 'select xuser_id from resource where id=${args.id}');

      //rights: must be owner or site admin to edit existing
      bool canEdit = ai.isSiteAdmin || ownerId == ai.id;
      if (!canEdit) throw new Exception('Only the owner or site administrator can edit a resource');

      //save changes
      await db.execute('update resource set title=@t, description=@d, kind=@k, url=@u where id=${args.id}',
        {'t': args.title, 'd': args.description, 'k': args.kind, 'u': args.url});
    });
    return r;
  }

  ///save a resource
  @ApiMethod(method: 'POST', path: 'ResourceTriage')
  Future<APIResponseBase> resourceTriage(ResourceTriageRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be admin
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureSiteAdmin(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ResourceTriage', r, (db) async {
      //fail if visible
      String visible = await MiscLib.queryScalar(db, 'select visible from resource where id=${args.id}');
      if (visible != 'N') throw new Exception('Only invisible resources can be reset or deleted.');

      //delete?
      if (args.mode == 'D') await CleanDeleter.deleteResource(db, args.id);

      //reset?
      if (args.mode == 'R') {
        await db.execute('delete from resource_xuser where resource_id=${args.id} and kind=\'R\'');
        await db.execute('update resource set visible=\'Y\' where id=${args.id}');
      }
    });
    return r;
  }

  ///record votes for/against a resource
  @ApiMethod(method: 'POST', path: 'ResourceUserSave')
  Future<APIResponseBase> resourceUserSave(ResourceUserSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('ResourceUserSave', r, (db) async {
      //remove rec if kind is null
      if (args.kind == null) {
        await db.execute('delete from resource_xuser where resource_id=${args.id} and xuser_id=${ai.id}');
      }

      else { //nonnull
        int count = await db.execute('update resource_xuser set processed=\'N\', kind=@k where resource_id=${args.id} and xuser_id=${ai.id}',
          {'k': args.kind});
        if (count == 0) {
          await db.execute('insert into resource_xuser(resource_id,xuser_id,kind,processed)values(${args.id},${ai.id},@k,\'N\')',
            {'k': args.kind});
        }
      }
    });
    return r;
  }

  ///get all users matching criteria
  @ApiMethod(method: 'POST', path: 'UserQuery')
  Future<UserQueryResponse> userQuery(UserQueryRequest args) async {
    UserQueryResponse r = new UserQueryResponse();
    await Database.safely('UserQuery', r.base, (db) async {
      String whereClause = '';
      Map<String, dynamic> params = new Map<String, dynamic>();
      if (args.name != null && args.name.length > 0) {
        String param1 = '%${args.name.toLowerCase()}%';
        whereClause = 'where lower(nick) like @nick or lower(public_name) like @name';
        params['nick'] = param1;
        params['name'] = param1;
      }
      r.users = new List<UserQueryItem>();
      await for (Row row in db.query('select id,nick,kind,public_name,avatar_no from xuser ${whereClause} order by last_activity desc limit 100', params)) {
        var item = new UserQueryItem()
          ..id = row.id
          ..nick = row.nick
          ..kind = row.kind
          ..publicName = row.public_name
          ..avatarUrl = ImageLib.getAvatarUrl(row.id, row.avatar_no);
        r.users.add(item);
      }
    });
    return r;
  }

  ///get a user
  @ApiMethod(method: 'POST', path: 'UserGet')
  Future<UserGetResponse> userGet(UserGetRequest args) async {
    UserGetResponse r = new UserGetResponse();

    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    if (!r.base.isOK) return r;

    await Database.safely('UserGet', r.base, (db) async {
      bool aboutMe = ai != null && args.userId == ai.id; //request is for this authenticated user?
      bool doLoad = args.userId > 0; //else return blank data

      //init blank data for editing
      if (args.includeEditing == 'Y') {
        r.allTimeZones = DateLib.allTimeZoneNames().toList();
        r.kind = 'V';
      }

      //load user
      if (doLoad) {
        Row userRow = await MiscLib.querySingleChecked(db, 'select status,nick,email,kind,site_admin,public_name,pref_email_notify,public_links,timezone,avatar_no from xuser where id=${args.userId}', 'User does not exist');
        r..nick = userRow.nick
          ..status = userRow.status
          ..email = userRow.email
          ..kind = userRow.kind
          ..isSiteAdmin = userRow.site_admin
          ..publicName = userRow.public_name
          ..prefEmailNotify = userRow.pref_email_notify
          ..publicLinks = userRow.public_links
          ..timeZone = userRow.timezone
          ..avatarUrl = ImageLib.getAvatarUrl(args.userId, userRow.avatar_no);
      }

      //if for another user
      if (!aboutMe) {
        //hide some things
        r.prefEmailNotify = 'N';
        r.email = '';

        //load this users vote for the other user
        if (ai != null)
          r.userUserKind = await MiscLib.queryScalar(db, 'select kind from xuser_xuser where owner_id=${ai.id} and about_id=${args.userId}');
      }

      //load all associated details
      r.events = new List<APIResponseAssociation>();
      r.projects = new List<APIResponseAssociation>();
      r.resources = new List<APIResponseAssociation>();
      if (args.includeDetail == 'Y') {
        //events
        List<Row> assocRows = await db.query('select id, title from event inner join event_xuser on event.id=event_xuser.event_id where event.start_time>@now and event_xuser.xuser_id=${args.userId} and event_xuser.status=\'A\' order by start_time',
          {'now': WLib.utcNow()}).toList();
        for (Row row in assocRows)
          r.events.add(new APIResponseAssociation() ..linkPaneKey = 'event/${row.id}' ..linkText = row.title);

        //projects
        assocRows = await db.query('select id, title from project inner join project_xuser on project.id=project_xuser.project_id where project_xuser.xuser_id=${args.userId} and project_xuser.kind<>\'N\' order by title').toList();
        for (Row row in assocRows)
          r.projects.add(new APIResponseAssociation() ..linkPaneKey = 'project/${row.id}' ..linkText = row.title);

        //resources
        assocRows = await db.query('select id, title from resource where xuser_id=${args.userId} and visible=\'Y\' order by important_count desc').toList();
        for (Row row in assocRows)
          r.resources.add(new APIResponseAssociation() ..linkPaneKey = 'resource/${row.id}' ..linkText = row.title);
      }
    });
    return r;
  }

  ///save/create a user
  @ApiMethod(method: 'POST', path: 'UserSave')
  Future<APIResponseBase> userSave(UserSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();
    DateTime now = WLib.utcNow();

    //must be logged in if updating
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    bool isNewUser = args.isNew == 'Y';
    if (!isNewUser) {
      Authenticator.ensureLoggedIn(ai, r);
      if (!r.isOK) return r;
    }

    await Database.safely('UserSave', r, (db) async {
      //validate nick/password complexity
      if (isNewUser) {
        String err = WLib.nickValidationError(args.saveNick);
        if (err != null) throw new Exception(err);
      }
      if (isNewUser || (args.savePW != null && args.savePW.length > 0)) {
        String err = WLib.passwordComplexityError(args.savePW);
        if (err != null) throw new Exception(err);
      }

      //if deleting..
      if (args.isDelete == 'Y') {
        CleanDeleter.deleteUser(db, ai.id);
        return;
      }

      //use this id instead of ai.id, since ai could be null
      int userId = null;

      //if creating..
      if (isNewUser) {
        //check nick isn't taken
        String existingNick = await MiscLib.queryScalar(db, 'select nick from xuser where nick=@n', {'n': args.saveNick});
        if (existingNick != null) throw new Exception('That nickname is already in use - try another');

        //store (with false password, and get id from db)
        userId = await MiscLib.queryScalar(db, 'insert into xuser(status,nick,password,kind,public_name,public_links,timezone,pref_email_notify,created_at,last_activity,last_recommend,sitewide_rank,site_admin,avatar_no)'
          ' values(\'A\',@nick,\'temp-pw\',@kind,@name,@links,@tz,@pref1,@d1,@d2,@d3,0,\'N\',0) returning id',
          {'nick': args.saveNick, 'kind': args.kind, 'name': args.publicName, 'links': args.publicLinks,
          'tz': args.timeZone, 'pref1': args.prefEmailNotify, 'd1':now, 'd2':now, 'd3':now});
      }

      //if updating (ignore saveNick)
      else {
        userId = ai.id;
        await db.execute('update xuser set kind=@kind,public_name=@name,public_links=@links,timezone=@tz,pref_email_notify=@pref1'
          ' where id=${userId}',
          {'kind': args.kind, 'name': args.publicName, 'links': args.publicLinks,
          'tz': args.timeZone, 'pref1': args.prefEmailNotify});
        Authenticator.invalidate(ai.nick);
      }

      //if email provided (either on new user or updated)...
      if (args.email != null && args.email.length > 0) {
        //store in proposed_email
        var rand = new Random();
        int code = 10000 + rand.nextInt(89999);
        var proposedEmail = {'email': args.email, 'code': code.toString()};
        await db.execute('update xuser set proposed_email=@p where id=${userId}', {'p': proposedEmail});

        //email the code to args.email
        var settings = ApiGlobals.configSettings;
        String link = settings.linkbackUrl + '/linkback/ValidateEmail?id=${userId}&code=${code}';
        String body = 'Automated message from ${settings.siteName}'
          '\r\n\r\nIf you intended to associate this email address with the account "${args.saveNick}",'
          '\r\nplease click on the link below or copy it into a browser to verify that you own'
          '\r\nthe email address.'
          '\r\n\r\n${link}';
        await MiscLib.queueEmail(db, args.email, 'Verify email address', body);
      }

      //if password provided, update it
      if (args.savePW != null) {
        await db.execute('update xuser set password=@p where id=${userId}',
          {'p': MiscLib.passwordHash(args.savePW)});
      }
    });
    return r;
  }

  ///save a user avatar
  @ApiMethod(method: 'POST', path: 'UserAvatarSave')
  Future<APIResponseBase> userAvatarSave(UserAvatarSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('UserAvatarSave', r, (db) async {
      await ImageLib.saveAvatar(db, ai.id, args.imageBytes);
    });
    return r;
  }

  ///dismiss a notification
  @ApiMethod(method: 'POST', path: 'UserNotifySave')
  Future<APIResponseBase> userNotifySave(UserNotifySaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    await Database.safely('UserNotifySave', r, (db) async {
      await db.execute('delete from xuser_notify where xuser_id=${ai.id} and id=@i',
        {'i':args.notifyId});
    });
    return r;
  }

  ///recover a password (see args doc for the 2 modes)
  @ApiMethod(method: 'POST', path: 'UserRecoverPassword')
  Future<APIResponseBase> userRecoverPassword(UserRecoverPasswordRequest args) async {
    APIResponseBase r = new APIResponseBase();
    await Database.safely('UserRecoverPassword', r, (db) async {
      //get info from xuser for either mode
      List<Row> userRows = await db.query('select id,recovery_code,email,proposed_email from xuser where lower(nick)=@n and status=\'A\'',
        {'n': (args.recoveryNick ?? '').toLowerCase()}).toList();
      if (userRows.length == 0) throw new Exception('No such user');
      Row userRow = userRows[0];
      int userId = userRow.id;

      //email mode
      if (args.mode == 'E') {
        //store new random recovery code
        Random rand = new Random();
        int code = 10000 + rand.nextInt(89999);
        await db.execute('update xuser set recovery_code=@c where id=${userId}',
          {'c': code.toString()});

        //email it
        String email1 = userRow.email ?? '';
        String email2 = null;
        Map proposedEmail = userRow.proposed_email;
        if (proposedEmail != null) email2 = proposedEmail['email'];
        List<String> allEmails = new List<String>();
        if (email1.length > 0) allEmails.add(email1);
        if (email2 != null && email2.length > 0) allEmails.add(email2);
        if (allEmails.length == 0) throw new Exception('You have no email address on file; cannot recover account');
        String emailTo = allEmails.join(',');
        String body = 'You (or someone) requested to reset the account "${args.recoveryNick}".'
          ' \r\nIf you did not request this, you can safely ignore this email.'
          '\r\n\r\nYour recovery code is ${code} - Enter this number on the web site to complete the recovery.';
        await MiscLib.queueEmail(db, emailTo, 'Recovery code', body);
      }

      //validation mode
      if (args.mode == 'V') {
        String err = WLib.passwordComplexityError(args.recoveryPassword);
        if (err != null)
          throw new Exception(err);
        if (args.code == null || args.code != userRow.recovery_code)
          throw new Exception('Recovery code is not correct.');
        await db.execute('update xuser set password=@p where id=${userId}',
          {'p': MiscLib.passwordHash(args.recoveryPassword)});
        Authenticator.invalidate(args.recoveryNick);
      }
    });
    return r;
  }

  ///save a user's opinion of another user
  @ApiMethod(method: 'POST', path: 'UserUserSave')
  Future<APIResponseBase> userUserSave(UserUserSaveRequest args) async {
    APIResponseBase r = new APIResponseBase();

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    Authenticator.ensureLoggedIn(ai, r);
    if (!r.isOK) return r;

    //validate
    bool ok = args.kind == 'B' || args.kind == 'F' || args.kind == null;
    if(!ok) throw new Exception('Bad kind in UserUserSave');

    await Database.safely('UserUserSave', r, (db) async {
      var params = {'k': args.kind};
      int count = await db.execute('update xuser_xuser set kind=@k where owner_id=${ai.id} and about_id=${args.aboutId}', params);
      if (count == 0)
        await db.execute('insert into xuser_xuser(owner_id,about_id,kind)values(${ai.id},${args.aboutId},@k)', params);
    });
    return r;
  }
}
