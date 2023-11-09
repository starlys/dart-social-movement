import 'package:postgres/postgres.dart';

///scratchpad/tests
main() async {
  //stdin.readLineSync();
  print('starting test');
  final db = PostgreSQLConnection('notifyplex.c2syiwxnbfcy.us-west-2.rds.amazonaws.com', 5432, 'autzone', username: 'starlys', password: 'PW HERE');
  print('opening db');
  await db.open();
  print('done');
}
