import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:autzone_models/autzone_models.dart';
import 'site_cache.dart';
import 'misc_lib.dart';
import 'permissions.dart';

///see ConvLib.setCollapseMode
class CollapseInfo {
  String collapseMode, ptextOverride;
  int collapsePosition;
}
///centralized access to joining conversations, visibility of convs to users,
/// and full text searching in posts
class ConvLib {

  ///determine if conversations are visible to the given user. Return list
  /// has an element for each invisible conv.id. For example, given a list of
  /// conversations (1,2,3), and conv #2 is invisible to the user, the return value is (2)
  static Future<List<int>> invisibleConvs(PostgreSQLConnection db, List<int> convIds, int userId) async {
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

    //for each returned value from the query, add to return list if not visible
    final returnConvs = new List<int>();
    final rows = await MiscLib.query(db, sql, null);
    for (final row in rows) {
      int convId = row['id'];
      String privacy = row['privacy'];
      String status = row['status'];
      bool isPublicProject = privacy == 'P' || privacy == 'A';
      bool isMember = status == 'J';
      bool isInvisible = !isPublicProject && !isMember;
      if (isInvisible) {
        returnConvs.add(convId);
      }
    }
    return returnConvs;
  }

  ///find titles and posts matching the search term
  static Future<List<ConvQueryConvItemResponse>> find(PostgreSQLConnection db, SiteRecord site, int userId, String searchTerm) async {
    final retConvs = new List<ConvQueryConvItemResponse>();

    //find up to 25 title matches, sort by quality
    String sql = 'select id, title, ts_rank_cd(v, q2) as rank'
      ' from (select id, title, q2, to_tsvector(\'english\', title) as v'
      ' from conv, plainto_tsquery(\'${searchTerm}\') as q2'
      ' where site_id=${site.id} and to_tsvector(\'english\', title) @@ q2 limit 25) subq'
      ' order by rank desc';
    final titleRows = await MiscLib.query(db, sql, null);

    //find up to 100 post matches, sort by quality (reduce number by titles
    // found)
    int maxPosts = 100 - titleRows.length;
    String subquery = '(select conv_post.id, conv_post.conv_id, conv_post.ptext, conv_post.created_at, q2, to_tsvector(\'english\', ptext) as v'
      ' from (conv_post inner join conv on conv_post.conv_id=conv.id), plainto_tsquery(\'${searchTerm}\') as q2'
      ' where site_id=${site.id} and to_tsvector(\'english\', ptext) @@ q2 limit ${maxPosts}) subq';
    sql = 'select conv_id, id, created_at, ptext, ts_rank_cd(v, q2) as rank, title'
      ' from ${subquery}'
      ' order by rank desc';
    final postRows = await MiscLib.query(db, sql, null);

    //storage for dates of posts (which are not returned to caller)
    Map<String, DateTime> postCreatedAt = new Map<String, DateTime>();

    //collate the 2 result sets together, noting that some posts are in the
    // convs that were in the 1st result set, and some are not
    for (final titleRow in titleRows) {
      final title = ConvQueryConvItemResponse(
        convId: titleRow['id'], hitText: titleRow['title'], posts: List<ConvQueryPostItemResponse>());
      retConvs.add(title);
    }
    for (final postRow in postRows) {
      ConvQueryConvItemResponse title;
      final matchingTitles = retConvs.where((c) => c.convId == postRow['conv_id']).toList();
      if (matchingTitles.length == 0) {
        title = new ConvQueryConvItemResponse(convId: postRow['conv_id'], hitText: postRow['title'], posts: List<ConvQueryPostItemResponse>());
        retConvs.add(title);
      } else {
        title = matchingTitles[0];
      }
      final hitText = WLib.chop(postRow['ptext'], 100);
      var post = new ConvQueryPostItemResponse(postId: postRow['id'], hitText: hitText);
      title.posts.add(post);
      postCreatedAt[post.postId] = postRow['created_at'];
    }

    //re-sort the posts within each conv by latest-first
    for (ConvQueryConvItemResponse title in retConvs) {
      if (title.posts == null) continue;
      ConvQueryConvItemResponseUtils.sortByDate(title, postCreatedAt);
    }

    //filter out the convs that the user doesn't have access to
    List<int> convIds = retConvs.map((c) => c.convId).toList();
    List<int> invisibles = await invisibleConvs(db, convIds, userId);
    for (int invisibleId in invisibles) {
      retConvs.removeWhere((e) => e.convId == invisibleId);
    }

    return retConvs;
  }

