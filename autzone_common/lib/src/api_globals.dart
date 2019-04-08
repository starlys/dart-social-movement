import 'dart:math';
import "config_settings.dart";
import 'config_loader.dart';
import 'site_cache.dart';

///stores API globals
class ApiGlobals {

  ///config file settings
  static ConfigLoader configLoader = new ConfigLoader();
  static ConfigSettings get configFileSettings => configLoader.settings;

  //database settings
  static SiteCache sites = SiteCache();
  
  //debugging
  static Random random = new Random(new DateTime.now().millisecondsSinceEpoch);
}
