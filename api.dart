import 'dart:io' as io;
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'package:angel_static/angel_static.dart';
import 'package:angel_cors/angel_cors.dart';
import 'package:file/local.dart' as file;
import 'package:angel_container/mirrors.dart';
import 'server/api_globals.dart';
import 'server/pulse.dart';
import 'server/servant_controller.dart';
import 'server/config_loader.dart';
import 'server/linkback.dart';
import 'server/date_lib.dart';
import 'server/database.dart';
import 'server/image_lib.dart';

//app entry point
main() async {
  print("starting autzone API listener");

  //set up globals and other initializers
  ApiGlobals.configLoader.init();
  bool isDev = ApiGlobals.configLoader.isDev;
  await DateLib.init();
  ImageLib.init(ApiGlobals.configSettings);

  //write alive file (do early so supervisor doesn't try to run api twice)
  Pulse pulse = new Pulse();
  pulse.writeAliveFile(true);

  //init database (potentially slower)
  await Database.init();
  await Database.loadGlobals();

  //set up Angel
  var angelApp = new Angel(reflector: MirrorsReflector());
  AngelHttp angelHttp;
  int port;
  if (isDev) {
    angelHttp = AngelHttp(angelApp);
    print('developer mode, nonsecure');
    port = 8081;
  } else {
    final context = new io.SecurityContext();
    context.useCertificateChain('/etc/letsencrypt/live/www.autistic.zone/fullchain.pem');
    context.usePrivateKey('/etc/letsencrypt/live/www.autistic.zone/privkey.pem');
    String host = ApiGlobals.configSettings.domain;
    print('production mode - port 443 on host ${host}');
    angelHttp = AngelHttp.fromSecurityContext(angelApp, context);
    port = 443;
  }

  //add routes for diagnostics
  angelApp.fallback(cors());
  angelApp.get("/hello", (req, res) => "Hello, world!");

  //add routes for servant (the main api)
  await angelApp.configure(new ServantController().configureServer);

  //add routes for static files
  final fs = const file.LocalFileSystem();
  final publicDir = fs.directory(ConfigLoader.rootPath() + '/public_html');
  final vDirRoot = CachingVirtualDirectory(angelApp, fs, publicPath: '/', indexFileNames: ['App.html'], source: publicDir);
  angelApp.fallback(vDirRoot.handleRequest);
  final vDirChild = CachingVirtualDirectory(angelApp, fs, publicPath: '/static', source: publicDir);
  angelApp.fallback(vDirChild.handleRequest);

  //attach the link-back style requests to the router (these include any
  // methods not served in the RPC style, such as links sent by email)
  angelApp.get('/linkback/ValidateEmail', (req, resp) => Linkback.validateEmail(req, resp));

  //start listener
  final server = await angelHttp.startServer(null, port);
  print("Angel server listening at ${angelHttp.uri}");

  //start 30s pulse tasks and register app-ending code
  pulse.init(() async {
    await server.close(force: true);
    ApiGlobals.configLoader.stopWatching();

    //in testing, this method does end, but the dart process takes a couple more
    // minutes to actually end.
    //For now, really really force it
    io.sleep(new Duration(seconds: 5));
    io.exit(0);
  });
  pulse.start();

}
