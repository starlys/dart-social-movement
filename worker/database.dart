import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'server/config_settings.dart';
import 'globals.dart';
import 'server/misc_lib.dart';
import '../models/models.dart';
import 'server/permissions.dart';
import 'server/logger.dart';
import 'server/conv_lib.dart';
import 'server/proposal_lib.dart';
import 'server/clean_deleter.dart';

typedef Future WorkFunc(Connection db);

///database operations
class Database {

  ///get the database connection
  static Future<dynamic> getConnection() async {
    bool isDev = Globals.config.isDev;
    String connstring = Globals.configSettings.database.connection;
    if (isDev) connstring = Globals.configSettings.database.connection_dev;
    return await connect(connstring, applicationName: 'autzone_bg');
  }

  ///for debugging, write a 'worker_starting' or 'worker_finished' file
  /// containing the task name
  static Future _writeDebugTaskFile(bool starting, String taskDesc) async {
    try {
      if (taskDesc == 'sendmail') return; //this gets called from sendmail script which is not interesting to debug now
      String fname2 = starting ? 'starting' : 'finished';
      File f = new File(Config.rootPath() + '/worker_' + fname2 + Globals.logFileSuffix);
      await f.writeAsString(WLib.utcNow().toIso8601String() + ' ' + taskDesc);
    }
    catch (ex) {
    }
  }

  ///wrap an operation in a db connection and catch errors.
  static Future safely(String taskDesc, WorkFunc f, {String loggingFilePrefix}) async {
    print(taskDesc + ' starting');
    await _writeDebugTaskFile(true, taskDesc);
    if (loggingFilePrefix == null) loggingFilePrefix = 'worker';
    Connection db;
    try {
      db = await getConnection();
      await f(db);
    }
    catch (ex) {
      print(ex);
      await Logger.logLimited(loggingFilePrefix, taskDesc + ', ' + ex.toString());
    }
    finally {
      db.close();
      print(taskDesc + ' done');
      await _writeDebugTaskFile(false, taskDesc);
    }
  }

  ///calculate site leadership (aka. site admins)
  static Future assignSiteLeadership(Connection db) async {
    //get settings
    var adminSettings = Globals.configSettings.site_admin;
    int minAdmins = adminSettings.min;
    int maxAdmins = adminSettings.max;
    double fracAdmins = adminSettings.percent / 100.0;

    //set project.member_count for all projects
    await db.execute('update project set member_count=(select count(*) from project_xuser where project_id=project.id)');

    //set project.active for all projects
    await db.execute('update project set active=(case when (select count(*) from conv where project_id=project.id and open=\'Y\')>0 then \'Y\' else \'N\' end)');

    //reset member count to zero for inactive projects
    await db.execute('update project set member_count=0 where active=\'N\'');

    //set sitewide_rank for all users = sum of project members for all projects they are managers of
    //print("debug1");
    await db.execute('update xuser set sitewide_rank=(select coalesce(sum(member_count),0) from project where exists(select * from project_xuser where project_id=project.id and xuser_id=xuser.id and kind=\'M\'))');
    //print("debug2");

    //load in the top ~25% users, but not exceeding min/max range, in sitewide_rank order
    int userCount = await MiscLib.queryScalar(db, 'select count(*) from xuser');
    userCount = userCount ?? 0;
    int leaderCount = max(minAdmins, min(maxAdmins, (userCount * fracAdmins).round()));
    //print("debug3");
    List<Row> rows1 = await db.query('select id from xuser order by sitewide_rank desc limit ${leaderCount}').toList();
    List<int> newLeaderIds = rows1.map((r) => r[0]).toList();
    //print("debug4");

    //load in existing site admins
    List<Row> rows2 = await db.query('select id from xuser where site_admin=\'Y\'').toList();
    List<int> oldLeaderIds = rows2.map((r) => r[0]).toList();
    //print("debug5");

    //declare notification text
    final String infoMessage = 'Site administrators are chosen automatically by the system each week.'
      'It is not a vote, and the role assignments can change at any time. '
      'Generally, managers of the projects having the most membership are the ones who are selected to be administrators. ';
    final String demoteMessage = 'You are no longer a site administrator. ' + infoMessage;
    final String promoteMessage = 'You are now a site administrator. ' + infoMessage;

    //for each "demoted" leader, update xuser and notify them
    for (int id in oldLeaderIds) {
      if (!newLeaderIds.contains(id)) {
        //print("debug6 " + id.toString());
        await db.execute('update xuser set site_admin=\'N\' where id=${id}');
        await MiscLib.notify(db, id, demoteMessage);
      }
    }

    //for each "promoted" leader, update xuser and notify them
    for (int id in newLeaderIds) {
      if (!oldLeaderIds.contains(id)) {
        await db.execute('update xuser set site_admin=\'Y\' where id=${id}');
        await MiscLib.notify(db, id, promoteMessage);
      }
    }
  }

