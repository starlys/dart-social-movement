import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
//import '../lib/html_lib.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';

///allows selecting multiple strings; returns null on cancel or a List<String>
/// containing the selected strings
class SelectMultipleDialog extends DialogBox {
  List<String> _options;
  String _title;

  SelectMultipleDialog(this._options, this._title) : super() {}

  @override
  Future build() async {
    //main content
    new FormBuilder(frame, _title); //the form is just used to format the title
    frame.appendText(
        'Select one or more options - use Ctrl/Command to select multiple');
    SelectElement sel = new SelectElement()
      ..multiple = true
      ..style.width = '80%'
      ..style.height = '200px';
    frame.append(sel);
    for (String option in _options)
      sel.append(new OptionElement(data: option, value: option));

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('OK', (e) async {
      List<String> selected = new List<String>();
      sel
          .querySelectorAll('option')
          .cast<OptionElement>()
          .forEach((OptionElement option) {
        if (option.selected) selected.add(option.value);
      });
      hide(selected);
    });
    bar.addButton('Cancel', (e) {
      hide(null);
      return null;
    });
  }
}
