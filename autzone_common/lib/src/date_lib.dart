import 'dart:async';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/standalone.dart';
import 'package:autzone_models/autzone_models.dart';

///misc helper functions for dates and timezones (server only)
class DateLib {
  static final DateFormat _soonDateFormat = new DateFormat.MMMd();
  static final DateFormat _dateFormat = new DateFormat.yMMMd();
  static final DateFormat _timeFormat = new DateFormat.Hm();

  ///init DateLib
  static Future init() async {
    //todo if working, remove explicit paths
    //String tzDataPath = 'data/2018i.tzf'; //tz lib assumes the main script is in the app root
    //String tzDataPath = 'packages/timezone/data/2015b.tzf'; //tz lib assumes the main script is in the app root
    await initializeTimeZone(); //local is UTC
  }

  ///get a date formatted like "Dec 31" (use for dates not more than a year in the future)
  static String formatSoonDate(DateTime d) {
    return _soonDateFormat.format(d);
  }

  ///get a date formatted like "1999 Dec 31 23:59" (but if tzName is null, return the UTC
  /// date only without timezone info; this is used for not logged in sessions)
  static String formatDateTime(DateTime dUtc, [String tzName = null]) {
    if (tzName == null) return _dateFormat.format(dUtc);
    DateTime formattable = utcToLocal(dUtc, tzName);
    return _dateFormat.format(formattable) +
        ' ' +
        _timeFormat.format(formattable);
  }

  ///convert a UTC datetime to local time
  static DateTime utcToLocal(DateTime dUtc, [String tzName = null]) {
    if (tzName == null) return dUtc;
    Location l = getLocation(tzName);
    TZDateTime dLocal = new TZDateTime.from(dUtc, l);
    return new DateTime(
        dLocal.year, dLocal.month, dLocal.day, dLocal.hour, dLocal.minute);
  }

  ///convert a local datetime to UTC
  static DateTime localToUtc(DateTime dLocal, [String tzName = null]) {
    if (tzName == null) return dLocal.toUtc(); //not sure this is right
    Location l = getLocation(tzName);
    TZDateTime dUtc = new TZDateTime(l, dLocal.year, dLocal.month, dLocal.day,
            dLocal.hour, dLocal.minute)
        .toUtc();
    return dUtc;
  }

  ///get all available time zone names
  static Iterable<String> allTimeZoneNames() {
    return timeZoneDatabase.locations.keys;
  }

  ///get a readable string like "2 days ago" or "10 minutes ago"
  static String ago(Duration d) {
    int min = d.inMinutes;
    if (min < 2) return 'just now';
    if (min < 60) return '${min} minutes ago';
    int hr = d.inHours;
    if (hr < 2) return '1 hour ago';
    if (hr < 24) return '${hr} hours ago';
    int day = d.inDays;
    if (day < 2) return '1 day ago';
    if (day < 65) return '${day} days ago';
    if (day < 30 * 24) return '${day ~/ 30} months ago';
    return '${day ~/ 365} years ago';
  }

  ///pack a UTC date by converting to local time then calling WLib.packDateEntry;
  /// this converts a database value to a value that can be edited in the client
  /// If tzName is null, it will assume UTC.
  static String packUtcDateEntry(DateTime dUtc, String tzName) {
    if (tzName == null)
      return WLib.packDateEntry(
          dUtc.year, dUtc.month, dUtc.day, dUtc.hour, dUtc.minute);
    Location l = getLocation(tzName);
    TZDateTime dLocal = new TZDateTime.from(dUtc, l);
    return WLib.packDateEntry(
        dLocal.year, dLocal.month, dLocal.day, dLocal.hour, dLocal.minute);
  }

  ///unpack a user date/time entry which was packed by WLib.packDateEntry, and convert
  /// from the user's time zone to UTC.
  /// If tzName is null, it will assume UTC.
  static DateTime unpackConvertDateEntry(String packed, String tzName) {
    //format is 'LDT:${yearS}${monthS}${dayS}${hourS}${minuteS}';
    if (!packed.startsWith('LDT:'))
      throw new Exception('packed date is not in the right format');
    int year = int.parse(packed.substring(4, 8)),
        month = int.parse(packed.substring(8, 10)),
        day = int.parse(packed.substring(10, 12)),
        hour = int.parse(packed.substring(12, 14)),
        minute = int.parse(packed.substring(14, 16));
    if (tzName != null) {
      Location l = getLocation(tzName);
      TZDateTime local = new TZDateTime(l, year, month, day, hour, minute);
      return local.toUtc();
    } else {
      //timezone not known, treat input as UTC
      return new DateTime.utc(year, month, day, hour, minute);
    }
  }
}