  ///find all convs with new posts and set the readers' read positions
  static Future findUnreads(Connection db) async {
    Stream<Row> rows = db.query('select id,last_activity from conv where activity_flag=\'Y\'');
    await for (Row row in rows) {
      int convId = row.id;
      DateTime lastActivity = row.last_activity;
      await db.execute('update conv_xuser set position_flag=\'U\' where conv_id=${convId} and read_position<@p', {'p': lastActivity});
      await db.execute('update conv set activity_flag=\'N\' where id=${convId}');
    }
  }

  ///set project.important_count to the count of likes of related convs
  static Future countProjectImportance(Connection db) async {
    await db.execute('update project set important_count=(select count(*) from conv inner join conv_xuser on conv.id=conv_xuser.conv_id where conv.project_id=project.id and conv_xuser.like=\'I\')');
  }

  ///recalculate things affected by conv_post.reaction
  static Future recalcReactions(Connection db) async {
    //get settings
    int reactionWeightDays = Globals.configSettings.spam.reaction_weight_days;

    //get the unique posts having new reactions
    List<Row> rows1 = await db.query('select distinct conv_post_id from conv_post_xuser where processed=\'N\' and reaction=\'X\'')
      .toList();
    List<String> postIds = rows1.map((r) => r[0]).toList();

    //get the unique project_xuser records for the authors of each of the posts having new reactions
    List<Row> authorRows = await db.query('select distinct conv.project_id,conv_post.author_id'
      ' from (conv_post_xuser inner join conv_post on conv_post_xuser.conv_post_id=conv_post.id)'
      ' inner join conv on conv_post.conv_id=conv.id'
      ' where conv_post_xuser.processed=\'N\'')
      .toList();

    //update conv_post.inappropriate_count for all affected posts
    for (String postId in postIds) {
      await db.execute('update conv_post set inappropriate_count=(select count(*) from conv_post_xuser where conv_post_id=\'${postId}\' and reaction=\'X\')');
    }

    //loop suspicious authors
    DateTime utcNow = WLib.utcNow();
    DateTime oldReactionCutoff = utcNow.subtract(new Duration(days:reactionWeightDays));
    for(Row authorRow in authorRows) {
      int projectId = authorRow.project_id;
      int authorId = authorRow.author_id;

      //count how many distinct users voted against this author (within the project, recently)
      //- this query counts all the reactions even if they were processed before
      //- if a downvoter voted against multiple posts of the author, only the latest downvote counts
      //- weight the downvotes so that older ones don't count as much
      List<Row> downVoteRows = await db.query('select max(conv_post.created_at)'
        ' from (conv_post_xuser inner join conv_post on conv_post_xuser.conv_post_id=conv_post.id)'
        ' inner join conv on conv_post.conv_id=conv.id'
        ' where conv_post_xuser.reaction=\'X\' and conv.project_id=${projectId} and conv_post.author_id=${authorId}'
        ' and conv_post.created_at>@cutoff'
        ' group by conv_post_xuser.created_by',
        {'cutoff': oldReactionCutoff})
        .toList();
      double weightedDownVotes = 0.0;
      for (Row downVoteRow in downVoteRows) {
        DateTime postDate = downVoteRow.created_at; //date of post, not of reaction
        int daysOld = utcNow.difference(postDate).inDays;
        int daysNew = reactionWeightDays - daysOld; //newer is larger
        if (daysNew >= reactionWeightDays) { weightedDownVotes += 1; }
        else { weightedDownVotes += daysNew / reactionWeightDays; }
      }
      int spamCount = weightedDownVotes.round();

      //update project_xuser.spam_count
      await _changeSpamCount(db, projectId, authorId, spamCount);
    } //end loop suspicious authors

    //the new reactions are all processed
    await db.execute('update conv_post_xuser set processed=\'Y\' where processed=\'N\'');
  }

