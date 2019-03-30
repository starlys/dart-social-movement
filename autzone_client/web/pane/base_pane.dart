import 'dart:html';
import 'dart:async';
import '../root/pane_key.dart';
import '../pane_factory.dart';
import '../lib/html_lib.dart';
import '../lib/button_bar_builder.dart';
import 'package:autzone_models/autzone_models.dart';

typedef void PaneHandler(BasePane);

///base class for all panes; see programmer doc for DOM layout notes
class BasePane {
  //private vars
  bool _isCollapsed = false; //set true when collapsed, can never be opened again

  ///key, such as 'proposal/1' or 'notify/123', used in url fragment
  /// If this changes after initialization, use changePaneKey event.
  PaneKey paneKey;

  ///DOM id of the pane-border element
  String borderId = HtmlLib.uniqueId();

  ///pane-border element
  DivElement borderElement;

  ///DOM id of the pane-body element
  String bodyId = HtmlLib.uniqueId();

  ///pane-body element
  DivElement bodyElement;

  ///main button bar for pane
  ButtonBarBuilder paneMenuBar;

  ///if set, function is called when pane collapses
  PaneHandler onCollapse;

  ///if set, function is called when pane's key changes
  PaneHandler onChanePaneKey;

  ///true if pane is collapsed
  bool get isCollapsed => _isCollapsed;

  ///initialize pane.
  /// Derived classes must add pane HTML to DOM.
  Future init(PaneKey pk) async {
    paneKey = pk;
  }

  ///change this pane's key and raise event
  void changePaneKey(PaneKey pk) {
    paneKey = pk;
    if (onChanePaneKey != null) onChanePaneKey(this);
  }

  ///collapse pane - remove content and replace with link to the content
  void collapse() {
    if (_isCollapsed) return;

    //remove content
    _isCollapsed = true;
    borderElement.querySelector('.pane-body').remove();
    borderElement.querySelector('.pane-menubar').remove();

    //add a reopen link
    AnchorElement reopener = new AnchorElement() ..href = '#' + paneKey.full ..text = 'reopen';
    Element header = borderElement.querySelector('.pane-header');
    header.appendText(' (');
    header.append(reopener);
    header.appendText(')');

    if (onCollapse != null) onCollapse(this);
  }

  ///handle hot key; return true if handled
  bool handleHotKey(KeyboardEvent e) {
    return false;
  }

  ///call from derived classes only
  ///create pane element showing title and subtitle
  ///in the form {icon} {title}\n{subtitle}
  ///where paneclass is the css class to apply to the .pane element (such as
  /// conv, doc). Add to DOM, scroll, and hook up close button.
  ///Title is chopped to 45 chars;
  /// iconName is without the png or path, like 'paneconv', or null
  void buildSkeletonHtml2({String paneClass, String iconHoverText, String iconName, String title, String subtitle,
    String subtitlePaneKey}) {
    title = WLib.chop(title ?? '', 45, addEllipsis: true);
    Element main2 = querySelector('#main2');

    //construct elements
    DivElement paneBorder = new DivElement() ..id = borderId ..className = 'pane-border',
      pane = new DivElement()..className = 'pane ' + paneClass,
      paneHeader = new DivElement()..className = 'pane-header',
      paneSubheader = new DivElement()..className = 'pane-subheader',
      paneBody = new DivElement()..id = bodyId ..className = 'pane-body';
    ButtonElement paneReopen = new ButtonElement() ..className = 'pane-reopen' ..title = 'Refresh',
      //paneClose = new ButtonElement()..className = 'pane-close' ..title = 'Close',
      paneMin = new ButtonElement()..className = 'pane-min' ..title = 'Collapse';

    //add parent-child relationships and other spans/links
    paneBorder.append(pane);
    pane.append(paneHeader);
    if (iconName != null) paneHeader.append(new ImageElement() ..src = 'images/${iconName}.png' ..title = iconHoverText ?? '');
    paneHeader.append(new SpanElement() ..text = title  ..className = 'pane-title');
    paneHeader.append(paneSubheader);
    if (subtitle != null) {
      paneSubheader.append(new AnchorElement() ..text = subtitle ..href = '#' + subtitlePaneKey);
    }
    pane.append(paneBody);
    paneBody.text = 'loading...';
    paneMenuBar = new ButtonBarBuilder(pane, className: 'pane-menubar');
    paneMenuBar.addElement(paneMin);
    //paneMenuBar.addElement(paneClose); //disabled; see note below; styles still exist
    paneMenuBar.addElement(paneReopen);

    //add to DOM
    main2.insertBefore(paneBorder, querySelector('#scrollspace'));
    borderElement = paneBorder;
    bodyElement = paneBody;

    //events
    paneMin.onClick.listen((e) {
      collapse();
    });
    paneReopen.onClick.listen((e) {
      recreatePane();
    });
    //paneClose.onClick.listen((e) { //disabled because people should collapse panes to allow undo; closing is too permanent
      //PaneFactory.delete(this);
    //});
  }

  ///change the pane title
  void retitle(String title) {
    Element el = borderElement.querySelector('.pane-title');
    el.text = title;
  }

  ///clears the loading message (any anything else in bodyElement)
  void clearLoadingMessage() {
    bodyElement.text = '';
  }

  ///trim an input (convenience for derived classes)
  String trimInput(InputElement i) => i.value.trim();

  ///trim an input (convenience for derived classes)
  String trimInputArea(TextAreaElement i) => i.value.trim();

  ///completely destroy and recreate the pane with the same key
  void recreatePane() {
    PaneFactory.create(paneKey);
  }

}
