part of models;

///very general functions shared by all tiers (cannot rely on html,
/// database, etc)
class WLib {

  ///test s for password complexity rules (s may be null); returns null if ok
  /// or the error message
  static String passwordComplexityError(String s) {
    s = s ?? '';
    if (s.length < 5) return 'Password must be 5 or more characters.';
    return null;
  }

  ///test s for nick-name rules (s may be null); returns null if ok
  /// or the error message
  static String nickValidationError(String s) {
    if (s == null || s.length < 5) return 'Nickname must be at least 5 characters';
    RegExp pat = new RegExp(r'^[0-9A-Za-z\-]*$');
    if (!pat.hasMatch(s)) return 'Nicknames can only include letters, digits, and hyphens';
    return null;
  }

  ///current time in UTC
  static DateTime utcNow() {
    return new DateTime.now().toUtc();
  }

  ///an early time in 1970 to use for all "before everything" calculations
  static DateTime utc1970() {
    return new DateTime(1970).toUtc();
  }

  ///convert a UTC DateTime to wire string format;
  /// null input results in null output
  static String dateTimeToWire(DateTime d) {
    if (d == null) return null;
    if (d.timeZoneOffset.inMilliseconds != 0) throw new Exception('Only UTC times can be converted to wire format');
    //if (d.second == 0) throw new Exception('DEBUG 2');
    return d.toIso8601String();
  }

  ///convert wire string (as created by dateTimeToWire) back into a DateTime in UTC;
  /// null input results in null output
  static DateTime wireToDateTime(String s){
    if (s == null) return null;
    DateTime d = DateTime.parse(s);
    //if (d.second == 0) throw new Exception('DEBUG 1');
    return d;
  }

  ///convert a local user-entered date and time (accurate to the minute), to a
  /// string format, ignoring time zone. Also see DateLib.unpackUtcDateEntry, packUtcDateEntry
  static String packDateEntry(int year, int month, int day, int hour, int minute) {
    String pad2(int i) => i.toString().padLeft(2, '0');
    String yearS = year.toString().padLeft(4, '0'),
      monthS = pad2(month), dayS = pad2(day), hourS = pad2(hour), minuteS = pad2(minute);
    return 'LDT:${yearS}${monthS}${dayS}${hourS}${minuteS}';
  }

  ///unpack a date into local time, which was packed with packDateEntry
  /// warning: only use client side since in the server context the info returned
  /// by this method has no timezone info; also see DateLib.unpackUtcDateEntry
  static DateTime unpackDateEntry(String packed) {
    //format is 'LDT:${yearS}${monthS}${dayS}${hourS}${minuteS}';
    if (!packed.startsWith('LDT:')) throw new Exception('packed date is not in the right format');
    int year = int.parse(packed.substring(4, 8)),
      month = int.parse(packed.substring(8, 10)),
      day = int.parse(packed.substring(10, 12)),
      hour = int.parse(packed.substring(12, 14)),
      minute = int.parse(packed.substring(14, 16));
    return new DateTime(year, month, day, hour, minute);
  }

  ///chop a string to a max char count, optionally adding ... to the end
  static String chop(String s, int maxlength, {bool addEllipsis:false}) {
    if (s.length <= maxlength) return s;
    s = s.substring(0, maxlength);
    if (addEllipsis) s += '...';
    return s;
  }

}
