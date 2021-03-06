import 'dart:io' as io;
import 'package:http_parser/http_parser.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'package:angel_static/angel_static.dart';
import 'package:angel_cors/angel_cors.dart';
import 'package:autzone_common/autzone_common.dart';
import 'package:file/local.dart' as file;
import 'package:angel_container/mirrors.dart';
import '../lib/src/pulse.dart';
import '../lib/src/servant_controller.dart';
import '../lib/src/linkback.dart';

//app entry point
main() async {
  print("starting autzone API listener");

  //set up non-database globals and other initializers
  ApiGlobals.instance = ApiGlobals();
  bool isDev = ApiGlobals.instance.configLoader.isDev;
  await DateLib.init();
  ImageLib.init(ApiGlobals.instance.configFileSettings);

  //write alive file (do early so supervisor doesn't try to run api twice)
  Pulse pulse = new Pulse();
  pulse.writeAliveFile(true);

  //init database and load settings from database (potentially slower)
  await Database.init();
  await ApiGlobals.instance.sites.allCodes(); //forces load

  //set up Angel
  var angelApp = new Angel(reflector: MirrorsReflector());
  AngelHttp angelHttp;
  int port;
  if (isDev) {
    angelHttp = AngelHttp(angelApp);
    print('developer mode, nonsecure');
    port = 8081;
  } else {
    //commented out for linux install with SSL
    // final context = new io.SecurityContext();
    // context.useCertificateChain('/etc/letsencrypt/live/www.autistic.zone/fullchain.pem');
    // context.usePrivateKey('/etc/letsencrypt/live/www.autistic.zone/privkey.pem');
    // print('production mode - port 443');
    // angelHttp = AngelHttp.fromSecurityContext(angelApp, context);
    // port = 443;
    angelHttp = AngelHttp(angelApp);
    print('live mode, nonsecure - for use behind proxy');
    port = 8081;
  }

  //set up error handling
  if (isDev) {
    var oldErrorHandler = angelApp.errorHandler;
    angelApp.errorHandler = (e, req, res) {
      print(e.error);
      //final fs = const file.LocalFileSystem();
      //fs.file('c:\\temp\\autzone2.log').writeAsString(req.uri.toString() + '\r\n' + e.error);
      return oldErrorHandler(e, req, res);
    };
  }

  //add routes for diagnostics/dev-mode
  if (isDev) angelApp.fallback(cors());
  angelApp.get("/hello", (req, res) => "Hello, world!");

  //add routes for servant (the main api)
  await angelApp.configure(new ServantController().configureServer);

  //add routes for static files
  final fs = const file.LocalFileSystem();
  final publicDir = fs.directory(ApiGlobals.rootPath + '/public_html');
  final vDirRoot = CachingVirtualDirectory(angelApp, fs, source: publicDir);
  angelApp.get('images/*', vDirRoot.handleRequest);
  angelApp.get('js/*', vDirRoot.handleRequest);
  angelApp.get('styles/*', vDirRoot.handleRequest);
  angelApp.get('site_*/*', vDirRoot.handleRequest);
  angelApp.get('/main.dart.js', vDirRoot.handleRequest);

  //add route for index.html with substitutions
  angelApp.get('/', (req, resp) async {
    SiteRecord config;
    try {
      config = await ApiGlobals.instance.sites.byDomain(req.hostname, false);
    } catch (e) {}
    if (config == null) config = ApiGlobals.instance.sites.byCode('AUT'); //dev mode default
    resp.contentType = MediaType('text', 'html');
    resp.write(config.indexHtml);
    resp.close();
  });

  //attach the link-back style requests to the router (these include any
  // methods not served in the RPC style, such as links sent by email)
  angelApp.get('/linkback/ValidateEmail', (req, resp) => Linkback.validateEmail(req, resp));

  //start listener
  final server = await angelHttp.startServer('0.0.0.0', port);
  print("Angel server listening at ${angelHttp.uri}");

  //start redirector on port 80 to force main page to be secure
  //Commented out for windows since we're now behind a proxy server;
  //if re-activating this, also see line:  nonSucureRedirectServer.close(force: true);
  // io.HttpServer nonSucureRedirectServer;
  // if (!isDev) {
  //   final angelNonsecureRedirector = Angel();
  //   angelNonsecureRedirector.get('/.well-known/acme-challenge/*', vDirRoot.handleRequest); //this is for certbot
  //   angelNonsecureRedirector.fallback((req, resp) async {
  //     if (req.path.contains('.well-known')) return; //this prevents the certbot call from being redirected
  //     try {
  //       final config = await ApiGlobals.instance.sites.byDomain(req.hostname, true);
  //       resp.redirect(config.homeUrl);
  //     } catch (e) {
  //       resp.write('Cannot find domain requested: ${req.hostname}');
  //       resp.close();
  //     }
  //   });
  //   final nonsecureHttp = AngelHttp(angelNonsecureRedirector);
  //   nonSucureRedirectServer = await nonsecureHttp.startServer('0.0.0.0', 80);
  // }

  //start 30s pulse tasks and register app-ending code
  pulse.init(() async {
    await server.close(force: true);
    //await nonSucureRedirectServer.close(force: true);
    await Database.dispose();

    //in testing, this method does end, but the dart process takes a couple more
    // minutes to actually end.
    //For now, really really force it
    io.sleep(new Duration(seconds: 5));
    io.exit(0);
  });
  pulse.start();
}
