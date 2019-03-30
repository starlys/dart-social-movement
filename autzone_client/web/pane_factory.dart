import 'dart:async';
import 'dart:html';
import 'push_queue_handler.dart';
import 'root/pane_key.dart';
import 'lib/html_lib.dart';
import 'pane/base_pane.dart';
import 'pane/notify_pane.dart';
import 'pane/project_tree_pane.dart';
import 'pane/project_pane.dart';
import 'pane/project_search_pane.dart';
import 'pane/project_members_pane.dart';
import 'pane/conv_search_pane.dart';
import 'pane/conv_pane.dart';
import 'pane/root_docs_pane.dart';
import 'pane/doc_pane.dart';
import 'pane/resource_tree_pane.dart';
import 'pane/active_proposal_list_pane.dart';
import 'pane/sys_proposal_list_pane.dart';
import 'pane/proposal_pane.dart';
import 'pane/event_search_pane.dart';
import 'pane/event_pane.dart';
import 'pane/resource_search_pane.dart';
import 'pane/resource_pane.dart';
import 'pane/user_search_pane.dart';
import 'pane/user_pane.dart';
import 'root/globals.dart';
import 'package:autzone_models/autzone_models.dart';
import 'main_controller.dart';

///logic to create empty panes
class PaneFactory {

  ///create a pane from the string represetation of a pane key,
  /// add to globals, show on screen and initialize
  static Future<BasePane> createFromString(String pkfull) async {
    return await create(new PaneKey(pkfull));
  }

  ///create a pane from a pane key, add to globals,
  /// show on screen and initialize
  static Future<BasePane> create(PaneKey pk, {bool doScroll: true}) async {
    //record activity
    Globals.lastActivityUtc = WLib.utcNow();
    MainController.doOnUserAction();

    //remember prior conditions
    Element main1 = querySelector('#main1');
    int priorScrollHeight = main1.scrollHeight - main1.clientHeight + 100;
    bool isReopeningLastPane = Globals.panes.length > 0 && Globals.panes.last.paneKey.isIdenticalTo(pk);

    //expand scrollspace while closing and opening things
    MainController.sizeScrollSpace(true);

    //delete existing panes with same key
    BasePane existingSamePane = Globals.panes.firstWhere((p) => p.paneKey.isLike(pk), orElse: () => null);
    bool waitForCloseAnimation = false;
    if (existingSamePane != null) {
      waitForCloseAnimation = Globals.panes.last != existingSamePane;
      delete(existingSamePane);
    }

    //delete panes if >500 total
    while(Globals.panes.length > 500) delete(Globals.panes[0]);

    //collapse panes to ensure only 10 are expanded
    int numExpanded = Globals.panes.where((p) => !p.isCollapsed).length;
    for (BasePane p in Globals.panes) {
      if (numExpanded <= 10) break;
      if (!p.isCollapsed) { p.collapse(); --numExpanded; }
    }

    //hide menus if small screen
    if (!Globals.isLargeScreen) MainController.hideMenuPanels();

    //parse pane key
    String paneType = pk.paneKind;

    //create the right subclass
    BasePane p;
    if (paneType == 'notify') p = new NotifyPane();
    else if (paneType == 'projecttree') p = new ProjectTreePane();
    else if (paneType == 'projectsearch') p = new ProjectSearchPane();
    else if (paneType == 'project') p = new ProjectPane();
    else if (paneType == 'project-members') p = new ProjectMembersPane();
    else if (paneType == 'convsearch') p = new ConvSearchPane();
    else if (paneType == 'conv') p = new ConvPane();
    else if (paneType == 'rootdocs') p = new RootDocsPane();
    else if (paneType == 'doc') p = new DocPane();
    else if (paneType == 'resourcetree') p = new ResourceTreePane();
    else if (paneType == 'resources') p = new ResourceSearchPane();
    else if (paneType == 'resource') p = new ResourcePane();
    else if (paneType == 'users') p = new UserSearchPane();
    else if (paneType == 'user') p = new UserPane();
    else if (paneType == 'proposals-active') p = new ActiveProposalListPane();
    else if (paneType == 'proposals-sys') p = new SysProposalListPane();
    else if (paneType == 'proposal') p = new ProposalPane();
    else if (paneType == 'events') p = new EventSearchPane();
    else if (paneType == 'event') p = new EventPane();
    if (p == null) return null;

    //initialize pane
    await p.init(pk);
    Globals.panes.add(p);

    //change page URL
    MainController.changeUrlFragment(pk.full);

    //if bottommost pane collapses, change page URL to blank
    p.onCollapse = (p2) {
      if (Globals.panes.last.isCollapsed){
        MainController.changeUrlFragment('');
      }
    };

    //if bottommost pane changes key, change page URL
    p.onChanePaneKey = (p2) {
      if (Globals.panes.last == p2){
        MainController.changeUrlFragment(p2.paneKey.full);
      }
    };

    //remove pane from pushqueue/screen
    PushQueueHandler.notifyPaneOpened(p);

    //scroll to new pane (with possible delay)
    final goSmoothScroll = () {
      final int startAt = main1.scrollTop, endAt = priorScrollHeight + 30;
      if (endAt > startAt + 30) {
        main1.scrollTop = startAt + 10;
        Timer(Duration(milliseconds: 30), () => main1.scrollTop = startAt + 10);
        Timer(Duration(milliseconds: 60), () => main1.scrollTop = startAt + 20);
        Timer(Duration(milliseconds: 90), () => main1.scrollTop = startAt + 30);
        Timer(Duration(milliseconds: 120), () => main1.scrollTop = endAt);
      } else {
        main1.scrollTop = endAt;
      }
    };
    if (doScroll && !isReopeningLastPane) {
      if (waitForCloseAnimation)
        new Future.delayed(new Duration(milliseconds: 250), () => goSmoothScroll());
      else
        goSmoothScroll();
    }

    MainController.sizeScrollSpace(false);
    return p;
  }

  ///remove pane from DOM and Globals
  static void delete(BasePane p) {
    bool isLast = Globals.panes.length > 0 && Globals.panes.last == p;
    Globals.panes.remove(p);

    //collapse with animation; remove from DOM after animation complete
    //(but if this is the bottom pane, then instant)
    try {
      int actualHeight = p.borderElement.clientHeight;
      p.borderElement
        ..style.height = HtmlLib.asPx(actualHeight)
        ..className = ''
        ..innerHtml = '';
      if (isLast)
        p.borderElement.remove();
      else {
        var effect = p.borderElement.animate(
          [
            {"height": HtmlLib.asPx(actualHeight), 'margin-top': 0, 'margin-bottom': 0},
            {"height": "0", 'margin-top': 0, 'margin-bottom': 0}
          ], {
          "duration": 300,
          "fill": "forwards"
        });
        effect.onFinish.listen((e) => p.borderElement.remove());
        }
    } catch (ex) {}

    //change URL to the new last pane, or blank if that is collapsed
    if (Globals.panes.length > 0) {
      BasePane lastPane = Globals.panes.last;
      if (lastPane.isCollapsed)
        MainController.changeUrlFragment('');
      else
        MainController.changeUrlFragment(lastPane.paneKey.full);
    }
  }


}
