import 'dart:io';
import 'config_settings.dart';

///wraps config file
class ConfigLoader {
  String _configPath;
  final bool ise2eTesting;
  String _rootPath;

  ///the settings; only available after init is finished
  ConfigSettings settings;

  ///true when this is the development server (when config.yaml has dev:true)
  bool get isDev => _isDev;
  bool _isDev = false;

  ConfigLoader({bool this.ise2eTesting = false}) {
    _configPath = rootPath() + '/config/config.yaml';
    settings = ConfigSettings(_configPath);
    _isDev = settings.dev == 'Y';
  }

  ///get the root path for the apps (that is, the dir containing all the packages)
  /// return value does NOT have final slash
  String rootPath() {
    if (_rootPath == null) {
      final segs = Platform.script.pathSegments;
      final leadingChar = Platform.isWindows ? '' : '/';
      _rootPath =
          leadingChar + segs.take(segs.length - 3).join('/'); //up 3 levels
      if (ise2eTesting)
        _rootPath = '/' + segs.take(segs.length - 2).join('/'); //up 2 levels
    }
    return _rootPath;
  }
}
