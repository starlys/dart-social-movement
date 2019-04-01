import 'package:autzone_common/autzone_common.dart';
import '../lib/src/controller.dart';

///app entry point
main() async {
  print("starting autzone worker");

  //set up 
  ApiGlobals.configLoader.init(true);
  await Database.init();
  await Database.loadGlobals();
  
  //run
  Controller c = new Controller();
  await c.start();

  //clean up
  await Database.dispose();
  print("ending autzone worker");
}
