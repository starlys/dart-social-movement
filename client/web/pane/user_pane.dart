import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import 'package:models/models.dart';
import '../rpc_lib.dart';
import '../lib/card_builder.dart';
import '../lib/html_lib.dart';
import '../messages.dart';
import '../root/globals.dart';
import '../dialog/user_dialog.dart';
import '../dialog/image_upload_dialog.dart';

///pane showing one user - paneKey is 'user/id'
class UserPane extends BasePane {
  int _userId;
  bool _clickedInCode = false;

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);
    bool loggedIn = Globals.userId != 0;

    //get user
    _userId = pk.part1AsInt;
    UserGetResponse user = await RpcLib.userGet(new UserGetRequest(userId: _userId, includeDetail: 'Y'));

    //build pane - readonly info
    buildSkeletonHtml2(paneClass: 'user', iconHoverText: 'User', iconName: 'paneuser', title: user.nick);
    clearLoadingMessage();
    CardBuilder card = new CardBuilder(bodyElement);
    Element avatarParent = card.addAny('Avatar');
    if (user.avatarUrl != null)
      avatarParent.append(new ImageElement(src: user.avatarUrl));
    else
      avatarParent.appendText('(none)');
    card.addText('Nickname', user.nick);
    card.addText('Name', user.publicName);
    if (user.publicLinks != null) {
      user.publicLinks.forEach((linkKind, linkValue) {
        card.addText(linkKind, linkValue);
      });
    }
    card.addText('Time zone', user.timeZone);
    card.addText('Kind of user', Globals.allUserKinds[user.kind]);
    if (user.status == 'D')
      card.addText('Status', 'User has been deleted');
    if (user.isSiteAdmin == 'Y')
      card.addText('Admin status', 'User is currently a site-wide administrator');

    //show checkboxes for user's votes - only if logged in and looking
    //at another user
    CheckboxInputElement add1Checkbox(bool value, String text) {
      DivElement div = new DivElement();
      CheckboxInputElement chk = new CheckboxInputElement()
        ..checked = value;
      div.append(chk);
      div.appendText(' ' + text);
      bodyElement.append(div);
      return chk;
    }
    CheckboxInputElement followCheck, blockCheck;
    if (loggedIn && Globals.nick != user.nick) {
      followCheck = add1Checkbox(user.userUserKind == 'F', 'Follow this user');
      blockCheck = add1Checkbox(user.userUserKind == 'B', 'Block this user');
      //hook up checkbox handlers
      var handleCheckbox = (e) {
        if (_clickedInCode) return;
        _clickedInCode = true;
        if (followCheck.checked) blockCheck.checked = false;
        if (blockCheck.checked) followCheck.checked = false;
        _clickedInCode = false;
        _handleVote(followCheck.checked, blockCheck.checked);
      };
      followCheck.onChange.listen(handleCheckbox);
      blockCheck.onChange.listen(handleCheckbox);
    }

    //associations
    DivElement assocBox = new DivElement() ..className = 'associations';
    bodyElement.append(assocBox);
    void build1AssocSection(String sectName, List<APIResponseAssociation> assocs, String iconName) {
      if (assocs == null || assocs.length == 0) return;
      assocBox.appendHtml('<h3><img src="images/${iconName}.png" /> ${sectName}</h3>');
      for (APIResponseAssociation assoc in assocs) HtmlLib.appendLinkToPane(assocBox, assoc.linkText, assoc.linkPaneKey);
    }
    build1AssocSection('Events attending', user.events.cast<APIResponseAssociation>(), 'paneevent');
    build1AssocSection('Projects', user.projects.cast<APIResponseAssociation>(), 'paneproject');
    build1AssocSection('Resources submitted', user.resources.cast<APIResponseAssociation>(), 'paneresource');

    //button bar
    if (loggedIn && Globals.nick == user.nick) {
      paneMenuBar.addButton('Edit', (e) async {
        var editDialog = new UserDialog(_userId);
        bool dialogOk = await editDialog.show();
        if (dialogOk) recreatePane();
      });
      paneMenuBar.addButton('Change Avatar', (e) async {
        var uploadDialog = new ImageUploadDialog('U', 'The image will be resized and cropped to be square.');
        bool dialogOk = await uploadDialog.show();
        if (dialogOk) recreatePane();
      });
    }
  }

  //record vote
  Future _handleVote(bool follow, bool block) async {
    String vote = null;
    if (follow) vote = 'F';
    else if (block) vote = 'B';
    if (!Messages.checkLoggedIn()) return;
    UserUserSaveRequest req = new UserUserSaveRequest(
      aboutId: _userId,
      kind: vote);
    await RpcLib.userUserSave(req);
  }
}