  ///load conv_post rows. Returns rows matching each of the given bool flags,
  /// eliminating duplicates. First:first post; betweenTimes:between time1 and time2,
  /// but not including posts *at* those times; afterTime2:including and later
  /// than time2; all:all posts.
  /// ConvId and userId must be set; projectId can be null.
  /// Output cols are
  /// * everything from conv_post
  /// * xuser: nick, avatar_no
  /// * blocking_kind: xuser_xuser.kind by this user about the author, or null
  /// * blocked_kind: xuser_xuser.kind by the author about this user, or null
  /// * spam_count from the author's project_xuser record or null (if author has left project)
  static Future<List<Map<String, dynamic>>> selectPosts(PostgreSQLConnection db, int convId, int userId, int projectId,
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
      var combined = new List<Map<String, dynamic>>();
      if (first && !all) {
        final rows = await MiscLib.query(db, '${sql1} where ${convIdWhere} order by conv_post.created_at limit 1', null);
        combined.addAll(rows);
      }
      if (betweenTimes && !all) {
        final rows = await MiscLib.query(db, '${sql1} where ${convIdWhere} and conv_post.created_at>@t1 and conv_post.created_at<@t2',
          {'t1':time1, 't2':time2});
        //postgres driver bug? the first one might equal created_at even though sql says "after"
        while (rows.length > 0 && time1.isAfter(rows[0]['created_at']))
          rows.removeAt(0);
        combined.addAll(rows);
      }
      if (afterTime2 && !all) {
        final rows = await MiscLib.query(db, '${sql1} where ${convIdWhere} and conv_post.created_at>=@t2',
          {'t2':time2});
        combined.addAll(rows);
      }
      if (all) {
        final rows = await MiscLib.query(db, '${sql1} where ${convIdWhere}', null);
        combined.addAll(rows);
      }

      //sort and eliminate duplicate conv rows
      String nominate(Map<String, dynamic> row) => row['id'];
      combined = MiscLib.distinct(combined, nominate);
      combined.sort((a, b) => (a['created_at'] as DateTime).compareTo(b['created_at']));
      return combined;
  }

  ///determine the collapse mode and position; postRow must have come from selectPosts method
  static CollapseInfo buildCollapseInfo(Map<String, dynamic> postRow, bool isManager) {
    //return from the first test that passes (most aggregious test first)
    final p = CollapseInfo();

    //the post author blocked this user?
    if (postRow['blocked_kind'] == 'B' && !isManager) {
      p.collapseMode = 'BlockedByAuthor';
      p.ptextOverride = 'Content hidden - you are being blocked by this author.';
      p.collapsePosition = 999;
      return p;
    }

    //this user has blocked post author?
    if (postRow['blocking_kind'] == 'B') {
      p.collapseMode = 'AuthorBlocked'; //expansion link in UI: Show content from blocked author
      p.collapsePosition = 0;
      return p;
    }

    //post was marked inappropriate
    if (postRow['inappropriate_count'] >= 3) {
      p.collapseMode = 'PostInappropriate'; //expansion link in UI: View inappropriate content
      p.collapsePosition = 0;
      return p;
    }

    //user has had other posts marked inappropriate
    if (postRow['spam_count'] != null && postRow['spam_count'] >= 7) {
      p.collapseMode = 'UserSuspcicious'; //expansion link in UI: View possibly inappropriate content
      p.collapsePosition = 0;
      return p;
    }

    //has trigger warning
    if (postRow['tw_position'] != null) {
      p.collapseMode = 'Trigger'; //expansion link in UI: Continue past trigger warning
      p.collapsePosition = postRow['tw_position'];
      return p;
    }

    //defaults
    p.collapseMode = 'Normal'; //expansion link in UI: More
    p.collapsePosition = 300;
    return p;
  }

  ///write one conv_post record, returning its id
  static Future<String> writeConvPost(PostgreSQLConnection db, int convId, int authorId, String ptext, int twPosition,
    bool hasImage, DateTime createdAt) async {
    String hasImageS = hasImage ? 'Y' : 'N';
    String id = await MiscLib.queryScalar(db, 'insert into conv_post(id,conv_id,author_id,created_at,ptext,tw_position,has_image,inappropriate_count)'
      ' values(uuid_generate_v4(),${convId},${authorId},@d,@t,${twPosition},\'${hasImageS}\',0) returning id',
      {'d': createdAt, 't': ptext});
    return id;
  }

