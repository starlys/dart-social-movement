import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../messages.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../root/globals.dart';
import '../rpc_lib.dart';
import '../twotier/wtypes.dart';
import '../twotier/wlib.dart';
import '../lib/primitive_datetime.dart';
import 'location_dialog.dart';

///edit or create event; return true if edited else false
class EventDialog extends DialogBox {
  int _eventId; //0 if new
  EventGetResponse _event; //from caller, but initially null if new
  double _changedLat, _changedLon; //set only when changed

  ///pass 0 for new event
  EventDialog(this._eventId, EventGetResponse this._event) : super() {}

  @override int dialogHeight() {
    return 400;
  }

  @override
  Future build() async {
    //get event or blank data for defaults
    bool isNewEvent = _eventId == 0;
    assert (_eventId != null);
    if (isNewEvent) {
      //the datetime hack puts the local time in a DateTime marked as UTC
      DateTime nowLocal = new DateTime.now();
      //DateTime nowHack = new DateTime.utc(nowLocal.year, nowLocal.month, nowLocal.day, nowLocal.hour, nowLocal.minute);
      _event = new EventGetResponse()
        ..startTimeU = WLib.packDateEntry(nowLocal.year, nowLocal.month, nowLocal.day, nowLocal.hour, nowLocal.minute);
    }

    //main content
    FormBuilder form = new FormBuilder(frame, 'Event');
    InputElement titleInput = form.addInput('Title', typicalControlWidth(), Globals.maxTitleLength, _event.title);
    TextAreaElement descInput = form.addTextArea('Description', typicalControlWidth(), 90, Globals.maxDescriptionLength, _event.description);
    DivElement startsAtDiv = new DivElement();
    form.addAny('Starts at', startsAtDiv);
    PrimitiveDateTime startsAtInput = new PrimitiveDateTime(startsAtDiv);
    startsAtInput.render(WLib.unpackDateEntry(_event.startTimeU));
    InputElement durationInput = form.addInput('Duration', typicalControlWidth(), Globals.maxTitleLength, _event.duration);
    ButtonElement mapButton = new ButtonElement() ..text = isNewEvent ? 'Set Location On Map' : 'Change Map Location';
    form.addAny('Map location', mapButton);
    TextAreaElement locationInput = form.addTextArea('Location/directions', typicalControlWidth(), 90, Globals.maxDescriptionLength, _event.location);

    //buttons
    mapButton.onClick.listen((e) async {
      List<double> latlon = _currentLatLon();
      LocationDialog dlg = new LocationDialog(latlon[0], latlon[1]);
      List<double> dlgResult = await dlg.show();
      if (dlgResult != null) {
        _changedLat = dlgResult[0];
        _changedLon = dlgResult[1];
        mapButton.text = 'Change Map Location';
      }
    });
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('OK', (e) async {
      //validation
      if (isNewEvent && _changedLat == null) {
        form.showError('You must choose a map location to save an event.');
        return;
      }
      String newTitle = trimInput(titleInput);
      if (newTitle.length == 0) {
        form.showError('Title is required');
        return;
      }

      List<double> latlon = _currentLatLon();
      DateTime startsAt = startsAtInput.getValue();
      EventSaveRequest saveArgs = new EventSaveRequest()
        ..eventId = _eventId
        ..title = newTitle
        ..description = trimTextArea(descInput)
        ..duration = trimInput(durationInput)
        ..location = trimTextArea(locationInput)
        ..startTime = WLib.packDateEntry(startsAt.year, startsAt.month, startsAt.day, startsAt.hour, startsAt.minute)
        ..lat = latlon[0].toString()
        ..lon = latlon[1].toString();
      APIResponseBase response = await RpcLib.command('EventSave', saveArgs);
      if (response.isOK) {
        if (isNewEvent) Messages.criticalMessage('The event will be reviewed and posted later');
        hide(true);
      }
    });
    bar.addButton('Cancel', (e) {
      hide(false);
    });
  }

  ///get the current lat/lon as [lat,lon] - either from the changed values or the
  /// original values; or return [null,null] if not available
  List<double> _currentLatLon() {
    double lat = _changedLat;
    double lon = _changedLon;
    if (lat == null) {
      if (_event.lat == null) return [null, null];
      lat = double.parse(_event.lat);
      lon = double.parse(_event.lon);
    }
    return [lat, lon];
  }
}
