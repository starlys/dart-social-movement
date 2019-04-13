import 'dart:math';
import "config_settings.dart";
import 'config_loader.dart';
import 'site_cache.dart';

///stores API globals
class ApiGlobals {
  ///each entry point (api, worker, tests, etc) has to instantiate this
  static ApiGlobals instance;

  ///config file settings
  ConfigLoader configLoader;
  ConfigSettings get configFileSettings => configLoader.settings;
  
  ///shortcut to configLoader.rootPath
  static String get rootPath => instance.configLoader.rootPath();

  //database settings
  SiteCache sites = SiteCache();
  
  //debugging
  Random random = new Random(new DateTime.now().millisecondsSinceEpoch);

  ApiGlobals({bool ise2eTesting = false}) {
    configLoader = ConfigLoader(ise2eTesting: ise2eTesting);
  }
}
