import 'dart:async';
import 'dart:io';
import 'package:postgres/postgres.dart';
import 'config_loader.dart';
import 'api_globals.dart';
import 'misc_lib.dart';
import '../models/models.dart';
import 'logger.dart';

typedef Future WorkFunc(PostgreSQLConnection db);

///for use only in Database
class DatabasePoolItem {
  bool inUse;
  PostgreSQLConnection connection;
}

///return value for Database.safely
class DatabaseResult {
  String errorMessage;
  String errorCode;
  bool ok;
}

///database connections and pool
abstract class Database {
  static final int poolSize = 5;
  static final _pool = List<DatabasePoolItem>();
  static int lastUsedIndex = 0;
  static final waiters = List<Completer<DatabasePoolItem>>();

  ///open all connections in the pool
  static Future init() async {
    for (int i = 0; i < poolSize; ++i) {
      _pool.add(DatabasePoolItem() ..connection = await _createOne());
    }
  }

  ///create and open one database connection
  static Future<PostgreSQLConnection> _createOne() async {
    bool isDev = ApiGlobals.configLoader.isDev;
    final dbsettings = isDev ? ApiGlobals.configSettings.database :ApiGlobals.configSettings.database_dev;

    //open connections and
    //initialize the uuid-ossp extension for each connection; this hack exists
    // because the generate_uuid functions don't work through this driver
    // otherwise, even though they work when connecting through any other tool
    final db = PostgreSQLConnection(dbsettings.host, dbsettings.port, dbsettings.dbname,
        username: dbsettings.user, password: dbsettings.password);
    await db.open();
    await db.execute('create extension if not exists "uuid-ossp";');
    await db.execute('create extension if not exists "cube";');
    await db.execute('create extension if not exists "earthdistance";');
    return db;
  }

  ///find next available pool item, or null if they are all in use
  static DatabasePoolItem _findAvailable() {
    for (int nTries = 0; nTries < poolSize; ++nTries) {
      if (++lastUsedIndex >= poolSize) lastUsedIndex = 0;
      if (!_pool[lastUsedIndex].inUse) return _pool[lastUsedIndex];
    }
    return null;
  }

  ///get a pool item, immediately if possible, else waiting if necessary until one is released
  static Future<DatabasePoolItem> getFromPool() async {
    var poolItem = _findAvailable();
    if (poolItem != null) {
      poolItem.inUse = true;
      return poolItem;
    }

    final waiter = Completer<DatabasePoolItem>();
    waiters.add(waiter);
    return waiter.future;
  }

  ///release a pool item, either to the next waiting caller or back to the pool
  static void releaseToPool(DatabasePoolItem poolItem) {
    //if no one needs this now
    if (waiters.length == 0) {
      poolItem.inUse = false;
    } else { //someone needs it now
      final waiter = waiters[0];
      waiters.removeAt(0);
      waiter.complete(poolItem);
    }
  } 

  ///wrap a database operation in a db connection and catch errors.
  /// If r is given puts error messages there.
  static Future<DatabaseResult> safely(String taskDesc, WorkFunc f) async {
    final poolItem = await getFromPool();
    String randomFileName = ApiGlobals.random.nextInt(100000).toString();
    try {
      await _writeDebugTaskFile(true, taskDesc, randomFileName);
      await f(poolItem.connection);
      return DatabaseResult() ..ok = true;
    }
    catch (ex) {
      var ret = DatabaseResult() ..errorCode = 'DB' ..errorMessage = ex.toString() ..ok = false;
      if (ret.errorMessage.startsWith('Exception:')) ret.errorMessage = ret.errorMessage.substring(11);
      print(ex);
      await Logger.logLimited('api', taskDesc + ', ' + ex.toString());
      return ret;
    }
    finally {
      await _writeDebugTaskFile(false, taskDesc, randomFileName);
      releaseToPool(poolItem);
    }
  }

  ///for debugging, write or delete an 'api_active' file
  /// containing the task name
  static Future _writeDebugTaskFile(bool starting, String taskDesc, String randomNamePart) async {
    try {
      File f = new File(ConfigLoader.rootPath() + '/api_active' + randomNamePart + '.txt');
      if (starting) {
        await f.writeAsString(WLib.utcNow().toIso8601String() + ' ' + taskDesc);
        //sleep(new Duration(seconds:4)); //DEBUG to test this function only
      } else {
        f.deleteSync();
      }
    }
    catch (ex) {
    }
  }

  ///load globals that never change
  static Future loadGlobals() async {
    await Database.safely('loadGlobals', (db) async {
      ApiGlobals.rootProjectId = await MiscLib.queryScalar(db, 'select id from project where kind=\'R\'', null);
    });
  }
}
