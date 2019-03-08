//import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../lib/html_lib.dart';
import '../../models/models.dart';

///base class for panes listing proposals of various kinds
abstract class ProposalListPane extends BasePane {

  //vars set in derived classes
  String paneClass, paneTitle;
  ProposalQueryResponse proposals;

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);

    //load proposals
    await load();

    //build pane
    buildSkeletonHtml2(paneClass: paneClass, iconName: 'paneproposal', title: paneTitle);
    clearLoadingMessage();
    for (ProposalQueryItem item in proposals.items) {
      HtmlLib.appendLinkToPane(bodyElement, item.title, 'proposal/${item.id}');
    }
    if (proposals.items.length == 0) bodyElement.appendText('(none found)');
    makeButtonBar();
  }

  ///when overridden, sets all class vars defined in this class, and loads the proposals
  /// for display
  Future load() async {}

  ///when overridden, builds button bar
  Future makeButtonBar() async {}
}
