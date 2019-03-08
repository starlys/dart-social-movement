import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../../models/models.dart';
import '../root/pane_key.dart';
import '../rpc_lib.dart';
import '../lib/html_lib.dart';
import '../lib/form_builder.dart';
import '../root/globals.dart';

///pane to view and vote for members in a project, or change member permissions
/// - pane key os project-members/id
class ProjectMembersPane extends BasePane {
  TableElement _resultTable;
  int _projectId;
  ProjectUserQueryResponse _project;
  List<ProjectUserItem> _filteredUsers; //may be same list as _project.users
  int _pageNo = 0; //controls paging for loads

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);
    _projectId = pk.part1AsInt;

    //load members - 1st page without any filtering
    await _loadProject(null);

    //build pane w/o result rows
    buildSkeletonHtml2(paneClass: 'project-members', iconHoverText: 'Project Members', iconName: 'paneproject', title: _project.projectTitle);
    clearLoadingMessage();
    DivElement scroll = HtmlLib.appendScrollingDiv(bodyElement);
    _resultTable = new TableElement() ..className = 'datatable'
      ..style.marginBottom = HtmlLib.asPx(6);
    scroll.append(_resultTable);
    FormBuilder form = new FormBuilder(bodyElement, 'Criteria');
    InputElement nameInp = form.addInput('Filter by name', 100, 50);

    //buttons
    paneMenuBar.addButton('Search', (e) => _doSearch(trimInput(nameInp)));
    if (_project.completeLoad != 'Y') {
      paneMenuBar.addButton('Next Page', (e) {
        ++_pageNo;
        _loadProject(trimInput(nameInp));
        _buildOutputTable();
      });
    }

    //initial autosearch results
    _buildOutputTable();
  }

  ///do the search and recreate _resultTable
  Future _doSearch(String name) async {
    name = name.toLowerCase();
    _resultTable.innerHtml = '<tr><td>Loading...</td></tr>';

    //search either on server or by filtering previously loaded complete results
    if (_project != null && _project.completeLoad == 'Y') { //filter locally
      _filteredUsers = _project.users.where((u) =>
        u.nick.toLowerCase().contains(name) || u.publicName.toLowerCase().contains(name))
        .toList();
    } else { //reload
      _pageNo = 0;
      await _loadProject(name);
    }

    _buildOutputTable();
  }

  ///build output table from _filteredUsers
  void _buildOutputTable() {
    _resultTable.innerHtml = '<tr><th>Type</th><th></th><th>Vote</th><th>Nickname (name)</th></tr>';
    for (ProjectUserItem user in _filteredUsers) {
      TableRowElement tr = _resultTable.addRow();
      TableCellElement td = tr.addCell();
      td.style.textAlign = 'right';
      td.append(_userKindImage(user));
      td.appendHtml('<br/>');
      td.append(_userKindDropdown(user));
      td = tr.addCell() ..className = 'avatar';
      if (user.avatarUrl != null)
        td.append(new ImageElement(src: user.avatarUrl));
      td = tr.addCell();
      Element chk = _voteCheckbox(user);
      if (chk != null) td.append(chk);
      td = tr.addCell();
      HtmlLib.appendLinkToPane(td, user.nick, 'user/${user.userId}', asDiv: false);
      if (user.publicName != null && user.publicName.length > 0)
        td.appendText(' - ${user.publicName}');
    }
  }

  ///return element for the kind icon
  Element _userKindImage(ProjectUserItem user) {
    String imgName = 'user_reg', hoverText = '';
    if (user.throttle != null) { imgName = 'user_throttled'; hoverText = user.throttle; }
    else if (user.kind == 'M') { imgName = 'user_manager'; hoverText = 'Project manager'; }
    return new Element.html('<img src="images/${imgName}.png" title="${hoverText}" />');
  }

  ///build element for the vote checkbox, hooked up to an editing handler;
  /// or if not logged in/current user, then null
  Element _voteCheckbox(ProjectUserItem user) {
    if (Globals.userId == null) return null;
    if (Globals.userId == user.userId) return null;

    //make checkbox
    CheckboxInputElement chk = new CheckboxInputElement()
      ..checked = user.voteKind == 'L'
      ..dataset['uid'] = user.userId.toString();

    //hook up check event
    //hook up event
    chk.onChange.listen((e) async {
      //get which user and new value for kind
      CheckboxInputElement chk2 = e.target;
      int userId = int.parse(chk2.dataset['uid']);
      String voteKind = chk2.checked ? 'L' : null;

      //save to server
      ProjectUserUserSaveRequest req = new ProjectUserUserSaveRequest()
        ..projectId = _projectId
        ..aboutId = userId
        ..kind = voteKind;
      await RpcLib.command('ProjectUserUserSave', req);

      //change in local data
      user.voteKind = voteKind;
    });

    return chk;
  }

  ///build element for the membership kind dropdown, hooked up to an editing handler;
  /// or if not editable, then return an element with plain text only
  Element _userKindDropdown(ProjectUserItem user) {
    //if not editable
    if (_project.editable != 'Y') {
      return new SpanElement() ..text = Globals.allProjectUserKinds[user.kind];
    }

    //create dropdown with options
    SelectElement sel = new SelectElement();
    Globals.allProjectUserKinds.forEach((code, text) {
      sel.append(new OptionElement(value: code) ..text = text);
    });
    sel ..value = user.kind ..dataset['uid'] = user.userId.toString();

    //hook up event
    sel.onChange.listen((e) async {
      //get which user and new value for kind
      SelectElement sel2 = e.target;
      int userId = int.parse(sel2.dataset['uid']);
      String kind = sel2.value;

      //save to server
      ProjectUserSaveRequest req = new ProjectUserSaveRequest()
        ..projectId = _projectId
        ..userId = userId
        ..kind = kind;
      await RpcLib.command('ProjectUserSave', req);

      //change in local data
      user.kind = kind;

      //rebuild the kind icon locally
      Element icon = sel2.parent.querySelector('img');
      icon.replaceWith(_userKindImage(user));
    });

    return sel;
  }

  ///set _project and _filteredusers based on arguments; caller should set _pageNo first
  Future _loadProject(String nameFilter) async {
    ProjectUserQueryRequest req = new ProjectUserQueryRequest() ..projectId = _projectId
      ..resultPage = _pageNo ..name = nameFilter;
    _project = await RpcLib.projectUserQuery(req);
    _filteredUsers = _project.users;
  }

}
