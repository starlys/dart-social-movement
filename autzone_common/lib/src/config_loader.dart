import 'dart:io';
import 'config_settings.dart';

///wraps config file 
class ConfigLoader {
    String _configPath = 'config/config.yaml';
    static String _rootPath;

    ///the settings; only available after init is finished
    ConfigSettings settings;

    ///true when this is the development server (when config.yaml has dev:true)
    bool get isDev => _isDev;
    bool _isDev = false;

    ConfigLoader() {
      _configPath = rootPath() + '/config/config.yaml';
    }

    ///get the root path for the apps (that is, the dir containing all the packages)
    /// return value does NOT have final slash
    static String rootPath() {
      if (_rootPath == null) {
        final segs = Platform.script.pathSegments;
        _rootPath = '/' + segs.take(segs.length - 3).join('/'); //up 4 levels
      }
      return _rootPath;
    }

    ///load settings
    init() {
      settings = ConfigSettings(_configPath);
      _isDev = settings.dev == 'Y';
    }
}
