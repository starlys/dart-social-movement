//import 'dart:io' as io;
import 'dart:async';
import 'models/models.dart';
import 'worker/database.dart';
import 'worker/globals.dart';
import 'worker/mail_lib.dart';

///entry point for sending mail; this script sends all queued mail
/// and erases old sent mail
Future main() async {
  print("starting autzone sendmail");

  //set up globals
  await Globals.config.init();

  //run
  await Database.safely('sendmail', _sendAll, loggingFilePrefix: 'sendmail');
  //io.exit(0);
  Globals.config.stopWatching();
}

//process all emails
Future _sendAll(Connection db) async {
  //erase old ones
  DateTime old = WLib.utcNow().subtract(new Duration(days: 10));
  await db.execute('delete from tomail where sent_at is not null and sent_at<@d', {'d': old});

  //loop for 100 at a time
  while (true) {
    List<Row> tomailRows = await db.query('select * from tomail where sent_at is null limit 100').toList();
    if (tomailRows.length == 0) break;
    for (Row tomailRow in tomailRows) {
      await MailLib.send(Globals.config, tomailRow.recipient, tomailRow.subject, tomailRow.body);
      await db.execute('update tomail set sent_at=@d where id=${tomailRow.id}', {'d': WLib.utcNow()});
    }
  }
}
