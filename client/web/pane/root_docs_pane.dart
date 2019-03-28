//import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../lib/html_lib.dart';
import 'package:models/models.dart';
import '../rpc_lib.dart';

///pane listing all root documents - paneKey is 'rootdocs'
class RootDocsPane extends BasePane {

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);

    //get all root docs
    DocQueryResponse docs = await RpcLib.docQuery(new DocQueryRequest(mode: 'R'));

    //build pane
    buildSkeletonHtml2(paneClass: 'rootdocs', title: 'Documents', iconName: 'panedoc');
    clearLoadingMessage();
    for (DocQueryItem item in docs.docs) {
      HtmlLib.appendLinkToPane(bodyElement, item.title, 'doc/${item.iid}');
    }
  }

}
