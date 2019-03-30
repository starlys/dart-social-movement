import 'dart:async';
import 'dart:io';
import 'config_settings.dart';

///wraps config file and watches for changes;
///note that this class prevents the app from ending
class ConfigLoader {
    String _configPath = 'config/config.yaml';
    DateTime _fileReadUtc;
    Timer _timer;

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
      List<String> segs = Platform.script.pathSegments;
      return '/' + segs.take(segs.length - 3).join('/'); //up 4 levels
    }

    ///load settings
    init(bool watchForChanges) {
      _load();

      //set up recurring action to check file date every 1 min and reload
      if (watchForChanges)
        _timer = new Timer.periodic(new Duration(minutes:1), _timerTick);
    }

    void _load() {
      _fileReadUtc = new DateTime.now().toUtc();
      settings = ConfigSettings(_configPath);
      _isDev = settings.dev == 'Y';
    }

    Future _timerTick(Timer t) async {
      File f = new File(_configPath);
      DateTime m = await f.lastModified();
      if (m.isAfter(_fileReadUtc)) _load();
    }

    ///stop this instance from watching for changes in the config file
    void stopWatching() {
      if (_timer != null) _timer.cancel();
    }
}
