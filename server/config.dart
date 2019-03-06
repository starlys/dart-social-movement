import 'dart:async';
import 'dart:io';

///wraps config file and watches for changes;
///note that this class prevents the app from ending
class Config {
    String _configPath = 'config/config.yaml';
    DateTime _fileReadUtc;
    Timer _timer;

    ///the settings; only available after init is finished
    Map settings;

    ///true when this is the development server (when config.yaml has dev:true)
    bool get isDev => _isDev;
    bool _isDev = false;

    Config() {
      _configPath = rootPath() + '/config/config.yaml';
    }

    ///get the root path for the apps (that is, the dir where pubspec.yaml lives)
    /// return value does NOT have final slash
    static String rootPath() {
      List<String> segs = Platform.script.pathSegments;
      return '/' + segs.take(segs.length - 1).join('/'); //up 1 level
    }

    ///load settings
    init() async {
      await _load();

      //set up recurring action to check file date every 1 min and reload
      _timer = new Timer.periodic(new Duration(minutes:1), _timerTick);
    }

    Future _load() async {
      _fileReadUtc=new DateTime.now().toUtc();
      settings = await loadConfig(_configPath);
      _isDev = settings['dev'] == 'Y';
    }

    Future _timerTick(Timer t) async {
      File f = new File(_configPath);
      DateTime m = await f.lastModified();
      if (m.isAfter(_fileReadUtc)) await _load();
    }

    ///stop this instance from watching for changes in the config file
    void stopWatching() {
      if (_timer != null) _timer.cancel();
    }
}
