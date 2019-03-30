import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:autzone_models/autzone_models.dart';
import 'package:autzone_common/autzone_common.dart';
import 'package:autzone_worker/autzone_worker.dart';

///entry point for sending mail; this script sends all queued mail
Future main() async {
  print("starting autzone sendmail");

  //set up 
  await ApiGlobals.configLoader.init(false);
  await Database.init();
  await Database.loadGlobals();

  //run
  await WDatabase.safely('sendmail', _sendAll, loggingFilePrefix: 'sendmail');

  //clean up
  await Database.dispose();
}

//process all emails
Future _sendAll(PostgreSQLConnection db) async {
  //erase old ones
  DateTime old = WLib.utcNow().subtract(new Duration(days: 10));
  await db.execute('delete from tomail where sent_at is not null and sent_at<@d', substitutionValues: {'d': old});

  //loop for 100 at a time
  while (true) {
    final tomailRows = await MiscLib.query(db, 'select * from tomail where sent_at is null limit 100', null);
    if (tomailRows.length == 0) break;
    for (final tomailRow in tomailRows) {
      await MailLib.send(ApiGlobals.configSettings, tomailRow['recipient'], tomailRow['subject'], tomailRow['body']);
      await db.execute('update tomail set sent_at=@d where id=${tomailRow['id']}', substitutionValues: {'d': WLib.utcNow()});
    }
  }
}
