import 'dart:async';
import 'lib/js_interop.dart';
import 'root/globals.dart';
import 'dialog/confirm_dialog.dart';

///timed and other simple user messages
class Messages {

  ///initialize (call one time)
  static void init() {
    jGrowlPosition = 'bottom-left';
  }

  ///show a timed message
  static void timed(String s) {
    jGrowl(s, new JGrowlOptions(life: 5000));
  }

  ///returns false if not logged in, and shows timed message
  static bool checkLoggedIn() {
    if (Globals.nick != null) return true;
    timed('That option is only available if you are logged in.');
    return false;
  }

  ///show a critical message requiring the user to press OK; don't forget
  /// to use await!
  static Future criticalMessage(String s) async {
    ConfirmDialog dlg = new ConfirmDialog(s, ['OK']);
    await dlg.show();
  }
}
