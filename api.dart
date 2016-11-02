//import 'dart:async';
import 'dart:io';
import 'package:rpc/rpc.dart';
import 'package:route/server.dart';
import 'server/api_globals.dart';
import 'server/pulse.dart';
import 'server/servant.dart';
import 'server/linkback.dart';
import 'server/authenticator.dart';
import 'server/date_lib.dart';
import 'server/database.dart';
import 'server/image_lib.dart';

//app entry point
main() async {
  print("starting autzone API listener");

  //set up globals and other initializers
  await ApiGlobals.config.init();
  bool isDev = ApiGlobals.config.isDev;
  await Authenticator.init();
  await DateLib.init();
  ImageLib.init(ApiGlobals.config);

  //write alive file (do early so supervisor doesn't try to run api twice)
  Pulse pulse = new Pulse();
  pulse.writeAliveFile(true);

  //init database (potentially slower)
  await Database.init();
  await Database.loadGlobals();

  //start listener
  HttpServer server;
  if (isDev) {
    print('developer mode - port 8083, nonsecure');
    server = await HttpServer.bind(InternetAddress.ANY_IP_V4, 8083); //for development only
  } else {
    //String password = new File('/var/www/cert/pwdfile').readAsStringSync().trim();
    SecurityContext context = new SecurityContext();
    //SecurityContext context = SecurityContext.defaultContext;
    context.useCertificateChain('/etc/letsencrypt/live/www.autistic.zone/fullchain.pem');
    context.usePrivateKey('/etc/letsencrypt/live/www.autistic.zone/privkey.pem');
    //context.setTrustedCertificates('/var/www/cert/autzone.pem', password: password);
    //context.setTrustedCertificates('/etc/letsencrypt/live/www.autistic.zone/fullchain.pem');
    String host = ApiGlobals.config.settings['domain'];
    print('production mode - port 443 on host ${host}');
    //List<InternetAddress> ips = await InternetAddress.lookup(host);
    //if (ips.length == 0)       print('cannot resolve {$host}');
    server = await HttpServer.bindSecure(InternetAddress.ANY_IP_V6, 443, context); //production with certificate, running as root
  }

  //start rpc server with a router (so we can listen for multiple things)
  Router router = new Router(server);
  //router.serve(r'/servant/').listen(rpc.httpRequestHandler); //could not get this pattern matching to work
  ApiServer rpc = new ApiServer();
  rpc.addApi(new Servant());
  router.defaultStream.listen(rpc.httpRequestHandler);

  //attache the link-back style requests to the router (these include any
  // methods not served in the RPC style, such as links sent by email)
  router.serve(r'/linkback/ValidateEmail').listen(Linkback.validateEmail);

  //start 30s pulse tasks and register app-ending code
  pulse.init(() async {
    await server.close(force: true);
    ApiGlobals.config.stopWatching();

    //in testing, this method does end, but the dart process takes a couple more
    // minutes to actually end. This could be the server listener??
    //For now, really really force it
    sleep(new Duration(seconds: 5));
    exit(0);
  });
  pulse.start();

}
