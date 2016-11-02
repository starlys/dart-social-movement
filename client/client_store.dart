import 'dart:html';
import 'dart:convert';

///stores some things in local browser storage, and handles storage
/// as a medium for messaging other windows
class ClientStore {
  static Storage _store = window.localStorage;

  static String get fontTheme => _store['font-theme'];
  static void set fontTheme(String name) { _store['font-theme'] = name; }

  static String get colorTheme => _store['color-theme'];
  static void set colorTheme(String name) { _store['color-theme'] = name; }

  static String get nick => _store['nick'];
  static void set nick(String name) { _store['nick'] = name; }

  static String get password => _store['password'];
  static void set password(String name) { _store['password'] = name; }

  static double get lat => double.parse(_store['lat'] ?? '0', (bad) => 0.0);
  static void set lat(double d) { _store['lat'] = d.toString(); }

  static double get lon => double.parse(_store['lon'] ?? '0', (bad) => 0.0);
  static void set lon(double d) { _store['lon'] = d.toString(); }

  ///use local storage to send a message to other winodw;
  /// msg must be a simple type, List, or Map
  static void sendMessage(dynamic msg) {
    String json = JSON.encode(msg);
    _store['message'] = json;
    _store.remove('message');
  }

  ///register a receiving function for messages sent with sendMessage
  /// from other windows
  static void registerReceiveMessage(void f(dynamic)) {
    window.onStorage.listen((e) {
      var message = JSON.decode(e.newValue);
      f(message);
    });
  }
}
