import 'dart:async';
import 'dart:io';
import 'globals.dart';
import 'database.dart';
import '../models/models.dart';
import '../server/config_settings.dart';
import '../server/config_loader.dart';
import '../server/logger.dart';

///controls access to all the worker tasks on a timer
class Controller {

  //start all tasks
  Future start() async {
    Duration aSecond = new Duration(seconds:1);
    await writeAliveFile(true);

    //infinite loop
    while (true) {
      //exit if stop file exists
      File stopFile = new File(ConfigLoader.rootPath() + '/stop.txt');
      if (await stopFile.exists()) {
        Globals.configLoader.stopWatching();
        await writeAliveFile(false);
        return;
      }

      await _timerTick();
      sleep(aSecond);
    }
  }

  ///do tasks scheduled for right now
  Future _timerTick() async {
    DateTime now = WLib.utcNow();
    if (now.isAfter(Globals.next30s)) {
      await writeAliveFile(true);
      await Database.safely('findUnreads', Database.findUnreads);
      Globals.next30s = WLib.utcNow().add(new Duration(seconds:30));
    } else if (now.isAfter(Globals.next1h)) {
      await Database.safely('timeoutProposals', Database.timeoutProposals);
      await Database.safely('calcReactions', Database.recalcReactions);
      await Database.safely('countResourceVotes', Database.countResourceVotes);
      await Database.safely('recommendConversations', Database.recommendConversations);
      Globals.next1h = WLib.utcNow().add(new Duration(hours:1));
    } else if (now.isAfter(Globals.next24h)) {
      await Database.safely('dailyDelete', Database.dailyDelete);
      await Database.safely('assignProjectLeadership', Database.assignProjectLeadership);
      await Database.safely('closeConversations', Database.closeConversations);
      await Database.safely('hideResources', Database.hideResources);
      await Database.safely('emailNotifications', Database.emailNotifications);
      await Database.safely('countProjectImportance', Database.countProjectImportance);
      Globals.next24h = WLib.utcNow().add(new Duration(days:1));
    } else if (now.isAfter(Globals.next1week)) {
      await Database.safely('weeklyDelete', Database.weeklyDelete);
      await Database.safely('assignSiteLeadership', Database.assignSiteLeadership);
      Globals.next1week = WLib.utcNow().add(new Duration(days:7));
    }
  }

  ///write to worker_alive.txt so the supervisor can detect if this process is running
  Future writeAliveFile(bool makeExist) async {
    try {
      File f = new File(Config.rootPath() + '/worker_alive.txt');
      if (makeExist){
        await f.writeAsString("!");
      } else {
        await f.delete();
      }
    }
    catch (ex) {
      await Logger.logLimited('worker_debug_', 'could not write to worker_alive, ' + ex.toString());
    }

    //for debugging also write *alive file with unique name for this process
    try {
      File f = new File(Config.rootPath() + '/worker_alive' + Globals.logFileSuffix);
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
