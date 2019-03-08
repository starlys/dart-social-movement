import 'dart:io';
import 'dart:async';
import 'package:intl/intl.dart';
import 'config.dart';
import '../models/models.dart';

///error logger
class Logger{

  static DateTime _suppressUntilUtc = WLib.utc1970();

  //log a message to a file starting with namePrefix (whose name contains
  /// the date), but no more often than once per minute.
  /// Timing is based on all log files, not separate for each file.
  static Future logLimited(String namePrefix, String message) async {
    try {
      //if too often, skip
      DateTime d = WLib.utcNow();
      if (d.isBefore(_suppressUntilUtc)) return;
      _suppressUntilUtc = d.add(new Duration(minutes:1));

      //compose file name
      var nameFormatter = new DateFormat('y-MM-dd');
      String dateS = nameFormatter.format(d);
      var fullFormatter = new DateFormat('y-MM-dd hh-mm-ss');
      String dateTimeS = fullFormatter.format(d);
      String fullName = Config.rootPath() + '/' + namePrefix + dateS + '.txt';

      //write message
      File f = new File(fullName);
      IOSink wri = f.openWrite(mode:APPEND);
      wri.writeln(dateTimeS + ':' + message);
      await wri.close();
    }
    catch (ex) {}
  }
}
