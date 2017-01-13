import 'dart:html';
import 'dart:math';
import 'dart:async';
import 'html_lib.dart';
// ignore: uri_does_not_exist
import '../client_store.dart';

///manages modal dialog life cycle. Derived classes should override
/// build to fill up the frame with content. Callers only need
/// to call show().
class DialogBox {
  bool _showing = false;
  Completer _continuation;
  Element _backdrop; //added to DOM in show()
  Element frame; //added to DOM in show()

  DialogBox() {
    _backdrop = new DivElement() ..className = 'dialog-backdrop';
    frame = new DivElement() ..className = 'dialog-frame';
  }

  ///when overridden, builds dialog box content
  Future build() async {
  }

  ///when overridden, finishes up the setup after content is shown
  Future afterShown() async {
  }

  ///get dialog height (override in derived class)
  int dialogHeight() {return 300;}

  ///get typical control width for input and textarea (override in derived class)
  int typicalControlWidth() {return 400;}

  ///show dialog; return value depends on the derived class
  Future<dynamic> show() async {
    if (_showing) return _continuation.future;
    await build();

    //size
    int width = min(600, window.innerWidth - 10);
    int height = min(dialogHeight(), window.innerHeight - 90);
    frame.style.height = HtmlLib.asPx(height);
    frame.style.width = HtmlLib.asPx(width);

    //theme (coloring the dialogs doesn't work so well)
    String fontTheme = ClientStore.fontTheme ?? '';
    if (fontTheme.length > 0) frame.classes.add(fontTheme);
    //String colorTheme = ClientStore.colorTheme ?? '';
    //if (colorTheme.length > 0) frame.classes.add(colorTheme);

    //add to DOM
    document.body.append(_backdrop);
    document.body.append(frame);
    _showing = true;
    await afterShown();
    _continuation = new Completer();
    return await _continuation.future;
  }

  ///hide/destroy dialog and pass value through to the future returned by show
  /// (This is usually called by event handlers in the derived class)
  void hide(dynamic value) {
    if (!_showing) return;
    frame.remove();
    _backdrop.remove();
    _showing = false;
    _continuation.complete(value);
  }

  ///trim an input (convenience for derived classes)
  String trimInput(InputElement i) => i.value.trim();

  ///trim a textarea input (convenience for derived classes)
  String trimTextArea(TextAreaElement i) => i.value.trim();
}
