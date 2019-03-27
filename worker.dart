import 'server/api_globals.dart';
import 'worker/controller.dart';
import 'server/database.dart';

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
