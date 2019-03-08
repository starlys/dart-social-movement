import 'dart:async';
import '../models/models.dart';
import 'misc_lib.dart';
import 'permissions.dart';

///centralized access to joining conversations, visibility of convs to users,
/// and full text searching in posts
class ConvLib {

  ///determine if conversations are visible to the given user. Return list
  /// has an element for each invisible conv.id. For example, given a list of
  /// conversations (1,2,3), and conv #2 is invisible to the user, the return value is (2)
  static Future<List<int>> invisibleConvs(Connection db, List<int> convIds, int userId) async {
    //if empty list passed, return empty list
    if (convIds.length == 0) return new List<int>();

    //compose sql to join conv with project (so event convs will return no rows, and
    // that's ok since events are public), and left join in the user's role if
    // any
    String convIdString = convIds.join(',');
    String sql = 'select conv.id, project.privacy, conv_xuser.status from'
      ' (conv inner join project on conv.project_id=project.id)'
      ' left join conv_xuser on conv.id=conv_xuser.conv_id and xuser_id=${userId}'
      ' where conv.id in (${convIdString})';

    //set up return array to correspond with calling array, initially all trues
    //List<bool> visibles = new List<bool>.filled(convIds.length, true);

    //for each returned value from the query, add to return list if not visible
    List<int> returnConvs = new List<int>();
    await for (Row row in db.query(sql)) {
      int convId = row[0];
      String privacy = row[1];
      String status = row[2];
      bool isPublicProject = privacy == 'P' || privacy == 'A';
      bool isMember = status == 'J';
      bool isInvisible = !isPublicProject && !isMember;
      if (isInvisible) {
        //int convIdx = convIds.indexOf(convId);
        //if (convIdx >= 0) visibles[convIdx] = false;
        returnConvs.add(convId);
      }
    }
    return returnConvs;
  }

  //find titles and posts matching the search term, and populate r
  static Future find(Connection db, int userId, String searchTerm, ConvQueryResponse r) async {
    r.convs = new List<ConvQueryConvItemResponse>();

    //find up to 25 title matches, sort by quality
    String sql = 'select id, title, ts_rank_cd(v, q2) as rank'
      ' from (select id, title, q2, to_tsvector(\'english\', title) as v'
      ' from conv, plainto_tsquery(\'${searchTerm}\') as q2'
      ' where to_tsvector(\'english\', title) @@ q2 limit 25) subq'
      ' order by rank desc';
    List<Row> titleRows = await db.query(sql).toList();

    //find up to 100 post matches, sort by quality (reduce number by titles
    // found)
    int maxPosts = 100 - titleRows.length;
    String subquery = '(select id, conv_id, ptext, created_at, q2, to_tsvector(\'english\', ptext) as v'
      ' from conv_post, plainto_tsquery(\'${searchTerm}\') as q2'
      ' where to_tsvector(\'english\', ptext) @@ q2 limit ${maxPosts}) subq';
    sql = 'select conv_id, id, created_at, ptext, ts_rank_cd(v, q2) as rank,'
      ' (select title from conv where id=conv_id) as title'
      ' from ${subquery}'
      ' order by rank desc';
    //print(sql);//debug
    List<Row> postRows = await db.query(sql).toList();

    //storage for dates of posts (which are not returned to caller)
    Map<String, DateTime> postCreatedAt = new Map<String, DateTime>();

    //collate the 2 result sets together, noting that some posts are in the
    // convs that were in the 1st result set, and some are not
    for (Row titleRow in titleRows) {
      ConvQueryConvItemResponse title = new ConvQueryConvItemResponse();
      title.convId = titleRow.id;
      title.hitText = titleRow.title;
      r.convs.add(title);
    }
    for (Row postRow in postRows) {
      ConvQueryConvItemResponse title;
      List matchingTitles = r.convs.where((c) => c.convId == postRow.conv_id).toList();
      if (matchingTitles.length == 0) {
        title = new ConvQueryConvItemResponse();
        title.convId = postRow.conv_id;
        title.hitText = postRow.title;
        r.convs.add(title);
      } else {
        title = matchingTitles[0];
      }
      if (title.posts == null) title.posts = new List<ConvQueryPostItemResponse>();
      var post = new ConvQueryPostItemResponse()
        ..postId = postRow.id
        ..hitText = postRow.ptext;
      post.hitText = WLib.chop(post.hitText, 100);
      title.posts.add(post);
      postCreatedAt[post.postId] = postRow.created_at;
    }

    //re-sort the posts within each conv by latest-first
    for (ConvQueryConvItemResponse title in r.convs) {
      if (title.posts == null) continue;
      title.posts.sort((ConvQueryPostItemResponse a, ConvQueryPostItemResponse b) {
        DateTime aDate = postCreatedAt[a.postId];
        DateTime bDate = postCreatedAt[b.postId];
        if (aDate == null || bDate == null) return 1; //shouldn't happen
        return bDate.compareTo(aDate);
      });
    }

    //filter out the convs that the user doesn't have access to
    List<int> convIds = r.convs.map((c) => c.convId).toList();
    //List<bool> visibles = await isVisibleTo(db, convIds, userId);
    List<int> invisibles = await invisibleConvs(db, convIds, userId);
    for (int invisibleId in invisibles) {
      r.convs.removeWhere((e) => e.convId == invisibleId);
    }
  }

