import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../twotier/wtypes.dart';
import '../rpc_lib.dart';
import '../lib/html_lib.dart';
import '../lib/form_builder.dart';
import '../root/globals.dart';

///pane to allow searching for resources across categories - paneKey is 'resources'
class ResourceSearchPane extends BasePane {
  DivElement _resultDiv;

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);

    //build pane
    buildSkeletonHtml2(paneClass: 'resources', title: 'Resource Search', iconName: 'paneresource');
    clearLoadingMessage();
    _resultDiv = HtmlLib.appendScrollingDiv(bodyElement)
      ..style.marginBottom = HtmlLib.asPx(6)
      ..style.display = 'hidden';
    FormBuilder form = new FormBuilder(bodyElement, 'Criteria');
    InputElement titleInp = form.addInput('Title', 100, 50);
    var kindInput = new SelectElement();
    kindInput.append(new OptionElement());
    for (String kindOption in Globals.allResourceKinds)
      kindInput.append(new OptionElement() ..value = kindOption ..text = kindOption);
    form.addAny('Kind', kindInput);

    //buttons
    paneMenuBar.addButton('Search', (e) => _doSearch(trimInput(titleInp), kindInput.value));
  }

  //do the search and recreate _resultTable
  Future _doSearch(String title, String kind) async {
    _resultDiv.style.display = 'block';
    _resultDiv.innerHtml = 'Loading...';
    ResourceQueryResponse response = await RpcLib.resourceQuery(
      new ResourceQueryRequest() ..title = title ..kind = kind);
    _resultDiv.innerHtml = '';
    for (ResourceItem res in response.items) {
      DivElement itemDiv = new DivElement() ..className = 'space1';
      _resultDiv.append(itemDiv);
      if (res.url != null && res.url.length > 0) {
        AnchorElement a = new AnchorElement(href: res.url);
        a ..innerHtml = '<img src="images/ext_link.png"/>'
          ..target = '_blank';
        itemDiv.append(a);
        itemDiv.appendText(' ');
      }
      HtmlLib.appendLinkToPane(itemDiv, res.title, 'resource/${res.id}', asDiv: false);
      itemDiv.appendText(' - ');
      HtmlLib.insertCollapsed1(itemDiv, res.description);
    }
    if (response.items.length == 0) _resultDiv.appendText('(none)');
  }
}
