import 'dart:html';
import 'dart:math';
import 'dart:async';
import 'root/pane_key.dart';
import 'client_store.dart';
import 'pane_factory.dart';
import 'rpc_lib.dart';
import 'package:models/models.dart';
import 'lib/html_lib.dart';
import 'messages.dart';
import 'lib/button_bar_builder.dart';
import 'root/globals.dart';
import 'pane/base_pane.dart';
import 'dialog/login_dialog.dart';
import 'dialog/location_dialog.dart';
import 'dialog/user_dialog.dart';
import 'main_menu_handler.dart';
import 'push_queue_handler.dart';

//main controller of client app
class MainController {

  //font & color themes; note that the readable names list corresponds to the
  // other list and that the blank item is the default theme
  static List<String> fontThemes = ['', 'theme-small', 'theme-large', 'theme-fancy'];
  static List<String> fontThemeNames = ['Default', 'Small', 'Large', 'Fancy'];
  static List<String> colorThemes = ['', 'theme-dark', 'theme-muted', 'theme-princess', 'theme-forest'];
  static List<String> colorThemeNames = ['Default', 'Dark', 'Muted', 'Princess', 'Forest'];

  //initialize app
  static Future startApp() async {

    //init libraries
    RpcLib.init();
    Messages.init();
    MainMenuHandler.init();
    UserDialog.onLogoutAccount = () => logOut(true, true);
    UserDialog.onChangeAccount = setVisibility;

    //define actions to do on every button click
    ButtonBarBuilder.systemButtonHandler = doOnUserAction;

    //notify user it started
    Messages.timed('Welcome!');

    //reset screen
    logOut(false, false);
    setVisibility();
    sizeEverything();
    applyThemes();

    //hook up events on static elements
    querySelector('#button-mystuff').onClick.listen((e) => showMyStuff(allowHide: true));
    querySelector('#button-menu').onClick.listen((e) => showMenu(allowHide: true));
    querySelector('#button-next').onClick.listen((e) => showNextInPushQueue());
    querySelector('#button-refresh').onClick.listen((e) => PushQueueHandler.refreshClicked());
    window.onHashChange.listen((e) => processUrl());
    window.onResize.listen((e) => sizeEverything());
    document.onKeyDown.listen((e) => handleHotKey(e));

    //auto-login
    String nick = ClientStore.nick ?? '';
    if (nick.length > 0) {
        try {
          await logIn(nick, ClientStore.password, false, true);
        } catch (ex) {} //can't abort startapp if this fails
    }

    //open pane referred to in URL
    try {
      await processUrl();
    } catch (ex) {} //can't abort startapp if this fails

    //if no pane was opened and not logged in (typical for first time visitor)
    //then show some helpful information
    try {
      if (Globals.nick == null && Globals.panes.length == 0) {
        await PaneFactory.create(new PaneKey('doc/s=PUB'), doScroll: false);
        await PaneFactory.create(new PaneKey('resourcetree'), doScroll: false);
      }
    } catch (ex) {} //can't abort startapp if this fails

    //show menus appropriate for login status and screen size
    if (Globals.isLargeScreen) {
      if (Globals.nick == null) {
        showMenu();
      } else {
        showMyStuff();
      }
    } else { //small
      if (Globals.panes.length == 0 && Globals.nick != null) {
        showMyStuff(); //only pop this up if nothing is showing
      }
    }

    //start push queue polling thread
    PushQueueHandler.init();
  }

  ///process the Globals.doOnUserAction queue
  static void doOnUserAction() {
    Globals.lastActivityUtc = WLib.utcNow();
    Map<String, UserActionFunc> actions = new Map.from(Globals.doOnUserAction);
    Globals.doOnUserAction.clear();
    actions.forEach((k, v) => v());
  }

  ///log out
  static void logOut(bool forget, bool notifyUser) {
    bool wasLoggedIn = Globals.nick != null;
    Globals.nick = null;
    Globals.userId = 0;
    Globals.publicName = null;
    Globals.lastPollUtc = new DateTime(1970);
    Globals.lastFullPollUtc = new DateTime(1970);
    Globals.pushQueue.clear();
    setVisibility();
    collapseAll();

    if (forget) {
      ClientStore.nick = null;
      ClientStore.password = null;
    }
    if (notifyUser && wasLoggedIn) {
      Messages.timed('Logged out');
    }
  }