  //load conv_post rows. Returns rows matching each of the given bool flags,
  // eliminating duplicates. First:first post; betweenTimes:between time1 and time2,
  // but not including posts *at* those times; afterTime2:including and later
  // than time2; all:all posts.
  // ConvId and userId must be set; projectId can be null.
  // Output cols are
  // * everything from conv_post
  // * xuser: nick, avatar_no
  // * blocking_kind: xuser_xuser.kind by this user about the author, or null
  // * blocked_kind: xuser_xuser.kind by the author about this user, or null
  // * spam_count from the author's project_xuser record or null (if author has left project)
  static Future<List<Row>> selectPosts(Connection db, int convId, int userId, int projectId,
    {bool first:false, bool betweenTimes:false,
    bool afterTime2:false, bool all:false,
    DateTime time1, DateTime time2}) async {
      String spamSql = projectId == null ? 'null as spam_count'
        : '(select spam_count from project_xuser where project_id=${projectId} and xuser_id=xuser.id) as spam_count';
      String sql1 = 'select conv_post.id,author_id,conv_post.created_at,conv_post.censored,'
        'conv_post.ptext,conv_post.tw_position,conv_post.has_image,conv_post.inappropriate_count,'
        'xuser.nick,xuser.avatar_no,'
        '(select kind from xuser_xuser where owner_id=${userId} and about_id=xuser.id) as blocking_kind,'
        '(select kind from xuser_xuser where about_id=${userId} and owner_id=xuser.id) as blocked_kind,'
        '${spamSql}'
        ' from conv_post inner join xuser on conv_post.author_id=xuser.id';
      String convIdWhere = 'conv_post.conv_id=${convId}';

      //load each set separately
      List<Row> combined = new List<Row>();
      if (first && !all) {
        List<Row> rows = await db.query('${sql1} where ${convIdWhere} order by conv_post.created_at limit 1').toList();
        combined.addAll(rows);
      }
      if (betweenTimes && !all) {
        List<Row> rows = await db.query('${sql1} where ${convIdWhere} and conv_post.created_at>@t1 and conv_post.created_at<@t2',
          {'t1':time1, 't2':time2}).toList();
        //postgres driver bug? the first one might equal created_at even though sql says "after"
        while (rows.length > 0 && time1.isAfter(rows[0].created_at))
          rows.removeAt(0);
        combined.addAll(rows);
      }
      if (afterTime2 && !all) {
        List<Row> rows = await db.query('${sql1} where ${convIdWhere} and conv_post.created_at>=@t2',
          {'t2':time2}).toList();
        combined.addAll(rows);
      }
      if (all) {
        List<Row> rows = await db.query('${sql1} where ${convIdWhere}').toList();
        combined.addAll(rows);
      }

      //sort and eliminate dups
      combined = MiscLib.distinct(combined, (r) => r.id);
      combined.sort((a, b) => (a.created_at as DateTime).compareTo(b.created_at));
      return combined;
  }

