import 'worker/globals.dart';
import 'worker/controller.dart';

//app entry point
main() async {
  print("starting autzone worker");

  //set up globals
  await Globals.config.init();
  //print(Globals.config.settings['sample']);

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
