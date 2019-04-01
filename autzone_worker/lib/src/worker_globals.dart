import 'dart:math';

///stores worker globals
class WorkerGlobals {

  //also note that worker and sendmail also use api_globals

  //timing
  static DateTime next30s = new DateTime(1970);
  static DateTime next1h = new DateTime(1970);
  static DateTime next24h = new DateTime(1970);
  static DateTime next1week = new DateTime(1970);

  //debugging
  static Random random = new Random(new DateTime.now().millisecondsSinceEpoch);
  static String logFileSuffix = (random.nextInt(9000) + 999).toString() + '.txt'; //such as '1234.txt'

  //other
  static bool isSiteSmall = false; //true when activity is low (causes spam checks to be relaxed)
}
