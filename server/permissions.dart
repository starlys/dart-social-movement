import "dart:async";
import "dart:math";
import 'package:postgresql/postgresql.dart';
import 'misc_lib.dart';
import "config.dart";
import 'twotier/wlib.dart';

///container for use with Permissions methods
class RestrictionInfo {
  ///0 for no restriction; 1-3 for the level
  int restrictionLevel = 0;
  ///number of whole days required between posts (0 for no restriction; 2 means
  /// "one post per 2 days")
  int restDays = 0;
  ///char limit of each post (does not support a concept of unlimited)
  int charLimit = 10000;
  ///user readable explanation of permissions
  String explanation;
  ///whether a post is allowed right now
  bool allowedNow = false;
}

//info used in Permissions.getConvJoinPermissions
class JoinInfo {
  int projectId; //or null if none
  bool hasConvUserRecord = false;
  String existingStatus; //from conv_xuser.status for existing record
  bool isAlreadyJoined = false; //for conv level only
  bool mayJoin = false;//may join at the level given in maxProjectUserKind
  bool mayRequest = false; //may request joining
  String maxProjectUserKind; //the value from projec_xuser.kind indicating the max level allowed (O,V, or A)
}

///logic dealing with read/write permissions
class Permissions{

  ///convert spam_count (defined in project_xuser table) to specific info about
  /// posting restrictions; does NOT set explanation or allowedNow
  static RestrictionInfo spamCountToRestrictions(Config cfg, int spamCount) {
    //get settings
    Map spamSettings = cfg.settings['spam'];
    int restrict1Score = spamSettings['restrict1_score'];
    int restrict2Score = spamSettings['restrict2_score'];
    int restrict3Score = spamSettings['restrict3_score'];

    //populate return structure
    RestrictionInfo r = new RestrictionInfo();
    if (spamCount >= restrict3Score) {
      r.restrictionLevel = 3;
      r.restDays = spamSettings['restrict3_rest_days'];
      r.charLimit = spamSettings['restrict3_chars'];
    } else if (spamCount >= restrict2Score) {
      r.restrictionLevel = 2;
      r.restDays = spamSettings['restrict2_rest_days'];
      r.charLimit = spamSettings['restrict2_chars'];
    } else if (spamCount >= restrict1Score) {
      r.restrictionLevel = 1;
      r.restDays = spamSettings['restrict1_rest_days'];
      r.charLimit = spamSettings['restrict1_chars'];
    }
    return r;
  }

