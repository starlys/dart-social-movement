import 'dart:async';
import 'database.dart';
import 'package:postgresql/postgresql.dart';
import 'misc_lib.dart';
import 'twotier/wtypes.dart';
import 'twotier/wlib.dart';

//tried to use 2 dart libs for memcache, and gave up for now. memcached_client
//is bulky and lacks documentation. memcache has no constructor except if
// caching locally which defeats the purpose
//import 'dart:convert' show UTF8;
//import 'package:memcached_client/memcached_client.dart';
//import "package:memcache/memcache.dart";
//import "package:memcache/src/memcache_native_connection.dart";

///Centralizes access to credentials via memcached and database;
/// this is meant to be fast as the credentials are checked on every
/// client request
class Authenticator {

  //static MemcachedClient _memcached;
  //static MemCacheNativeConnection _memcached;
  static Map<String, AuthInfo> _recentAuth = new Map<String, AuthInfo>(); //indexed by uppercase nick!
  static int _putCount = 0; //num items added to _recent since last cleanup

  ///set up credential caching system
  static Future init() async {
    //_memcached = await MemCacheNativeConnection.connect('127.0.0.1', 11211);
    //_memcached = await MemcachedClient.connect([new SocketAddress('127.0.0.1', 11211)]);
  }

  ///remove the given user id from the cache (for example, when they update their profile)
  static void invalidate(String nick) {
    _recentAuth.remove(nick.toUpperCase());
  }

  ///authenticate a user request; return null if auth failed
  static Future<AuthInfo> authenticateForAPI(APIRequestBase args) async {
    return authenticate(args.nick, args.password);
  }

  ///authenticate a user request; return null if auth failed;
  /// nick is matched in a case-insentive way
  static Future<AuthInfo> authenticate(String nick, String password) async {
    //note on expiration: if a user is using the site for a long time, this will
    //cache their authentication for 10 minutes, then it will reload for another
    //10 minutes and so on. This forces the is_site_admin flag to be loaded
    //occasionally in case it was changed by the worker thread

    //bad inputs?
    if (nick == null || password == null) return null;

    //is in memory?
    AuthInfo ai = _recentAuth[nick.toUpperCase()];
    if (ai != null) {
      if (password != ai.password) return null;
      //dont do this: see note at top of method: _setExpiration(ai);
      return ai;
    }

    //was not in memory - check database or exit
    ai = new AuthInfo();
    ai..nick = nick ..password = password;
    ai.passwordHash = MiscLib.passwordHash(password);
    await Database.safely('x', null, (db) async {
      List<Row> rows = await db.query('select id,nick,site_admin,public_name,timezone from xuser where status=\'A\' and lower(nick)=@n and password=@p',
        {'n':nick.toLowerCase(), 'p':ai.passwordHash}).toList();
      if (rows.length > 0) {
        Row row = rows[0];
        ai..id = row.id
          ..nick = row.nick //fixes capitalization compared to nick parameter
          ..isSiteAdmin = row.site_admin == 'Y'
          ..publicName = row.public_name
          ..timeZoneName = row.timezone
          ..lastPushQueueGetUtc = WLib.utc1970();
      }
    });
    if (ai.id == null) return null;

    //found in db; store
    _setExpiration(ai);
    _recentAuth[nick.toUpperCase()] = ai;

    //clean up occasionally
    if (++_putCount > 100) {
      _putCount = 0;
      _clean();
    }
    return ai;
  }

  ///populate an api response to be invalid if ai is null
  static void ensureLoggedIn(AuthInfo ai, APIResponseBase r) {
    if (ai == null) {
      r.ok = 'N';
      r.errorCode = 'auth';
      r.errorMessage = 'You must be logged in to do this action.';
    }
  }

  ///populate an api response to be invalid if ai indicates a non-site-admin user
  static void ensureSiteAdmin(AuthInfo ai, APIResponseBase r) {
    if (ai == null || !ai.isSiteAdmin) {
      r.ok = 'N';
      r.errorCode = 'auth';
      r.errorMessage = 'You must be a site administrator in to do this action.';
    }
  }

  ///set expiration date
  static void _setExpiration(AuthInfo ai) {
    ai._expirationUtc = WLib.utcNow().add(new Duration(minutes:10));
  }

  ///clean out old entries from _recent
  static void _clean() {
    DateTime nowUtc = WLib.utcNow();
    _recentAuth.keys.where((nick) => _recentAuth[nick]._expirationUtc.isBefore(nowUtc))
      .toList()
      .forEach(_recentAuth.remove);
  }
}

///authentication results as provided by Authenticator
class AuthInfo {
  int id;
  String nick;
  String password;
  String publicName;
  bool isSiteAdmin;
  String passwordHash;
  String timeZoneName;
  ///when PushQueueGet was last called (never null)
  DateTime lastPushQueueGetUtc;
  DateTime _expirationUtc;
}
