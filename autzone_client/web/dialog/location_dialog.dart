import 'dart:async';
import 'dart:html';
import 'dart:js' show context, JsObject;
import '../messages.dart';
import '../lib/dialog_box.dart';
import '../lib/html_lib.dart';
import '../lib/button_bar_builder.dart';

///dialog to obtain geolocation from address lookup or map click;
/// return value is null if canceled or a List<double> with 2 entries [lat, lon]
class LocationDialog extends DialogBox {
  //static vars - see staticInit
  static var _googleMaps, _map, _geocoder; //google maps objects
  static Element _mapCubbyhole; //the owner of the map div when not shown
  static Element
      _mapDiv; //this gets moved between the cubbyhole and the dialog (see notes in staticInit)

  List<double> _latLon; //initial and return value
  var _marker; //most recently set marker (this is a google maps type)
  var _mapClickSubscription; //listener

  ///initialize static vars: since google maps can't be recreated each time the
  /// dialog shows, we have to create it in a hidden div that's always on the
  /// page, and then when the dialog is in use, move that hidden div to the dialog
  /// and then move it back when done
  static void _staticInit() {
    //set up references to js objects
    if (_googleMaps != null) return;
    _googleMaps = context['google']['maps'];

    //create the div for the map (in the main page body, hidden)
    _mapCubbyhole = new DivElement()..style.display = 'none';
    document.body.append(_mapCubbyhole);
    _mapDiv = new DivElement()..id = HtmlLib.uniqueId();
    _mapCubbyhole.append(_mapDiv);
    _mapDiv.style
      ..zIndex = '5'
      ..margin = '4px'
      ..width = '100%'
      ..height = '380px';
    var mapTypeId = _googleMaps['MapTypeId']['ROADMAP'];
    var mapOptions = new JsObject.jsify({
      //"center": center,
      "zoom": 15,
      "mapTypeId": mapTypeId,
      'mapTypeControl': false,
      'streetViewControl': false,
      'fullscreenControl': false
    });
    _map = new JsObject(_googleMaps['Map'], [_mapDiv, mapOptions]);
    _geocoder = new JsObject(_googleMaps['Geocoder'], []);
  }

  ///pass null or 0 if unknown
  LocationDialog(double lat, double lon) : super() {
    if (lat != null && lat != 0) {
      _latLon = [lat, lon];
    }
  }

  @override
  int dialogHeight() {
    return 500;
  }

  Future build() async {
    //main content: the map 'borrower' is the parent that stays on this
    //dialog as the parent of the map div. The map div gets moved from its
    //'cubbyhole' to the 'borrower' while this dialog is active; then it
    //is put back at the end
    DivElement streetDiv = new DivElement();
    TextInputElement streetInp = new TextInputElement()
      ..maxLength = 400
      ..style.width = '170px';
    streetDiv.append(streetInp);
    ButtonElement streetBtn = new ButtonElement()
      ..text = 'Lookup Address or Zip/Postal code';
    streetDiv.append(streetBtn);
    frame.append(streetDiv);
    DivElement mapBorrower = new DivElement();
    frame.append(mapBorrower);
    frame.appendText(
        'You can drag the map to scroll, zoom in or out, then click on the exact location to set the marker.');

    //hook up google maps and move div to the borrower
    _staticInit();
    mapBorrower.append(_mapDiv);

    //scroll map to the caller's position if any
    if (_latLon != null) {
      var center = new JsObject(_googleMaps['LatLng'], _latLon);
      _setMarker(center, true);
    }

    //street button event
    streetBtn.onClick.listen((e) {
      String addr = streetInp.value.trim();
      if (addr.length == 0) return;
      var geoOptions = new JsObject.jsify({'address': addr});
      _geocoder.callMethod('geocode', [
        geoOptions,
        (results, status) {
          if (status == _googleMaps['GeocoderStatus']['OK']) {
            var loc = results[0]['geometry']['location'];
            _setMarker(loc, true);
          } else {
            Messages.timed('Geocode was not successful: ' + status);
          }
        }
      ]);
    });

    //click on map event (note this event must be unsubscribed in the hide
    // function because it's an event on a static variable)
    _mapClickSubscription = _googleMaps['event'].callMethod('addListener', [
      _map,
      'click',
      (e) {
        var loc = e['latLng'];
        _setMarker(loc, false);
      }
    ]);

    //button bar
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('Use This Location', (e) {
      if (_latLon == null) {
        Messages.timed('Search for location or click map first');
        return null;
      }
      hide(_latLon);
      return null;
    });
    bar.addButton('Cancel', (e) {
      hide(null);
      return null;
    });
  }

  ///see notes in staticInit and init
  @override
  void hide(dynamic value) {
    //remove marker
    if (_marker != null) {
      _marker.callMethod('setMap', [null]);
      _marker = null;
    }

    //put map back in cubbyhole
    _mapCubbyhole.append(_mapDiv);
    super.hide(value);

    //unhook events
    _googleMaps['event'].callMethod('removeListener', [_mapClickSubscription]);
  }

  ///convert a js object containing location into [lat,lon]
  List<double> _googleLocToLatLon(dynamic loc) {
    String s = loc.toString(); //in format '(lat,lon)'
    s = s.substring(1, s.length - 2); //remove parens
    List<String> parts = s.split(',');
    double lat = double.parse(parts[0]);
    double lon = double.parse(parts[1]);
    return [lat, lon];
  }

  ///set a marker on the map and remove any previous marker;
  /// the marker will be the return value
  void _setMarker(dynamic loc, bool centerMap) {
    //remove old
    if (_marker != null) {
      _marker.callMethod('setMap', [null]);
      _marker = null;
    }

    //center map and add marker
    if (centerMap) _map.callMethod('setCenter', [loc]);
    var markerOptions = new JsObject.jsify({"map": _map, "position": loc});
    _marker = new JsObject(_googleMaps['Marker'], [markerOptions]);

    //store our return value from this dialog
    _latLon = _googleLocToLatLon(loc.toString());
  }
}