  ///get info about posting permissions for a user+conv, based on throttling
  /// and the rules of the conv.
  /// convRow must contain the posting rules fields, and open.
  static Future<RestrictionInfo> getConvPostPermissions(Config cfg, Connection db, int userId,
    int convId, Row convRow) async {

    //if conv is closed, exit now
    if (convRow.open != 'Y') {
      RestrictionInfo info = new RestrictionInfo()
        ..explanation = 'Conversation has been closed.';
      return info;
    }

    //get this user's spam count and set info to rules based on that
    int spamCount = 0;
    int projectId = convRow.project_id;
    if (projectId != null) {
      spamCount = (await MiscLib.queryScalar(db, 'select spam_count from project_xuser where project_id=${projectId} and xuser_id=${userId}')) ?? 0;
    }
    RestrictionInfo spamInfo = spamCountToRestrictions(cfg, spamCount);
    spamInfo.allowedNow = true;

    //if there are restrictions, check the user's latest post in whole project to see if they
    //are allowed to post now
    if (spamInfo.restDays > 0 && projectId != null) {
      DateTime latestPostAt = await MiscLib.queryScalar(db, 'select max(created_at) from conv_post inner join conv on conv_post.conv_id=conv.id where conv.project_id=${projectId} and conv_post.author_id=${userId}');
      if (latestPostAt != null) {
        Duration ago = WLib.utcNow().difference(latestPostAt);
        if (ago.inDays < spamInfo.restDays) {
          spamInfo.allowedNow = false;
        }
      }
    }

    //check the conv rules for separate restrictions
    RestrictionInfo rulesInfo = new RestrictionInfo()
      ..charLimit = convRow.post_max_size
      ..allowedNow = true;
    int userDailyMax = convRow.xuser_daily_max;
    if (userDailyMax < 999) {
      DateTime yesterday = WLib.utcNow().subtract(new Duration(days:1));
      int postCount = (await MiscLib.queryScalar(db, 'select count(*) from conv_post where conv_id=${convId} and author_id=${userId}'
        ' and created_at>@t', {'t': yesterday})) ?? 0;
      if (postCount >= userDailyMax) {
        rulesInfo.allowedNow = false;
      }
    }

    //combine restrictions and format explanation
    RestrictionInfo combinedInfo = new RestrictionInfo()
      ..restrictionLevel = spamInfo.restrictionLevel
      ..restDays = spamInfo.restDays
      ..charLimit = min(spamInfo.charLimit, rulesInfo.charLimit)
      ..allowedNow = spamInfo.allowedNow && rulesInfo.allowedNow;
    StringBuffer expl = new StringBuffer();
    if (combinedInfo.restrictionLevel > 0) expl.write('You have been quieted in this project. ');
    if (combinedInfo.restDays > 1) {
      expl.write('You may post every ${combinedInfo.restDays} days');
    } else if (combinedInfo.restDays == 1) {
      expl.write('You may post once per day');
    } else {
      expl.write('You may post up to ${userDailyMax} times per day');
    }
    expl.write(' (max ${combinedInfo.charLimit} chars).');
    if (!combinedInfo.allowedNow) expl.write(' The limit has been reached.');
    combinedInfo.explanation = expl.toString();

    return combinedInfo;
  }

  //look in project or event to determine if user is manager/owner;
  //only pass nonnull for one of the keys (projectId, eventId)
  static Future<bool> isConvManager(Connection db, int userId, int projectId, int eventId) async {
    if (projectId != null) {
      String kind = await getProjectUserKind(db, userId, projectId);
      return isProjectUserKindIn(kind, testForManager: true);
    }
    if (eventId != null) {
      int createdBy = await MiscLib.queryScalar(db, 'select created_by from event where id=${eventId}');
      if (createdBy == userId) return true;
    }
    return false;
  }

  ///get user membership in project (project_xuser.kind)
  static Future<String> getProjectUserKind(Connection db, int userId, int projectId) async {
    return await MiscLib.queryScalar(db, 'select kind from project_xuser where project_id=${projectId} and xuser_id=${userId}');
  }

  ///compare the value of project_xuser.kind to see if the kind is a manager, posting user
  /// or regular user. Pass false for both bool args to just test if the user is joined to the
  /// project.
  static bool isProjectUserKindIn(String kind, {bool testForPosting: false, bool testForManager: false}) {
    if (testForManager)
      return kind == 'M';
    bool canPost = kind == 'V' || kind == 'A' || kind == 'M';
    if (testForPosting)
      return canPost;
    return canPost || kind == 'O';
  }

  ///get whether a user is joined to a project (as observer or posting user)
  static Future<bool> isJoinedToProject(Connection db, int userId, int projectId) async {
    String kind = await getProjectUserKind(db, userId, projectId);
    return isProjectUserKindIn(kind);
  }

  ///look in project or event to determine if user is a member;
  ///only pass nonnull for one of the keys (projectId, eventId)
  static Future<bool> isConvCreatable(Connection db, int userId, int projectId, int eventId) async {
    if (projectId != null) {
      return await isJoinedToProject(db, userId, projectId);
    }
    if (eventId != null) {
      String status = await MiscLib.queryScalar(db, 'select status from event_xuser where event_id=${eventId} and xuser_id=${userId}');
      if (status == 'A') return true;
    }
    return false;
  }

