import 'dart:async';
import 'package:test/test.dart';
import '../lib/src/date_lib.dart';

Future main() async {
  await DateLib.init();

  test('soon date formats', () {
    expect(DateLib.formatSoonDate(DateTime(2001, 12, 31)), equals('Dec 31'));
  });

  test('ago formats', () {
    expect(DateLib.ago(Duration(minutes: 4)), equals('4 minutes ago'));
    expect(DateLib.ago(Duration(minutes: 1)), equals('just now'));
    expect(DateLib.ago(Duration(days: 40)), equals('40 days ago'));
    expect(DateLib.ago(Duration(days: 80)), equals('2 months ago'));
    expect(DateLib.ago(Duration(days: 366*4)), equals('4 years ago'));
  });

  test('client pack formats', () {
    String packed = DateLib.packUtcDateEntry(DateTime.utc(2001, 3, 31, 8, 59, 4), null);
    expect(packed, equals('LDT:200103310859'));
    DateTime unpacked = DateLib.unpackConvertDateEntry(packed, null);
    expect(unpacked, equals(DateTime.utc(2001, 3, 31, 8, 59, 0)));
  });

}