  ///update project_xuser.spam_count with notifications
  static Future _changeSpamCount(Connection db, int projectId, int userId, int newSpamCount) async {
    //get current spam count and exit if no change
    int oldSpamCount = await MiscLib.queryScalar(db, 'select spam_count from project_xuser where project_id=${projectId} and xuser_id=${userId}');
    if (oldSpamCount == newSpamCount) return;

    //get restiction level info for old and new
    RestrictionInfo oldRestrictions = Permissions.spamCountToRestrictions(Globals.config, oldSpamCount);
    RestrictionInfo newRestrictions = Permissions.spamCountToRestrictions(Globals.config, newSpamCount);

    //save new spam count
    await db.execute('update project_xuser set spam_count=${newSpamCount} where project_id=${projectId} and xuser_id=${userId}');

    //if level changed, notify user with explanation of the change
    if (oldRestrictions.restrictionLevel != newRestrictions.restrictionLevel) {
      String projTitle = await MiscLib.queryScalar(db, 'select title from project where id=${projectId}');
      String linkKey = 'project/' + projectId.toString();
      bool isGettingWorse = newRestrictions.restrictionLevel > oldRestrictions.restrictionLevel;
      String levelMessage = newRestrictions.restrictionLevel == 0 ?
        'You no longer have any posting restrictions.'
        : 'You are now allowed to post every ${newRestrictions.restDays} day(s), up to ${newRestrictions.charLimit} characters.';
        String reasonMessage = isGettingWorse ? 'The change has been made because other users marked one or more of your posts as inappropriate.'
          : 'The prior restrictions are being relaxed because your posts have not been marked as inappropriate recently.';
      String message = 'Your permissions have changed for the project "${projTitle}". ${levelMessage} ${reasonMessage}';
      await MiscLib.notify(db, userId, message, linkText:projTitle, linkKey:linkKey);
    }
  }

  ///check for proposals that need to be closed, and close them
  static Future timeoutProposals(Connection db) async {
    List<Row> rows = await db.query('select id from proposal where active=\'Y\' and timeout<@d',
      {'d': WLib.utcNow()}).toList();
    for (Row row in rows) await ProposalLib.closeProposal(db, row[0]);
  }

  ///delete old data - to be called daily (also see weeklyDelete)
  static Future dailyDelete(Connection db) async {
    //delete doc_revisions older than 1 year
    List<Row> rows = await db.query('select id from doc_revision where created_at<@d',
      {'d': WLib.utcNow().subtract(new Duration(days: 365))}).toList();
    for (Row row in rows) await db.execute('delete from doc_revision where id=${row[0]}');
  }

  ///delete old data - to be called weekly (also see dailyDelete)
  static Future weeklyDelete(Connection db) async {
    //some dates
    DateTime now = WLib.utcNow();
    DateTime monthAgo = now.subtract(new Duration(days: 30));
    DateTime sixMonthsAgo = now.subtract(new Duration(days: 180));
    DateTime yearAgo = now.subtract(new Duration(days: 365));

    //notifications older than 6 months
    await db.execute('delete from xuser_notify where created_at<@d', {'d': sixMonthsAgo});

    //conversations whose delete_time is reached
    List<Row> rows = await db.query('select id from conv where open=\'N\' and delete_time<@d', {'d': now}).toList();
    for (Row row in rows) await CleanDeleter.deleteConv(db, row[0]);

    //events having no convs and were a month or more ago
    rows = await db.query('select id from event where not exists(select * from conv where event_id=event.id) and start_time<@d', {'d': monthAgo}).toList();
    for (Row row in rows) await CleanDeleter.deleteEvent(db, row[0]);

    //users who haven't done anything in a year
    rows = await db.query('select id from xuser where last_activity<@d', {'d': yearAgo}).toList();
    for (Row row in rows) await CleanDeleter.deleteUser(db, row[0]);

    //project proposals whose delete_time is reached
    rows = await db.query('select id from proposal where kind=\'PROJ\' and delete_time<@d', {'d': now}).toList();
    for (Row row in rows) await ProposalLib.delete(db, row[0], true);

    //project shells that were never used for anything, or all content has
    // already timed out, after 1 year
    rows = await db.query('select id from project where created_at<@d'
      ' and not exists(select * from conv where project_id=project.id)'
      ' and not exists(select * from proposal where project_id=project.id)',
      {'d': yearAgo}).toList();
    for (Row row in rows) {
      try {await CleanDeleter.deleteProjectPartial(db, row[0]);}
      catch(ex) {}
    }

  }