  //set the collapse mode and position in p; postRow must have come from selectPosts method
  static void setCollapseMode(ConvGetPostItem p, Row postRow, bool isManager) {
    //return from the first test that passes (most aggregious test first)

    //the post author blocked this user?
    if (postRow.blocked_kind == 'B' && !isManager) {
      p.collapseMode = 'BlockedByAuthor';
      p.ptext = 'Content hidden - you are being blocked by this author.';
      p.collapsePosition = 999;
      return;
    }

    //this user has blocked post author?
    if (postRow.blocking_kind == 'B') {
      p.collapseMode = 'AuthorBlocked'; //expansion link in UI: Show content from blocked author
      p.collapsePosition = 0;
      return;
    }

    //post was marked inappropriate
    if (postRow.inappropriate_count >= 3) {
      p.collapseMode = 'PostInappropriate'; //expansion link in UI: View inappropriate content
      p.collapsePosition = 0;
      return;
    }

    //user has had other posts marked inappropriate
    if (postRow.spam_count != null && postRow.spam_count >= 7) {
      p.collapseMode = 'UserSuspcicious'; //expansion link in UI: View possibly inappropriate content
      p.collapsePosition = 0;
      return;
    }

    //has trigger warning
    if (postRow.tw_position != null) {
      p.collapseMode = 'Trigger'; //expansion link in UI: Continue past trigger warning
      p.collapsePosition = postRow.tw_position;
      return;
    }

    //defaults
    p.collapseMode = 'Normal'; //expansion link in UI: More
    p.collapsePosition = 300;
  }

  ///write one conv_post record, returning its id
  static Future<String> writeConvPost(Connection db, int convId, int authorId, String ptext, int twPosition,
    bool hasImage, DateTime createdAt) async {
    String hasImageS = hasImage ? 'Y' : 'N';
    String id = await MiscLib.queryScalar(db, 'insert into conv_post(id,conv_id,author_id,created_at,ptext,tw_position,has_image,inappropriate_count)'
      ' values(uuid_generate_v4(),${convId},${authorId},@d,@t,${twPosition},\'${hasImageS}\',0) returning id',
      {'d': createdAt, 't': ptext});
    return id;
  }

  //write one conv_xuser record (attempts update, then insert)
  //NOTE like argument is only honored for inserts
  static Future writeConvUser(Connection db, int convId, int userId, String status, String like) async {
    int count = await db.execute('update conv_xuser set status=@s where conv_id=${convId} and xuser_id=${userId}',
      {'s': status});
    if (count == 0) {
      await db.execute('insert into conv_xuser(conv_id,xuser_id,status,"like",bookmarked,read_position,position_flag)'
        'values(${convId},${userId},@s,@l,\'N\',@d,\'N\')',
        {'d': WLib.utc1970(), 's': status, 'l': like});
    }
  }

  //write a project_xuser record (insert only), and auto-vote for all the
  // existing managers in the project. Also for democratic projects, save a
  // notification about the auto-vote status
  static Future insertProjectUser(Connection db, int projectId, int userId, String kind) async {
    //join project
    await db.execute('insert into project_xuser(project_id,xuser_id,kind,spam_count)'
      'values(${projectId},${userId},\'${kind}\',0)');

    //get project info/managers
    Row projectRow = await MiscLib.querySingleChecked(db, 'select title,leadership from project where id=${projectId}', 'Project does not exist');
    bool isDemocratic = projectRow.leadership == 'D';
    List<Row> managerRows = await db.query('select xuser_id from project_xuser where project_id=${projectId} and kind=\'M\'').toList();

    //autovote for current managers
    for (Row managerRow in managerRows) {
      int aboutId = managerRow[0];
      await db.execute('insert into project_xuser_xuser(project_id,owner_id,about_id,kind)'
        ' values(${projectId},${userId},${aboutId},\'L\')');
    }

    //send notification
    if (isDemocratic) {
      String note = 'You joined project "${projectRow.title}". We automatically cast votes on your behalf'
        ' for the current managers of the project, but you can change your votes.';
      MiscLib.notify(db, userId, note, linkText: 'View project', linkKey: 'project/${projectId}');
    }
  }

