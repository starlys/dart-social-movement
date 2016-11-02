import 'dart:html';
import 'dialog_box.dart';
import 'button_bar_builder.dart';
import 'form_builder.dart';

class StringDialog extends DialogBox {

  @override int dialogHeight() { return 150; }

  ///dialog to ask for a one-line string value; maxlength is required
  /// show method returns the string or null if canceled
  StringDialog(String caption, String priorValue, int maxLength) {
    //main content
    FormBuilder form = new FormBuilder(frame, caption);
    InputElement inp = form.addInput('', 300, maxLength, priorValue);

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('OK', (e) {
      hide(inp.value);
    });
    bar.addButton('Cancel', (e) {
      hide(null);
    });
  }


}
