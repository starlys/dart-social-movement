import 'dart:io';
import 'server/api_globals.dart';
import 'server/pulse.dart';
import 'server/servant.dart';
import 'server/linkback.dart';
import 'server/authenticator.dart';
import 'server/date_lib.dart';
import 'server/database.dart';
import 'server/image_lib.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'package:angel_static/angel_static.dart';
import 'package:file/local.dart';

//app entry point
main() async {
  print("starting autzone API listener");

  //set up globals and other initializers
  ApiGlobals.configLoader.init();
  bool isDev = ApiGlobals.configLoader.isDev;
  await Authenticator.init();
  await DateLib.init();
  ImageLib.init(ApiGlobals.configSettings);

  //write alive file (do early so supervisor doesn't try to run api twice)
  Pulse pulse = new Pulse();
  pulse.writeAliveFile(true);

  //init database (potentially slower)
  await Database.init();
  await Database.loadGlobals();

  //set up Angel
  var angelApp = new Angel();
  AngelHttp angelHttp;
  if (isDev) {
    http = AngelHttp(angelApp);
    print('developer mode, nonsecure');
  } else {
    SecurityContext context = new SecurityContext();
    context.useCertificateChain('/etc/letsencrypt/live/www.autistic.zone/fullchain.pem');
    context.usePrivateKey('/etc/letsencrypt/live/www.autistic.zone/privkey.pem');
    String host = ApiGlobals.configSettings.domain;
    print('production mode - port 443 on host ${host}');
    http = AngelHttp.fromSecurityContext(angelApp, context)
  }

  //add routes for diagnostics
  angelApp.get("/hello", (req, res) => "Hello, world!");

  //add routes for servant (the main api)
  await angelApp.configure(new Servant().configureServer);
  //alternately?: await angelApp.mountController<Servant>();

  //add routes for static files
  final fs = const LocalFileSystem();
  final publicDir = Directory(ApiGlobals.configLoader.appPath() + '/public_html');
  final vDirRoot = CachingVirtualDirectory(angelApp, fs, publicPath: '/', indexFileNames: ['App.html'], source: publicDir);
  angelApp.configure(vDirRoot);
  final vDirChild = CachingVirtualDirectory(angelApp, fs, publicPath: '/static', source: publicDir);
  angelApp.configure(vDirChild);

  //attach the link-back style requests to the router (these include any
  // methods not served in the RPC style, such as links sent by email)
  angelApp.get('/linkback/ValidateEmail', (RequestContext req) => Linkback.validateEmail(req));

  //start listener
  HttpServer server = await http.startServer();
  print("Angel server listening at ${http.uri}");

  //start 30s pulse tasks and register app-ending code
  pulse.init(() async {
    await server.close(force: true);
    ApiGlobals.config.stopWatching();

    //in testing, this method does end, but the dart process takes a couple more
    // minutes to actually end.
    //For now, really really force it
    sleep(new Duration(seconds: 5));
    exit(0);
  });
  pulse.start();

}