  ///log in or out (called from hello link)
  static void toggleLogin() {
    //log out
    if (Globals.nick != null) {
      logOut(true, true);
      return;
    }

    //define logging in as the dialog needs it
    Future<String> loginHandlerFromDialog(String nick, String pw, bool savePW) async {
      bool ok = await logIn(nick, pw, true, savePW);
      if (ok) return null;
      return 'Account nickname or password is incorrect.';
    }

    //ask for credentials
    LoginDialog dlg = new LoginDialog(loginHandlerFromDialog);
    dlg.show();
  }

  ///attempt login; return true on success
  static Future<bool> logIn(String nick, String password, bool notifyUser, bool savePW) async {
    //login
    var req = new APIRequestBase(nick: nick, password: password);
    AuthenticateResponse auth = await RpcLib.authenticate(req);

    //if ok, store creds
    if (auth.base.isOK) {
      Globals.nick = auth.nick;
      Globals.password = password;
      Globals.userId = auth.userId;
      Globals.publicName = auth.publicName;
      Globals.isSiteAdmin = auth.isSiteAdmin == 'Y';
      if (savePW) {
        ClientStore.nick = nick;
        ClientStore.password = password;
      } else {
        ClientStore.password = null;
      }
      if (notifyUser) Messages.timed('Logged in.');
      setVisibility();
      sizeEverything();
      PushQueueHandler.init();
      if (Globals.isLargeScreen) showMyStuff();
    }
    else {
      if (notifyUser) Messages.timed('Account nickname or password is incorrect.');
    }
    return auth.base.isOK;
  }

  ///size the scrollspace to a big or normal amount (use big while dealing with panes
  /// so it doesn't scroll unnecessarily)
  static void sizeScrollSpace(bool big) {
    int h = max(20, window.innerHeight - 500); //was: wh - 300, or wh ~/ 5
    if (big) h = 500;
    HtmlLib.height('#scrollspace', h);
  }

  ///set all elements size/position for current screen size
  static void sizeEverything() {
    var delayed = () {
      //get sizes
      int wh = window.innerHeight,
        hh = querySelector('#header').clientHeight;
        //fh = $('#footer').height;
      int mh = wh - hh - 20;
      bool isLargeScreen = window.innerWidth > 1200;
      int leftw = isLargeScreen ? 400 : 0;
      bool modeChanged = isLargeScreen != Globals.isLargeScreen;
      Globals.isLargeScreen = isLargeScreen;

      //set sizes
      HtmlLib.height('#middle', mh);
      sizeScrollSpace(false);
      HtmlLib.width('#main1', min(700, window.innerWidth - leftw - 2));

      //set popup sizes
      String popupmax = HtmlLib.asPx(mh - 70);
      final $ = document.querySelector;
      $('#mystuff1').style.maxHeight = popupmax;
      $('#menu1').style.maxHeight = popupmax;
      $('#mystuff2').style.maxHeight = popupmax;
      $('#menu2').style.maxHeight = popupmax;

      //position popupconnector vertically (it gets horz position elsewhere)
      var btnrect = $('#button-menu').getBoundingClientRect();
      $('#popupconnector').style
        ..bottom = HtmlLib.asPx(wh - btnrect.top - 1);

      if (modeChanged) {
        HtmlLib.width('#left', leftw);
        hideMenuPanels();
      }
    };
    Timer.run(delayed);
  }

  ///application wide handler for hot keys
  static void handleHotKey(KeyboardEvent e) {
    bool handled = false;
    if (e.ctrlKey) {
      handled = true;
      if (e.keyCode == KeyCode.SPACE) showNextInPushQueue();
      else if (e.keyCode == KeyCode.M) showMenu();
      else if (e.keyCode == KeyCode.I) showMyStuff();
      else if (e.keyCode == KeyCode.Q) logOut(true, true);
      else if (e.keyCode == KeyCode.H) collapseAll();
      else handled = false;
    }
    if (!handled && Globals.panes.length > 1)
      handled = Globals.panes.last.handleHotKey(e);
    if (!handled && e.keyCode == KeyCode.ESC) {
      handled = true;
      hideMenuPanels();
    }
    if (handled) e.preventDefault();
  }

  ///apply themes found in ClientStore
  static void applyThemes() {
    //remove existing themes
    var page = querySelector('#page');
    for (String c in fontThemes.skip(1)) page.classes.remove(c);
    for (String c in colorThemes.skip(1)) page.classes.remove(c);

    //add theme
    String fontTheme = ClientStore.fontTheme ?? '';
    if (fontTheme.length > 0) page.classes.add(fontTheme);
    String colorTheme = ClientStore.colorTheme ?? '';
    if (colorTheme.length > 0) page.classes.add(colorTheme);
  }

