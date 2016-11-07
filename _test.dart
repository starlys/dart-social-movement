import 'worker/mail_lib.dart';
import 'dart:async';
import 'dart:io';
import 'worker/globals.dart';
//import 'server/twotier/wlib.dart';
//import 'server/config.dart';

//scratchpad/tests
main() async {
  await Globals.config.init();

  //send mail
  String err = await MailLib.send(Globals.config, 'starluciaford@gmail.com', 'test email from Abq ', 'this is a test');
  print(err);

  //test infinite loop for mem leak
  //pulse();

  Globals.config.stopWatching();
}

//supervisor fast testing - no leaks
Future pulse() async {
  while (true) {
    //new Timer.periodic(duration, callback)
    sleep(new Duration(milliseconds: 1));
    try {
      //detect restart (as signaled from autzone script)
      File f_restart = new File('restart.txt');
      if (await f_restart.exists()) {
        sleep(new Duration(seconds: 10));
        print('found restart.txt');
      }
    } catch (ex) {
      print('failed: ' + ex.toString());
    }
  }
}
