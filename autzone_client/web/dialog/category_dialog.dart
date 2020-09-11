import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../root/globals.dart';
import '../rpc_lib.dart';
import 'package:autzone_models/autzone_models.dart';

///dialog for creating or editing a category, which is either a sister or child
/// of some other reference category; returns true if saved on server, else false
/// if canceled
class CategoryDialog extends DialogBox {
  int _referenceCatId, _existingCatId;
  String _kind, _referenceTitle, _existingTitle, _existingDescription;

  ///create dialog - pass existing id/title if editing existing; else pass reference id/title
  /// if adding a new one in relation to the given cat; _kind is defined in category table;
  ///  pass nulls for the other options
  CategoryDialog(this._kind, this._existingCatId, this._existingTitle,
      this._existingDescription, this._referenceCatId, this._referenceTitle)
      : super() {}

  @override
  Future build() async {
    bool isNewCat = _existingCatId == null;
    bool isExistingCat = _referenceCatId == null;
    assert(isNewCat != isExistingCat);

    //main content
    FormBuilder form = new FormBuilder(frame, 'Category');
    InputElement titleInput = form.addInput('Category title',
        typicalControlWidth(), Globals.maxTitleLength, _existingTitle);
    TextAreaElement descrInput = form.addTextArea(
        'Description',
        typicalControlWidth(),
        90,
        Globals.maxDescriptionLength,
        _existingDescription);
    RadioButtonInputElement sameLevelRadio, subLevelRadio;
    if (isNewCat) {
      FormBuilder subform = form.addSubformFrame('Position');
      sameLevelRadio = new RadioButtonInputElement()..name = 'catmode';
      subLevelRadio = new RadioButtonInputElement()
        ..name = 'catmode'
        ..checked = true;
      subform.parent
        ..append(sameLevelRadio)
        ..appendText('New category at same level as ${_referenceTitle}')
        ..appendHtml('<br/>')
        ..append(subLevelRadio)
        ..appendText('New category as sub-category of ${_referenceTitle}');
    }

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('Save', (e) async {
      String referenceMode = '';
      if (sameLevelRadio != null && sameLevelRadio.checked) referenceMode = 'S';
      if (subLevelRadio != null && subLevelRadio.checked) referenceMode = 'C';
      CategorySaveRequest req = new CategorySaveRequest(
          catId: _existingCatId,
          kind: _kind,
          referenceId: _referenceCatId,
          referenceMode: referenceMode,
          title: trimInput(titleInput),
          description: trimTextArea(descrInput));

      APIResponseBase response = await RpcLib.categorySave(req);
      if (response.isOK) {
        hide(true);
      }
    });

    bar.addButton('Cancel', (e) {
      hide(false);
      return null;
    });
  }
}