  ///assign leaders of democratic projects
  static Future assignProjectLeadership(Connection db) async {
    //loop democratic projects
    List<Row> rows = await db.query('select id,title from project where leadership=\'D\' and kind=\'P\'').toList();
    for (Row row in rows) await _assignProjectLeadership(db, row[0], row[1]);
  }

  ///assign leadership to one democratic project
  static Future _assignProjectLeadership(Connection db, int projectId, String projectTitle) async {
    //load all those voted into leadership, by most votes first
    List<Row> voteRows = await db.query('select about_id,count(*) as c from project_xuser_xuser where project_id=${projectId} and kind=\'L\' group by about_id order by c desc').toList();

    //if there are no votes at all, quit now. (If this isn't done, then it could remove everyone
    // from leadership)
    if (voteRows.length == 0) return;

    //determine the new manager group from the top 10% of the query (at least 8)
    List<int> newManagers = new List<int>();
    int candidateCount = voteRows.length; //members who received any votes
    int managerCount = min(candidateCount, max(8, candidateCount ~/ 10));
    for (int i = 0; i < managerCount; ++i) newManagers.add(voteRows[i][0]);

    //load the existing manager group
    List<Row> managerRows = await db.query('select xuser_id from project_xuser where project_id=${projectId} and kind=\'M\'').toList();
    List<int> oldManagers = new List<int>();
    for (Row row in managerRows) oldManagers.add(row[0]);

    //set up notification values
    String notifLink = 'project/${projectId}';
    String notifLinkText = 'Go to project';
    String notifBody = 'Thank you for serving as a manager of the democratic project "${projectTitle}". Voting has changed and other leaders have been voted in, so you are no longer a manager.';

    //for each user who is no longer a manager..
    for (int userId in oldManagers.where((oldId) => !newManagers.contains(oldId))) {
      await db.execute('update project_xuser set kind=\'A\' where project_id=${projectId} and xuser_id=${userId}');
      await MiscLib.notify(db, userId, notifBody, linkKey: notifLink, linkText: notifLinkText);
    }

    //for each user who is newly a manager..
    notifBody = 'You have been voted in as a manager of the democratic project "${projectTitle}". You now share various responsibilities with other managers, such as inviting and approving join requests. This role is not permanent; as votes shift, you may be replaced.';
    for (int userId in newManagers.where((newId) => !oldManagers.contains(newId))) {
      await db.execute('update project_xuser set kind=\'M\' where project_id=${projectId} and xuser_id=${userId}');
      await MiscLib.notify(db, userId, notifBody, linkKey: notifLink, linkText: notifLinkText);
    }
  }

  ///set resource.important_count for all resources whose votes recently changed
  static Future countResourceVotes(Connection db) async {
    //get list of unique resource ids having uncounted votes
    List<Row> rows1 = await db.query('select distinct resource_id from resource_xuser where processed<>\'Y\'').toList();
    List<int> resourceIds = rows1.map((r) => r[0]).toList();
    if (resourceIds.length == 0) return;

    //recalc important_count
    String inClause = resourceIds.join(',');
    String sql = 'update resource set important_count=(select count(*) from resource_xuser where resource_id=resource.id and kind=\'I\')'
      ' where id in (${inClause})';
    await db.execute(sql);

    //reset processed flag
    await db.execute('update resource_xuser set processed=\'Y\' where processed<>\'Y\'');
  }

  ///recommend conversations to users
  static Future recommendConversations(Connection db) async {
    //find users with activity since last recommendation, and whose last
    // recommendation was at least an hour ago.
    //NOTE this query is not indexed
    DateTime now = WLib.utcNow();
    DateTime cutoff = now.subtract(new Duration(hours:1));
    List<Row> rows1 = await db.query('select id from xuser where last_activity>last_recommend and last_recommend<@t',
      {'t': cutoff}).toList();
    List<int> userIds = rows1.map((r) => r[0]).toList();

    //recommendations by user
    for (int userId in userIds) {
      await _recommendProjectConversations(db, userId);
      await _recommendSpawnedConversations(db, userId);
      await _recommendImportantConversations(db, userId);

      //set recommended date
      await db.execute('update xuser set last_recommend=@t where id=${userId}', {'t':now});
    }
  }

