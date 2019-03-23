import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../lib/html_lib.dart';
import '../pane_factory.dart';
import '../../models/models.dart';
import '../rpc_lib.dart';
import '../lib/card_builder.dart';
import '../messages.dart';
import '../root/globals.dart';
import '../dialog/event_dialog.dart';
import '../dialog/confirm_dialog.dart';
import '../lib/string_dialog.dart';
import '../dialog/conv_dialog.dart';

///pane showing one event - paneKey is 'event/id'
class EventPane extends BasePane {
  int _eventId;

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);

    //get event
    _eventId = pk.part1AsInt;
    var getArgs = new EventRequest(eventId: _eventId);
    EventGetResponse event = await RpcLib.eventGet(getArgs);
    bool loggedIn = Globals.userId != 0;
    bool editable = event.isCreator == 'Y';

    //build pane - readonly info
    buildSkeletonHtml2(paneClass: 'event', iconHoverText: 'Event', iconName: 'paneevent', title: event.title);
    clearLoadingMessage();
    CardBuilder card = new CardBuilder(bodyElement);
    card.addText('Title', event.title);
    card.addText('Date/time', event.startTimeR);
    card.addText('Duration', event.duration);
    card.addText('Description', event.description);
    card.addText('Location', event.location);
    card.addPaneLink('Created by', event.creatorNick, 'user/${event.creatorId}');

    //find logged in user's RSVP
    String myStatus = 'D', myStatusDesc = '';
    if (loggedIn) {
      Iterable<EventGetUserResponse> myselfs = event.users.where((u) => u.userId == Globals.userId);
      if (myselfs.length > 0) {
        myStatus = myselfs.first.status;
        myStatusDesc = myselfs.first.statusDesc;
      }
    }

    //show checkbox for user's RSVP
    Element myVoteCell = card.addAny('My response');
    CheckboxInputElement myVoteChk = new CheckboxInputElement()
      ..checked = myStatus == 'A';
    myVoteCell.append(myVoteChk);
    myVoteCell.appendText(' I am attending');
    myVoteChk.onChange.listen((e) async {
      if (!Messages.checkLoggedIn()) return; //note the checkbox will be incorrect if checked while logged out
      String vote = myVoteChk.checked ? 'A' : 'D';

      //get status description from dialog
      StringDialog statusDescDlg = new StringDialog('Optionally enter a reason or message for your attendance', myStatusDesc, 100);
      String newStatusDesc = await statusDescDlg.show();
      myStatusDesc = newStatusDesc ?? myStatusDesc; //if dlg canceled, proceed with old message

      //save 'vote'
      EventUserSaveRequest req = new EventUserSaveRequest(
        eventId: _eventId,
        status: vote,
        statusDesc: myStatusDesc);
      await RpcLib.eventUserSave(req);
    });

    //show conversation list
    if (event.convs != null && event.convs.length > 0) {
      bodyElement.appendHtml('<h2><img src="images/paneconv.png"/>Conversations</h2>');
      DivElement scroll = HtmlLib.appendScrollingDiv(bodyElement);
      for (EventGetConvResponse conv in event.convs) {
        HtmlLib.appendLinkToPane(scroll, conv.title, 'conv/${conv.iid}');
      }
    }

    //show attendee list
    if (event.users != null && event.users.length > 0) {
      bodyElement.appendHtml('<h2><img src="images/paneuser.png"/>Attendees</h2>');
      DivElement scroll = HtmlLib.appendScrollingDiv(bodyElement);
      for (EventGetUserResponse user in event.users) {
        if (user.status != 'A') continue;
        DivElement d1 = new DivElement() ..className = 'avatar';
        scroll.append(d1);
        if (user.avatarUrl != null)
          d1.append(new ImageElement(src: user.avatarUrl));
        HtmlLib.appendLinkToPane(d1, user.nick, 'user/${user.userId}', asDiv: false);
        d1.appendText(' (${user.publicName}) ${user.statusDesc}');
      }
    }

    //button bar
    if (loggedIn && editable) {
      paneMenuBar.addButton('Edit', (e) async {
        var editDialog = new EventDialog(_eventId, event);
        bool dialogOk = await editDialog.show();
        if (dialogOk) recreatePane();
      });
      paneMenuBar.addButton('Delete Event', (e) async {
        ConfirmDialog dlg = new ConfirmDialog('Really delete event?', ConfirmDialog.YesNoOptions);
        int btnIndex = await dlg.show();
        if (btnIndex == 0) {
          await RpcLib.eventDelete(EventRequest(eventId: _eventId));
          PaneFactory.delete(this);
        }
      });
    }
    if (loggedIn) {
      paneMenuBar.addButton('New Conversation', (e) async {
        ConvDialog dlg = new ConvDialog(null, null, _eventId);
        int convId = await dlg.show();
        if (convId == null) return;
        recreatePane();
        PaneFactory.createFromString('conv/${convId}');
      });
    }
  }

}
