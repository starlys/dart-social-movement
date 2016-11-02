import 'dart:math';
import "config.dart";

///stores API globals
class ApiGlobals {

  ///config file settings
  static Config config = new Config();

  ///the project.id for the single row with kind=R (parent of root documents)
  static int rootProjectId = 0;

  //debugging
  static Random random = new Random(new DateTime.now().millisecondsSinceEpoch);
  //static String logFileSuffix = (random.nextInt(9000) + 999).toString() + '.txt'; //such as '1234.txt'
}
