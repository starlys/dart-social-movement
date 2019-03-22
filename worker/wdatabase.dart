import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:postgres/postgres.dart';
import '../server/config_loader.dart';
import 'globals.dart';
import '../server/misc_lib.dart';
import '../server/database.dart';
import '../models/models.dart';
import '../server/permissions.dart';
import '../server/conv_lib.dart';
import '../server/proposal_lib.dart';
import '../server/clean_deleter.dart';
import '../server/logger.dart';

///worker database operations
class WDatabase extends Database {

  ///for debugging, write a 'worker_starting' or 'worker_finished' file
  /// containing the task name
  static Future _writeDebugTaskFile(bool starting, String taskDesc) async {
    try {
      if (taskDesc == 'sendmail') return; //this gets called from sendmail script which is not interesting to debug now
      String fname2 = starting ? 'starting' : 'finished';
      File f = new File(ConfigLoader.rootPath() + '/worker_' + fname2 + Globals.logFileSuffix);
      await f.writeAsString(WLib.utcNow().toIso8601String() + ' ' + taskDesc);
    }
    catch (ex) {
    }
  }

  ///wrap a database operation in a db connection and catch errors.
  /// If r is given puts error messages there.
  static Future<DatabaseResult> safely(String taskDesc, WorkFunc f) async {
    final poolItem = await Database.getFromPool();
    try {
      await _writeDebugTaskFile(true, taskDesc);
      await f(poolItem.connection);
      return DatabaseResult() ..ok = true;
    }
    catch (ex) {
      var ret = DatabaseResult() ..errorCode = 'DB' ..errorMessage = ex.toString() ..ok = false;
      if (ret.errorMessage.startsWith('Exception:')) ret.errorMessage = ret.errorMessage.substring(11);
      print(ex);
      await Logger.logLimited('api', taskDesc + ', ' + ex.toString());
      return ret;
    }
    finally {
      await _writeDebugTaskFile(false, taskDesc);
      Database.releaseToPool(poolItem);
    }
  }

  
  ///calculate site leadership (aka. site admins)
  static Future assignSiteLeadership(PostgreSQLConnection db) async {
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
    int userCount = await MiscLib.queryScalar(db, 'select count(*) from xuser', null);
    userCount = userCount ?? 0;
    int leaderCount = max(minAdmins, min(maxAdmins, (userCount * fracAdmins).round()));
    //print("debug3");
    final rows1 = await MiscLib.query(db, 'select id from xuser order by sitewide_rank desc limit ${leaderCount}', null);
    List<int> newLeaderIds = rows1.map((r) => r['id']).toList();
    //print("debug4");

    //load in existing site admins
    final rows2 = await MiscLib.query(db, 'select id from xuser where site_admin=\'Y\'', null);
    List<int> oldLeaderIds = rows2.map((r) => r['id']).toList();
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
  static Future findUnreads(PostgreSQLConnection db) async {
    final rows = await MiscLib.query(db, 'select id,last_activity from conv where activity_flag=\'Y\'', null);
    for (final row in rows) {
      int convId = row['id'];
      DateTime lastActivity = row['last_activity'];
      await db.execute('update conv_xuser set position_flag=\'U\' where conv_id=${convId} and read_position<@p', substitutionValues: {'p': lastActivity});
      await db.execute('update conv set activity_flag=\'N\' where id=${convId}');
    }
  }

  ///set project.important_count to the count of likes of related convs
  static Future countProjectImportance(PostgreSQLConnection db) async {
    await db.execute('update project set important_count=(select count(*) from conv inner join conv_xuser on conv.id=conv_xuser.conv_id where conv.project_id=project.id and conv_xuser.like=\'I\')');
  }

  ///recalculate things affected by conv_post.reaction
  static Future recalcReactions(PostgreSQLConnection db) async {
    //get settings
    int reactionWeightDays = Globals.configSettings.spam.reaction_weight_days;

    //get the unique posts having new reactions
    final rows1 = await MiscLib.query(db, 'select distinct conv_post_id from conv_post_xuser where processed=\'N\' and reaction=\'X\'', null);
    List<String> postIds = rows1.map((r) => r['conv_post_id']).toList();

    //get the unique project_xuser records for the authors of each of the posts having new reactions
    final authorRows = await MiscLib.query(db, 'select distinct conv.project_id,conv_post.author_id'
      ' from (conv_post_xuser inner join conv_post on conv_post_xuser.conv_post_id=conv_post.id)'
      ' inner join conv on conv_post.conv_id=conv.id'
      ' where conv_post_xuser.processed=\'N\'', null);

    //update conv_post.inappropriate_count for all affected posts
    for (String postId in postIds) {
      await db.execute('update conv_post set inappropriate_count=(select count(*) from conv_post_xuser where conv_post_id=\'${postId}\' and reaction=\'X\')');
    }

    //loop suspicious authors
    DateTime utcNow = WLib.utcNow();
    DateTime oldReactionCutoff = utcNow.subtract(new Duration(days:reactionWeightDays));
    for(final authorRow in authorRows) {
      int projectId = authorRow['project_id'];
      int authorId = authorRow['author_id'];

      //count how many distinct users voted against this author (within the project, recently)
      //- this query counts all the reactions even if they were processed before
      //- if a downvoter voted against multiple posts of the author, only the latest downvote counts
      //- weight the downvotes so that older ones don't count as much
      final downVoteRows = await MiscLib.query(db, 'select max(conv_post.created_at)'
        ' from (conv_post_xuser inner join conv_post on conv_post_xuser.conv_post_id=conv_post.id)'
        ' inner join conv on conv_post.conv_id=conv.id'
        ' where conv_post_xuser.reaction=\'X\' and conv.project_id=${projectId} and conv_post.author_id=${authorId}'
        ' and conv_post.created_at>@cutoff'
        ' group by conv_post_xuser.created_by',
        {'cutoff': oldReactionCutoff});
      double weightedDownVotes = 0.0;
      for (final downVoteRow in downVoteRows) {
        DateTime postDate = downVoteRow['created_at']; //date of post, not of reaction
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
  static Future _changeSpamCount(PostgreSQLConnection db, int projectId, int userId, int newSpamCount) async {
    //get current spam count and exit if no change
    int oldSpamCount = await MiscLib.queryScalar(db, 'select spam_count from project_xuser where project_id=${projectId} and xuser_id=${userId}', null);
    if (oldSpamCount == newSpamCount) return;

    //get restiction level info for old and new
    RestrictionInfo oldRestrictions = Permissions.spamCountToRestrictions(Globals.configSettings, oldSpamCount);
    RestrictionInfo newRestrictions = Permissions.spamCountToRestrictions(Globals.configSettings, newSpamCount);

    //save new spam count
    await db.execute('update project_xuser set spam_count=${newSpamCount} where project_id=${projectId} and xuser_id=${userId}');

    //if level changed, notify user with explanation of the change
    if (oldRestrictions.restrictionLevel != newRestrictions.restrictionLevel) {
      String projTitle = await MiscLib.queryScalar(db, 'select title from project where id=${projectId}', null);
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
  static Future timeoutProposals(PostgreSQLConnection db) async {
    final rows = await MiscLib.query(db, 'select id from proposal where active=\'Y\' and timeout<@d',
      {'d': WLib.utcNow()});
    for (final row in rows) await ProposalLib.closeProposal(db, row['id']);
  }

  ///delete old data - to be called daily (also see weeklyDelete)
  static Future dailyDelete(PostgreSQLConnection db) async {
    //delete doc_revisions older than 1 year
    final rows = await MiscLib.query(db, 'select id from doc_revision where created_at<@d',
      {'d': WLib.utcNow().subtract(new Duration(days: 365))});
    for (final row in rows) await db.execute('delete from doc_revision where id=${row['id']}');
  }

  ///delete old data - to be called weekly (also see dailyDelete)
  static Future weeklyDelete(PostgreSQLConnection db) async {
    //some dates
    DateTime now = WLib.utcNow();
    DateTime monthAgo = now.subtract(new Duration(days: 30));
    DateTime sixMonthsAgo = now.subtract(new Duration(days: 180));
    DateTime yearAgo = now.subtract(new Duration(days: 365));

    //notifications older than 6 months
    await db.execute('delete from xuser_notify where created_at<@d', substitutionValues: {'d': sixMonthsAgo});

    //conversations whose delete_time is reached
    var rows = await MiscLib.query(db, 'select id from conv where open=\'N\' and delete_time<@d', {'d': now});
    for (final row in rows) await CleanDeleter.deleteConv(db, row['id']);

    //events having no convs and were a month or more ago
    rows = await MiscLib.query(db, 'select id from event where not exists(select * from conv where event_id=event.id) and start_time<@d', {'d': monthAgo});
    for (final row in rows) await CleanDeleter.deleteEvent(db, row['id']);

    //users who haven't done anything in a year
    rows = await MiscLib.query(db, 'select id from xuser where last_activity<@d', {'d': yearAgo});
    for (final row in rows) await CleanDeleter.deleteUser(db, row['id']);

    //project proposals whose delete_time is reached
    rows = await MiscLib.query(db, 'select id from proposal where kind=\'PROJ\' and delete_time<@d', {'d': now});
    for (final row in rows) await ProposalLib.delete(db, row['id'], true);

    //project shells that were never used for anything, or all content has
    // already timed out, after 1 year
    rows = await MiscLib.query(db, 'select id from project where created_at<@d'
      ' and not exists(select * from conv where project_id=project.id)'
      ' and not exists(select * from proposal where project_id=project.id)',
      {'d': yearAgo});
    for (final row in rows) {
      try {await CleanDeleter.deleteProjectPartial(db, row['id']);}
      catch(ex) {}
    }
  }

  ///assign leaders of democratic projects
  static Future assignProjectLeadership(PostgreSQLConnection db) async {
    //loop democratic projects
    final rows = await MiscLib.query(db, 'select id,title from project where leadership=\'D\' and kind=\'P\'', null);
    for (final row in rows) await _assignProjectLeadership(db, row['id'], row['title']);
  }

  ///assign leadership to one democratic project
  static Future _assignProjectLeadership(PostgreSQLConnection db, int projectId, String projectTitle) async {
    //load all those voted into leadership, by most votes first
    final voteRows = await MiscLib.query(db, 'select about_id,count(*) as c from project_xuser_xuser where project_id=${projectId} and kind=\'L\' group by about_id order by c desc', null);

    //if there are no votes at all, quit now. (If this isn't done, then it could remove everyone
    // from leadership)
    if (voteRows.length == 0) return;

    //determine the new manager group from the top 10% of the query (at least 8)
    List<int> newManagers = new List<int>();
    int candidateCount = voteRows.length; //members who received any votes
    int managerCount = min(candidateCount, max(8, candidateCount ~/ 10));
    for (int i = 0; i < managerCount; ++i) newManagers.add(voteRows[i]['about_id']);

    //load the existing manager group
    final managerRows = await MiscLib.query(db, 'select xuser_id from project_xuser where project_id=${projectId} and kind=\'M\'', null);
    List<int> oldManagers = new List<int>();
    for (final row in managerRows) oldManagers.add(row['xuser_id']);

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
  static Future countResourceVotes(PostgreSQLConnection db) async {
    //get list of unique resource ids having uncounted votes
    final rows1 = await MiscLib.query(db, 'select distinct resource_id from resource_xuser where processed<>\'Y\'', null);
    List<int> resourceIds = rows1.map((r) => r['resource_id']).toList();
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
  static Future recommendConversations(PostgreSQLConnection db) async {
    //find users with activity since last recommendation, and whose last
    // recommendation was at least an hour ago.
    //NOTE this query is not indexed
    DateTime now = WLib.utcNow();
    DateTime cutoff = now.subtract(new Duration(hours:1));
    final rows1 = await MiscLib.query(db, 'select id from xuser where last_activity>last_recommend and last_recommend<@t',
      {'t': cutoff});
    List<int> userIds = rows1.map((r) => r['id']).toList();

    //recommendations by user
    for (int userId in userIds) {
      await _recommendProjectConversations(db, userId);
      await _recommendSpawnedConversations(db, userId);
      await _recommendImportantConversations(db, userId);

      //set recommended date
      await db.execute('update xuser set last_recommend=@t where id=${userId}', substitutionValues: {'t':now});
    }
  }

  ///recommend convs in projects a user is already in
  static Future _recommendProjectConversations(PostgreSQLConnection db, int userId) async {
    //find convs in all projects the user is already in
    final rows1 = await MiscLib.query(db, 'select id from conv where project_id in (select project_id from project_xuser where xuser_id=${userId} and kind<>\'N\')', null);
    List<int> convIds = rows1.map((r) => r['id']).toList();
    if (convIds.length == 0) return;

    //for those potential convs, get the exiting status
    String inClause = convIds.join(',');
    final joinRows = await MiscLib.query(db, 'select conv_id,status from conv_xuser where conv_id in (${inClause}) and xuser_id=${userId}', null);
    Map<int, String> statusByConv = new Map<int, String>();
    for (final joinRow in joinRows) statusByConv[joinRow['conv_id']] = joinRow['status'];

    //for each potential conv, if there is no existing status or the existing
    // status is N, recommend it
    for (int convId in convIds) {
      String status = statusByConv[convId];
      if (status == null || status == 'N')
        await ConvLib.writeConvUser(db, convId, userId, 'R', 'N');
    }
  }

  ///recommend convs spawned from convs that a user is already in
  static Future _recommendSpawnedConversations(PostgreSQLConnection db, int userId) async {
    //find convs the user is already in
    final rows1 = await MiscLib.query(db, 'select conv_id from conv_xuser where xuser_id=${userId} and status=\'J\'', null);
    List<int> sourceConvIds = rows1.map((r) => r['conv_id']).toList();
    if (sourceConvIds.length == 0) return;

    //load ids of all convs spawned from those
    String sourceConvInClause = sourceConvIds.join(',');
    final spawnedConvRows = await MiscLib.query(db, 'select id, (select status from conv_xuser where conv_id=conv.id and xuser_id=${userId}) as status from conv where from_conv_id in (${sourceConvInClause})', null);

    //loop spawned convs and if the user isn't joined, recommend it
    for (final convRow in spawnedConvRows) {
      int convId = convRow['id'];
      String status = convRow['status'];
      if (status == null || status == 'N') {
        await ConvLib.writeConvUser(db, convId, userId, 'R', 'N');
      }
    }
  }

  ///recommend convs that are marked important by users followed by the given user
  static Future _recommendImportantConversations(PostgreSQLConnection db, int userId) async {
    //get all convs liked by users being followed
    final rows1 = await MiscLib.query(db, 'select distinct conv_id from conv_xuser inner join xuser_xuser on conv_xuser.xuser_id=xuser_xuser.about_id'
      ' where xuser_xuser.owner_id=${userId} and xuser_xuser.kind=\'F\' and conv_xuser.like=\'I\'', null);
    List<int> convIds = rows1.map((r) => r['conv_id']).toList();
    if (convIds.length == 0) return;

    //for those potential convs, get the exiting status
    String inClause = convIds.join(',');
    final joinRows = await MiscLib.query(db, 'select conv_id,status from conv_xuser where conv_id in (${inClause}) and xuser_id=${userId}', null);
    Map<int, String> statusByConv = new Map<int, String>();
    for (final joinRow in joinRows) statusByConv[joinRow['id']] = joinRow['status'];

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
  static Future closeConversations(PostgreSQLConnection db) async {
    //get info about all open convs
    final rows = await MiscLib.query(db, 'select id,created_at,last_activity from conv where open=\'Y\'', null);

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
    for (final row in rows) {
      bool isInactive = activityCutoff.isAfter(row['last_activity']);
      bool isOld = createdCutoff.isAfter(row['created_at']);

      //for the too-big calculation, only run it if the other tests were
      // inconclusive
      bool isTooBig = false;
      if (!isInactive && !isOld) {
        int convSize = await MiscLib.queryScalar(db, 'select sum(char_length(ptext)) from conv_post where conv_id=${row['id']}', null);
        if (convSize == null) convSize = 0;
        isTooBig = convSize > convTooBig;
      }

      //close it
      if (isInactive || isOld || isTooBig)
        await db.execute('update conv set open=\'N\', delete_time=@d where id=${row['id']}', substitutionValues: {'d': deleteDate});
    }
  }

  ///hide resources if the remove vote count is high
  static Future hideResources(PostgreSQLConnection db) async {
    //get the count of votes of all kinds for each visible resource; the result set may have
    // multiple rows for each resource id
    final voteSumRows = await MiscLib.query(db, 'select resource_xuser.resource_id, resource_xuser.kind, count(resource_xuser.kind) as votecount from resource_xuser inner join resource on resource_xuser.resource_id=resource.id where resource.visible=\'Y\' group by resource_xuser.resource_id, resource_xuser.kind', null);

    //copy rows into maps for easier access (counts indexed by id)
    Map<int, int> importantCounts = new Map<int, int>(),
      removeCounts = new Map<int, int>();
    for (final row in voteSumRows) {
      int id = row['resource_id'], voteCount = row['votecount'];
      String kind = row['kind'];
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
  static Future emailNotifications(PostgreSQLConnection db) async {
    //get config settings
    String siteName = Globals.configSettings.siteName;

    //get user ids having any un-emailed notifications
    final distinctUserRows = await MiscLib.query(db, 'select id,pref_email_notify,email from xuser where exists(select * from xuser_notify where xuser_id=xuser.id and emailed=\'N\')', null);

    //loop users
    for (final userRow in distinctUserRows) {
      //if the user wants and can get email
      bool wantsEmail = userRow['ref_email_notify'] == 'Y';
      String emailAddress = userRow['email'] ?? '';
      bool canSendEmail = emailAddress.contains('@');
      if (canSendEmail && wantsEmail) {

        //load notifications for user
        final notifRows = await MiscLib.query(db, 'select body,link_text,link_key from xuser_notify where xuser_id=${userRow['id']} and emailed=\'N\'', null);
        int notifCount = await MiscLib.queryScalar(db, 'select count(*) from xuser_notify where xuser_id=${userRow['id']}', null) ?? 0;
        if (notifCount > 0) {

          //compose notifications into an email body
          StringBuffer body = new StringBuffer('You have new notifications at ${siteName}\r\n\r\n');
          int number = 0;
          for (final notifRow in notifRows) {
            String link = '';
            body.write('${++number}. ${notifRow['body']}\r\n${link}-------------------\r\n');
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
