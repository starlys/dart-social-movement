import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/button_bar_builder.dart';

///dialog to show messages and get simple yes/no responses;
/// result is the button index
class ConfirmDialog extends DialogBox {

  static final List<String> YesNoOptions = ['Yes', 'No'];

  String _message;
  List<String> _options;

  ConfirmDialog(this._message, this._options) : super() {}

  @override int dialogHeight() {return 100;}

  Future build() async {
    //main content
    frame.appendText(_message);

    //handler
    void buttonHandler(e) {
      String text = e.currentTarget.text;
      int idx = _options.indexOf(text);
      hide(idx);
    }

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    for (String s in _options) bar.addButton(s, buttonHandler);
  }
}