  ///get info about permissions for joining a project (without joining a conv in
  /// the project). If projectId is null assumes public.
  /// Only sets maxProjectUserKind, mayJoin, mayRequest.
  static Future<JoinInfo> getProjectJoinPermissions(Connection db, int userId, int projectId) async {
      JoinInfo r = new JoinInfo()
        ..projectId = projectId;

      //get associated project or event info
      String privacy = 'P'; //events are public
      if (projectId != null) {
        Row projRow = await MiscLib.querySingleChecked(db, 'select privacy from project where id=${projectId}', 'Project does not exist');
        privacy = projRow.privacy;

        //if this user already joined project:
        String projUserKind = await Permissions.getProjectUserKind(db, userId, projectId);
        if (isProjectUserKindIn(projUserKind)) {
          r.maxProjectUserKind = 'A';
          r.mayJoin = true;
          return r;
        }
      }

      //public project/event: allow join as type visitor
      if (privacy == 'P') {
        r.mayJoin = true;
        r.maxProjectUserKind = 'V';
        return r;
      }

      //announcement project: allow join as type observer
      if (privacy == 'A') {
        r.mayJoin = true;
        r.maxProjectUserKind = 'O';
        return r;
      }

      //by-request project: allow requesting, not joining
      if (privacy == 'R') {
        r.mayRequest = true;
        return r;
      }

      //cannot join
      return r;
  }

  //get info about permissions for joining a conversation
  static Future<JoinInfo> getConvJoinPermissions(Connection db, int userId, int convId) async {
      //get info from the conv
      Row convRow = await MiscLib.querySingleChecked(db, 'select project_id,event_id from conv where id=${convId}', 'Conversation does not exist');
      int projectId = convRow.project_id; //null ok

      //get project level join permissions
      JoinInfo r = await getProjectJoinPermissions(db, userId, projectId);

      //get whether user is already joined
      List<Row> convUserRows = await db.query('select status from conv_xuser where conv_id=${convId} and xuser_id=${userId}').toList();
      r.hasConvUserRecord = convUserRows.length > 0;
      if (r.hasConvUserRecord) {
        Row convUserRow = convUserRows[0];
        r.existingStatus = convUserRow.status;
        if (r.existingStatus == 'J') {
          r.isAlreadyJoined = true;
          r.mayJoin = false;
          return r;
        }
      }

      //if project allows, exit
      if (r.mayJoin) return r;

      //if explicitly invited to conv, they can join
      if (r.existingStatus == 'I') {
        r.mayJoin = true;
        r.maxProjectUserKind = 'A';
        return r;
      }

      //cannot join or request
      return r;
  }

  ///throw exceptions if the user may not post to the conv; convRow must be loaded from ConvLib.getConvRow
  /// or equivalent; projectId is from that row and may be null; postLength is the proposed length
  /// of the post
  static Future checkConvPostPermissions(Config cfg, Connection db, int userId, int convId,
    Row convRow, int projectId, int postLength) async {
    //check user is joined to conv
    Row convUserRow = await db.query('select status from conv_xuser where conv_id=${convId} and xuser_id=${userId}').first;
    if (convUserRow == null || convUserRow.status != 'J') throw new Exception('Cannot post to a conversation that you have not joined');

    //check user is allowed to post in project
    if (projectId != null) {
      String kind = await Permissions.getProjectUserKind(db, userId, projectId);
      if (kind == null) throw new Exception('Cannot post in a project that you have not joined');
      bool ok = Permissions.isProjectUserKindIn(kind, testForPosting: true);
      if (!ok) throw new Exception('Cannot post in a project where you are an observer or have left the project');
    }

    //check spam and other restrictions are met
    RestrictionInfo postPermissions = await Permissions.getConvPostPermissions(cfg, db, userId, convId, convRow);
    if (!postPermissions.allowedNow) throw new Exception('Not allowed to post in this conversation now.');
    if (postLength > postPermissions.charLimit) throw new Exception('Post exceeds allowed length of ${postPermissions.charLimit}.');
  }
}
