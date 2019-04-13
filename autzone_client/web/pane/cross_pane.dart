import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../lib/html_lib.dart';
import 'package:autzone_models/autzone_models.dart';
import '../rpc_lib.dart';
import '../root/globals.dart';

///pane showing cross query results - paneKey is 'cross'
class CrossPane extends BasePane {

  @override
  Future<PaneInitResult> init(PaneKey pk) async {
    await super.init(pk);

    //get query results
    var getArgs = new CrossQueryRequest();
    final result = await RpcLib.crossQuery(getArgs);

    //build pane
    buildSkeletonHtml2(paneClass: 'cross', iconHoverText: 'New', iconName: 'panecross', title: 'New On ${Globals.appTitle1}');
    clearLoadingMessage();
    if (result.items != null && result.items.length > 0) {
      DivElement scroll = HtmlLib.appendScrollingDiv(bodyElement);
      for (final item in result.items) {
        HtmlLib.appendLinkToPane(scroll, item.linkText, item.linkPaneKey);
      }
    }
    return apiResultToPaneInitResult(result.base);
  }
}
