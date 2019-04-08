//import 'worker/mail_lib.dart';
//import 'dart:async';
import 'dart:io';
//import 'dart:convert';
//import 'worker/worker_globals.dart';
//import 'server/twotier/wlib.dart';
//import 'server/config.dart';
//import 'autzone_models/lib/autzone_models.dart';

///scratchpad/tests
main() async {
  final process = await Process.start('open', ['-a', 'calculator'], 
  //final process = await Process.start('open', ['-a', 'calculator'], 
  //final process = await Process.start('dart', ['/Users/star/autzone/autzone_sendmail/bin/autzone_sendmail.dart'], 
    workingDirectory: '/Users/star/temp'); //, mode: ProcessStartMode.normal);
  
  print('exitCode=${process.exitCode}');
  //if (process.exitCode != null) {
    //process.exitCode.then((code) { 
      //print('process ended');
    //}); 
  //}
  //final mailProcess = await Process.start('dart', ['autzone_sendmail/bin/autzone_sendmail.dart.snapshot'], workingDirectory: '/Users/star/autzone', mode: ProcessStartMode.detached);
  //mailProcess.exitCode.then((code) { }); //experiment: if we check the exit code when the process ends, then it won't keep defunct entries in the process table

  //await Globals.configLoader.init();
  //send mail
  //String err = await MailLib.send(Globals.configSettings, 'starluciaford@gmail.com', 'test email from Abq ', 'this is a test');
  //print(err);
  //print('hey, using lots of memory');
  stdin.readLineSync();
}




