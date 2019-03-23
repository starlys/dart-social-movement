import 'dart:async';
import 'dart:html';
import 'base_tree_pane.dart';
import '../root/pane_key.dart';
import '../rpc_lib.dart';
import '../messages.dart';
import '../lib/html_lib.dart';
import '../lib/button_bar_builder.dart';
import '../../models/models.dart';
import '../dialog/resource_dialog.dart';

///shows outline of resource  categories and commands for accessing the resources
/// in those categories - paneKey is 'resourcetree'
class ResourceTreePane extends BaseTreePane {
  int _resourceCount = 0;
  ResourceQueryResponse _resources;

  @override
  Future init(PaneKey pk) async {
    paneClass = 'resourcetree';
    paneTitle = 'Resource Categories';
    paneIconName = 'paneresource';
    categoryKind = 'R';
    await super.init(pk);
  }

  @override
  Future insertDetails(Element detailBox, int catId) async {
    //get resources in this cat
    _resources = await RpcLib.resourceQuery(
      new ResourceQueryRequest(categoryId: catId));

    //convert to html links; also link directly to resource
    detailBox.append(new HeadingElement.h3() ..text = 'Resources in this category');
    for (ResourceItem re in _resources.items) {
      DivElement pdiv = new DivElement();
      if (re.url != null && re.url.length > 0) {
        var link = new AnchorElement() ..target = '_blank' ..href = re.url;
        link.append(new ImageElement(src: 'images/ext_link.png'));
        pdiv.append(link);
        //fails: pdiv.appendHtml('<a target="_blank" href="${re.url}"><img src="images/ext_link.png"/></a> ');
      }
      HtmlLib.appendLinkToPane(pdiv, re.title, 'resource/${re.iid}', asDiv: false);
      detailBox.append(pdiv);
      //idea to put description here, but not sure if a good idea: HtmlLib.insertCollapsed1(pdiv, re.description);
    }
    if (_resources.items.length == 0) detailBox.appendText('(none)');
    _resourceCount = _resources.items.length;
  }

  @override
  void insertDetailButtons(ButtonBarBuilder bar, int catId) {
    bar.addButton('Create Resource', (e) {
      if (_resourceCount >= 100) {
        Messages.timed('There are too many resources in this category. Please choose a more detailed sub-category.');
        return;
      }
      ResourceDialog dlg = new ResourceDialog(0, catId);
      dlg.show();
    });
  }

  @override
  List<String> getContentTitles() {
    return _resources.items.map((i) => i.title).toList();
  }

  @override
  List<int> getContentIds(List<String> contentTitles) {
    return contentTitles.map((s) {
      List<ResourceItem> matches = _resources.items.where((i) => i.title == s).toList();
      if (matches.length > 0) return matches[0].iid;
      return null;
    })
    .where((i) => i != null)
    .toList();
  }
}
