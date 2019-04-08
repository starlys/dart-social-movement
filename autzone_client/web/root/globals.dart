import 'dart:async';
import '../pane/base_pane.dart';
import 'package:autzone_models/autzone_models.dart';

typedef Future UserActionFunc();

///application-wide globals (no methods)
class Globals {
  //variables coming from constants declared in index.html
  static String appTitle1;
  static String appTitle2;
  static String siteCode;

  ///max length of titles, unless database specifies a shorter limit
  static final int maxTitleLength = 500;
  static final int maxDescriptionLength = 10000;

  ///all resource kinds the front end knows about (note that the database doesn't enforce these)
  static final List<String> allResourceKinds = ['On-line reading', 'On-line multimedia', 'Book', 'Product', 'Organization', 'Service', 'Location'];

  ///all public links kinds the front end knows about (note that the database doesn't enforce these);
  /// If any of these are removed, the client will not be able to edit users correctly
  static final List<String> allPublicLinkKinds = ['Email', 'Blog', 'Facebook', 'Twitter', 'Linked-in', 'Google+', 'Tumblr', 'Instagram', 'Other(1)', 'Other(2)', 'Other(3)'];

  ///all values of xuser.kind; names indexed by code
  static final Map<String, String> allUserKinds = {'V': 'Visitor', 'M': 'Member', 'A': 'Ally'};

  ///all values of project_xuser.kind; names indexed by code (excludes value 'N')
  static final Map<String, String> allProjectUserKinds = {'O': 'Observer', 'V': 'Visitor', 'A': 'Active member', 'M': 'Project manager'};

  ///all values of project.privacy; names indexed by code
  static final Map<String, String> allProjectPrivacy = {
    'P': 'Public',
    'A': 'Announcement - private for posting, public for reading',
    'R': 'Private - join by request or invite',
    'I': 'Extra-private - by invite only'
    };

  ///true if screen shows menu on left at all times; false if it pops up (null before size calculated)
  static bool isLargeScreen = null;

  ///user id if logged in, 0 if logged out
  static int userId = 0;

  ///logged in nick, null if not logged in
  static String nick;

  ///password for nick
  static String password;

  //full name if logged in
  static String publicName;

  ///true if is site admin (note that this was true at the time of login, it could have changed server side)
  static bool isSiteAdmin;

  ///panes now showing
  static List<BasePane> panes = new List<BasePane>();

  ///time when page loaded
  static final DateTime pageLoadUtc = WLib.utcNow();
  
  ///last activity time
  static DateTime lastActivityUtc = WLib.utcNow();

  ///push queue items
  static List<PushQueueItem> pushQueue = new List<PushQueueItem>();

  ///actions to be done on the next user action; code that puts functions
  /// here can expect them to run on the next button click, and it can also
  /// remove the action before it runs
  static Map<String, UserActionFunc> doOnUserAction = new Map<String, UserActionFunc>();

  ///true when user has clicked refresh button but polling hasn't completed
  static bool pollExplicitlyRequested = false;

  ///when either this app called PushQueueGet or when another browser window
  /// notified this one of received items
  static DateTime lastPollUtc = new DateTime(1970);

  ///this this app called PushQueueGet in full mode, or when another browser window
  /// notified this one of received items in full mode
  static DateTime lastFullPollUtc = new DateTime(1970);

  ///true with the URL fragment was changed in code
  static bool urlChangedInCode = false;

  ///tracking whether the menus are visible
  static bool menuShowing = false, myStuffShowing = false;
}
