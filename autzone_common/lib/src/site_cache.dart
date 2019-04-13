import 'dart:async';
import 'dart:io';
import 'database.dart';
import 'misc_lib.dart';
import 'api_globals.dart';
import 'package:autzone_models/autzone_models.dart';

///cache of site and config tables, plus other unchanging/cacheable values
class SiteCache {
  var _sites = Map<String, SiteRecord>();
  var _nextLoadTime = WLib.utc1970();
  final String _notFoundMessage = 'Site not found';

  Future init() {
    return _load();
  }

  ///get all site codes
  Future<List<String>> allCodes() async {
    await _loadIfNeeded();
    return _sites.values.map((s) => s.code).toList();
  }

  ///get site by code; to improve performance, this call assumes that sites were already loaded from one of the async calls
  SiteRecord byCode(String code) {
    final site = _sites[code];
    if (site == null) throw Exception('${_notFoundMessage} (code ${code})');
    return site;
  }

  ///get site by domain name, case insensitive; if searchParent is true, also matches if the given
  ///domain is one level more general, for example: domain s.com matches www.s.com from site table.
  ///Note that if you have a multitenant site that uses a.x.com and b.x.com and the user goes to x.com, 
  ///then the result will be undefined.
  Future<SiteRecord> byDomain(String domain, bool searchParent) async {
    await _loadIfNeeded();
    domain = domain.toLowerCase();
    var site = _sites.values.firstWhere((s) => s.domain == domain);
    if (site == null) {
      if (searchParent) site = _sites.values.firstWhere((s) => s.parentDomain == domain);
      if (site == null) throw Exception('${_notFoundMessage} (domain ${domain})');
    }
    return site;
  }

  ///get site by database id
  Future<SiteRecord> byId(int id) async {
    await _loadIfNeeded();
    final site = _sites.values.firstWhere((s) => s.id == id);
    if (site == null) throw Exception('${_notFoundMessage} (id ${id})');
    return site;
  }

  Future _loadIfNeeded() async {
    if (WLib.utcNow().isAfter(_nextLoadTime)) await _load();
  }

  Future _load() async {
    _nextLoadTime = WLib.utcNow().add(Duration(minutes: 10));
    await Database.safely('load site+config', (db) async {
      final siteRows = await MiscLib.query(db, 'select * from site order by id', null);
      final configRows = await MiscLib.query(db, 'select * from config', null);
      final codeToString = (int siteId, String code) {
        try { return configRows.firstWhere((r) => r['site_id'] == siteId && r['code'] == code)['value'];}
        catch (e) { throw Exception('Missing config row for site $siteId, code $code'); }
      };
      final codeToInt = (int siteId, String code) => int.parse(codeToString(siteId, code));
      final sites = Map<String, SiteRecord>();
      for (final siteRow in siteRows) {
        final siteId = siteRow['id'];
        final int rootProjectId = await MiscLib.queryScalar(db, 'select id from project where kind=\'R\' and site_id=${siteId}', null);

        final deletion = SiteRecord_Deletion(
          codeToInt(siteId, 'deletion.conv_days')
          );
        final admin = SiteRecord_SiteAdmin(
          codeToInt(siteId, 'site_admin.min'),
          codeToInt(siteId, 'site_admin.max'),
          codeToInt(siteId, 'site_admin.percent')
        );
        final spam = SiteRecord_Spam(
          codeToInt(siteId, 'spam.reaction_weight_days'),
          codeToInt(siteId, 'spam.restrict1_score'),
          codeToInt(siteId, 'spam.restrict2_score'),
          codeToInt(siteId, 'spam.restrict3_score'),
          codeToInt(siteId, 'spam.restrict1_rest_days'),
          codeToInt(siteId, 'spam.restrict1_chars'),
          codeToInt(siteId, 'spam.restrict2_rest_days'),
          codeToInt(siteId, 'spam.restrict2_chars'),
          codeToInt(siteId, 'spam.restrict3_rest_days'),
          codeToInt(siteId, 'spam.restrict3_chars')
          );
        final operation = SiteRecord_Operation(
          codeToInt(siteId, 'operation.root_doc_vote_min'),
          codeToInt(siteId, 'operation.root_doc_vote_days'),
          codeToInt(siteId, 'operation.conv_inactive_days'),
          codeToInt(siteId, 'operation.conv_old_days'),
          codeToInt(siteId, 'operation.conv_too_big')
          );
        final site = SiteRecord(siteRow['id'], siteRow['code'], siteRow['domain'], siteRow['home_url'], 
          siteRow['title1'], siteRow['title2'], deletion, admin, spam, operation, rootProjectId);
        sites[site.code] = site;
        if (!sites.containsKey(r'$code$')) sites[r'$code$'] = site; //support dev mode by using site id 1
      }
      _sites = sites;
    });
  }
}

