import 'dart:html';
import 'html_lib.dart';

///builds simple tables for card-style displays (with headings down the left column)
class CardBuilder {
  Element _parent; //parent of table
  TableElement _table = new TableElement() ..className = 'cardtable';

  CardBuilder(Element parent) {
    _parent = parent;
    _parent.append(_table);
  }

  ///add a row with the given caption and return the parent of the right side
  /// cell, so the caller can add anything there
  Element addAny(String caption) {
    var row = _table.addRow();
    row.append(new Element.th() ..text = caption);
    TableCellElement c = row.addCell();
    return c;
  }

  ///add a row with text
  void addText(String caption, String text, {bool useCollapser: false}) {
    Element c = addAny(caption);
    if (useCollapser) HtmlLib.insertCollapsed1(c, text);
    else c.text = text;
  }

  ///add a hyperlink row (uses target=_blank)
  void addHyperlink(String caption, String text, String href) {
    Element c = addAny(caption);
    c.append(new AnchorElement() ..href = href ..text = text ..target = '_blank');
  }

  ///add a pane-link row for opening a new pane
  void addPaneLink(String caption, String text, String paneKey) {
    Element c = addAny(caption);
    HtmlLib.appendLinkToPane(c, text, paneKey);
  }
}