  //join a user to a conv; it is presumed that the permissions have already been checked
  static Future join(Connection db, int userId, int convId, JoinInfo permissions) async {
    //get conv info
    Row convRow = await MiscLib.querySingleChecked(db, 'select project_id,event_id from conv where id=${convId}', 'Conversation does not exist');
    int projectId = convRow.project_id;
    int eventId = convRow.event_id;

    //events are simple: join and exit
    if (eventId != null) {
      await writeConvUser(db, convId, userId, 'J', 'N');
      return;
    }

    //the rest of this is for project convs only
    if (projectId == null) throw new Exception('Conv requires event or project to be set');

    //write/update project_xuser
    String newKind = permissions.maxProjectUserKind;
    List<Row> projectUserRows = await db.query('select kind from project_xuser where project_id=${projectId} and xuser_id=${userId}').toList();
    if (projectUserRows.length == 0) {
      await db.execute('insert into project_xuser(project_id,xuser_id,kind,spam_count)'
        'values(${projectId},${userId},\'${newKind}\',0)');
    } else {
      //existing record, possibly upgrade the kind N->O->V->A
      String existingKind = projectUserRows[0].kind;
      bool doUpdate = existingKind == 'N'
        || (existingKind == 'O' && (newKind == 'V' || newKind == 'A'))
        || (existingKind == 'V' && newKind == 'A');
      if (doUpdate) {
        await db.execute('update project_xuser set kind=\'${newKind}\' where project_id=${projectId} and xuser_id=${userId}');
      }
    }

    //join user to ALL convs in project that they have already been invited to
    // or requested
    await db.execute('update conv_xuser set status=\'J\' where xuser_id=${userId}'
      ' and (status=\'I\' or status=\'A\')'
      ' and (select project_id from conv where conv.id=conv_xuser.conv_id)=${projectId}');

    //join user to the conv requested in this call
    await writeConvUser(db, convId, userId, 'J', 'N');
  }

  ///get most columns from conv row; throw exception if not found
  static Future<Row> getConvRow(Connection db, int convId) async {
    return await MiscLib.querySingleChecked(db, 'select project_id,event_id,post_max_size,xuser_daily_max,open from conv where id=${convId}',
      'Conversation does not exist');
  }

  ///update the read position for one user/conv. newReadPosition is required and this
  /// is always the value set. If lastViewedPosition is null, it simply writes the new position
  /// with no additional checks. If lastViewedPosition is a DateTime, then it checks
  /// to see if there are any posts after that time and before the newReadPosition; if there
  /// are any, it does NOT update the position.
  /// In practice this complex case is used when the read position is update upon
  /// posting. It means that if the user views posts and then writes a
  /// post, but while they were composing, someone else posted, then the
  /// read position will NOT be updated.
  static Future smartUpdateReadPosition(Connection db, int convId, int userId,
    DateTime newReadPosition, DateTime lastViewedPosition) async {

    //not sure how 1970 is getting set in conv_xuser, so this might find the source of the problem
    if (newReadPosition.isBefore(new DateTime(1980))) throw new Exception('Invalid read position');

    //potentially abort if intervening posts found (see method comments)
    if (lastViewedPosition != null) {
      List<Row> intervenings = await db.query('select id from conv_post where conv_id=${convId} and created_at>@d1 and created_at<@d2',
        {'d1': lastViewedPosition, 'd2': newReadPosition}).toList();
      if (intervenings.length > 0) return;
    }

    //update read position (only if joined)
    await db.execute('update conv_xuser set position_flag=\'N\', read_position=@t where conv_id=${convId} and xuser_id=${userId} and status=\'J\'',
      {'t': newReadPosition});

  }
}
