import 'dart:async';
import 'database.dart';
import 'misc_lib.dart';
import 'package:autzone_models/autzone_models.dart';
import 'package:autzone_common/autzone_common.dart';

//tried to use 2 dart libs for memcache, and gave up for now. memcached_client
//is bulky and lacks documentation. memcache has no constructor except if
// caching locally which defeats the purpose
//import 'dart:convert' show UTF8;
//import 'package:memcached_client/memcached_client.dart';
//import "package:memcache/memcache.dart";
//import "package:memcache/src/memcache_native_connection.dart";

///Centralizes access to credentials via cache and database;
/// this is meant to be fast as the credentials are checked on every
/// client request
class Authenticator {

  static Map<String, AuthInfo> _recentAuth = new Map<String, AuthInfo>(); //indexed by siteCode|uppercase nick; example: AUT|BOB
  static int _putCount = 0; //num items added to _recent since last cleanup

  ///build key for _recentAuth
  static String _key(String siteCode, String nick) => '${siteCode}|${nick.toUpperCase()}';

  ///remove the given user id from the cache (for example, when they update their profile)
  static void invalidate(String siteCode, String nick) {
    _recentAuth.remove(_key(siteCode, nick));
  }

  ///authenticate a user request; return null if auth failed
  static Future<AuthInfo> authenticateForAPI(APIRequestBase args) async {
    return authenticate(args.siteCode, args.nick, args.password);
  }

  ///authenticate a user request; return null if auth failed;
  /// nick is matched in a case-insentive way
  static Future<AuthInfo> authenticate(String siteCode, String nick, String password) async {
    //note on expiration: if a user is using the site for a long time, this will
    //cache their authentication for 10 minutes, then it will reload for another
    //10 minutes and so on. This forces the is_site_admin flag to be loaded
    //occasionally in case it was changed by the worker thread

    //bad inputs?
    if (siteCode == null || nick == null || password == null) return null;

    //is in memory?
    final recentKey = _key(siteCode, nick);
    AuthInfo ai = _recentAuth[recentKey];
    if (ai != null) {
      if (password != ai.password) return null;
      //dont do this: see note at top of method: _setExpiration(ai);
      return ai;
    }

    //was not in memory - check database or exit
    final site = ApiGlobals.sites.byCode(siteCode);
    ai = new AuthInfo();
    ai..nick = nick ..password = password;
    ai.passwordHash = MiscLib.passwordHash(password);
    await Database.safely('x', (db) async {
      final rows = await MiscLib.query(db, 'select id,nick,site_admin,public_name,timezone from xuser where site_id=${site.id} and status=\'A\' and lower(nick)=@n and password=@p',
        {'n':nick.toLowerCase(), 'p':ai.passwordHash});
      if (rows.length > 0) {
        final row = rows[0];
        ai..id = row['id']
          ..site = site
          ..nick = row['nick'] //fixes capitalization compared to nick parameter
          ..isSiteAdmin = row['site_admin'] == 'Y'
          ..publicName = row['public_name']
          ..timeZoneName = row['timezone']
          ..lastPushQueueGetUtc = WLib.utc1970();
      }
    });
    if (ai.id == null) return null;

    //found in db; store
    _setExpiration(ai);
    _recentAuth[recentKey] = ai;

    //clean up occasionally
    if (++_putCount > 100) {
      _putCount = 0;
      _clean();
    }
    return ai;
  }

  ///return an invalid api response if ai is null, else return null
  static APIResponseBase ensureLoggedIn(AuthInfo ai) {
    if (ai == null) return APIResponseBase(ok: 'N', errorCode: 'auth', errorMessage: 'You must be logged in to do this action.');
    return null;
  }

  ///return an invalid api response if ai indicates a non-site-admin user, else return null
  static APIResponseBase ensureSiteAdmin(AuthInfo ai) {
    if (ai == null || !ai.isSiteAdmin) return APIResponseBase(ok: 'N', errorCode: 'auth', errorMessage: 'You must be a site administrator in to do this action.');
    return null;
  }

  ///set expiration date
  static void _setExpiration(AuthInfo ai) {
    ai._expirationUtc = WLib.utcNow().add(new Duration(minutes:10));
  }

  ///clean out old entries from _recent
  static void _clean() {
    DateTime nowUtc = WLib.utcNow();
    _recentAuth.keys.where((key) => _recentAuth[key]._expirationUtc.isBefore(nowUtc))
      .toList()
      .forEach(_recentAuth.remove);
  }
}

///authentication results as provided by Authenticator
class AuthInfo {
  int id;
  SiteRecord site;
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
