import 'dart:async';
import 'dart:io';
//import 'api_globals.dart';
import 'config.dart';

///handles trivial tasks in the API on a timer. For complex tasks, write the code in the
/// worker app instead.
class Pulse {
  Function _stopEvent;
  int _pulseCount = 0; //see _timerTick

  ///init; pass the function to call when the app should end
  void init(Function stopEvent){
    _stopEvent = stopEvent;
  }

  //start pulse tasks
  void start() {
    new Timer(new Duration(seconds:6), () => _timerTick());
  }

  Future _timerTick() async {
    //exit app if stop file exists
    File stopFile = new File(Config.rootPath() + '/stop.txt');
    if (await stopFile.exists()) {
      await writeAliveFile(false);
      _stopEvent();
      return; //see bug notes in api.dart about exiting the whole app
    }

    //write alive file every 30s
    if (_pulseCount++ > 5) {
      _pulseCount = 0;
      await writeAliveFile(true);
    }
    start();
  }

  ///write to api_alive.txt so the supervisor job can detect if this process is running
  Future writeAliveFile(bool makeExist) async {
    try {
      File f = new File(Config.rootPath() + '/api_alive.txt');
      if (makeExist){
        await f.writeAsString("!");
      } else {
        await f.delete();
      }
    }
    catch (ex) {
    }
  }
}
