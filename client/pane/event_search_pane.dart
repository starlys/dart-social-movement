import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../../models/models.dart';
import '../rpc_lib.dart';
import '../lib/html_lib.dart';
import '../lib/form_builder.dart';
import '../main_controller.dart';
import '../client_store.dart';

///pane to allow searching for events - paneKey is 'events'
class EventSearchPane extends BasePane {
  DivElement _resultDiv;
  bool _myLocKnown = false; //true when my location is known

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);
    _myLocKnown = ClientStore.lon != 0;

    //build pane
    buildSkeletonHtml2(paneClass: 'events', title: 'Event Search', iconName: 'paneevent');
    clearLoadingMessage();
    _resultDiv = HtmlLib.appendScrollingDiv(bodyElement)
      ..style.marginBottom = HtmlLib.asPx(6)
      ..style.display = 'hidden';
    FormBuilder form = new FormBuilder(bodyElement, 'Criteria');
    InputElement titleInp = form.addInput('Title', 100, 50);
    DivElement locDiv = new DivElement();
    CheckboxInputElement locCheck = new CheckboxInputElement() ..checked = _myLocKnown;
    locDiv.append(locCheck);
    locDiv.appendText(' Within ');
    NumberInputElement milesInp = new NumberInputElement() ..style.width = '60px' ..valueAsNumber = 20
      ..min = '1' ..max = '9999';
    locDiv.append(milesInp);
    locDiv.appendText(' miles of ');
    ButtonElement setLocationButton = new ButtonElement() ..text = 'My Location' ..className = 'linkbutton';
    locDiv.append(setLocationButton);
    form.addAny('Location', locDiv);
    SelectElement dateInput = new SelectElement();
    dateInput.append(new OptionElement() ..value = '7' ..text = 'Next week');
    dateInput.append(new OptionElement() ..value = '30' ..text = 'Next month');
    dateInput.append(new OptionElement() ..value = '60' ..text = 'Next 2 months');
    dateInput.append(new OptionElement() ..value = '180' ..text = 'Next 6 months');
    dateInput.append(new OptionElement() ..value = '365' ..text = 'Next year');
    dateInput.value = '60';
    form.addAny('When', dateInput);

    //define validation & search
    Future _doSearch() async {
      //validation - exit if failed
      if (!_myLocKnown && locCheck.checked) {
        form.showError('You have not yet set your location.');
        return;
      }

      //parse inputs
      DateTime today = new DateTime.now();
      DateTime dateTo = today.add(new Duration(days: int.parse(dateInput.value)));
      EventQueryRequest req = new EventQueryRequest(
        title: trimInput(titleInp),
        dateFrom: WLib.packDateEntry(today.year, today.month, today.day, 0, 0),
        dateTo: WLib.packDateEntry(dateTo.year, dateTo.month, dateTo.day, 0, 0),
        miles: locCheck.checked ? milesInp.valueAsNumber : 0,
        lat: ClientStore.lat.toString(),
        lon: ClientStore.lon.toString()
      );

      //load
      _resultDiv.style.display = 'block';
      _resultDiv.innerHtml = 'Loading...';
      EventQueryResponse response = await RpcLib.eventQuery(req);
      _resultDiv.innerHtml = '';
      for (EventItemResponse event in response.events) {
        DivElement itemDiv = new DivElement() ..className = 'space1';
        _resultDiv.append(itemDiv);
        itemDiv.appendText(event.startTime);
        itemDiv.appendText(' - ');
        HtmlLib.appendLinkToPane(itemDiv, event.title, 'event/${event.id}', asDiv: false);
      }
      if (response.events.length == 0) _resultDiv.innerHtml = '(none)';
    }

    //initially autosearch
    if (_myLocKnown) _doSearch();

    //buttons and events
    setLocationButton.onClick.listen((e) async {
      await MainController.userSetLocation(true);
      _myLocKnown = ClientStore.lon != 0;
      if (_myLocKnown) locCheck.checked = true;
    });
    paneMenuBar.addButton('Search', (e) => _doSearch());
  }


}
