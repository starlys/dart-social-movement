import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../../models/models.dart';
import '../rpc_lib.dart';
import '../lib/html_lib.dart';
import '../lib/form_builder.dart';
//import '../lib/button_bar_builder.dart';

///pane to allow searching for projects across categories - paneKey is 'projectsearch'
class ProjectSearchPane extends BasePane {
  DivElement _resultDiv;

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);

    //build pane
    buildSkeletonHtml2(paneClass: 'projectsearch', title: 'Project Search', iconName: 'paneproject');
    clearLoadingMessage();
    _resultDiv = HtmlLib.appendScrollingDiv(bodyElement)
      ..style.marginBottom = HtmlLib.asPx(6)
      ..style.display = 'none';
    FormBuilder form = new FormBuilder(bodyElement, 'Criteria');
    InputElement titleInp = form.addInput('Title', 100, 50);

    //buttons
    paneMenuBar.addButton('Search', (e) => _doSearch(trimInput(titleInp)));
  }

  //do the search and recreate _resultTable
  Future _doSearch(String title) async {
    _resultDiv.style.display = 'block';
    _resultDiv.innerHtml = 'Loading...';
    ProjectQueryResponse response = await RpcLib.projectQuery(
      new ProjectQueryRequest() ..title = title);
    _resultDiv.innerHtml = '';
    for (ProjectQueryItem proj in response.projects) {
      DivElement itemDiv = new DivElement() ..className = 'space1';
      _resultDiv.append(itemDiv);
      HtmlLib.appendLinkToPane(itemDiv, proj.title, 'project/${proj.projectId}', asDiv: false);
      itemDiv.appendText(' - ');
      HtmlLib.insertCollapsed1(itemDiv, proj.description);
    }
    if (response.projects.length == 0) _resultDiv.innerHtml = '(none)';
  }
}
