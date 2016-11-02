import 'dart:async';
import 'dart:html';
import 'base_tree_pane.dart';
import '../root/pane_key.dart';
import '../rpc_lib.dart';
import '../messages.dart';
import '../lib/html_lib.dart';
import '../lib/button_bar_builder.dart';
import '../twotier/wtypes.dart';
import '../dialog/project_dialog.dart';

///shows outline of project categories and commands for accessing the projects
/// in those categories - paneKey is 'projecttree'
class ProjectTreePane extends BaseTreePane {
  int _projectCount = 0;
  ProjectQueryResponse _projects;

  @override
  Future init(PaneKey pk) async {
    paneClass = 'projecttree';
    paneTitle = 'Project Categories';
    paneIconName = 'paneproject';
    categoryKind = 'P';
    await super.init(pk);
  }

  @override
  Future insertDetails(Element detailBox, int catId) async {
    //get projects in this cat
    _projects = await RpcLib.projectQuery(
      new ProjectQueryRequest() ..catId = catId);

    //convert to html links
    detailBox.append(new HeadingElement.h3() ..text = 'Projects in this category');
    for (ProjectQueryItem proj in _projects.projects) {
      DivElement pdiv = new DivElement();
      pdiv.appendHtml('<a href="#project/${proj.projectId}">${proj.title}</a> ');
      detailBox.append(pdiv);
      HtmlLib.insertCollapsed1(pdiv, proj.description);
    }
    if (_projects.projects.length == 0) detailBox.appendText('(none)');
    _projectCount = _projects.projects.length;
  }

  @override
  void insertDetailButtons(ButtonBarBuilder bar, int catId) {
    bar.addButton('Create Project', (e) async {
      if (_projectCount >= 100) {
        Messages.timed('There are too many projects in this category. Please choose a more detailed sub-category.');
        return;
      }
      ProjectDialog dlg = new ProjectDialog(0, selectedCatId);
      bool saved = await dlg.show();
      if (saved) {
        recreatePane();
        Messages.criticalMessage('Your new project will be reviewed by admins then posted later.');
      }
    });
  }

  @override
  List<String> getContentTitles() {
    return _projects.projects.map((i) => i.title).toList();
  }

  @override
  List<int> getContentIds(List<String> contentTitles) {
    return contentTitles.map((s) {
      List<ProjectQueryItem> matches = _projects.projects.where((i) => i.title == s).toList();
      if (matches.length > 0) return matches[0].projectId;
      return null;
    })
    .where((i) => i != null)
    .toList();
  }

}