  ///recommend convs in projects a user is already in
  static Future _recommendProjectConversations(Connection db, int userId) async {
    //find convs in all projects the user is already in
    List<Row> rows1 = await db.query('select id from conv where project_id in (select project_id from project_xuser where xuser_id=${userId} and kind<>\'N\')').toList();
    List<int> convIds = rows1.map((r) => r[0]).toList();
    if (convIds.length == 0) return;

    //for those potential convs, get the exiting status
    String inClause = convIds.join(',');
    List<Row> joinRows = await db.query('select conv_id,status from conv_xuser where conv_id in (${inClause}) and xuser_id=${userId}').toList();
    Map<int, String> statusByConv = new Map<int, String>();
    for (Row joinRow in joinRows) statusByConv[joinRow[0]] = joinRow[1];

    //for each potential conv, if there is no existing status or the existing
    // status is N, recommend it
    for (int convId in convIds) {
      String status = statusByConv[convId];
      if (status == null || status == 'N')
        await ConvLib.writeConvUser(db, convId, userId, 'R', 'N');
    }
  }

  ///recommend convs spawned from convs that a user is already in
  static Future _recommendSpawnedConversations(Connection db, int userId) async {
    //find convs the user is already in
    List<Row> rows1 = await db.query('select conv_id from conv_xuser where xuser_id=${userId} and status=\'J\'').toList();
    List<int> sourceConvIds = rows1.map((r) => r[0]).toList();
    if (sourceConvIds.length == 0) return;

    //load ids of all convs spawned from those
    String sourceConvInClause = sourceConvIds.join(',');
    List<Row> spawnedConvRows = await db.query('select id, (select status from conv_xuser where conv_id=conv.id and xuser_id=${userId}) as status from conv where from_conv_id in (${sourceConvInClause})').toList();

    //loop spawned convs and if the user isn't joined, recommend it
    for (Row convRow in spawnedConvRows) {
      int convId = convRow[0];
      String status = convRow[1];
      if (status == null || status == 'N') {
        await ConvLib.writeConvUser(db, convId, userId, 'R', 'N');
      }
    }
  }

  ///recommend convs that are marked important by users followed by the given user
  static Future _recommendImportantConversations(Connection db, int userId) async {
    //get all convs liked by users being followed
    List<Row> rows1 = await db.query('select distinct conv_id from conv_xuser inner join xuser_xuser on conv_xuser.xuser_id=xuser_xuser.about_id'
      ' where xuser_xuser.owner_id=${userId} and xuser_xuser.kind=\'F\' and conv_xuser.like=\'I\'').toList();
    List<int> convIds = rows1.map((r) => r[0]).toList();
    if (convIds.length == 0) return;

    //for those potential convs, get the exiting status
    String inClause = convIds.join(',');
    List<Row> joinRows = await db.query('select conv_id,status from conv_xuser where conv_id in (${inClause}) and xuser_id=${userId}').toList();
    Map<int, String> statusByConv = new Map<int, String>();
    for (Row joinRow in joinRows) statusByConv[joinRow[0]] = joinRow[1];

    //for each potential conv, if there is no existing status or the existing
    // status is N, recommend it
    for (int convId in convIds) {
      String status = statusByConv[convId];
      if (status == null || status == 'N')
        await ConvLib.writeConvUser(db, convId, userId, 'R', 'N');
    }
  }

