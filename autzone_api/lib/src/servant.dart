import 'dart:async';
import 'dart:math';
import 'package:autzone_common/autzone_common.dart';
import 'package:autzone_models/autzone_models.dart';

///implementation of exposed public API methods
class Servant {

  ///convert DatabaseResult to APIResponseBase
  static APIResponseBase dbBase(DatabaseResult r, {int newId: null}) => 
    APIResponseBase(ok: r.ok ? 'Y' : 'N', errorCode: r.errorCode, errorMessage: r.errorMessage, newId: newId);

  ///make an 'ok' APIResult
  static APIResponseBase okBase({int newId: null}) => 
    APIResponseBase(ok: 'Y', newId: newId);

  ///check credentials, and return some extra info if valid
  Future<AuthenticateResponse> authenticate(APIRequestBase args) async {
    AuthInfo ai = await Authenticator.authenticateForAPI(args);

    //require login
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return AuthenticateResponse(base: authFail);

    //response
    return AuthenticateResponse(base: okBase(),
      userId: ai.id, 
      publicName: ai.publicName, 
      isSiteAdmin: ai.isSiteAdmin ? 'Y' : 'N', 
      nick: ai.nick);
  }

  ///get all categories matching kind; no authentication
  Future<CategoryQueryResponse> categoryQuery(CategoryQueryRequest args) async {
    final cats = List<CategoryItemResponse>();
    final dbresult = await Database.safely('CategoryQuery', (db) async {
      final rows = await MiscLib.query(db, 'select * from category where kind=@k order by title',
        {'k': args.kind});
      for (final row in rows) {
        var item = new CategoryItemResponse(
          iid: row['id'], 
          parentId: row['parent_id'], 
          title: row['title'],
          description: row['description']);
        cats.add(item);
      }
    });
    return CategoryQueryResponse(base: dbBase(dbresult), categories: cats);
  }

