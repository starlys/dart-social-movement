import 'dart:async';
import 'dart:io';
import 'database.dart';
import 'misc_lib.dart';
import 'config_loader.dart';
import 'package:autzone_models/autzone_models.dart';

///cache of site and config tables, plus other unchanging/cacheable values
class SiteCache {
  var _sites = Map<String, SiteRecord>();
  var _nextLoadTime = WLib.utcNow();

  Future init() {
    return _load();
  }

  ///get all site codes
  Future<List<String>> allCodes() async {
    await _loadIfNeeded();
    return _sites.values.map((s) => s.code).toList();
  }

  ///get site by code; to improve performance, this call assumes that sites were already loaded from one of the async calls
  SiteRecord byCode(String code) => _sites[code];

  ///get site by domain name, case insensitive
  Future<SiteRecord> byDomain(String domain) async {
    await _loadIfNeeded();
    domain = domain.toLowerCase();
    return _sites.values.firstWhere((s) => s.domain == domain);
  }

  ///get site by database id
  Future<SiteRecord> byId(int id) async {
    await _loadIfNeeded();
    return _sites.values.firstWhere((s) => s.id == id);
  }

  Future _loadIfNeeded() async {
    if (WLib.utcNow().isAfter(_nextLoadTime)) await _load();
  }

  Future _load() async {
    _nextLoadTime = WLib.utcNow().add(Duration(minutes: 10));
    Database.safely('load site+config', (db) async {
      final siteRows = await MiscLib.query(db, 'select * from site', null);
      final configRows = await MiscLib.query(db, 'select * from config', null);
      final codeToString = (int siteId, String code) => configRows.firstWhere((r) => r['site_id'] == siteId && r['code'] == code)['value'];
      final codeToInt = (int siteId, String code) => int.parse(codeToString(siteId, code));
      final sites = Map<String, SiteRecord>();
      for (final siteRow in siteRows) {
        final siteId = siteRow['site_id'];
        final int rootProjectId = await MiscLib.queryScalar(db, 'select id from project where kind=\'R\' abd site_id=$siteId', null);

        final deletion = SiteRecord_Deletion(
          codeToInt(siteId, 'deletion.conv.days')
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
      }
      _sites = sites;
    });
  }
}

class SiteRecord {
  String _indexhtml;

  final int id;
  
  ///the project.id for the single row with kind=R (parent of root documents)
  final int rootProjectId;

  ///see database doc, site table for these meanings
  final String code, domain, homeUrl, title1, title2;

  final SiteRecord_Deletion deletion;
  final SiteRecord_SiteAdmin site_admin;
  final SiteRecord_Spam spam;
  final SiteRecord_Operation operation;

  SiteRecord(int this.id, String this.code, String this.domain, String this.homeUrl, String this.title1, String this.title2,
    SiteRecord_Deletion this.deletion, SiteRecord_SiteAdmin this.site_admin, SiteRecord_Spam this.spam,
    SiteRecord_Operation this.operation, int this.rootProjectId) {}

  ///get cached generated version of index.html for this site
  String get indexHtml {
    if (_indexhtml == null) {
      final template = File('${ConfigLoader.rootPath()}/public_html/index.html');
      _indexhtml = template.readAsStringSync()
        .replaceAll(r'$title1$', title1.replaceAll("'", "\'"))
        .replaceAll(r'$title2$', title2.replaceAll("'", "\'"))
        .replaceAll(r'$code$', code)
        .replaceAll(r'site_AUT', 'site_$code');
    }
    return _indexhtml;
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