///Detail fields from site table and container for config table entries
class SiteRecord {
  String _indexhtml;

  final int id;
  
  ///the project.id for the single row with kind=R (parent of root documents)
  final int rootProjectId;

  ///see database doc, site table for these meanings
  final String code, domain, homeUrl, title1, title2;

  ///domain with first segment removed (example www.s.com causes parentDomain=s.com)
  final String parentDomain;

  final SiteRecord_Deletion deletion;
  final SiteRecord_SiteAdmin site_admin;
  final SiteRecord_Spam spam;
  final SiteRecord_Operation operation;

  SiteRecord(int this.id, String this.code, String this.domain, String this.homeUrl, String this.title1, String this.title2,
    SiteRecord_Deletion this.deletion, SiteRecord_SiteAdmin this.site_admin, SiteRecord_Spam this.spam,
    SiteRecord_Operation this.operation, int this.rootProjectId) : parentDomain = _removeDomainPrefix(domain) {}

  ///get cached generated version of index.html for this site
  String get indexHtml {
    if (_indexhtml == null) {
      final rootPath = ApiGlobals.rootPath;
      final templatePath = ApiGlobals.instance.configLoader.isDev ? '${rootPath}/autzone_client/web/index.html' : '${rootPath}/public_html/index.html';
      final template = File(templatePath);
      _indexhtml = template.readAsStringSync()
        .replaceAll(r'$title1$', title1.replaceAll("'", "\'"))
        .replaceAll(r'$title2$', title2.replaceAll("'", "\'"))
        .replaceAll(r'$code$', code)
        .replaceAll(r'site_AUT', 'site_$code');
    }
    return _indexhtml;
  }

  static String _removeDomainPrefix(String s) {
    final int dot = s.indexOf('.');
    if (dot == -1) return s;
    final parent = s.substring(dot + 1);
    final int dot2 = parent.indexOf('.');
    if (dot2 == -1) return s; //need at least one dot in the result
    return parent;
  }
}

///constants determining when to delete records
class SiteRecord_Deletion {
  final int conv_days; //days after which convs are deleted counting from the date they are closed
  SiteRecord_Deletion(int this.conv_days) {}
}

///constants determining assignment of site admins
class SiteRecord_SiteAdmin {
  ///at least this many admins
  final int min;
  
  ///at most this many admins
  final int max;
  
  ///etween min/max, the percent of user base that is an admin
  final int percent;

  SiteRecord_SiteAdmin(int this.min, int this.max, int this.percent) {}
}

///constants determining spam/throttle behavior
class SiteRecord_Spam {
  ///days at which reactions to posts no longer matter for spam_count (weight of reaction declines linearly)
  final int reaction_weight_days; 

  ///spam_count needed to achieve restriction level 1
  final int restrict1_score; 

  ///spam_count needed to achieve restriction level 2
  final int restrict2_score; 

  ///spam_count needed to achieve restriction level 3
  final int restrict3_score;

  ///number of days between posts required at restriction level 1
  final int restrict1_rest_days; 

  ///max number of chars allowed at restriction level 1
  final int restrict1_chars; 

  ///umber of days between posts required at restriction level 2
  final int restrict2_rest_days; 

  ///max number of chars allowed at restriction level 2
  final int restrict2_chars;

  ///number of days between posts required at restriction level 3
  final int restrict3_rest_days; 

  ///max number of chars allowed at restriction level 3
  final int restrict3_chars;

    SiteRecord_Spam(int this.reaction_weight_days, int this.restrict1_score, int this.restrict2_score, int this.restrict3_score,
      int this.restrict1_rest_days, int this.restrict1_chars, int this.restrict2_rest_days, int this.restrict2_chars,
      int this.restrict3_rest_days, int this.restrict3_chars) {}
}

///other operational logic
class SiteRecord_Operation {
  ///min number of people required to pass a root doc or system proposal
  final int root_doc_vote_min; 

  ///days to keep a root doc or system proposal open
  final int root_doc_vote_days; 

  ///days after which a conv is considered inactive
  final int conv_inactive_days;

  ///days after which a conv is considered old and is closed (not to be confused with deletion.conv_days)
  final int conv_old_days;

  ///char count over which a conv is considered too big and is closed
  final int conv_too_big;

  SiteRecord_Operation(int this.root_doc_vote_min, int this.root_doc_vote_days, int this.conv_inactive_days,
    int this.conv_old_days, int this.conv_too_big) {}
}
