import 'dart:async';
import 'dart:io';
import 'config.dart';
import 'api_globals.dart';
import 'misc_lib.dart';
import '../models/models.dart';
import 'logger.dart';

typedef Future WorkFunc(Connection db);

///basic database operations/library
class Database {
  static Pool _pool;
  static final int poolSize = 5;

  static Future init() async {
    //create connection pool (note min and max connections must be the same, since we initialize them all here)
    bool isDev = ApiGlobals.config.isDev;
    String connstring = ApiGlobals.configSettings.database.connection;
    if (isDev) connstring = ApiGlobals.configSettings.database.connection_dev;
    _pool = new Pool(connstring, minConnections: poolSize, maxConnections: poolSize);
    await _pool.start();

    //initialize the uuid-ossp extension for each connection; this hack exists
    // because the generate_uuid functions don't work through this driver
    // otherwise, even though they work when connecting through any other tool
    List<Connection> dbs = new List<Connection>();
    for (int i = 0; i < poolSize; ++i) {
      var db = await _pool.connect();
      await db.execute('create extension if not exists "uuid-ossp";');
      await db.execute('create extension if not exists "cube";');
      await db.execute('create extension if not exists "earthdistance";');
      dbs.add(db);
    }
    for (var db in dbs) db.close(); //documentation unclear: appears we close them each time to return them to the pool
  }

  ///load globals that never change
  static Future loadGlobals() async {
    await Database.safely('loadGlobals', null, (db) async {
      ApiGlobals.rootProjectId = await MiscLib.queryScalar(db, 'select id from project where kind=\'R\'');
    });
  }

  ///get a database connection
  static Future<dynamic> getConnection() async {
    return await _pool.connect();
  }

  ///wrap a database operation in a db connection and catch errors.
  /// If r is given puts error messages there.
  static Future safely(String taskDesc, APIResponseBase r, WorkFunc f) async {
    Connection db;
    String randomFileName = ApiGlobals.random.nextInt(100000).toString();
    try {
      await _writeDebugTaskFile(true, taskDesc, randomFileName);
      db = await getConnection();
      await f(db);
    }
    catch (ex) {
      if (r != null) {
        r.errorCode = "DB";
        r.errorMessage = ex.toString();
        if (r.errorMessage.startsWith('Exception:')) r.errorMessage = r.errorMessage.substring(11);
        r.ok = 'N';
      }
      print(ex);
      await Logger.logLimited('api', taskDesc + ', ' + ex.toString());
    }
    finally {
      db.close();
      await _writeDebugTaskFile(false, taskDesc, randomFileName);
    }
  }

  ///for debugging, write or delete an 'api_active' file
  /// containing the task name
  static Future _writeDebugTaskFile(bool starting, String taskDesc, String randomNamePart) async {
    try {
      File f = new File(Config.rootPath() + '/api_active' + randomNamePart + '.txt');
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

}
