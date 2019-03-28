import 'dart:math';
import "config_settings.dart";
import 'config_loader.dart';

///stores API globals
class ApiGlobals {

  ///config file settings
  static ConfigLoader configLoader = new ConfigLoader();
  static ConfigSettings get configSettings => configLoader.settings;

  ///the project.id for the single row with kind=R (parent of root documents)
  static int rootProjectId = 0;

  //debugging
  static Random random = new Random(new DateTime.now().millisecondsSinceEpoch);
}
