import 'worker/globals.dart';
import 'worker/controller.dart';

//app entry point
main() {
  print("starting autzone worker");

  //set up globals
  Globals.configLoader.init();

  Controller c = new Controller();
  c.start();


 //  runZoned(() async {
 //   try {
 //     Controller c = new Controller();
 //     c.start();
 //   } catch (e) {
 //     print("caught");
 //   }
 // }, onError: (e, s) {
 //   print("uncaught");
 // });

}