  ///save a category (new, edited, or reparented)
  Future<APIResponseBase> categorySave(CategorySaveRequest args) async {
    //must be site admin
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureSiteAdmin(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('CategorySave', (db) async {
      //get referenced parent in sister mode
      int parentOfRef = null;
      if (args.referenceMode == 'S'){
        parentOfRef = await MiscLib.queryScalar(db, 'select parent_id from category where id=${args.referenceId}', null);
      }

      //create or update
      if (args.catId != null && args.catId > 0) {
        //update
        String sql = 'update category set kind=@k,title=@t,description=@d';
        if (args.referenceMode == 'C') sql += ',parent_id=${args.referenceId}';
        if (args.referenceMode == 'S') sql += ',parent_id=${parentOfRef}'; //null ok
        sql += ' where id=${args.catId}';
        await db.execute(sql, substitutionValues: {'k':args.kind, 't':args.title, 'd':args.description});
      } else {
        //create
        String sql = 'insert into category(parent_id,kind,title,description)values(@p,@k,@t,@d)';
        int parentId = null;
        if (args.referenceMode == 'C') parentId = args.referenceId;
        if (args.referenceMode == 'S') parentId = parentOfRef;
        await db.execute(sql, substitutionValues: {'p':parentId, 'k':args.kind, 't':args.title, 'd':args.description});
      }
    });
    return dbBase(dbresult);
  }

  ///delete a category and relink all references
  Future<APIResponseBase> categoryDelete(CategoryDeleteRequest args) async {

    //must be site admin
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureSiteAdmin(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('CategoryDelete', (db) async {
      //get parent cat (which is null if top level)
      int catToDelete = args.catId;
      int parentOfDeleted = await MiscLib.queryScalar(db, 'select parent_id from category where id=${catToDelete} and kind=@k',
        {'k': args.kind});

      //get whether deleting cat has projects or resources
      int countProjects = (await MiscLib.queryScalar(db, 'select count(*) from project where category_id=${catToDelete}', null) ?? 0);
      int countResources = (await MiscLib.queryScalar(db, 'select count(*) from resource where category_id=${catToDelete}', null) ?? 0);

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
    return dbBase(dbresult);
  }

  ///move projects/resources from one category to another
  Future<APIResponseBase> categoryMoveContents(CategoryMoveContentsRequest args) async {

    //must be site admin
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureSiteAdmin(ai);
    if (authFail != null) return authFail;

    //process args.relatedIds to make sure it's in the right format (prevent sql
    // injection)
    String inClause = args.relatedIds.join(',');

    final dbresult = await Database.safely('CategoryMoveContents', (db) async {
      //relink projects and resources
      if (args.kind == 'P') {
        await db.execute('update project set category_id=${args.catId} where id in (${inClause})');
      }
      if (args.kind == 'R') {
        await db.execute('update resource set category_id=${args.catId} where id in (${inClause})');
      }
    });
    return dbBase(dbresult);
  }

  ///full text search in convs and posts
  Future<ConvQueryResponse> convQuery(ConvQueryRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return ConvQueryResponse(base: authFail);

    //process args (prevent sql injection)
    String searchTerm = (args.term ?? '').replaceAll('\'', '');

    List<ConvQueryConvItemResponse> convs;
    final dbresult = await Database.safely('ConvQuery', (db) async {
      await ConvLib.find(db, ai.id, searchTerm);
    });
    return ConvQueryResponse(base: dbBase(dbresult), convs: convs);
  }

  ///get conv and post detail;
  /// if conv was recommended/invited, can have side effect of changing staus
  Future<ConvGetResponse> convGet(ConvGetRequest args) async {

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return ConvGetResponse(base: authFail);

    //declare return values
    String retParentTitle, retParentPaneKey, retReadPositionWDT, retTitle,
      retReplyAllowedDesc, retDeleteMessage;
    bool retIsManager, retIsJoined = false, retAnySkipped, retReplyAllowed = false, retLike = false, retBookmarked = false;
    int retReplyMaxLength;
    final retPosts = new List<ConvGetPostItem>();

    final dbresult = await Database.safely('ConvGet', (db) async {
      //function to load joinRow
      Map<String, dynamic> joinRow = null;
      Future loadJoinRow() async {
        List<Map<String, dynamic>> joinRows = await MiscLib.query(db, 'select status,"like",bookmarked,read_position from conv_xuser where conv_id=${args.convId} and xuser_id=${ai.id}', null);
        joinRow = joinRows.length > 0 ? joinRows[0] : null;
      };

      //get conv record and conv_xuser record if any
      final convRow = await MiscLib.queryRowChecked(db, 'select project_id,event_id,title,open,from_conv_id,open,post_max_size,xuser_daily_max,last_activity,delete_time from conv where id=${args.convId}', 'Conversation does not exist', null);
      int projectId = convRow['project_id']; //null ok
      int eventId = convRow['event_id']; //null ok
      await loadJoinRow();

      //if was invited, treat opening the conv as an implicit acceptance of the
      // invite
      if (joinRow != null && joinRow['status'] == 'I') {
        db.execute('update conv_xuser set status=\'J\' where conv_id=${args.convId} and xuser_id=${ai.id}');
        await loadJoinRow();
      }

      //figure read position, and whether it is at the beginning or not
      DateTime earliestTime = WLib.utc1970();
      DateTime readPosition = earliestTime;
      retAnySkipped = false; //true if un unread mode, the returned list of posts omits those already read
      if (joinRow != null) {
        readPosition = joinRow['read_position'];
        if (readPosition.isAfter(earliestTime) && args.mode == 'U') retAnySkipped = true;
        //This is not a valid test because the read position could be on the 2nd
        // post; wait to solve this problem until we have post sequence numbers
      }

      //look in project or event to determine if user is manager/owner
      retIsManager = await Permissions.isConvManager(db, ai.id, projectId, eventId);

      //get title/pane key of parent proj/event
      if (eventId != null) {
        retParentTitle = await MiscLib.queryScalar(db, 'select title from event where id=${eventId}', null);
        retParentPaneKey = 'event/${eventId}';
      }
      if (projectId != null) {
        retParentTitle = await MiscLib.queryScalar(db, 'select title from project where id=${projectId}', null);
        retParentPaneKey = 'project/${projectId}';
      }

      //set flags based on whether conv is visible
      //But if not visible, it's not an error: still include title in output
      List<int> invisibleConvIds = await ConvLib.invisibleConvs(db, [args.convId], ai.id);
      bool isVisible = invisibleConvIds.length == 0;

      //get posting permissions, or null
      RestrictionInfo postPermissions = null;
      if (isVisible && joinRow != null) {
          postPermissions = await Permissions.getConvPostPermissions(ApiGlobals.configSettings, db, ai.id, args.convId, convRow);
      }

      //load posts
      List<Map<String, dynamic>> postRows = null;
      if (isVisible) {
        DateTime time1 = WLib.wireToDateTime(args.rangeFromWDT), time2 = WLib.wireToDateTime(args.rangeToWDT);
        if (args.mode == 'U') time2 = readPosition;
        postRows = await ConvLib.selectPosts(db, args.convId, ai.id, projectId,
          first: args.mode != 'R',
          betweenTimes: args.mode == 'R',
          afterTime2: args.mode == 'U',
          all: args.mode == 'A',
          time1: time1, time2: time2);
        if (postRows.length == 1) retAnySkipped = false;
      }

      //set top level items in output
      retReadPositionWDT = WLib.dateTimeToWire(readPosition);
      retTitle = convRow['title'];
      retReplyAllowedDesc = '';
      DateTime deleteTime = convRow['delete_time'];
      retDeleteMessage = convRow['open'] == 'Y'
        ? (deleteTime != null ? 'Will be closed on ${DateLib.formatSoonDate(deleteTime)}' : 'Open')
        : 'Closed';
      if (joinRow != null) {
        if (joinRow['status'] == 'J') retIsJoined = true;
        retLike = joinRow['like'] == 'Y';
        retBookmarked = joinRow['bookmarked'] == 'Y';
      }
      if (postPermissions != null && retIsJoined) {
        retReplyAllowed = postPermissions.allowedNow;
        retReplyAllowedDesc = postPermissions.explanation;
        retReplyMaxLength = postPermissions.charLimit;
      }

      //copy rows into output structure
      DateTime utcNow = WLib.utcNow();
      if (postRows != null) {
        for (final postRow in postRows) {
          final collapseInfo = ConvLib.buildCollapseInfo(postRow, retIsManager);
          final int  authorId = postRow['author_id'];
          String ptext = postRow['ptext'];
          if (collapseInfo.ptextOverride != null) ptext =collapseInfo.ptextOverride;

          final p = ConvGetPostItem(
            iid: postRow['id'],
            authorId: authorId,
            authorNick: postRow['nick'],
            avatarUrl: ImageLib.getAvatarUrl(authorId, postRow['avatar_no']), //null ok
            createdAtWDT: WLib.dateTimeToWire(postRow['created_at']),
            createdAtReadable: DateLib.formatDateTime(postRow['created_at'], ai.timeZoneName),
            ago: DateLib.ago(utcNow.difference(postRow['created_at'])),
            ptext: ptext,
            imageUrl: postRow['has_image'] == 'Y' ? ImageLib.getPostImageUrl(postRow['id']) : null,
            collapseMode: collapseInfo.collapseMode,
            collapsePosition: collapseInfo.collapsePosition
          );
          retPosts.add(p);
        }
      }

      //if conv was recommended, then opening the conv is an implicit "quit"
      // because if the user does nothing else, it should not be recommended
      // again
      if (joinRow != null && joinRow['status'] == 'R') {
        db.execute('update conv_xuser set status=\'Q\' where conv_id=${args.convId} and xuser_id=${ai.id}');
      }
    });

    return ConvGetResponse(base: dbBase(dbresult),
      parentTitle: retParentTitle,
      parentPaneKey: retParentPaneKey,
      isManager: retIsManager ? 'Y' : 'N',
      isJoined: retIsJoined ? 'Y' : 'N',
      readPositionWDT: retReadPositionWDT,
      title: retTitle,
      anySkipped: retAnySkipped ? 'Y' : 'N',
      replyAllowed: retReplyAllowed ? 'Y' : 'N',
      replyAllowedDesc: retReplyAllowedDesc,
      deleteMessage: retDeleteMessage,
      like: retLike ? 'Y' : 'N',
      bookmarked: retBookmarked ? 'Y' : 'N',
      replyMaxLength: retReplyMaxLength,
      posts: retPosts
    );
  }

  ///get conv rules (for editing)
  Future<ConvGetRulesResponse> convGetRules(ConvGetRulesRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return ConvGetRulesResponse(base: authFail);

    //declare return values
    int postMaxSize, userDailyMax;
    String title;

    final dbresult = await Database.safely('ConvGetRules', (db) async {
      //get from conv
      final convRow = await MiscLib.queryRowChecked(db, 'select project_id,event_id,post_max_size,xuser_daily_max,title from conv where id=${args.convId}', 'Conversation does not exist', null);
      int projectId = convRow['project_id']; //null ok
      int eventId = convRow['event_id']; //null ok

      //must be manager (the info is public, so this check isn't really necessary)
      bool isManager = await Permissions.isConvManager(db, ai.id, projectId, eventId);
      if (!isManager) throw new Exception('Only managers can edit conversation rules.');

      postMaxSize = convRow['post_max_size'];
      userDailyMax = convRow['xuser_daily_max'];
      title = convRow['title'];
    });

    return ConvGetRulesResponse(base: dbBase(dbresult), postMaxSize: postMaxSize, userDailyMax: userDailyMax, title: title);
  }

  ///create new conv or update conv;
  /// the project or event ID must be set for a new blank conv, unless it is
  /// spawned from a post, in which case this method figures out the parent
  /// relationships
  Future<APIResponseBase> convSave(ConvSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    int convId;
    final dbresult = await Database.safely('ConvSave', (db) async {
      bool isNew = args.convId == null || args.convId == 0;

      //proj/event might be overridden from args!
      int projectId = args.projectId, eventId = args.eventId;

      //preliminarily, if spawning, get parent keys and author from the source conv
      //and ignore the proj or event that was passed in
      if (args.openingPostId != null) {
        final openingPostRow = await MiscLib.queryRow(db, 'select author_id,conv_id from conv_post where id=@p',
          {'p': args.openingPostId});
        if (openingPostRow == null) throw new Exception('Source post does not exist');
        //authorId = openingPostRow.author_id;
        final convRow = await MiscLib.queryRow(db, 'select project_id,event_id from conv where id=${openingPostRow['conv_id']}', null);
        if (convRow == null) throw new Exception('Conversation does not exist');
        projectId = convRow['project_id']; //null ok
        eventId = convRow['event_id']; //null ok
      }

      //update existing conv
      if (!isNew) {
        //overwrite proj/event keys from existing conv (they cant be changed)
        final convRow = await MiscLib.queryRowChecked(db, 'select project_id,event_id from conv where id=${args.convId}', 'Conversation does not exist', null);
        projectId = convRow['project_id']; //null ok
        eventId = convRow['event_id']; //null ok

        //for existing conv, must be manager
        bool isManager = await Permissions.isConvManager(db, ai.id, projectId, eventId);
        if (!isManager) throw new Exception('Only managers can edit conversations rules.');

        //update
        await db.execute('update conv set title=@t, xuser_daily_max=@m, post_max_size=@p',
          substitutionValues: {'t': args.title, 'm': args.userDailyMax, 'p': args.postMaxSize});

      } else { //create new conv
        //user must be joined to parent record
        if (! (await Permissions.isConvCreatable(db, ai.id, projectId, eventId)))
          throw new Exception('Conversations can be created only if you are a member of the project or event.');

        //create
        DateTime now = WLib.utcNow();
        convId = await MiscLib.queryScalar(db, 'insert into conv(project_id,event_id,title,open,from_conv_id,post_max_size,xuser_daily_max,created_at,last_activity,activity_flag)'
          'values(${projectId},${eventId}, @t, \'Y\', ${args.fromConvId}, ${args.postMaxSize}, ${args.userDailyMax}, @d1, @d2, \'N\')'
          'returning id',
          {'t': args.title, 'd1': now, 'd2': now}
          );

        //join creator to conversation
        await ConvLib.writeConvUser(db, convId, ai.id, 'J', 'I');

        //copy opening post if spawning conv from an existing post
        if (args.openingPostId != null) {
          final templatePost = await MiscLib.query(db, 'select author_id,ptext,tw_position,has_image from conv_post where id=@i',
            {'i': args.openingPostId});
          if (templatePost.length > 0) {
            final templatePost0 =templatePost[0];
            int authorId = templatePost0['author_id'];
            String ptext = templatePost0['ptext'];
            bool hasImage = templatePost0['has_image'] == 'Y';
            int twPosition = templatePost0['tw_position'];
            String newPostId = await ConvLib.writeConvPost(db, convId, authorId, ptext, twPosition, hasImage, WLib.utcNow());
            if (hasImage)
              await ImageLib.duplicatePostImage(args.openingPostId, newPostId);
          }
        }
      }
    });
    return dbBase(dbresult, newId:convId);
  }

  ///get limited extra info about a post (which would be too inefficient to get in ConvGet)
  Future<ConvPostGetResponse> convPostGet(ConvPostGetRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return ConvPostGetResponse(base: authFail);

    //declare return values
    String retAvatarUrl, retCreatedAtReadable, retThrottleDescription, retReaction, retAllReasons;
    bool retCanCensor;

    final dbresult = await Database.safely('ConvPostGet', (db) async {
      //get info from the post
      final postRow = await MiscLib.queryRow(db, 'select conv_id,author_id,created_at from conv_post where id=@i', {'i': args.postId});
      if (postRow == null) throw new Exception('Post does not exist');
      int convId = postRow['conv_id'];
      int authorId = postRow['author_id'];

      //get info from the author
      final authorRow = await MiscLib.queryRow(db, 'select avatar_no,timezone from xuser where id=${authorId}', null);
      if (authorRow != null) {
        retAvatarUrl = ImageLib.getAvatarUrl(authorId, authorRow['avatar_no']);
        retCreatedAtReadable = DateLib.formatDateTime(postRow['created_at'], authorRow['timezone']) + ' (${authorRow['timezone']})';
      }

      //get info from the conv
      final convRow = await MiscLib.queryRowChecked(db, 'select project_id,event_id,post_max_size,xuser_daily_max from conv where id=${convId}', 'Conversation does not exist', null);
      int projectId = convRow['project_id']; //null ok
      int eventId = convRow['event_id']; //null ok

      //get info about the author in relation to the project
      retThrottleDescription = '';
      if (projectId != null) {
        final projectUserRow = await MiscLib.queryRowChecked(db, 'select spam_count from project_xuser where project_id=${projectId} and xuser_id=${authorId}', 'User is not joined to project', null);
        int spamCount = projectUserRow['spam_count'];
        RestrictionInfo ri = Permissions.spamCountToRestrictions(ApiGlobals.configSettings, spamCount);
        if (ri.restrictionLevel > 0)
          retThrottleDescription = 'User is permitted one post every ${ri.restDays} day(s).';
      }

      //if current user is proj manager, load censoring info
      retCanCensor = await Permissions.isConvManager(db, ai.id, projectId, eventId);
      if (retCanCensor) {
        final reactionRows = await MiscLib.query(db, 'select created_by,reaction,reason from conv_post_xuser where conv_post_id=@i',
          {'i': args.postId});
        List<String> reasons = new List<String>();
        int inappropriateCount = 0;
        for (final reactionRow in reactionRows) {
          if (reactionRow['created_by'] == ai.id) retReaction = reactionRow['reaction'];
          if (reactionRow['reaction'] == 'X') ++inappropriateCount;
          String reason = reactionRow['reason'];
          if (reason != null && !reason.isEmpty) reasons.add(reason);
        }
        retAllReasons = reasons.join('; ');
        if (inappropriateCount < 2) retCanCensor = false; //can censor only if manager and post has 2 downvotes
      }
    });
    return ConvPostGetResponse(base: dbBase(dbresult), 
      avatarUrl: retAvatarUrl, 
      createdAtReadable: retCreatedAtReadable,
      throttleDescription: retThrottleDescription,
      canCensor: retCanCensor ? 'Y' : 'N',
      reaction: retReaction,
      allReasons: retAllReasons
    );
  }

  ///save a new post, or censor or delete  post
  Future<APIResponseBase> convPostSave(ConvPostSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ConvPostSave', (db) async {
      await MiscLib.touchUser(db, ai.id);
      int convId = args.convId; //may be overridden

      //get info about existing post
      int authorId = null;
      if (args.postId != null) {
        final postRow = await MiscLib.queryRow(db, 'select conv_id,author_id from conv_post where id=@i', {'i': args.postId});
        if (postRow == null) throw new Exception('Post does not exist');
        convId = postRow['conv_id'];
        authorId = postRow['author_id'];
      }

      //get info from the conv
      final convRow = await ConvLib.getConvRow(db, convId);
      int projectId = convRow['project_id']; //null ok
      int eventId = convRow['event_id']; //null ok

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
            substitutionValues: {'i': args.postId});
        }
      }

      //if storing new post..
      else if (args.postId == null) {
        authorId = ai.id;

        //check permissions
        await Permissions.checkConvPostPermissions(ApiGlobals.configSettings, db, ai.id, convId, convRow, projectId, args.ptext.length);

        //write it
        final twarning = args.triggerWarning ?? '';
        String ptextWithWarning = twarning + (args.ptext ?? '');
        int twPosition = twarning.length;
        if (twPosition == 0) twPosition = null;
        DateTime createdAt = WLib.utcNow();
        await ConvLib.writeConvPost(db, convId, authorId, ptextWithWarning, twPosition, false, createdAt);

        //update conv activity
        await db.execute('update conv set last_activity=@t, activity_flag=\'Y\' where id=${convId}',
          substitutionValues: {'t': createdAt});

        //update this user's read position (in the simple case, this means it won't
        // show the post as unread to them, as long as there weren't intervening
        // posts)
        if (args.lastKnownWDT != null) {
          await ConvLib.smartUpdateReadPosition(db, convId, authorId, createdAt, WLib.wireToDateTime(args.lastKnownWDT));
        }
      }
    });
    return dbBase(dbresult);
  }

  ///save a new post with an image
  Future<APIResponseBase> convPostImageSave(ConvPostImageSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ConvPostImageSave', (db) async {
      //get info from the conv
      final convRow = await ConvLib.getConvRow(db, args.convId);
      int projectId = convRow['project_id']; //null ok

      //check permissions
      await Permissions.checkConvPostPermissions(ApiGlobals.configSettings, db, ai.id, args.convId, convRow, projectId, args.ptext.length);

      //write it
      String postId = await ConvLib.writeConvPost(db, args.convId, ai.id, args.ptext, null, true, WLib.utcNow());
      await ImageLib.savePostImage(postId, args.imageBytes);
    });
    return dbBase(dbresult);
  }

  ///save reaction to a post
  Future<APIResponseBase> convPostUserSave(ConvPostUserSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ConvPostUserSave', (db) async {
      //must be joined to conv (not checked because low security risk)

      //delete, update or insert conv_post_xuser
      if ((args.reaction ?? '').length == 0) {
        await db.execute('delete from conv_post_xuser where conv_post_id=@i and created_by=${ai.id}',
          substitutionValues: {'i': args.postId});
      } else {
        int nrows = await db.execute('update conv_post_xuser set reaction=@r,reason=@why where conv_post_id=@i and created_by=${ai.id}',
          substitutionValues: {'r': args.reaction, 'why': args.reason, 'i': args.postId});
        if (nrows == 0) {
          await db.execute('insert into conv_post_xuser(conv_post_id,created_by,reaction,reason,processed)'
            ' values(@i,${ai.id},@r,@why,\'N\')',
            substitutionValues: {'r': args.reaction, 'why': args.reason, 'i': args.postId});
        }
      }
    });
    return dbBase(dbresult);
  }

  ///save read position
  Future<APIResponseBase> convSetReadPosition(ConvSetReadPositionRequest args) async {

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ConvSetReadPosition', (db) async {
      await ConvLib.smartUpdateReadPosition(db, args.convId, ai.id, WLib.wireToDateTime(args.positionWDT), null);
    });
    return dbBase(dbresult);
  }

  ///join, quit, or update likes for a conv
  Future<ConvUserSaveResponse> convUserSave(ConvUserSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return ConvUserSaveResponse(base: authFail);

    //what is being attempted?
    bool isQuitting = args.status == 'Q';
    bool isUpdatingPrefs = args.like != null || args.bookmarked != null;
    bool isJoining = args.status == 'J';

    String retAction;
    final dbresult = await Database.safely('ConvUserSave', (db) async {
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
        await db.execute(sql, substitutionValues: builder.paramsMap);
      }

      //if joining..
      else if (isJoining) {
        //get allowed maximums for participation
        JoinInfo permissions = await Permissions.getConvJoinPermissions(db, ai.id, args.convId);

        //join or request joining based on permissions
        if (permissions.mayJoin) {
          await ConvLib.join(db, ai.id, args.convId, permissions);
          retAction = 'J';
        } else if (permissions.mayRequest) {
          await ConvLib.writeConvUser(db, args.convId, ai.id, 'A', 'N');
          await ProposalLib.proposeJoinConv(db, ai.id, ai.nick, permissions.projectId, args.convId);
          retAction = 'R';
        } else {
          retAction = 'X';
        }
      }
    });
    return ConvUserSaveResponse(base: dbBase(dbresult), action: retAction);
  }

  ///get all root docs; no authentication
  Future<DocQueryResponse> docQuery(DocQueryRequest args) async {
    if (args.mode != 'R') throw new Exception('unknown mode');
    final docs = new List<DocQueryItem>();
    final dbresult = await Database.safely('DocQuery', (db) async {
      String sql = 'select id, title from doc where project_id in (select id from project where kind=\'R\') order by title';
      final docRows = await MiscLib.query(db, sql, null);
      for (final row in docRows) {
        var item = new DocQueryItem(iid: row['id'], title: row['title']);
        docs.add(item);
      }
    });
    return DocQueryResponse(base: dbBase(dbresult), docs: docs);
  }

  ///get all docs matching criteria
  Future<DocGetResponse> docGet(DocGetRequest args) async {
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok
    String timeZoneName = ai != null ? ai.timeZoneName : null;

    //declare return values
    int retDocId, retProjectId, retProposalId;
    String retTitle, retProjectTitle, retBody, retHtmlDiff, retCreatedAt, retReasonNotEditable;
    bool retIsProjectManager = false, retAllowSave;
    final retVerList = new List<DocGetVersionItem>();

    final dbresult = await Database.safely('DocGet', (db) async {
      //get info about doc (but don't load text yet)
      String whereClause = 'id=${args.docId}';
      if (args.specialCode != null && args.specialCode.length < 50)
        whereClause = 'special_code=\'${args.specialCode}\'';
      final docRow = await MiscLib.queryRowChecked(db, 'select id,title,project_id,revision_no from doc where ${whereClause}', 'Document does not exist', null);
      retDocId = docRow['id'];
      retProjectId = docRow['project_id'];
      if (retProjectId == ApiGlobals.rootProjectId) retProjectId = null;
      retTitle = docRow['title'];
      int latestRevisionNo = docRow['revision_no'];

      //get info about associated project (must be logged in and joined to proj for this)
      if (retProjectId != null) {
        final authFail = Authenticator.ensureLoggedIn(ai);
        if (authFail != null) throw new Exception('You must be logged in to request a project document');
        String kind = await Permissions.getProjectUserKind(db, ai.id, retProjectId);
        if (Permissions.isProjectUserKindIn(kind, testForManager: true))
          retIsProjectManager = true;
        bool isJoined = Permissions.isProjectUserKindIn(kind);
        if (!isJoined) throw new Exception('You are not part of this project');
        final projRow = await MiscLib.queryRowChecked(db, 'select title from project where id=${retProjectId}', 'Project does not exist', null);
        retProjectTitle = projRow['title'];
      }

      //load doc and html diff
      DocDiffInfo info = await DiffLib.load(db, retDocId, args.revisionNo, true);
      retBody = info.after;
      String before = info.before ?? '';
      String after = info.after ?? '';
      retHtmlDiff = DiffLib.buildReviewHtml(before, after);
      retCreatedAt = DateLib.formatDateTime(info.afterCreatedAt, timeZoneName); 
      retProposalId = info.beforeProposalId;

      //load last 100 versions
      if (args.getVerList == 'Y') {
        final revRows = await MiscLib.query(db, 'select revision_no,created_at from doc_revision where doc_id=${retDocId} limit 100 order by revision_no desc', null);
        for (final revRow in revRows) {
          var i = new DocGetVersionItem(revisionNo: revRow['revision_no'], createdAtR: DateLib.formatDateTime(revRow['created_at'], timeZoneName)); 
          retVerList.add(i);
        }
      }

      //include information about whether the user may edit
      retAllowSave = true;
      if (latestRevisionNo != info.afterRevNo) {
        retAllowSave = false;
        retReasonNotEditable = 'You cannot edit an old version; you must open the latest version to be able to edit.';
      }
      if (retProjectId == null) {
        //check for active proposals on this root doc
        int proposalCount = await MiscLib.queryScalar(db, 'select count(*) from proposal where active=\'Y\' and doc_id=${retDocId}', null);
        if (proposalCount > 0) {
          retAllowSave = false;
          retReasonNotEditable = 'You cannot edit the document now because there is a proposal for another edit awaiting a decision';
        }
      }
    });
    return DocGetResponse(base: dbBase(dbresult),
      docId: retDocId,
      projectId: retProjectId,
      title:retTitle,
      projectTitle: retProjectTitle,
      body: retBody,
      htmlDiff: retHtmlDiff,
      isProjectManager: retIsProjectManager ? 'Y' : 'N',
      proposalId: retProposalId,
      createdAtR: retCreatedAt,
      verList: retVerList,
      allowSave: retAllowSave ? 'Y' : 'N',
      reasonNotEditable: retReasonNotEditable
    );
  }

  ///create or update a document
  Future<APIResponseBase> docSave(DocSaveRequest args) async {
    assert(args.docId != null);

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    int newId;
    final dbresult = await Database.safely('DocSave', (db) async {
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
          await db.execute('update doc set title=@t where id=${args.docId} and project_id=${args.projectId}', 
            substitutionValues: {'t': args.title});
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
          newId = linkId;
        }

        //if project doc exists..
        else {
          //if latest ver is blank and is revision 1 then just update it to the
          // 1st real version and don't save any history
          if (diffInfo.afterRevNo == 1 && (committedBody ?? '').length == 0) {
            await db.execute('update doc set body=@b where id=${args.docId} and project_id=${args.projectId}',
              substitutionValues: {'b': args.body});
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
        await ProposalLib.proposeRootDocumentChange(ApiGlobals.configSettings, db, ai.id, args.docId, args.title, args.summary,
          changeHtml, args.body);
      }
    });

    return dbBase(dbresult, newId: newId);
  }

  ///roll back a project document to the previous version
  Future<APIResponseBase> docRollback(DocRollbackRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('DocRollback', (db) async {
      //rights checks
      final docRow = await MiscLib.queryRowChecked(db, 'select project_id,revision_no,title from doc where id=${args.docId}', 'Document does not exist', null);
      int projectId = docRow['project_id'];
      if (projectId == null) throw new Exception('Only project documents can be rolled back');
      if (docRow['revision_no'] != args.revisionNo) throw new Exception('Another user modified the document at the same time; this version cannot be rolled back');
      bool isManager = await Permissions.isConvManager(db, ai.id, projectId, null);
      if (!isManager) throw new Exception('Only project managers can roll back documents');

      //roll back
      DiffLib.unreviseDocument(db, args.docId, args.revisionNo);

      //notify project managers (except current user) that the doc was rolled back
      List<int> projectManagers = await MiscLib.getProjectManagers(db, projectId);
      for (int uid in projectManagers) {
        if (uid == ai.id) continue;
        await MiscLib.notify(db, uid, 'A project document change was rolled back',
          linkText: docRow['title'], linkKey: 'doc/${args.docId}');
      }
    });
    return dbBase(dbresult);
  }

  ///get all events matching criteria
  Future<EventQueryResponse> eventQuery(EventQueryRequest args) async {
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok
    String tzName = null;
    if (ai != null) tzName = ai.timeZoneName;

    final events = new List<EventItemResponse>();
    final dbresult = await Database.safely('EventQuery', (db) async {
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

      final rows = await MiscLib.query(db, sql, builder.paramsMap);

      //fill in events
      for (final row in rows) {
        var item = new EventItemResponse(iid: row['id'], title: row['title'],
          startTime: DateLib.formatDateTime(row['start_time'], tzName),
          creatorId: row['created_by'],
          creatorNick: row['nick']);
        events.add(item);
      }
    });
    return EventQueryResponse(base: dbBase(dbresult), events: events);
  }

  ///get single event
  Future<EventGetResponse> eventGet(EventRequest args) async {
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok
    String tzName = null;
    if (ai != null) tzName = ai.timeZoneName;

    //declare return values
    String retTitle, retDescription, retLocation, retDuration, retCreatorNick, retCreatorAvatarUrl, retLat, retLon,
      retStartTimeU, retStartTimeR, retCreatedAtR;
    int retCreatorId;
    bool retIsCreator;
    final retUsers = new List<EventGetUserResponse>();
    final retConvs = new List<EventGetConvResponse>();

    final dbresult = await Database.safely('EventGet', (db) async {
      //load from event and xuser
      String sql = 'select event.*, xuser.nick, xuser.avatar_no'
        ' from event inner join xuser on event.created_by=xuser.id'
        ' where event.id=${args.eventId}';
      final eventRow = await MiscLib.queryRowChecked(db, sql, 'Event does not exist', null);
      retTitle = eventRow['title'];
      retDescription = eventRow['description'];
      retDuration = eventRow['duration'];
      retLocation = eventRow['location'];
      retCreatorId = eventRow['created_by'];
      retCreatorNick = eventRow['nick'];
      retCreatorAvatarUrl = ImageLib.getAvatarUrl(retCreatorId, eventRow['avatar_no']);
      retLat = eventRow['lat'].toString();
      retLon = eventRow['lon'].toString();
      DateTime startTime = eventRow['start_time'];
      retStartTimeU = DateLib.packUtcDateEntry(startTime, tzName);
      retStartTimeR = DateLib.formatDateTime(startTime, tzName);
      DateTime createTime = eventRow['created_at'];
      retCreatedAtR = DateLib.formatDateTime(createTime, tzName);
      retIsCreator = ai != null && ai.id == retCreatorId;

      //load from event_xuser
      final userRows = await MiscLib.query(db, 'select xuser_id,nick,avatar_no,public_name,event_xuser.status,event_xuser.status_desc from event_xuser inner join xuser on event_xuser.xuser_id=xuser.id where event_xuser.event_id=${args.eventId}', null);
      for (final row in userRows) {
        var item = new EventGetUserResponse(
          userId: row['xuser_id'],
          nick: row['nick'],
          publicName: row['public_name'],
          avatarUrl: ImageLib.getAvatarUrl(row['xuser_id'], row['avatar_no']),
          status: row['status'],
          statusDesc: row['status_desc']);
        retUsers.add(item);
      }

      //load from convs linked to event
      final convRows = await MiscLib.query(db, 'select id,open,title,last_activity from conv where event_id=${args.eventId}', null);
      for (final row in convRows) {
        var item = new EventGetConvResponse(
          iid: row['id'],
          open: row['open'],
          title: row['title'],
          lastActivity: WLib.dateTimeToWire(row['last_activity']));
        retConvs.add(item);
      }

    });
    return EventGetResponse(base: dbBase(dbresult),
      title: retTitle,
      description: retDescription,
      location: retLocation,
      duration: retDuration,
      creatorId: retCreatorId,
      creatorNick: retCreatorNick,
      creatorAvatarUrl: retCreatorAvatarUrl,
      lat: retLat,
      lon: retLon,
      startTimeU: retStartTimeU,
      startTimeR: retStartTimeR,
      isCreator: retIsCreator ? 'Y' : 'N',
      createdAtR: retCreatedAtR,
      users: retUsers,
      convs: retConvs
    );
  }

  ///create or update event
  Future<APIResponseBase> eventSave(EventSaveRequest args) async {
    assert(args.eventId != null);
    double lat = double.parse(args.lat);
    double lon = double.parse(args.lon);

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('EventSave', (db) async {
      DateTime startTimeUtc = DateLib.unpackConvertDateEntry(args.startTime, ai.timeZoneName);

      //new event
      if (args.eventId == 0) {
        await ProposalLib.proposeNewEvent(db, ai.id, args.title, args.description,
          startTimeUtc, args.duration, lat, lon, args.location);
      }

      else {//existing event
        //get some existing values
        final eventRow = await MiscLib.queryRowChecked(db, 'select created_by,start_time from event where id=${args.eventId}', 'Event does not exist', null);
        bool startChanged = startTimeUtc.millisecondsSinceEpoch != eventRow['start_time'].millisecondsSinceEpoch;

        //must be the owner to update
        if (eventRow['created_by'] != ai.id)
          throw new Exception('Only the creator of an event can update it');

        //save changes
        await db.execute('update event set title=@t,description=@d,start_time=@s,duration=@du,'
          'lat=${args.lat},lon=${args.lon},location=@lo'
          ' where id=${args.eventId}',
          substitutionValues: {'t': args.title, 'd': args.description, 's': startTimeUtc, 'du': args.duration,
          'lo': args.location});

        //if start time changed, notify everyone of the change
        if (startChanged) {
          String body = 'The event "${args.title}" changed to a new time. It now starts at ';
          String sql = 'select xuser.id,timezone from event_xuser inner join xuser on event_xuser.xuser_id=xuser.id where event_xuser.event_id=${args.eventId} and event_xuser.status=\'A\'';
          final userRows = await MiscLib.query(db, sql, null);
          for(final userRow in userRows) {
            try {
              String formattedStartTime = DateLib.formatDateTime(startTimeUtc, userRow['timezone'])
                + ' (shown in your time zone: ${userRow['timezone']})';
              await MiscLib.notify(db, userRow[0], body + formattedStartTime,
                linkText: args.title, linkKey: 'event/${args.eventId}');
            } catch (ex) {} //on tz conversion error, don't notify that one person
          }
        }
      }
    });
    return dbBase(dbresult);
  }

  ///delete event
  Future<APIResponseBase> eventDelete(EventRequest args) async {
    assert(args.eventId != null);

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('EventDelete', (db) async {
      //get some existing values
      final eventRow = await MiscLib.queryRowChecked(db, 'select created_by,start_time from event where id=${args.eventId}', 'Event does not exist', null);

      //must be the owner to delete
      if (eventRow['created_by'] != ai.id)
        throw new Exception('Only the creator of an event can delete it');

      //delete
      await CleanDeleter.deleteEvent(db, args.eventId);
    });
    return dbBase(dbresult);
  }

  ///for an event save whether the authenticated user is coming or not
  Future<APIResponseBase> eventUserSave(EventUserSaveRequest args) async {
    assert(args.eventId != null);

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('EventUserSave', (db) async {
      //update or create record
      var params = {'s': args.status, 'sd': args.statusDesc};
      int count = await db.execute('update event_xuser set status=@s, status_desc=@sd where event_id=${args.eventId} and xuser_id=${ai.id}',
        substitutionValues: params);
      if (count == 0) {
        await db.execute('insert into event_xuser(event_id,xuser_id,status,status_desc)values(${args.eventId},${ai.id},@s,@sd)',
          substitutionValues: params);
      }
    });
    return dbBase(dbresult);
  }

  ///get all projects matching criteria
  Future<ProjectQueryResponse> projectQuery(ProjectQueryRequest args) async {
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok

    final projects = new List<ProjectQueryItem>();
    final dbresult = await Database.safely('ProjectQuery', (db) async {
      //build query: note 2 versions of sql for logged in and not logged in
      final builder = QueryClauseBuilder();
      builder.add('project.kind=\'P\'');
      if (args.catId != null) builder.add('category_id=${args.catId}');
      if (args.title != null) builder.add('lower(title) like @t', name:'t', value: '%${args.title.toLowerCase()}%');
      if (builder.count < 2) throw new Exception('must search on at least one criterion');
      String sql = 'select id,title,leadership,privacy,important_count,\'N\' as kind,description from project'
        ' where ${builder.whereClause} limit 100';
      if (ai != null) {
        sql = 'select id,title,leadership,privacy,important_count,project_xuser.kind,description from project'
          ' left join project_xuser on project.id=project_xuser.project_id and xuser_id=${ai.id}'
          ' where ${builder.whereClause} limit 100';
      }

      final rows = await MiscLib.query(db, sql, builder.paramsMap);

      //define converting a row to a sortable value
      int rowToSortValue(Map<String, dynamic> r) {
        //combine kind and important into a number with higher negative values = better
        int importants = r['important_count'];
        String kind = r['kind']; //note if not logged in, kind is always 'N'
        int big = 0 - max(importants, 9999);
        if (kind == 'M') big -= 30000;
        else if (kind == 'A') big -= 20000;
        else if (kind != null) big -= 10000;
        return big;
      };

      //sort by kind(manager,active,other), subsort by important_count
      rows.sort((Map<String, dynamic> a, Map<String, dynamic> b) {
        return rowToSortValue(a).compareTo(rowToSortValue(b));
      });

      //fill in projects
      for (final row in rows) {
        var item = new ProjectQueryItem(
          projectId: row['id'],
          title: row['title'],
          leadership: row['leadership'],
          privacy: row['privacy'],
          description: row['desciption']);
        projects.add(item);
      }
    });
    return ProjectQueryResponse(base: dbBase(dbresult), projects: projects);
  }

  ///get one project for display, with related proposals, convs, docs
  Future<ProjectGetResponse> projectGet(ProjectGetRequest args) async {
    //allow not logged in (but if logged in, behaves better)
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    String tzName = ai != null ? ai.timeZoneName : null;

    //declare return values
    String retActive, retLeadership, retPrivacy, retTitle, retDescription, retUserKind;
    int retCategoryId;
    var retProposals = List<ProjectProposalItem>();
    var retConvs = List<ProjectConvItem>();
    var retDocs = List<ProjectDocItem>();

    final dbresult = await Database.safely('ProjectGet', (db) async {
      //load project info
      final projectRow = await MiscLib.queryRowChecked(db, 'select active,leadership,privacy,title,description,category_id from project where id=${args.projectId}', 'Project does not exist', null);
      retActive = projectRow['active'];
      retLeadership = projectRow['leadership'];
      retPrivacy = projectRow['privacy'];
      retTitle = projectRow['title'];
      retDescription = projectRow['description'];
      retCategoryId = projectRow['category_id'];

      //load this user's status in project (if logged in)
      retUserKind = 'N';
      if (ai != null) {
        retUserKind = await Permissions.getProjectUserKind(db, ai.id, args.projectId);
      }
      bool isJoined = retUserKind == 'M' || retUserKind == 'A' || retUserKind == 'V' || retUserKind == 'O';
      bool canViewDetails = isJoined || (retPrivacy == 'P' || retPrivacy == 'A');

      //hide some things if not allowed
      if (!canViewDetails) {
        retDescription = '';
      }

      //load child records
      retProposals = (await MiscLib.query(db, 'select id,active,title,created_at from proposal where project_id=${args.projectId} order by created_at desc', null))
        .map((row) => new ProjectProposalItem(iid: row['id'], active: row['active'], title: row['title'],
        createdAtR: DateLib.formatDateTime(row['created_at'], tzName)
        )).toList();
      retConvs = (await MiscLib.query(db, 'select id,open,title,last_activity from conv where project_id=${args.projectId} order by last_activity desc', null))
        .map((row) => new ProjectConvItem(iid: row['id'], open: row['open'], title: row['title'],
        lastActivity: DateLib.formatDateTime(row['last_activity'], tzName)
        )).toList();
      retDocs = (await MiscLib.query(db, 'select id,title from doc where project_id=${args.projectId} order by title', null))
        .map((row) => new ProjectDocItem(iid: row['id'], title: row['title']
        )).toList();
    });
    return ProjectGetResponse(base: dbBase(dbresult),
      active: retActive,
      leadership: retLeadership,
      privacy: retPrivacy,
      title: retTitle,
      description: retDescription,
      categoryId: retCategoryId,
      userKind: retUserKind,
      proposals: retProposals,
      convs: retConvs,
      docs: retDocs
    );
  }

  ///create or update project
  Future<APIResponseBase> projectSave(ProjectSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ProjectSave', (db) async {
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
          String oldleadership = await MiscLib.queryScalar(db, 'select leadership from project where id=${args.projectId}', null);
          if (oldleadership == 'D') throw new Exception('Cannot change a democratic project to fixed leadership.');
        }

        //save changes
        await db.execute('update project set leadership=@l,privacy=@p,category_id=${args.categoryId},title=@t,description=@d'
          ' where id=${args.projectId}',
          substitutionValues: {'l':args.leadership, 'p':args.privacy, 't':args.title, 'd':args.description});
      }
    });
    return dbBase(dbresult);
  }

  ///get info about users in a project
  Future<ProjectUserQueryResponse> projectUserQuery(ProjectUserQueryRequest args) async {
    final int pageSize = 100;

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return ProjectUserQueryResponse(base: authFail);

    //declare return variables
    String retProjectTitle;
    bool retEditable;
    final retUsers = new List<ProjectUserItem>();

    final dbresult = await Database.safely('ProjectUserQuery', (db) async {
      //get project info
      final projectRow = await MiscLib.queryRowChecked(db, 'select privacy,leadership,title from project where id=${args.projectId}', 'Project does not exist', null);
      String privacy = projectRow['privacy'];
      bool isPrivate = privacy == 'I' || privacy == 'R';
      retProjectTitle = projectRow['title'];

      //determine rights; must be joined to view private project members
      String userKind = await Permissions.getProjectUserKind(db, ai.id, args.projectId);
      bool isJoined = Permissions.isProjectUserKindIn(userKind);
      bool isManager = Permissions.isProjectUserKindIn(userKind, testForManager: true);
      if (isPrivate && !isJoined) throw new Exception('Only members can query users in private projects');
      retEditable = isManager && projectRow['leadership'] == 'F';

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
      final userRows = await MiscLib.query(db, sql, params);
      for (final row in userRows) {
        if (row['kind'] == 'N') continue; //as if never joined
        String throttle = '';
        RestrictionInfo spamInfo = Permissions.spamCountToRestrictions(ApiGlobals.configSettings, row['spam_count']);
        if (spamInfo.restrictionLevel > 0) {
          throttle = 'User may post every ${spamInfo.restDays} days (max ${spamInfo.charLimit} chars)';
        }
        final int rowUserId = row['xuser_id'];
        final u = ProjectUserItem(
          userId: rowUserId,
          kind: row['kind'],
          nick: row['nick'],
          publicName: row['public_name'],
          voteKind: row['votekind'],
          avatarUrl: ImageLib.getAvatarUrl(rowUserId, row['avatar_no']),
          throttle: throttle
        );
        retUsers.add(u);
      }
    });

    //assume that if the query yielded 100 rows, there are probably more
    bool completeLoad = retUsers.length < pageSize;

    return ProjectUserQueryResponse(base: dbBase(dbresult),
      projectTitle: retProjectTitle,
      editable: retEditable ? 'Y': 'N',
      users: retUsers,
      completeLoad: completeLoad ? 'Y' : 'N'
    );
  }

  ///quit or downgrade own role in project, or change another member's role
  Future<APIResponseBase> projectUserSave(ProjectUserSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ProjectUserSave', (db) async {
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
            substitutionValues: {'k':kind});
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
        int numManagers = await MiscLib.queryScalar(db, 'select count(*) from project_xuser where project_id=${args.projectId} and kind=\'M\'', null) ?? 0;
        if (numManagers == 0) {
          //no managers left, so make project democratic;
          //the worker process will eventually assign leaders and notify them
          await db.execute('update project set leadership=\'D\' where id=${args.projectId}');
        }
      }
    });
    return dbBase(dbresult);
  }

  ///record a vote for/against another user taking leadership in a project
  Future<APIResponseBase> projectUserUserSave(ProjectUserUserSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ProjectUserUserSave', (db) async {
      //check current user is joined to project
      bool isJoined = await Permissions.isJoinedToProject(db, ai.id, args.projectId);
      if (!isJoined) throw new Exception('You can only vote if you are a member of the project.');

      //can't vote for self
      if (ai.id == args.aboutId) throw new Exception('Cannot vote for yourself.');

      //store vote
      int count = await db.execute('update project_xuser_xuser set kind=@k where project_id=${args.projectId} and owner_id=${ai.id} and about_id=${args.aboutId}',
        substitutionValues: {'k': args.kind});
      if (count == 0) {
        await db.execute('insert into project_xuser_xuser(project_id,owner_id,about_id,kind)values(${args.projectId},${ai.id},${args.aboutId},@k)',
          substitutionValues: {'k': args.kind});
      }
    });
    return dbBase(dbresult);
  }

  ///get all proposals matching inputs; no authentication
  Future<ProposalQueryResponse> proposalQuery(ProposalQueryRequest args) async {
      final items = new List<ProposalQueryItem>();

    final dbresult = await Database.safely('ProposalQuery', (db) async {
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
      final proposalRows = await MiscLib.query(db, 'select id,title,kind from proposal where ${where.whereClause} order by created_at',
        where.paramsMap);
      for (final row in proposalRows) {
        var item = new ProposalQueryItem(iid: row['id'], title: row['title'], kind: row['kind']);
        items.add(item);
      }
    });
    return ProposalQueryResponse(base: dbBase(dbresult), items: items);
  }

  ///get details on one proposal
  Future<ProposalGetResponse> proposalGet(ProposalGetRequest args) async {
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);//null ok

    //declare return values
    String retKind, retActive, retEligible, retTitle, retTimeout, retSummary, retSummaryHtml,
      retDtext, retDeleteTime, retCreatedByNick, retCreatedByAvatarUrl, retMyEligible, retStatusDescription;
    int retWinningOption, retCreatedBy, retProjectId, retDocId, retMyVote;
    final retOptions = new List<ProposalOptionItem>();

    final dbresult = await Database.safely('ProposalGet', (db) async {
      //get row
      final row = await MiscLib.queryRowChecked(db, 'select * from proposal where id=${args.proposalId}', 'Proposal does not exist', null);

      //convert to output format
      retKind = row['kind'];
      retActive = row['active'];
      retEligible = row['eligible'];
      retTitle = row['title'];
      retSummary = row['summary'];
      retSummaryHtml = row['summary_html'];
      retDtext = row['dtext'];
      retTimeout = WLib.dateTimeToWire(row['timeout']);
      retDeleteTime = WLib.dateTimeToWire(row['delete_time']);
      retWinningOption = row['winning_option'];
      retCreatedBy = row['created_by'];
      retProjectId = row['project_id'];
      retDocId = row['doc_id'];

      //get info on creator
      final userRow = await MiscLib.userRowForAvatars(db, retCreatedBy);
      retCreatedByNick = userRow['nick'];
      retCreatedByAvatarUrl = ImageLib.getAvatarUrl(retCreatedBy, userRow['avatar_no']);

      //unpack options and votes maps
      Map<String, dynamic> optionsMap = MiscLib.jsonToMap(row['options']);
      Map<String, dynamic> countMap = MiscLib.jsonToMap(row['vote_counts']);
      optionsMap.forEach((opt, desc) {
        int optN = int.parse(opt);
        int voteCount = 0;
        if (countMap != null && countMap.containsKey(opt))
          voteCount = countMap[opt];
        var item = new ProposalOptionItem(optionNo: optN, optionDesc: desc.toString(), voteCount: voteCount);
        retOptions.add(item);
      });

      //load this user's vote and eligibility
      retMyEligible = 'N';
      if (ai != null) {
        bool canVote = await ProposalLib.isEligibleToVote(db, ai.id, ai.isSiteAdmin, row);
        if (canVote) {
          retMyEligible = 'Y';
          retMyVote = await MiscLib.queryScalar(db, 'select vote from proposal_xuser where proposal_id=${args.proposalId} and xuser_id=${ai.id}', null);
        }
      }

      //format description of voting period
      if (retActive == 'Y')
        retStatusDescription = 'Voting is open until ' + DateLib.formatSoonDate(row['timeout']);
      else if (row['delete_time'] != null)
        retStatusDescription = 'Voting closed; proposal to be deleted on ' + DateLib.formatSoonDate(row['delete_time']);
      else
        retStatusDescription = 'Voting closed';
    });
    return ProposalGetResponse(base: dbBase(dbresult),
      kind:retKind,
      winningOption: retWinningOption,
      createdBy: retCreatedBy,
      projectId: retProjectId,
      docId: retDocId,
      active: retActive,
      eligible: retEligible,
      title: retTitle,
      timeout: retTimeout,
      myVote: retMyVote,
      summary: retSummary,
      summaryHtml: retSummaryHtml,
      dtext: retDtext,
      deleteTime: retDeleteTime,
      createdByNick: retCreatedByNick,
      createdByAvatarUrl: retCreatedByAvatarUrl,
      options: retOptions,
      myEligible: retMyEligible,
      statusDescription: retStatusDescription
    );
  }

  ///create new proposal (use only for the proposal kinds that users create directly);
  /// for PROJ type only, returns newId
  Future<APIResponseBase> proposalSave(ProposalSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    int newId;
    final dbresult = await Database.safely('ProposalSave', (db) async {
      //call methods in proposalLib based on the kind
      if (args.kind == 'PROJ') {
        bool isJoined = await Permissions.isJoinedToProject(db, ai.id, args.projectId);
        if (!isJoined) throw new Exception('Only project members can create a proposal');
        int proposalId = await ProposalLib.proposeInProject(db, ai.id, args.projectId, args.eligible, args.title,
          args.summary, args.options, args.days);
        newId = proposalId;
      }
      else if (args.kind == 'SYS') {
        await ProposalLib.proposeSystemChange(ApiGlobals.configSettings, db, ai.id, args.title, args.summary, args.options);
      }
    });
    return dbBase(dbresult, newId: newId);
  }

  ///delete proposal
  Future<APIResponseBase> proposalDelete(ProposalGetRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ProposalDelete', (db) async {
      //get info on proposal to check rights
      final row = await MiscLib.queryRowChecked(db, 'select created_by,kind from proposal where id=${args.proposalId}', 'Proposal does not exist', null);
      if (ai.id != row['created_by']) throw new Exception('You can only delete your own proposal');
      String kind = row['kind'];
      bool canDeleteKind = kind == 'PROJ' || kind == 'ROOT' || kind == 'SYS';
      if (!canDeleteKind) throw new Exception('You cannot delete that kind of proposal');

      //delete
      await ProposalLib.delete(db, args.proposalId, true);
    });
    return dbBase(dbresult);
  }

  ///record vote for proposal
  Future<APIResponseBase> proposalUserSave(ProposalUserSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ProposalUserSave', (db) async {
      //check eligibility
      final proposalRow = await MiscLib.queryRowChecked(db, 'select kind,created_by,project_id,eligible from proposal where id=${args.proposalId}', 'Proposal does not exist', null);
      bool canVote = await ProposalLib.isEligibleToVote(db, ai.id, ai.isSiteAdmin, proposalRow);
      if (!canVote) throw new Exception('You are not eligible to vote on this proposal');

      //vote
      await ProposalLib.vote(db, args.proposalId, ai.id, args.vote);
    });
    return dbBase(dbresult);
  }

  ///get all 3 kinds of push queue items: notifications, unreads, and
  /// suggestions. May return error code 'FREQ' if too frequent
  Future<PushQueueGetResponse> pushQueueGet(PushQueueGetRequest args) async {
     bool isFull = args.depth == 'F';

    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return PushQueueGetResponse(base: authFail);

    //prevent frequent calling for same nick on multiple windows or machines
    if (ai.lastPushQueueGetUtc.add(new Duration(seconds:30)).isAfter(WLib.utcNow())) {
      return PushQueueGetResponse(
        base: APIResponseBase(errorCode: 'FREQ', errorMessage: 'PushQueueGet requests are too frequent', ok: 'N'),
        fullModeStatus: 'T'
      );
    }
    ai.lastPushQueueGetUtc = WLib.utcNow();
    final items = new List<PushQueueItem>();

    final dbresult = await Database.safely('PushQueueGet', (db) async {
      //load all notifications
      final notifRows = await MiscLib.query(db, 'select id,body,link_text,link_key from xuser_notify where xuser_id=${ai.id} order by created_at', null);
      for (final row in notifRows) {
        var i = new PushQueueItem(
          kind: 'N', 
          why: 'G', 
          sid: row['id'], 
          text: row['body'], 
          linkText: row['link_text'], 
          linkPaneKey: row['link_key']);
        items.add(i);
      }

      //load all unreads
      final convRows = await MiscLib.query(db, 'select conv.id as c_id,conv.title as c_title, project_xuser.kind as p_kind,'
        ' event.created_by as e_created_by,conv_xuser.status'
        ' from ((conv inner join conv_xuser on conv.id=conv_xuser.conv_id)'
        ' left join project_xuser on conv.project_id=project_xuser.project_id and project_xuser.xuser_id=${ai.id})'
        ' left join event on conv.event_id=event.id'
        ' where conv_xuser.position_flag=\'U\' and conv_xuser.status=\'J\' and conv_xuser.xuser_id=${ai.id}', null);

      //sort unreads by projects I manage, events I posted, all others
      // (subsorted by conv.id, which is the order of when conversations started)
      int compareConvRows(Map<String, dynamic> a, Map<String, dynamic> b) {
         bool aManager = a['p_kind'] == 'M', bManager = b['p_kind'] == 'M';
         if (aManager && !bManager) return 1;
         if (bManager && !aManager) return -1;
         bool aMyEvent = a['e_created_by'] == ai.id, bMyEvent = b['e_created_by'] == ai.id;
         if (aMyEvent && !bMyEvent) return 1;
         if (bMyEvent && !aMyEvent) return -1;
         return a['c_id'].compareTo(b['c_id']);
      }
      convRows.sort(compareConvRows);

      //copy unreads to output
      for (final row in convRows) {
        var i = new PushQueueItem(
          kind: 'U', 
          why: 'G', 
          iid: row['c_id'], 
          linkText: row['c_title'], 
          linkPaneKey: 'conv/' + row['c_id'].toString()
        );
        items.add(i);
      }

      //load suggestions less often
      if (isFull) {
        await MiscLib.touchUser(db, ai.id);

        //load proposals user is eligible to vote on but has not voted on
        DateTime now = WLib.utcNow();
        final proposalRows = await MiscLib.query(db, 'select id,kind,eligible,title,project_id,'
          'created_by,'
          '(select vote from proposal_xuser where proposal_id=proposal.id and xuser_id=${ai.id}) as vote'
          ' from proposal where active=\'Y\' and timeout>@now',
          {'now': now});
        int includedNEW = 0; //count of kind=NEW records included
        for (final row in proposalRows) {
          //skip if already voted
          if (row['vote'] != null) continue;

          //eligible?
          bool isEligible = await ProposalLib.isEligibleToVote(db, ai.id, ai.isSiteAdmin, row);
          if (!isEligible) continue;

          //for kind=NEW only include up to 5 to spread the load among site
          // admins
          if (row['kind'] == 'NEW') {
            if (includedNEW >= 5) continue;
            ++includedNEW;
          }

          //convert to output
          var i = new PushQueueItem(
            kind: 'S', 
            why: 'V', 
            iid: row['id'], 
            linkText: row['title'], 
            linkPaneKey: 'proposal/' + row['id'].toString()
          );
          items.add(i);
        }

        //load invited, recommended, and bookmarked convs
        final suggestRows = await MiscLib.query(db, 'select conv.id as c_id,conv.title as c_title,conv_xuser.status,conv_xuser.bookmarked'
          ' from conv inner join conv_xuser on conv.id=conv_xuser.conv_id'
          ' where conv_xuser.xuser_id=${ai.id}'
          ' and (conv_xuser.status=\'I\' or conv_xuser.status=\'R\' or bookmarked=\'Y\')', null);

        //copy invited, recommended, and bookmarked convs to output in separate
        // groups to maintain ordering
        void copy1(Map<String, dynamic> row, String kind, String why) {
          var i = new PushQueueItem(
            kind: kind,
            why: why, 
            iid: row['c_id'], 
            linkText: row['c_title'], 
            linkPaneKey: 'conv/' + row['c_id'].toString()
          );
          items.add(i);
        }
        for (final row in suggestRows.where((r) => r['status'] == 'I')) //invited
          copy1(row, 'S', 'I');
        for (final row in suggestRows.where((r) => r['status'] == 'R')) //recommended
          copy1(row, 'S', 'R');
        for (final row in suggestRows.where((r) => r['bookmarked'] == 'Y')) //bookmarked
          copy1(row, 'B', 'G');

      }//if full
    });
    return PushQueueGetResponse(base: dbBase(dbresult), items: items);
  }

  ///get all resources matching criteria
  Future<ResourceQueryResponse> resourceQuery(ResourceQueryRequest args) async {
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok
    bool isSiteAdmin = ai != null && ai.isSiteAdmin;

    final items = new List<ResourceItem>();
    final dbresult = await Database.safely('ResourceQuery', (db) async {
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
      final rows = await MiscLib.query(db, sql, builder.paramsMap);

      //fill in r.items
      for (final row in rows) {
        var item = new ResourceItem(
          iid: row['id'],
          title: row['title'],
          description: row['description'],
          url: row['url']);
        items.add(item);
      }
    });

    return ResourceQueryResponse(base: dbBase(dbresult), items: items);
  }

  ///get one resource
  Future<ResourceGetResponse> resourceGet(ResourceGetRequest args) async {
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base); //null ok
    bool isSiteAdmin = ai != null && ai.isSiteAdmin;

    //declare return variables
    int retCategoryId, retUserId, retImportantCount;
    String retTitle, retDescription, retCreatedAt, retVisible, retKind, retUrl, retNick, retUserKind;
    bool retIsCreator;

    final dbresult = await Database.safely('ResourceGet', (db) async {
      //load from resource
      String sql = 'select category_id,title,url,important_count,description,kind,created_at,visible,xuser_id'
        ',(select nick from xuser where id=resource.xuser_id) as nick'
        ' from resource where id=${args.iid}';
      final resourceRow = await MiscLib.queryRowChecked(db, sql, 'Resource does not exist', null);
      retCategoryId = resourceRow['category_id'];
      retUserId = resourceRow['xuser_id'];
      retImportantCount = resourceRow['important_count'];
      retTitle = resourceRow['title'];
      retDescription = resourceRow['description'];
      retCreatedAt = DateLib.formatDateTime(resourceRow['created_at']);
      retVisible = resourceRow['visible'];
      retKind = resourceRow['kind'];
      retUrl = resourceRow['url'];
      retIsCreator = (ai != null && retUserId == ai.id);
      retNick = resourceRow['nick'];

      //load from resource_xuser
      retUserKind = null; //meaning, there is no record
      if (ai != null) {
        String sql = 'select kind from resource_xuser where resource_id=${args.iid} and xuser_id=${ai.id}';
        retUserKind = await MiscLib.queryScalar(db, sql, null); //may be null
      }
    });
    return ResourceGetResponse(base: dbBase(dbresult),
      isSiteAdmin: isSiteAdmin ? 'Y' : 'N',
      categoryId: retCategoryId,
      userId: retUserId,
      importantCount: retImportantCount,
      title: retTitle,
      description: retDescription,
      createdAtR: retCreatedAt,
      visible: retVisible,
      kind: retKind,
      url: retUrl,
      isCreator: retIsCreator ? 'Y' : 'N',
      nick: retNick,
      userKind: retUserKind
    );
  }

  ///save a resource
  Future<APIResponseBase> resourceSave(ResourceSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ResourceSave', (db) async {
      //for new resources, store proposal and exit
      bool isNew = args.iid == 0;
      if (isNew) {
        await ProposalLib.proposeNewResource(db, ai.id, args.kind, args.title, args.description, args.url, args.categoryId);
        return;
      }

      //get owner of resource being modified
      int ownerId = await MiscLib.queryScalar(db, 'select xuser_id from resource where id=${args.iid}', null);

      //rights: must be owner or site admin to edit existing
      bool canEdit = ai.isSiteAdmin || ownerId == ai.id;
      if (!canEdit) throw new Exception('Only the owner or site administrator can edit a resource');

      //save changes
      await db.execute('update resource set title=@t, description=@d, kind=@k, url=@u where id=${args.iid}',
        substitutionValues: {'t': args.title, 'd': args.description, 'k': args.kind, 'u': args.url});
    });
    return dbBase(dbresult);
  }

  ///save a resource
  Future<APIResponseBase> resourceTriage(ResourceTriageRequest args) async {
    //must be site admin
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureSiteAdmin(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ResourceTriage', (db) async {
      //fail if visible
      String visible = await MiscLib.queryScalar(db, 'select visible from resource where id=${args.iid}', null);
      if (visible != 'N') throw new Exception('Only invisible resources can be reset or deleted.');

      //delete?
      if (args.mode == 'D') await CleanDeleter.deleteResource(db, args.iid);

      //reset?
      if (args.mode == 'R') {
        await db.execute('delete from resource_xuser where resource_id=${args.iid} and kind=\'R\'');
        await db.execute('update resource set visible=\'Y\' where id=${args.iid}');
      }
    });
    return dbBase(dbresult);
  }

  ///record votes for/against a resource
  Future<APIResponseBase> resourceUserSave(ResourceUserSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('ResourceUserSave', (db) async {
      //remove rec if kind is null
      if (args.kind == null) {
        await db.execute('delete from resource_xuser where resource_id=${args.iid} and xuser_id=${ai.id}');
      }

      else { //nonnull
        int count = await db.execute('update resource_xuser set processed=\'N\', kind=@k where resource_id=${args.iid} and xuser_id=${ai.id}',
          substitutionValues: {'k': args.kind});
        if (count == 0) {
          await db.execute('insert into resource_xuser(resource_id,xuser_id,kind,processed)values(${args.iid},${ai.id},@k,\'N\')',
            substitutionValues: {'k': args.kind});
        }
      }
    });
    return dbBase(dbresult);
  }

  ///get all users matching criteria
  Future<UserQueryResponse> userQuery(UserQueryRequest args) async {
    final users = new List<UserQueryItem>();
    final dbresult = await Database.safely('UserQuery', (db) async {
      String whereClause = '';
      Map<String, dynamic> params = new Map<String, dynamic>();
      if (args.name != null && args.name.length > 0) {
        String param1 = '%${args.name.toLowerCase()}%';
        whereClause = 'where lower(nick) like @nick or lower(public_name) like @name';
        params['nick'] = param1;
        params['name'] = param1;
      }
      final rows = await MiscLib.query(db, 'select id,nick,kind,public_name,avatar_no from xuser ${whereClause} order by last_activity desc limit 100', params);
      for (final row in rows) {
        var item = new UserQueryItem(
          iid: row['id'],
          nick: row['nick'],
          kind: row['kind'],
          publicName: row['public_name'],
          avatarUrl: ImageLib.getAvatarUrl(row['id'], row['avatar_no'])
        );
        users.add(item);
      }
    });

    return UserQueryResponse(base: dbBase(dbresult), users: users);
  }

  ///get a user
  Future<UserGetResponse> userGet(UserGetRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return UserGetResponse(base: authFail);

    //declare return variables
    String retKind, retNick, retStatus, retEmail, retPublicName, retIsSiteAdmin, retPrefEmailNotify = 'N',
      retTimeZone, retAvatarUrl, retUserUserKind;
    List<String> retAllTimeZones;
    Map<String, String> retPublicLinks;
    final retEvents = new List<APIResponseAssociation>();
    final retProjects = new List<APIResponseAssociation>();
    final retResources = new List<APIResponseAssociation>();

    final dbresult = await Database.safely('UserGet', (db) async {
      bool aboutMe = ai != null && args.userId == ai.id; //request is for this authenticated user?
      bool doLoad = args.userId > 0; //else return blank data

      //init blank data for editing
      if (args.includeEditing == 'Y') {
        retAllTimeZones = DateLib.allTimeZoneNames().toList();
        retKind = 'V';
      }

      //load user
      if (doLoad) {
        final userRow = await MiscLib.queryRowChecked(db, 'select status,nick,email,kind,site_admin,public_name,pref_email_notify,public_links,timezone,avatar_no from xuser where id=${args.userId}', 'User does not exist', null);
        retNick = userRow['nick'];
        retStatus = userRow['status'];
        retEmail = userRow['email'];
        retKind = userRow['kind'];
        retIsSiteAdmin = userRow['site_admin'];
        retPublicName = userRow['public_name'];
        retPrefEmailNotify = userRow['pref_email_notify'];
        final publicLinksMap = MiscLib.jsonToMap(userRow['public_links']);
        retPublicLinks = Map<String, String>.from(publicLinksMap);
        retTimeZone = userRow['timezone'];
        retAvatarUrl = ImageLib.getAvatarUrl(args.userId, userRow['avatar_no']);
      }

      //if for another user
      if (!aboutMe) {
        //hide some things
        retPrefEmailNotify = 'N';
        retEmail = '';

        //load this users vote for the other user
        if (ai != null)
          retUserUserKind = await MiscLib.queryScalar(db, 'select kind from xuser_xuser where owner_id=${ai.id} and about_id=${args.userId}', null);
      }

      //load all associated details
      if (args.includeDetail == 'Y') {
        //events
        var assocRows = await MiscLib.query(db, 'select id, title from event inner join event_xuser on event.id=event_xuser.event_id where event.start_time>@now and event_xuser.xuser_id=${args.userId} and event_xuser.status=\'A\' order by start_time',
          {'now': WLib.utcNow()});
        for (final row in assocRows)
          retEvents.add(new APIResponseAssociation(linkPaneKey: 'event/${row['id']}', linkText: row['title']));

        //projects
        assocRows = await MiscLib.query(db, 'select id, title from project inner join project_xuser on project.id=project_xuser.project_id where project_xuser.xuser_id=${args.userId} and project_xuser.kind<>\'N\' order by title', null);
        for (final row in assocRows)
          retProjects.add(new APIResponseAssociation(linkPaneKey: 'project/${row['id']}', linkText: row['title']));

        //resources
        assocRows = await MiscLib.query(db, 'select id, title from resource where xuser_id=${args.userId} and visible=\'Y\' order by important_count desc', null);
        for (final row in assocRows)
          retResources.add(new APIResponseAssociation(linkPaneKey: 'resource/${row['id']}', linkText: row['title']));
      }
    });

    return UserGetResponse(base: dbBase(dbresult),
      allTimeZones: retAllTimeZones,
      kind: retKind,
      nick: retNick,
      status: retStatus,
      email: retEmail,
      publicName: retPublicName,
      isSiteAdmin: retIsSiteAdmin,
      prefEmailNotify: retPrefEmailNotify,
      publicLinks: retPublicLinks,
      timeZone: retTimeZone,
      avatarUrl: retAvatarUrl,
      userUserKind: retUserUserKind,
      events: retEvents,
      projects: retProjects,
      resources: retResources
    );
  }

  ///save/create a user
  Future<APIResponseBase> userSave(UserSaveRequest args) async {
    DateTime now = WLib.utcNow();

    //must be logged in if updating
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    bool isNewUser = args.isNew == 'Y';
    if (!isNewUser) {
      final authFail = Authenticator.ensureLoggedIn(ai);
      if (authFail != null) return authFail;
    }

    final dbresult = await Database.safely('UserSave', (db) async {
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
          {'nick': args.saveNick, 'kind': args.kind, 'name': args.publicName, 'links': MiscLib.jsonParameter(args.publicLinks),
          'tz': args.timeZone, 'pref1': args.prefEmailNotify, 'd1':now, 'd2':now, 'd3':now});
      }

      //if updating (ignore saveNick)
      else {
        userId = ai.id;
        await db.execute('update xuser set kind=@kind,public_name=@name,public_links=@links,timezone=@tz,pref_email_notify=@pref1'
          ' where id=${userId}',
          substitutionValues: {'kind': args.kind, 'name': args.publicName, 'links': MiscLib.jsonParameter(args.publicLinks),
          'tz': args.timeZone, 'pref1': args.prefEmailNotify});
        Authenticator.invalidate(ai.nick);
      }

      //if email provided (either on new user or updated)...
      if (args.email != null && args.email.length > 0) {
        //store in proposed_email
        var rand = new Random();
        int code = 10000 + rand.nextInt(89999);
        var proposedEmail = {'email': args.email, 'code': code.toString()};
        await db.execute('update xuser set proposed_email=@p where id=${userId}', 
          substitutionValues: {'p': MiscLib.jsonParameter(proposedEmail)});

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
          substitutionValues: {'p': MiscLib.passwordHash(args.savePW)});
      }
    });
    return dbBase(dbresult);
  }

  ///save a user avatar
  Future<APIResponseBase> userAvatarSave(UserAvatarSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('UserAvatarSave', (db) async {
      await ImageLib.saveAvatar(db, ai.id, args.imageBytes);
    });
    return dbBase(dbresult);
  }

  ///dismiss a notification
  Future<APIResponseBase> userNotifySave(UserNotifySaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    final dbresult = await Database.safely('UserNotifySave', (db) async {
      await db.execute('delete from xuser_notify where xuser_id=${ai.id} and id=@i',
        substitutionValues: {'i':args.notifyId});
    });
    return dbBase(dbresult);
  }

  ///recover a password (see args doc for the 2 modes)
  Future<APIResponseBase> userRecoverPassword(UserRecoverPasswordRequest args) async {
    final dbresult = await Database.safely('UserRecoverPassword', (db) async {
      //get info from xuser for either mode
      final userRows = await MiscLib.query(db, 'select id,recovery_code,email,proposed_email from xuser where lower(nick)=@n and status=\'A\'',
        {'n': (args.recoveryNick ?? '').toLowerCase()});
      if (userRows.length == 0) throw new Exception('No such user');
      final userRow = userRows[0];
      int userId = userRow['id'];

      //email mode
      if (args.mode == 'E') {
        //store new random recovery code
        Random rand = new Random();
        int code = 10000 + rand.nextInt(89999);
        await db.execute('update xuser set recovery_code=@c where id=${userId}',
          substitutionValues: {'c': code.toString()});

        //email it
        String email1 = userRow['email'] ?? '';
        String email2 = null;
        final proposedEmail = MiscLib.jsonToMap(userRow['proposed_email']);
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
        if (args.code == null || args.code != userRow['recovery_code'])
          throw new Exception('Recovery code is not correct.');
        await db.execute('update xuser set password=@p where id=${userId}',
          substitutionValues: {'p': MiscLib.passwordHash(args.recoveryPassword)});
        Authenticator.invalidate(args.recoveryNick);
      }
    });
    return dbBase(dbresult);
  }

  ///save a user's opinion of another user
  Future<APIResponseBase> userUserSave(UserUserSaveRequest args) async {
    //must be logged in
    AuthInfo ai = await Authenticator.authenticateForAPI(args.base);
    final authFail = Authenticator.ensureLoggedIn(ai);
    if (authFail != null) return authFail;

    //validate
    bool ok = args.kind == 'B' || args.kind == 'F' || args.kind == null;
    if(!ok) throw new Exception('Bad kind in UserUserSave');

    final dbresult = await Database.safely('UserUserSave', (db) async {
      var params = {'k': args.kind};
      int count = await db.execute('update xuser_xuser set kind=@k where owner_id=${ai.id} and about_id=${args.aboutId}', 
        substitutionValues: params);
      if (count == 0)
        await db.execute('insert into xuser_xuser(owner_id,about_id,kind)values(${ai.id},${args.aboutId},@k)', 
          substitutionValues: params);
    });
    return dbBase(dbresult);
  }
}
