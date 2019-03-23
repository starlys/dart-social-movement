import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../../models/models.dart';
import '../rpc_lib.dart';
import '../lib/html_lib.dart';
import '../lib/form_builder.dart';

///pane to allow searching for users - paneKey is 'users'
class UserSearchPane extends BasePane {
  DivElement _resultsDiv;

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);

    //build pane
    buildSkeletonHtml2(paneClass: 'users', title: 'User Search', iconName: 'paneuser');
    clearLoadingMessage();
    _resultsDiv = HtmlLib.appendScrollingDiv(bodyElement) ..style.display = 'none';
    FormBuilder form = new FormBuilder(bodyElement, 'Criteria');
    InputElement nickInp = form.addInput('Any part of nickname or name', 100, 20);

    //buttons
    paneMenuBar.addButton('Search', (e) => _doSearch(trimInput(nickInp)));
  }

  //do the search and recreate _resultsDiv
  Future _doSearch(String nick) async {
    _resultsDiv.style.display = 'block';
    _resultsDiv.innerHtml = 'Loading...';
    UserQueryResponse response = await RpcLib.userQuery(
      new UserQueryRequest(name: nick));
    _resultsDiv.innerHtml = '';
    for (UserQueryItem u in response.users) {
      DivElement d1 = new DivElement() ..className = 'avatar';
      _resultsDiv.append(d1);
      if (u.avatarUrl != null)
        d1.append(new ImageElement(src: u.avatarUrl));
      HtmlLib.appendLinkToPane(d1, u.nick, 'user/${u.iid}', asDiv: false);
      d1.appendText(' (${u.publicName})');
    }
    if (response.users.length == 0) _resultsDiv.innerHtml = '(none)';
  }
}
