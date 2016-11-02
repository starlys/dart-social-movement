import 'dart:html';

///assistant in building button bars
class ButtonBarBuilder {

  DivElement _buttonsDiv = new DivElement() ..className = 'button-bar';

  ///set by main controller to a handler for things to do every time
  /// a button is pressed
  static VoidCallback systemButtonHandler;

  ///create; add the button bar to the DOM
  ButtonBarBuilder(Element parent, {String className}) {
    if (className != null) _buttonsDiv.className += ' ' + className;
    parent.append(_buttonsDiv);
  }

  ///add a button to the bar with handler
  ButtonElement addButton(String text, void handler(MouseEvent)) {
    var b = new ButtonElement() ..text = text ..className = 'button';

    //wrap handler in a function that does systemwide things
    b.onClick.listen((e) {
      if (systemButtonHandler != null) systemButtonHandler();
      handler(e);
    });
    _buttonsDiv.append(b);
    return b;
  }

  ///append an artibrary element to the bar
  void addElement(Element child) {
    _buttonsDiv.append(child);
  }
}
