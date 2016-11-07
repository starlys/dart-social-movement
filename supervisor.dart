import 'dart:io';
import 'dart:async';

//when mail should be sent
DateTime _nextMailUtc = utcNow();
Duration _mailInterval = new Duration(minutes:2);

///This is the supervisor script that should be started when the system boots.
/// It cooperates with the 'autzone' shell script to start/stop the services
Future main(List<String> args) async {
  log("starting autzone supervisor");
  //await endBoth();
  timerTick();
}

///get the root path for the apps (that is, the dir where pubspec.yaml lives)
/// return value does NOT have final slash
String rootPath() {
  List<String> segs = Platform.script.pathSegments;
  return '/' + segs.take(segs.length - 1).join('/'); //up 1 level
}

///end api and worker procs
Future endBoth() async {
  //tell procs to stop
  log("supervisor: initiating stop");
  await writeDebugTaskFile(true, 'endBoth');
  File f_stop = new File('stop.txt');
  await f_stop.writeAsString("!");

  //wait a while for them to stop
  DateTime waitUntil = utcNow().add(new Duration(seconds: 30));
  while (waitUntil.isAfter(utcNow())) {
    sleep(new Duration(seconds:3));
    File f_api = new File('api_alive.txt');
    File f_bg = new File('worker_alive.txt');
    bool stillRunning = (await f_api.exists()) || (await f_bg.exists());
    if (!stillRunning) break;
  }

  //in case they didn't respond to the stop request,
  // kill them
  log("supervisor: killing processes");
  Process.runSync(rootPath() + '/autzone.sh', ['kill'], workingDirectory: rootPath(), runInShell: true);
  try {await f_stop.delete(); }
  catch (ex) {}
  //on Exception { }

  try {
    File f_api = new File('api_alive.txt');
    await f_api.delete();
  }
  catch (ex) {}
  try {
    File f_bg = new File('worker_alive.txt');
    await f_bg.delete();
  }
  catch (ex) {}
  await writeDebugTaskFile(false, 'endBoth');
}

Future startBoth() async {
  await startApi();
  await startWorker();
}

Future startApi() async {
  log("supervisor: starting api");
  await writeDebugTaskFile(true, 'startApi');
  await Process.start('dart', ['api.dart'], mode: ProcessStartMode.DETACHED);
  await writeDebugTaskFile(false, 'startApi');
  sleep(new Duration(seconds: 2));
}

Future startWorker() async {
  log("supervisor: starting worker");
  await writeDebugTaskFile(true, 'startWorker');
  await Process.start('dart', ['worker.dart'], mode: ProcessStartMode.DETACHED);
  await writeDebugTaskFile(false, 'startWorker');
  sleep(new Duration(seconds: 2));
}

///call timerTick after 10s
void timerTickLater() {
  new Timer(new Duration(seconds: 10), () => timerTick());
}

///repeating function to check status of other processes
Future timerTick() async {
  try {
    //detect restart (as signaled from autzone script)
    File f_restart = new File('restart.txt');
    if (await f_restart.exists()) {
      log("supervisor: restart detected");
      await f_restart.delete();
      await endBoth();
      sleep(new Duration(seconds: 10));
    }

    //if restarting or either proc crashed, restart it
    bool apiAlive = await isRunning('api_alive.txt', 3);
    if (!apiAlive) await startApi();
    bool workerAlive = await isRunning('worker_alive.txt', 8);
    if (!workerAlive) await startWorker();

    //if it's time to send mail, run that process
    if (utcNow().isAfter(_nextMailUtc)) {
      await writeDebugTaskFile(true, 'sendmail');
      //log("supervisor: starting sendmail");
      Process.start('dart', [rootPath() + '/sendmail.dart'], workingDirectory: rootPath(), mode: ProcessStartMode.DETACHED);
      _nextMailUtc = utcNow().add(_mailInterval);
      await writeDebugTaskFile(false, 'sendmail');
    }

  } catch (ex) {}

  ///write to supervisor_alive.txt for debugging
  try {
    File f = new File(rootPath() + '/supervisor_alive.txt');
    await f.writeAsString("!");
  }
  catch (ex) {
  }

  timerTickLater();
}

///find out if either process is running based on its ...alive.txt file date
Future<bool> isRunning(String aliveFileName, int minutesOld) async {
  try {
    File f = new File(aliveFileName);
    bool exists = await f.exists();
    if (!exists) return false;
    DateTime lastMod = f.lastModifiedSync().toUtc(); //NOT SURE IF THIS IS OK FOR DAYLIGHT SAVINGS!! documentation mising
    DateTime aBitAgo = utcNow().subtract(new Duration(minutes: minutesOld));
    return lastMod.isAfter(aBitAgo);
  }
  catch (ex) {
    return false;
  }
}

///current time in UTC
DateTime utcNow() {
  return new DateTime.now().toUtc();
}

///print message to stdout with current time
void log(String message) {
  print('${utcNow().toIso8601String()}: ${message}');
}

///for debugging, write a 'supervisor_starting' or 'supervisor_finished' file
/// containing the task name
Future writeDebugTaskFile(bool starting, String taskDesc) async {
  try {
    String fname2 = starting ? 'starting' : 'finished';
    File f = new File(rootPath() + '/supervisor_' + fname2 + '.txt');
    await f.writeAsString(utcNow().toIso8601String() + ' ' + taskDesc);
  }
  catch (ex) {
  }
}