  ///write one conv_xuser record (attempts update, then insert)
  ///NOTE like argument is only honored for inserts
  static Future writeConvUser(PostgreSQLConnection db, int convId, int userId, String status, String like) async {
    int count = await db.execute('update conv_xuser set status=@s where conv_id=${convId} and xuser_id=${userId}',
      substitutionValues: {'s': status});
    if (count == 0) {
      await db.execute('insert into conv_xuser(conv_id,xuser_id,status,"like",bookmarked,read_position,position_flag)'
        'values(${convId},${userId},@s,@l,\'N\',@d,\'N\')',
        substitutionValues: {'d': WLib.utc1970(), 's': status, 'l': like});
    }
  }

  ///write a project_xuser record (insert only), and auto-vote for all the
  /// existing managers in the project. Also for democratic projects, save a
  /// notification about the auto-vote status
  static Future insertProjectUser(PostgreSQLConnection db, int projectId, int userId, String kind) async {
    //join project
    await db.execute('insert into project_xuser(project_id,xuser_id,kind,spam_count)'
      'values(${projectId},${userId},\'${kind}\',0)');

    //get project info/managers
    final projectRow = await MiscLib.queryRowChecked(db, 'select title,leadership from project where id=${projectId}', 'Project does not exist', null);
    bool isDemocratic = projectRow['leadership'] == 'D';
    final managerRows = await MiscLib.query(db, 'select xuser_id from project_xuser where project_id=${projectId} and kind=\'M\'', null);

    //autovote for current managers
    for (final managerRow in managerRows) {
      int aboutId = managerRow[0];
      await db.execute('insert into project_xuser_xuser(project_id,owner_id,about_id,kind)'
        ' values(${projectId},${userId},${aboutId},\'L\')');
    }

    //send notification
    if (isDemocratic) {
      String note = 'You joined project "${projectRow['title']}". We automatically cast votes on your behalf'
        ' for the current managers of the project, but you can change your votes.';
      MiscLib.notify(db, userId, note, linkText: 'View project', linkKey: 'project/${projectId}');
    }
  }

  ///join a user to a conv; it is presumed that the permissions have already been checked
  static Future join(PostgreSQLConnection db, int userId, int convId, JoinInfo permissions) async {
    //get conv info
    final convRow = await MiscLib.queryRowChecked(db, 'select project_id,event_id from conv where id=${convId}', 'Conversation does not exist', null);
    int projectId = convRow['project_id'];
    int eventId = convRow['event_id'];

    //events are simple: join and exit
    if (eventId != null) {
      await writeConvUser(db, convId, userId, 'J', 'N');
      return;
    }

    //the rest of this is for project convs only
    if (projectId == null) throw new Exception('Conv requires event or project to be set');

    //write/update project_xuser
    String newKind = permissions.maxProjectUserKind;
    final projectUserRows = await MiscLib.query(db, 'select kind from project_xuser where project_id=${projectId} and xuser_id=${userId}', null);
    if (projectUserRows.length == 0) {
      await db.execute('insert into project_xuser(project_id,xuser_id,kind,spam_count)'
        'values(${projectId},${userId},\'${newKind}\',0)');
    } else {
      //existing record, possibly upgrade the kind N->O->V->A
      String existingKind = projectUserRows[0]['kind'];
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
  static Future<Map<String, dynamic>> getConvRow(PostgreSQLConnection db, int convId) async {
    return await MiscLib.queryRowChecked(db, 'select site_id,project_id,event_id,post_max_size,xuser_daily_max,open from conv where id=${convId}',
      'Conversation does not exist', null);
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
  static Future smartUpdateReadPosition(PostgreSQLConnection db, int convId, int userId,
    DateTime newReadPosition, DateTime lastViewedPosition) async {

    //not sure how 1970 is getting set in conv_xuser, so this might find the source of the problem
    if (newReadPosition.isBefore(new DateTime(1980))) throw new Exception('Invalid read position');

    //potentially abort if intervening posts found (see method comments)
    if (lastViewedPosition != null) {
      final intervenings = await MiscLib.query(db, 'select id from conv_post where conv_id=${convId} and created_at>@d1 and created_at<@d2',
        {'d1': lastViewedPosition, 'd2': newReadPosition});
      if (intervenings.length > 0) return;
    }

    //update read position (only if joined)
    await db.execute('update conv_xuser set position_flag=\'N\', read_position=@t where conv_id=${convId} and xuser_id=${userId} and status=\'J\'',
      substitutionValues: {'t': newReadPosition});

  }
}
