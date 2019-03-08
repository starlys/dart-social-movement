import 'dart:async';
import 'package:crypto/crypto.dart' show sha256;
import 'package:postgres/postgres.dart'; 
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

///misc helper functions for API and worker
class MiscLib {

  /// given a complex row as returned by the postgres package, simplify the structure so there are no table names
  /// and the result is just column-name:value pairs
  static Map<String, dynamic> reduceRowWithTableNames(Map<String, Map<String, dynamic>> row) {
    final ret = Map<String, dynamic>();
    for (var tableMap in row.values) ret.addAll(tableMap);
    return ret;
  }

  ///query a single row; null if not found or a map of column-name:values
  static Future<Map<String, dynamic>> queryRow(PostgreSQLConnection db, String sql, Map<String, dynamic> substitutionValues) async {
    final rows = await db.mappedResultsQuery(sql, substitutionValues: substitutionValues);
    if (rows == null || rows.length == 0) return null;
    return reduceRowWithTableNames(rows[0]);
  }

  ///version of queryRow with the added feature of throwing an exception
  /// if the row is null
  static Future<Map<String, dynamic>> queryRowChecked(PostgreSQLConnection db, String sql, String messageIfNotFound, Map<String, dynamic> substitutionValues) async {
    final row = await queryRow(db, sql, substitutionValues);
    if (row == null) throw new Exception(messageIfNotFound);
    return row;
  }

  ///query multiple rows; guaranteed list of map of column-name:values
  static Future<List<Map<String, dynamic>>> query(PostgreSQLConnection db, String sql, Map<String, dynamic> substitutionValues) async {
    var ret = List<Map<String, dynamic>>();
    final rows = await db.mappedResultsQuery(sql, substitutionValues: substitutionValues);
    if (rows == null || rows.length == 0) return ret;
    for (var row in rows) ret.add(reduceRowWithTableNames(row));
    return ret;
  }

  ///get a xuser row for the given user id; includes nick, avatar_no only
  static Future<Map<String, dynamic>> userRowForAvatars(PostgreSQLConnection db, int userId) {
    return queryRow(db, 'select nick,avatar_no from xuser where id=${userId}', null);
  }

  ///query a scalar value; null if no rows found
  static Future<dynamic> queryScalar(PostgreSQLConnection db, String sql, Map<String, dynamic> substitutionValues) async {
    final row = await queryRow(db, sql, substitutionValues);
    if (row == null) return null;
    final colName = row.keys.first;
    return row[colName];
  }

  ///queue up email to be sent by an occasional background process
  static Future queueEmail(PostgreSQLConnection db, String recipient, String subject, String body) async {
    await db.query('insert into tomail(recipient,subject,body)values(@r,@s,@b)', substitutionValues:
      {'r': recipient, 's': subject, 'b': body});
  }

  ///notify the user of something. linkText is an optional name to hyperlink to,
  /// which links to linkKey (for example 'user/3')
  static Future notify(PostgreSQLConnection db, int userId, String body,
    {String linkText:null, String linkKey:null}) async {
    await db.query('insert into xuser_notify(id,xuser_id,body,link_text,link_key,emailed,created_at)values(uuid_generate_v4(),@uid,@body,@linktext,@linkkey,\'N\',@d)',
      substitutionValues: {'uid': userId, 'body': body, 'linktext':linkText, 'linkkey':linkKey, 'd':WLib.utcNow()}
    );
  }

  ///get all project manager user Ids for a project
  static Future<List<int>> getProjectManagers(PostgreSQLConnection db, int projectId) async {
    var managerRows = await query(db, 'select xuser_id from project_xuser where project_id=${projectId} and kind=\'M\'', null);
    return managerRows.map((row) => row['xuser_id']).toList();
  }

  //get the password hash for the given raw password
  static String passwordHash(String s) {
    if (s == null) return '';
    List<int> pwBytes = sha256.convert(utf8.encode(s)).bytes;
    String hashed = base64.encode(pwBytes);
    return hashed;
  }

  //Get distinct items based on a map function. The map should return a
  // simple type that is checked for equality.
  static List distinct(List i, Function map) {
    final set = new Set();
    return i.where((e) {
      var key = map(e);
      bool isNew = !set.contains(key);
      if (isNew) set.add(key);
      return isNew;
    }).toList();
  }

  ///get a list of all non-deleted user ids
  static Future<List<int>> getAllUserIds(PostgreSQLConnection db) async {
    final userIds = new List<int>();
    final rows = await query(db, 'select id from xuser where status=\'A\'', null);
    for (final row in rows) userIds.add(row['id']);
    return userIds;
  }

  ///set xuser.last_activity, but for performance, skip if it has been set in the last 10 min
  static Future touchUser(PostgreSQLConnection db, int userId) async {
    DateTime now = WLib.utcNow();
    DateTime recent = now.subtract(new Duration(minutes:10));
    await db.query('update xuser set last_activity=@t2 where id=${userId} and last_activity<@t1',
      substitutionValues: {'t1': recent, 't2': now});
  }

  ///get a binary file via http
  static Future<List<int>> httpGetBinary(String url) async {
    return await http.readBytes(url);
  }

}
