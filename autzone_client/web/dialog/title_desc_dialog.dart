import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../root/globals.dart';

///request a title and description for anything from the user;
/// Returns true if accepted, then caller may inspect title/desc vars
/// for the entered values
class TitleDescDialog extends DialogBox {
  String _topPrompt, _descPrompt;
  bool _titleEditable;
  String title = '';
  String description = '';

  TitleDescDialog(this._topPrompt, this._descPrompt, this._titleEditable) : super() {
  }

  @override int dialogHeight() { return 150; }

  @override
  Future build() async {
    //main content
    FormBuilder form = new FormBuilder(frame, _topPrompt);
    InputElement titleInput = form.addInput('Title', typicalControlWidth(), Globals.maxTitleLength, title); //lengths not actually limited by databse, so these are fairly long
    if (!_titleEditable) titleInput.readOnly = true;
    TextAreaElement descInput = form.addTextArea(_descPrompt, typicalControlWidth(), 80, 10000, description);

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('OK', (e) {
      title = titleInput.value;
      description = descInput.value;
      hide(true);
    });

    bar.addButton('Cancel', (e) {
      hide(false);
    });
  }
}
