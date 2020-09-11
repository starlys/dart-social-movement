import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../lib/html_lib.dart';
import '../root/globals.dart';
import '../rpc_lib.dart';
import 'package:autzone_models/autzone_models.dart';

///create or edit a conversation; also allow it to be spawned from a post on
/// some other conversation;
/// returns conv_id if saved, else null if canceled
class ConvDialog extends DialogBox {
  int _convId, _fromConvId;
  int _projectId,
      _eventId; //only set for new blank convs; see note in save logic
  String _openingPostId, _seedPostText;
  ConvGetRulesResponse _convRules;

  ///create dialog for an existing conv, or a new blank conv;
  /// pass null convId for new
  ConvDialog(this._convId, this._projectId, this._eventId) : super() {}

  ///create dialog for spawning a conv from an existing post
  ConvDialog.spawn(this._fromConvId, this._openingPostId, this._seedPostText)
      : super() {}

  @override
  int dialogHeight() {
    return 160;
  }

  @override
  Future build() async {
    //get existing rules
    bool isNew = _convId == null;
    bool isSpawning = _fromConvId != null;
    if (!isNew)
      _convRules =
          await RpcLib.convGetRules(ConvGetRulesRequest(convId: _convId));
    else
      _convRules = new ConvGetRulesResponse(
          postMaxSize: 5000, userDailyMax: 3); //defaults

    //main content
    FormBuilder form = new FormBuilder(frame, 'Conversation');
    InputElement titleInput = form.addInput('Title', typicalControlWidth(),
        Globals.maxTitleLength, _convRules.title);
    if (isSpawning) {
      DivElement seedParent = new DivElement();
      form.addAny('Opening post', seedParent);
      HtmlLib.insertCollapsed1(seedParent, _seedPostText);
    }
    NumberInputElement postMaxSizeInput = new NumberInputElement()
      ..min = '10'
      ..max = '100000'
      ..valueAsNumber = _convRules.postMaxSize;
    form.addAny('Maximum post size (characters)', postMaxSizeInput);
    NumberInputElement userDailyMaxInput = new NumberInputElement()
      ..min = '1'
      ..max = '100000'
      ..valueAsNumber = _convRules.userDailyMax;
    form.addAny('Maximum times per day a user can post', userDailyMaxInput);

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('Save', (e) async {
      //note on project and event IDs - when spawning a conv, the server method
      // is designed to look up the project and event IDs and ignore what's
      // passed in, so these can be null in that case
      ConvSaveRequest req = ConvSaveRequest(
          convId: _convId,
          projectId: _projectId,
          eventId: _eventId,
          fromConvId: _fromConvId,
          openingPostId: _openingPostId,
          title: trimInput(titleInput),
          postMaxSize: postMaxSizeInput.valueAsNumber,
          userDailyMax: userDailyMaxInput.valueAsNumber);
      APIResponseBase response = await RpcLib.convSave(req);
      if (response.isOK) {
        hide(response.newId);
      }
    });

    bar.addButton('Cancel', (e) {
      hide(null);
      return null;
    });
  }
}
