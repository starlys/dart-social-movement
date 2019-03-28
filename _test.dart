//import 'worker/mail_lib.dart';
//import 'dart:async';
import 'dart:io';
import 'dart:convert';
//import 'worker/worker_globals.dart';
//import 'server/twotier/wlib.dart';
//import 'server/config.dart';
import 'models/models.dart';

//scratchpad/tests
main() async {
  //await Globals.configLoader.init();

  //send mail
  //String err = await MailLib.send(Globals.configSettings, 'starluciaford@gmail.com', 'test email from Abq ', 'this is a test');
  //print(err);

  //test infinite loop for mem leak
  //pulse();

  //Globals.configLoader.stopWatching();




 
  final req = APIRequestBase(nick: 'indira', password: '12345');
  final requestMap = APIRequestBaseSerializer.toMap(req);
  final requestJson = json.encode(requestMap);
  HttpClient().post('localhost', 8081, 'servant/v2/Authenticate')
    .then((HttpClientRequest r) async { 
      r.headers.contentType = ContentType.json;
      r.write(requestJson);
      return r.close(); 
    })
    .then((HttpClientResponse resp) async {
      resp.transform(Utf8Decoder()).listen(print);
  });
  //final authResponse = AuthenticateResponseSerializer.fromMap(responseMap);
  //print(authResponse.publicName);
}