  ///change the URL fragment to the given pane Key
  static void changeUrlFragment(String pkfull) {
    String oldFragment = Uri.base.fragment;
    if (oldFragment == pkfull) return;
    String newUrl = Uri.base.removeFragment().toString() + '#' + pkfull;
    Globals.urlChangedInCode = true;
    window.location.assign(newUrl);
  }

  ///open pane based on current URL
  static Future processUrl() async {
    //ignore if changed by our code
    if (Globals.urlChangedInCode) {
      Globals.urlChangedInCode = false;
      return;
    }

    //ignore if the fragment already indicates the last open pane
    String paneKey = Uri.base.fragment;
    if (Globals.panes.length > 0) {
      BasePane lastPane = Globals.panes.last;
      if (lastPane.paneKey.full == paneKey && !lastPane.isCollapsed) return;
    }

    //open pane specified in fragment
    if (paneKey.length == 0) return;
    await PaneFactory.create(new PaneKey(paneKey));
  }

  ///set visibility of elements based on login status
  /// (also set public name)
  static void setVisibility() {
    var $ = document.querySelector;
    Element logInOut = new ButtonElement() ..onClick.listen((e) => toggleLogin());
    Element hello = $('#hello');
    hello.innerHtml = '';
    bool isLoggedIn = Globals.nick != null;
    bool wasLoggedIn = $('#button-next').style.display != 'hidden';
    bool changedStatus = wasLoggedIn != isLoggedIn;
    if (changedStatus) {
      hideMenuPanels();
    }
    if (isLoggedIn) {
      logInOut.text = 'Log Out';
      hello.appendText('Hello ${Globals.publicName} ');
      $('#button-next').style.visibility = 'visible';
      $('#button-mystuff').style.visibility = 'visible';
    } else {
      logInOut.text = 'Log In';
      hello.appendText('(not logged in) ');
      $('#mystuff1').style.visibility = 'hidden';
      $('#button-next').style.visibility = 'hidden';
      $('#button-mystuff').style.visibility = 'hidden';
    }
    hello.append(logInOut);
    MainMenuHandler.setVisibility(isLoggedIn);
  }

  ///hide both menu panels
  static void hideMenuPanels() {
    Globals.myStuffShowing = false;
    Globals.menuShowing = false;
    var $ = document.querySelector;
    $('#mystuff1').style.display = 'none';
    $('#menu1').style.display = 'none';
    $('#popupconnector').style.display = 'none';
    $('#button-mystuff').style.borderTopWidth = '1px';
    $('#button-menu').style.borderTopWidth = '1px';
  }

  ///show my-stuff panel
  static void showMyStuff({bool allowHide: false}) {
    var $ = document.querySelector;
    bool wasShowing = Globals.myStuffShowing;
    hideMenuPanels();
    if (allowHide && wasShowing) return;
    $('#mystuff1').style.visibility = 'visible';
    Globals.myStuffShowing = true;
    _showPopupConnector($('#button-mystuff'));
  }

  ///show menu panel
  static void showMenu({bool allowHide: false}) {
    bool wasShowing = Globals.menuShowing;
    hideMenuPanels();
    if (allowHide && wasShowing) return;
    querySelector('#menu1').style.visibility = 'visible';
    Globals.menuShowing = true;
    _showPopupConnector(querySelector('#button-menu'));
  }

  //display a slice of color to connect the buttons with the popup panel
  static void _showPopupConnector(Element over) {
    var btnrect = over.getBoundingClientRect();
    querySelector('#popupconnector').style
      ..display = 'block'
      ..width = HtmlLib.asPx(btnrect.width - 2)
      ..left = HtmlLib.asPx(btnrect.left);
  }

  ///handle Next button
  static void showNextInPushQueue() {
    PushQueueHandler.showNext();
  }

  ///collapse all panes
  static void collapseAll() {
    for (BasePane p in Globals.panes) p.collapse();
  }

  ///optionally ask the user for their earth location, then store
  /// in ClientStore. Caller should check ClientStore after this
  /// Future is completed, to see if it was successful.
  static Future userSetLocation(bool forced) async {
    //skip if location already known
    if (!forced && ClientStore.lon != 0) return;

    //show LocationDialog then store in ClientStore if successful
    LocationDialog dlg = new LocationDialog(ClientStore.lat, ClientStore.lon);
    List<double> latlon = await dlg.show();
    if (latlon != null) {
      ClientStore.lat = latlon[0];
      ClientStore.lon = latlon[1];
    }
  }
}
