//import 'worker/mail_lib.dart';
//import 'dart:async';
//import 'dart:io';
import 'worker/globals.dart';
//import 'server/twotier/wlib.dart';
//import 'server/config.dart';

//scratchpad/tests
main() async {
  await Globals.configLoader.init();

  //send mail
  //String err = await MailLib.send(Globals.configSettings, 'starluciaford@gmail.com', 'test email from Abq ', 'this is a test');
  //print(err);

  //test infinite loop for mem leak
  //pulse();

  Globals.configLoader.stopWatching();
}


