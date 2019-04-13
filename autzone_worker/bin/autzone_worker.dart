import 'package:autzone_common/autzone_common.dart';
import '../lib/src/controller.dart';

///app entry point
main() async {
  print("starting autzone worker");

  //set up 
  ApiGlobals.instance = ApiGlobals();
  await Database.init();
  await ApiGlobals.instance.sites.allCodes(); //force load
  
  //run
  Controller c = new Controller();
  await c.start();

  //clean up
  await Database.dispose();
  print("ending autzone worker");
}
