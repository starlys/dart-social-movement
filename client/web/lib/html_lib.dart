import 'dart:html';
import 'dart:convert';

///html helpers
class HtmlLib {
  static int _maxid = 0;

  static final String MORE = 'More';

  ///convert a number N to string 'Npx'
  static String asPx(dynamic n) {
    if (n is double)
      return n.toInt().toString() + 'px';
    return n.toString() + 'px';
  }

  ///generate a unique ID for html elements
  static String uniqueId() {
    return 'e' + (++_maxid).toString();
  }

  ///set element height in px
  static void height(String selector, int h) {
    querySelector(selector).style.height = asPx(h);
  }

  ///set element width in px
  static void width(String selector, int h) {
    querySelector(selector).style.width = asPx(h);
  }

  ///show or hide an element using style.display (note: hidden doesn't
  /// work for all elements). Uses inline-block to show
  static void showViaStyle(String selector, bool show) {
    querySelector(selector).style.display = show ? 'inline-block' : 'none';
  }

  ///wrapper to insertCollapsed2 with a single string and collapse position
  static void insertCollapsed1(Element parent, String collapsible,
    {int collapsePosition:150, String moreMessage:null, bool hideInitial:false}) {
    collapsible = collapsible ?? '';
    if (collapsible.length > collapsePosition + 20) {
      String first = collapsible.substring(0, collapsePosition);
      String second = collapsible.substring(collapsePosition);
      insertCollapsed2(parent, first, second, moreMessage: moreMessage, hideInitial: hideInitial);
    } else {
      parent.appendHtml(unsafeStringToSafeHtmlWithLineBreaks(collapsible), treeSanitizer: NodeTreeSanitizer.trusted);
      //parent.appendText(collapsible);
    }
  }

  ///add a string as the last child of parent, but separated into an initially-
  /// visible part (first), a message like "More" (moreMessage), and an
  /// initially-hidden part (second); hook up events for doing the expansion.
  /// If hideInitial is true, hides first on expansion.
  /// Moremessage may be null for default. Converts linebreaks to br.
  static void insertCollapsed2(Element parent, String first,
    String second, {String moreMessage: null, bool hideInitial: false}) {

    if (moreMessage == null) moreMessage = MORE;
    SpanElement firstE = new SpanElement();
    setTextWithLineBreaks(firstE, first);
    SpanElement moreE = new SpanElement() ..text = moreMessage ..className = 'text-expander';
    SpanElement secondE = new SpanElement() ..style.display = 'none';
    setTextWithLineBreaks(secondE, second);
    parent.append(firstE);
    parent.append(moreE);
    parent.append(secondE);
    moreE.onClick.listen((e) {
      if (hideInitial) firstE.remove();
      moreE.remove();
      secondE.style.display = '';
    });
  }

  ///add OptionElement elements under a SelectElement, for each item
  /// in the given list (converts to String as needed); sets text and value to the same thing
  static void addOptionElements(SelectElement sel, List options) {
    for (dynamic opt in options) sel.append(new OptionElement()
      ..value = opt.toString()
      ..text = opt.toString());
  }

  ///create, append and return a scrolling div with the given max height
  static DivElement appendScrollingDiv(Element parent, {int maxHeight:200}) {
    DivElement s = new DivElement() ..className = 'scroll-list' ..style.maxHeight = asPx(maxHeight);
    parent.append(s);
    return s;
  }

  ///add a link to another pane in the parent; the link will show as a div;
  /// paneKey should not include the fragment char '#'
  static void appendLinkToPane(Element parent, String title, String paneKey,
    {bool asDiv: true}) {
    var a = new AnchorElement()..href = '#' + paneKey ..text = title;
    if (asDiv) a.style.display = 'block';
    parent.append(a);
  }

  ///parse a text area into a list of strings, allowing for \r\n or \n delimiters
  static List<String> textAreaValueToLines(TextAreaElement el, {bool removeBlanks: false}) {
    var lines = el.value.split('\n').map((s) => s.replaceAll('\r', '')).cast<String>().toList();
    if (removeBlanks) {
      lines = lines.map((o) => o.trim()).where((o) => o.length > 0).toList();
    }
    return lines;
  }

  ///return a safe html string given an unsafe string that might have line breaks;
  /// the result may have <br> tags but is guaranteed to have no other html
  /// tags
  static String unsafeStringToSafeHtmlWithLineBreaks(String s) {
    HtmlEscape escaper = const HtmlEscape();
    s = escaper.convert(s);
    s = s.replaceAll('\r', '').replaceAll('\n', '<br/>');
    return s;
  }

  ///set the text of an element while changing \r\n to <br>, by
  /// setting the innerHtml to a sanitized string, disallowing tags other than
  /// br.
  static void setTextWithLineBreaks(Element el, String text) {
    el.setInnerHtml(unsafeStringToSafeHtmlWithLineBreaks(text), treeSanitizer: NodeTreeSanitizer.trusted,
      validator: null);
  }
}
