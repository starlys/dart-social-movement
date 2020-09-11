import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';

///dialog for specifying the sister or child relationship between a category and
/// some other reference category; returns 'S' for sister and 'C' for child, or null if canceled
class CategoryMoveModeDialog extends DialogBox {
  String _title, _referenceTitle;

  ///create dialog with the title of the thing to move and the title of the other (reference
  /// thing)
  CategoryMoveModeDialog(this._title, this._referenceTitle) : super() {}

  @override
  int dialogHeight() {
    return 100;
  }

  @override
  Future build() async {
    //main content
    new FormBuilder(frame, 'Category Move');
    RadioButtonInputElement sameLevelRadio = new RadioButtonInputElement()
      ..name = 'catmode';
    RadioButtonInputElement subLevelRadio = new RadioButtonInputElement()
      ..name = 'catmode'
      ..checked = true;
    frame
      ..append(sameLevelRadio)
      ..appendText('${_title} at same level as ${_referenceTitle}')
      ..appendHtml('<br/>')
      ..append(subLevelRadio)
      ..appendText('${_title} as sub-category of ${_referenceTitle}');

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('OK', (e) {
      if (sameLevelRadio != null && sameLevelRadio.checked) hide('S');
      if (subLevelRadio != null && subLevelRadio.checked) hide('C');
      return null;
    });

    bar.addButton('Cancel', (e) {
      hide(null);
      return null;
    });
  }
}
