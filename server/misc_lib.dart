import 'dart:async';
import 'package:crypto/crypto.dart' show sha256;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'twotier/wlib.dart';

///misc helper functions for API and worker
class MiscLib {

  ///get a xuser row using query.single for the given user id; includes nick, avatar_no only
  static Future<Row> userRowForAvatars(Connection db, int userId) async {
    return await db.query('select nick,avatar_no from xuser where id=${userId}').single;
  }

  ///query a scalar value; null if no rows found
  static Future<dynamic> queryScalar(Connection db, String sql, [dynamic values]) async {
    Row row = await querySingle(db, sql, values);
    if (row == null) return null;
    return row[0];

    //old implementation, unsure if this closes the stream immediately:
    /*await for (Row row in db.query(sql, values)) {
      return row[0];
    }
    return null;*/
  }

  ///query a single row; null if not found
  static Future<Row> querySingle(Connection db, String sql, [dynamic values]) async {
    Stream<Row> rows = db.query(sql, values);
    Row row = await rows.firstWhere((r) => true, defaultValue: () => null);
    return row;
  }

  ///version of querySingle with the added feature of throwing an exception
  /// if the row is null
  static Future<Row> querySingleChecked(Connection db, String sql, String messageIfNotFound, [dynamic values]) async {
    Row row = await querySingle(db, sql, values);
    if (row == null) throw new Exception(messageIfNotFound);
    return row;
  }

  ///queue up email to be sent by an occasional background process
  static Future queueEmail(Connection db, String recipient, String subject, String body) async {
    await db.execute('insert into tomail(recipient,subject,body)values(@r,@s,@b)',
      {'r': recipient, 's': subject, 'b': body});
  }

  ///notify the user of something. linkText is an optional name to hyperlink to,
  /// which links to linkKey (for example 'user/3')
  static Future notify(Connection db, int userId, String body,
    {String linkText:null, String linkKey:null}) async {
    await db.execute('insert into xuser_notify(id,xuser_id,body,link_text,link_key,emailed,created_at)values(uuid_generate_v4(),@uid,@body,@linktext,@linkkey,\'N\',@d)',
    {'uid': userId, 'body': body, 'linktext':linkText, 'linkkey':linkKey, 'd':WLib.utcNow()}
    );
  }

  ///get all project manager user Ids for a project
  static Future<List<int>> getProjectManagers(Connection db, int projectId) async {
    List<Row> managerRows = await db.query('select xuser_id from project_xuser where project_id=${projectId} and kind=\'M\'').toList();
    return managerRows.map((row) => row[0]).toList();
  }

  //get the password hash for the given raw password
  static String passwordHash(String s) {
    if (s == null) return '';
    List<int> pwBytes = sha256.convert(UTF8.encode(s)).bytes;
    String hashed = BASE64.encode(pwBytes);
    return hashed;
  }

  //get a Stream of UTF chars from a string
  static Stream<List<int>> stringToStream(String s) {
    return new Stream.fromIterable(UTF8.encode(s));
  }

  //Get distinct items based on a map function. The map should return a
  // simple type that is checked for equality.
  static List distinct(List i, Function map) {
    Set set = new Set();
    return i.where((e) {
      var key = map(e);
      bool isNew = !set.contains(key);
      if (isNew) set.add(key);
      return isNew;
    }).toList();
  }

  ///get a list of all non-deleted user ids
  static Future<List<int>> getAllUserIds(Connection db) async {
    List<int> userIds = new List<int>();
    await for (Row row in db.query('select id from xuser where status=\'A\''))
      userIds.add(row[0]);
    return userIds;
  }

  ///set xuser.last_activity, but for performance, skip if it has been set in the last 10 min
  static Future touchUser(Connection db, int userId) async {
    DateTime now = WLib.utcNow();
    DateTime recent = now.subtract(new Duration(minutes:10));
    await db.execute('update xuser set last_activity=@t2 where id=${userId} and last_activity<@t1',
      {'t1': recent, 't2': now});
  }

  ///get a binary file via http
  static Future<List<int>> httpGetBinary(String url) async {
    return await http.readBytes(url);
  }

}
