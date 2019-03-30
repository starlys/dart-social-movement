import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../pane_factory.dart';
import 'package:autzone_models/autzone_models.dart';
import '../rpc_lib.dart';
import '../lib/card_builder.dart';
import '../messages.dart';
import '../root/globals.dart';
import '../dialog/resource_dialog.dart';

///pane showing one resource - paneKey is 'resource/id'
class ResourcePane extends BasePane {
  int _resourceId;
  bool _clickedInCode = false;

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);

    //get resource
    _resourceId = pk.part1AsInt;
    ResourceGetResponse resource = await RpcLib.resourceGet(new ResourceGetRequest(iid: _resourceId));

    //build pane - readonly info
    buildSkeletonHtml2(paneClass: 'resource', iconHoverText: 'Resource', iconName: 'paneresource', title: resource.title);
    clearLoadingMessage();
    CardBuilder card = new CardBuilder(bodyElement);
    card.addText('Title', resource.title);
    if (resource.url != null && resource.url.length > 0)
      card.addHyperlink('Web URL', resource.url, resource.url);
    card.addText('Description', resource.description);
    card.addPaneLink('Created by', resource.nick, 'user/${resource.userId}');
    if (resource.visible != 'Y')
      card.addText('Hidden', 'This resource is not visible because users marked it as inappropriate.');

    //show checkboxes for user's votes
    Element myVoteCell = card.addAny('My vote');
    CheckboxInputElement add1Checkbox(bool value, String text) {
      DivElement div = new DivElement();
      CheckboxInputElement chk = new CheckboxInputElement()
        ..checked = value;
      div.append(chk);
      div.appendText(' ' + text);
      myVoteCell.append(div);
      return chk;
    }
    CheckboxInputElement importantCheck = add1Checkbox(resource.userKind == 'I', 'Important');
    CheckboxInputElement removeCheck = add1Checkbox(resource.userKind == 'R', 'Remove');

    //hook up checkbox handlers
    var handleCheckbox = (e) {
      if (_clickedInCode) return;
      _clickedInCode = true;
      if (e.target.checked) {
        if (e.target == importantCheck) removeCheck.checked = false;
        if (e.target == removeCheck) importantCheck.checked = false;
      }
      _clickedInCode = false;
      _handleVote(importantCheck.checked, removeCheck.checked);
    };
    importantCheck.onChange.listen(handleCheckbox);
    removeCheck.onChange.listen(handleCheckbox);

    //button bar
    bool loggedIn = Globals.userId != 0;
    bool editable = resource.isCreator == 'Y' || resource.isSiteAdmin == 'Y';
    if (loggedIn && editable) {
      paneMenuBar.addButton('Edit', (e) async {
        var editDialog = new ResourceDialog(_resourceId, 0);
        bool dialogOk = await editDialog.show();
        if (dialogOk) recreatePane();
      });
    }
    if (loggedIn && resource.isSiteAdmin == 'Y' && resource.visible == 'N') {
      paneMenuBar.addButton('Delete', (e) async {
        await RpcLib.resourceTriage(ResourceTriageRequest(iid: _resourceId, mode:'D'));
        PaneFactory.delete(this);
      });
      paneMenuBar.addButton('Reset To Visible', (e) async {
        await RpcLib.resourceTriage(ResourceTriageRequest(iid: _resourceId, mode:'R'));
        recreatePane();
      });
    }
  }

  //record vote
  Future _handleVote(bool important, bool remove) async {
    String vote = null;
    if (important) vote = 'I';
    else if (remove) vote = 'R';
    if (!Messages.checkLoggedIn()) return;
    ResourceUserSaveRequest req = new ResourceUserSaveRequest(
      iid: _resourceId,
      kind: vote);
    await RpcLib.resourceUserSave(req);
  }
}
