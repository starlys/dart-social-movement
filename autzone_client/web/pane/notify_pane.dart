import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import 'package:autzone_models/autzone_models.dart';
import '../root/globals.dart';
import '../rpc_lib.dart';

///user notification pane - paneKey is 'notify/id'
class NotifyPane extends BasePane {
  PushQueueItem _item;

  @override
  Future init(PaneKey pk) async {
    //find already-loaded notification or throw exception
    await super.init(pk);
    String notifyId = pk.part1;
    _item = Globals.pushQueue.firstWhere((i) => i.sid == notifyId && i.kind == 'N', orElse: () => null);
    if (_item == null) return;

    //build pane
    buildSkeletonHtml2(paneClass: 'notify', iconHoverText: 'Notification', iconName: 'panenotify', title: _item.text);
    clearLoadingMessage();
    bodyElement.append(new DivElement() ..text = _item.text);
    bodyElement.append(new BRElement());
    if ((_item.linkPaneKey ?? '').length > 0) {
      var link = new AnchorElement() ..href = '#' + _item.linkPaneKey ..text = _item.linkText;
      bodyElement.append(link);
    }

    //button bar and events
    ButtonElement dismissBtn;
    dismissBtn = paneMenuBar.addButton('Dismiss', (e) {
      //chk.disabled = true;
      //new Timer(new Duration(milliseconds: 300), () => chk.remove());
      dismissBtn.remove();
      dismiss();
      paneMenuBar.addElement(new SpanElement() ..text = 'Dismissed');
    });
  }

  ///send server message to dismiss notification
  void dismiss() {
    var req = new UserNotifySaveRequest(notifyId: _item.sid);
    RpcLib.userNotifySave(req);
  }
}
