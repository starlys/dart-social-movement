import 'dart:html';
import 'main_controller.dart';
import 'pane_factory.dart';
import 'client_store.dart';
import 'dialog/user_dialog.dart';
import 'dialog/event_dialog.dart';
import 'root/globals.dart';
import 'lib/html_lib.dart';

///constructs html and handles user events on main menu
class MainMenuHandler {
  static DivElement _panel;
  static List<Element> _loggedInOnlyItems, _loggedOutOnlyItems;

  ///one-time initializer
  static void init() {
    //index current theme names or -1
    int colorThemeIndex = MainController.colorThemes.indexOf(ClientStore.colorTheme);
    int fontThemeIndex = MainController.fontThemes.indexOf(ClientStore.fontTheme);

    //create all items
    var $ = document.querySelector;
    _panel = $('#menu2');
    int year = (new DateTime.now()).year;

    addItem('Recent additions to site', 'panecross', () => PaneFactory.createFromString('cross'));

    addHeading('Resources - books, web, etc.', 'HELPRES');
    addItem('Browse/Create resources by category', 'paneresource', () => PaneFactory.createFromString('resourcetree'));
    addItem('Search resources by keyword', 'paneresource', () => PaneFactory.createFromString('resources'));

    addHeading('Projects and conversations', 'HELPPROJ');
    addItem('Browse/Create projects by category', 'paneproject', () => PaneFactory.createFromString('projecttree'));
    addItem('Search projects by keyword', 'paneproject', () => PaneFactory.createFromString('projectsearch'));
    addItem('Search in all conversations', 'paneconv', () => PaneFactory.createFromString('convsearch'));

    addHeading('Local events', 'HELPEV');
    addItem('Find events', 'paneevent', () => PaneFactory.createFromString('events'));
    addItem('Create an event', 'paneevent', () => (new EventDialog(0, null).show()));

    addHeading('Organizing the movement', 'HELPORG');
    addItem('Movement agenda & documents', 'panedoc', () => PaneFactory.createFromString('rootdocs'));
    addItem('Proposed changes - active', 'paneproposal', () => PaneFactory.createFromString('proposals-active'));
    addItem('System changes', 'paneproposal', () => PaneFactory.createFromString('proposals-sys/${year}'));

    addHeading('Accounts and settings', 'HELPSET');
    Element loginItem = addItem('Log In', null, () => MainController.toggleLogin());
    Element profileItem = addItem('My Profile', 'paneuser', () => PaneFactory.createFromString('user/${Globals.userId}'));
    Element logoutItem = addItem('Log Out', null, () => MainController.toggleLogin(), hover:'Shortcut: Ctrl-Q');
    Element createAccountItem = addItem('Create Account', null, () { new UserDialog(0).show(); });
    addItem('Find a user', 'paneuser', () => PaneFactory.createFromString('users'));
    addItem('Collapse All', null, () => MainController.collapseAll(), hover:'Shortcut: Ctrl-H');
    SelectElement colorSelect = addDropdown('Colors', MainController.colorThemeNames, colorThemeIndex);
    SelectElement fontSelect = addDropdown(' Fonts', MainController.fontThemeNames, fontThemeIndex);

    //save the items that are only shown based on login status
    _loggedInOnlyItems = [profileItem, logoutItem];
    _loggedOutOnlyItems = [loginItem, createAccountItem];

    //events for dropdowns
    colorSelect.onChange.listen((e) {
      String code = MainController.colorThemes[colorSelect.selectedIndex];
      ClientStore.colorTheme = code;
      MainController.applyThemes();
    });
    fontSelect.onChange.listen((e) {
      String code = MainController.fontThemes[fontSelect.selectedIndex];
      ClientStore.fontTheme = code;
      MainController.applyThemes();
    });

  }

  ///set menu item visibility based on login status
  static void setVisibility(bool isLoggedIn) {
    void makevis(Element e2, bool v2) {
      String styleDisplay = v2 ? 'inline-block' : 'none';
      e2.style.display = styleDisplay;
      Element assocIcon = e2.previousElementSibling;
      if (assocIcon is ImageElement) assocIcon.style.display = styleDisplay;
    }
    for (Element e in _loggedInOnlyItems) makevis(e, isLoggedIn);
    for (Element e in _loggedOutOnlyItems) makevis(e, !isLoggedIn);
  }

  ///add a heading to the panel, with a help icon
  static void addHeading(String heading, String helpDocCode) {
    _panel.appendHtml('<h2>${heading} <a href="#doc/s=${helpDocCode}"><img src="images/help_dim.png" /></a></h2>');
  }

  ///add a menu item to the panel; icon can be null
  static Element addItem(String s, String iconName, VoidCallback handler, {String hover: null}) {
    DivElement div = new DivElement();
    _panel.append(div);
    if (iconName != null) div.appendHtml('<img src="images/${iconName}.png" />');
    ButtonElement link = new ButtonElement() ..text = s;
    if (iconName == null) link.style.marginLeft = '26px';
    div.append(link);
    if (hover != null) link.title = hover;
    link.onClick.listen((e) {
      //done in panefactory now: if (!Globals.isLargeScreen) MainController.hideMenuPanels();
      handler();
    });
    return link;
  }

  ///add a select item to the panel - NOT in a separate div
  static Element addDropdown(String title, List<String> values, int selectedIndex) {
    SelectElement dd = new SelectElement();
    HtmlLib.addOptionElements(dd, values);
    if (selectedIndex >= 0) dd.selectedIndex = selectedIndex;
    var div = new DivElement() ..style.display = 'inline-block';
    div.appendText(title);
    div.appendText(': ');
    div.append(dd);
    _panel.append(div);
    return dd;
  }
}
