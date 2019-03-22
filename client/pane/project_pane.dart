import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../pane_factory.dart';
import '../../models/models.dart';
import '../root/globals.dart';
import '../rpc_lib.dart';
import '../messages.dart';
import '../lib/string_dialog.dart';
import '../lib/html_lib.dart';
//import '../lib/form_builder.dart';
import '../lib/card_builder.dart';
//import '../lib/button_bar_builder.dart';
import '../dialog/conv_dialog.dart';
import '../dialog/proposal_dialog.dart';
import '../dialog/project_dialog.dart';
import '../dialog/project_membership_dialog.dart';

///pane to show one project details - paneKey is 'project/id'
class ProjectPane extends BasePane {
  int _projectId;
  ProjectGetResponse _project;

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);

    //get project
    _projectId = pk.part1AsInt;
    _project = await RpcLib.projectGet(new ProjectGetRequest(projectId: _projectId));
    bool canView = ['O','V','A','M'].contains(_project.userKind);

    //build pane - ID section
    buildSkeletonHtml2(paneClass: 'project', iconHoverText: 'Project', iconName: 'paneproject', title: _project.title);
    clearLoadingMessage();
    CardBuilder card = new CardBuilder(bodyElement);
    card.addText('Title', _project.title);
    card.addText('Visible to', privacyToReadble(_project.privacy));
    card.addText('Leadership', leadershipToReadble(_project.leadership));
    card.addText('Description', _project.description, useCollapser: true);

    //build 3 lists of related info: docs, convs, proposals
    if (canView && _project.docs != null && _project.docs.length > 0) {
      bodyElement.appendHtml('<h2><img src="images/panedoc.png"/>Documents</h2>');
      DivElement scroll = HtmlLib.appendScrollingDiv(bodyElement);
      for (ProjectDocItem doc in _project.docs) {
        HtmlLib.appendLinkToPane(scroll, doc.title, 'doc/${doc.id}');
      }
    }
    if (_project.convs != null && _project.convs.length > 0) {
      bodyElement.appendHtml('<h2><img src="images/paneconv.png"/>Conversations</h2>');
      DivElement scroll = HtmlLib.appendScrollingDiv(bodyElement);
      for (ProjectConvItem conv in _project.convs) {
        String titlePlus = conv.title + (conv.open != 'Y' ? ' (closed)' : '');
        HtmlLib.appendLinkToPane(scroll, titlePlus, 'conv/${conv.id}');
      }
    }
    if (canView && _project.proposals != null && _project.proposals.length > 0) {
      bodyElement.appendHtml('<h2><img src="images/paneproposal.png"/>Proposals/Surveys</h2>');
      DivElement scroll = HtmlLib.appendScrollingDiv(bodyElement);
      for (ProjectProposalItem prop in _project.proposals) {
        HtmlLib.appendLinkToPane(scroll, prop.title, 'proposal/${prop.id}');
      }
    }

    //buttons
    if (_project.userKind == 'M') {
      paneMenuBar.addButton('Edit', (e) => _editHandler());
    }
    if (canView) {
      paneMenuBar.addButton('New Conversation', (e) => _newConvHandler());
      paneMenuBar.addButton('New Document', (e) => _newDocHandler());
      paneMenuBar.addButton('New Poll/Proposal', (e) => _newProposalHandler());
      paneMenuBar.addButton('My Role', (e) => _myRoleHandler());
    }
    paneMenuBar.addButton('Members', (e) => _membersHandler());
  }

  //button handlers
  Future _editHandler() async {
    ProjectDialog dlg = new ProjectDialog(_projectId, _project.categoryId);
    bool saved = await dlg.show();
    if (saved) recreatePane();
  }
  Future _myRoleHandler() async {
    ProjectMembershipDialog dlg = new ProjectMembershipDialog(_projectId, _project.userKind);
    bool saved = await dlg.show();
    if (saved) recreatePane();
  }
  Future _membersHandler() async {
    if (!Messages.checkLoggedIn()) return;
    PaneFactory.createFromString('project-members/${_projectId}');
  }
  Future _newConvHandler() async {
    ConvDialog dlg = new ConvDialog(null, _projectId, null);
    int convId = await dlg.show();
    if (convId == null) return;
    recreatePane();
    PaneFactory.createFromString('conv/${convId}');
  }
  Future _newDocHandler() async {
    StringDialog dlg = new StringDialog('Document title', '', Globals.maxTitleLength);
    String title = await dlg.show();
    if (title == null || title.length == 0) return;
    var req = new DocSaveRequest(
      docId: 0,
      projectId: _projectId,
      body: '',
      title: title);
    APIResponseBase resp = await RpcLib.docSave(req);
    if (resp.ok == 'Y') {
      Messages.timed('Document created. Press Edit to start entering content.');
      PaneFactory.createFromString('doc/${resp.newId}');
      recreatePane();
    }
  }
  Future _newProposalHandler() async {
    ProposalDialog dlg = new ProposalDialog('PROJ', _projectId, _project.title);
    dynamic idOrBool = await dlg.show();
    if (idOrBool is int)
      PaneFactory.createFromString('proposal/${idOrBool}');
  }

  ///convert project.privacy field values to readable text
  static String privacyToReadble(String privacy) {
    if (privacy == 'P') return 'Public';
    if (privacy == 'A') return 'Announcement';
    if (privacy == 'I') return 'Private - by invitation only';
    if (privacy == 'R') return 'Private - may join by request';
    return '';
  }

  ///convert project.leadership field values to readable text
  static String leadershipToReadble(String leadership) {
    if (leadership == 'F') return 'Fixed: project creators retain authority';
    if (leadership == 'D') return 'Democratic: leadership determined by vote';
    return '';
  }
}