  ///close conversations that are too big, too old, or are inactive;
  /// this is fairly slow since it sums the size of all posts
  static Future closeConversations(Connection db) async {
    //get info about all open convs
    List<Row> rows = await db.query('select id,created_at,last_activity from conv where open=\'Y\'').toList();

    //get config values
    var opSettings = Globals.configSettings.operation;
    int convInactiveDays = opSettings.conv_inactive_days;
    int convOldDays = opSettings.conv_old_days;
    int convTooBig = opSettings.conv_too_big;
    int deleteDays = Globals.configSettings.deletion.conv_days;

    //loop and determine if it should be closed
    DateTime activityCutoff = WLib.utcNow().subtract(new Duration(days: convInactiveDays));
    DateTime createdCutoff = WLib.utcNow().subtract(new Duration(days: convOldDays));
    DateTime deleteDate = WLib.utcNow().add(new Duration(days: deleteDays));
    for (Row row in rows) {
      bool isInactive = activityCutoff.isAfter(row.last_activity);
      bool isOld = createdCutoff.isAfter(row.created_at);

      //for the too-big calculation, only run it if the other tests were
      // inconclusive
      bool isTooBig = false;
      if (!isInactive && !isOld) {
        int convSize = await MiscLib.queryScalar(db, 'select sum(char_length(ptext)) from conv_post where conv_id=${row.id}');
        if (convSize == null) convSize = 0;
        isTooBig = convSize > convTooBig;
      }

      //close it
      if (isInactive || isOld || isTooBig)
        await db.execute('update conv set open=\'N\', delete_time=@d where id=${row.id}', {'d': deleteDate});
    }
  }

  ///hide resources if the remove vote count is high
  static Future hideResources(Connection db) async {
    //get the count of votes of all kinds for each visible resource; the result set may have
    // multiple rows for each resource id
    List<Row> voteSumRows = await db.query('select resource_xuser.resource_id, resource_xuser.kind, count(resource_xuser.kind) as votecount from resource_xuser inner join resource on resource_xuser.resource_id=resource.id where resource.visible=\'Y\' group by resource_xuser.resource_id, resource_xuser.kind').toList();

    //copy rows into maps for easier access (counts indexed by id)
    Map<int, int> importantCounts = new Map<int, int>(),
      removeCounts = new Map<int, int>();
    for (Row row in voteSumRows) {
      int id = row[0], voteCount = row[2];
      String kind = row[1];
      if (kind == 'I') importantCounts[id] = voteCount;
      if (kind == 'R') removeCounts[id] = voteCount;
    }

    //loop those resources with any remove votes and check if there are enough
    // to make it invisible, which is twice as many as important votes (and at least 3)
    removeCounts.forEach((id, removeCount0) async {
      int removeCount = removeCount0 ?? 0;
      int importantCount = importantCounts[id] ?? 0;
      bool hideIt = removeCount > 3 && removeCount > importantCount * 2;

      if (hideIt)
        await db.execute('update resource set visible=\'N\' where id=${id}');
    });
  }

  ///email new notifciations to user who request it
  static Future emailNotifications(Connection db) async {
    //get config settings
    String siteName = Globals.configSettings.siteName;

    //get user ids having any un-emailed notifications
    List<Row> distinctUserRows = await db.query('select id,pref_email_notify,email from xuser where exists(select * from xuser_notify where xuser_id=xuser.id and emailed=\'N\')').toList();

    //loop users
    for (Row userRow in distinctUserRows) {
      //if the user wants and can get email
      bool wantsEmail = userRow.pref_email_notify == 'Y';
      String emailAddress = userRow.email ?? '';
      bool canSendEmail = emailAddress.contains('@');
      if (canSendEmail && wantsEmail) {

        //load notifications for user
        List<Row> notifRows = await db.query('select body,link_text,link_key from xuser_notify where xuser_id=${userRow.id} and emailed=\'N\'').toList();
        int notifCount = await MiscLib.queryScalar(db, 'select count(*) from xuser_notify where xuser_id=${userRow.id}') ?? 0;
        if (notifCount > 0) {

          //compose notifications into an email body
          StringBuffer body = new StringBuffer('You have new notifications at ${siteName}\r\n\r\n');
          int number = 0;
          for (Row notifRow in notifRows) {
            String link = '';
            body.write('${++number}. ${notifRow.body}\r\n${link}-------------------\r\n');
          }
          int unemailedNotifCount = notifCount - notifRows.length;
          if (unemailedNotifCount > 1)
            body.writeln('There are also ${unemailedNotifCount} older notifications.');

          //send email
          await MiscLib.queueEmail(db, emailAddress, '${siteName} - Notifications', body.toString());
        }
      }

    }

    //set all notifications for all users to emailed=Y
    await db.execute('update xuser_notify set emailed=\'Y\' where emailed=\'N\'');
  }


}
