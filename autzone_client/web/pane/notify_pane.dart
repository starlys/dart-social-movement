import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import 'package:autzone_models/autzone_models.dart';
import '../root/globals.dart';
import '../rpc_lib.dart';
import '../pane_factory.dart';

///user notification pane - paneKey is 'notify/id'
class NotifyPane extends BasePane {
  PushQueueItem _item;
  bool _hasLink = false;

  @override
  Future<PaneInitResult> init(PaneKey pk) async {
    //find already-loaded notification or die
    await super.init(pk);
    String notifyId = pk.part1;
    _item = Globals.pushQueue.firstWhere(
        (i) => i.sid == notifyId && i.kind == 'N',
        orElse: () => null);
    if (_item == null) return PaneInitResult.unknownFailure;
    _hasLink = (_item.linkPaneKey ?? '').length > 0;

    //build pane
    buildSkeletonHtml2(
        paneClass: 'notify',
        iconHoverText: 'Notification',
        iconName: 'panenotify',
        title: _item.text);
    clearLoadingMessage();
    bodyElement.append(new DivElement()..text = _item.text);
    bodyElement.append(new BRElement());
    if (_hasLink) {
      var link = new AnchorElement()
        ..href = '#' + _item.linkPaneKey
        ..text = _item.linkText;
      bodyElement.append(link);
    }

    //button bar and events
    ButtonElement dismissBtn;
    dismissBtn = paneMenuBar.addButton('Dismiss', (e) {
      dismissBtn.remove();
      dismissOnServer();
      paneMenuBar.addElement(new SpanElement()..text = 'Dismissed');
      PaneFactory.delete(this);
      if (_hasLink) PaneFactory.create(PaneKey(_item.linkPaneKey));
      return null;
    });

    return PaneInitResult.ok;
  }

  ///send server message to dismiss notification
  void dismissOnServer() {
    var req = new UserNotifySaveRequest(notifyId: _item.sid);
    RpcLib.userNotifySave(req);
  }
}
