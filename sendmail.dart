import 'dart:async';
import 'package:postgres/postgres.dart';
import 'models/models.dart';
import 'worker/wdatabase.dart';
import 'worker/globals.dart';
import 'worker/mail_lib.dart';
import 'server/misc_lib.dart';

///entry point for sending mail; this script sends all queued mail
/// and erases old sent mail
Future main() async {
  print("starting autzone sendmail");

  //set up globals
  await Globals.configLoader.init();

  //run
  await WDatabase.safely('sendmail', _sendAll, loggingFilePrefix: 'sendmail');
  //io.exit(0);
  Globals.configLoader.stopWatching();
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
      await MailLib.send(Globals.configSettings, tomailRow['recipient'], tomailRow['subject'], tomailRow['body']);
      await db.execute('update tomail set sent_at=@d where id=${tomailRow['id']}', substitutionValues: {'d': WLib.utcNow()});
    }
  }
}
