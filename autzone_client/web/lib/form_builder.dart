import 'dart:html';
import 'html_lib.dart';

///builds simple tables for entry forms
class FormBuilder {
  Element _parent; //parent of table
  TableElement _table = new TableElement() ..className = 'formtable';
  DivElement _error = new DivElement() ..className = 'error';

  FormBuilder(Element parent, String formTitle) {
    _parent = parent;
    _parent.appendHtml('<b>${formTitle}</b>');
    _parent.append(_error);
    _parent.append(_table);
  }

  Element get parent => _parent;

  ///show an error message at the top of the form
  void showError(String s) {
    _error.text = s;
    _error.scrollIntoView();
  }

  ///add a text input field
  InputElement addInput(String caption, int width, int maxLength, [String value = '']) {
    TextInputElement inp = new TextInputElement() ..style.width = HtmlLib.asPx(width)
      ..maxLength = maxLength
      ..value = value;
    addAny(caption, inp);
    return inp;
  }

  ///add a password input field
  PasswordInputElement addPasswordInput(String caption, int width, int maxLength, [String value = '']) {
    PasswordInputElement inp = new PasswordInputElement() ..style.width = HtmlLib.asPx(width)
      ..maxLength = maxLength
      ..value = value;
    addAny(caption, inp);
    return inp;
  }

  ///add a textarea input field
  TextAreaElement addTextArea(String caption, int width, int height, int maxLength, [String value = '']) {
    TextAreaElement inp = new TextAreaElement() ..style.width = HtmlLib.asPx(width)
      ..style.height = HtmlLib.asPx(height)
      ..maxLength = maxLength
      ..value = value;
    addAny(caption, inp);
    return inp;
  }

  ///add any control
  void addAny(String caption, Element ctrl) {
    var row = _table.addRow();
    row.addCell() ..text = caption ..style.verticalAlign = 'top';
    row.addCell().append(ctrl);
  }

  ///add an explanation div after the given element
  void addExplanation(Element el, String text) {
    DivElement div = new DivElement() ..className = 'explain' ..text = text;
    el.insertAdjacentElement('afterEnd', div);
  }

  ///add a row with any control on the left (where the captions normally are)
  /// and any control on the right
  void addAnyAny(Element leftCtrl, Element rightCtrl) {
    var row = _table.addRow();
    row.addCell().append(leftCtrl);
    row.addCell().append(rightCtrl);
  }

  ///add a bordered frame in the table with a nested FormBulder in it;
  /// the parent element of the subform is the border div
  FormBuilder addSubformFrame(String caption) {
    var row = _table.addRow();
    var cell = row.addCell() ..colSpan = 2;
    var border = new DivElement() ..className = 'subform-group';
    cell.append(border);
    FormBuilder subform = new FormBuilder(border, caption);
    return subform;
  }
}
