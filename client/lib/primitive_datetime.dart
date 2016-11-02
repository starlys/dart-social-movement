import 'dart:html';

///encapsulates a dropdown for year, month, day, and time;
/// assumes local timezone; allows 15 minute precision;
/// allows for dates +/- years from now
class PrimitiveDateTime {

  List<String> monthAbbrevs = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  DivElement parentDiv;
  SelectElement
    _year = new SelectElement(),
    _month = new SelectElement(),
    _day = new SelectElement(),
    _time = new SelectElement();

  PrimitiveDateTime(DivElement this.parentDiv) {}

  ///create the DOM in parentDiv (can only call once)
  void render(DateTime value) {
    //add values to dropdowns
    int thisYear = (new DateTime.now()).year;
    for (int year = thisYear - 4; year < thisYear + 5; ++year)
      _year.append(new OptionElement() ..value = year.toString() ..text = year.toString());
    for (int month = 1; month <= 12; ++month)
      _month.append(new OptionElement() ..value = month.toString() ..text = '${month} - ${monthAbbrevs[month - 1]}');
    for (int day = 1; day <= 31; ++day)
      _day.append(new OptionElement() ..value = day.toString() ..text = day.toString());
    for (int hour = 0; hour < 24; ++hour) {
      for (int minute = 0; minute <= 45; minute += 15) {
        int totalMin = hour * 60 + minute;
        _time.append(new OptionElement() ..value = totalMin.toString() ..text = '${hour}:${minute.toString().padLeft(2, '0')}');
      }
    }

    //add to DOM
    parentDiv.append(_year);
    parentDiv.appendText(' - ');
    parentDiv.append(_month);
    parentDiv.appendText(' - ');
    parentDiv.append(_day);
    parentDiv.appendText(' at ');
    parentDiv.append(_time);

    //set current values
    _year.value = value.year.toString();
    _month.value = value.month.toString();
    _day.value = value.day.toString();
    int forcedMinute = value.hour * 60 + value.minute - value.minute % 15;
    _time.value = forcedMinute.toString();
  }

  ///get the currently selected value
  DateTime getValue() {
    int totalMinutes = int.parse(_time.value);
    return new DateTime(int.parse(_year.value), int.parse(_month.value), int.parse(_day.value),
      (totalMinutes / 60).floor(), totalMinutes % 60);
  }
}
