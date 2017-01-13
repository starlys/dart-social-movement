import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../pane_factory.dart';
import '../twotier/wtypes.dart';
import '../rpc_lib.dart';
import '../lib/card_builder.dart';
//import '../lib/html_lib.dart';
import '../messages.dart';
import '../root/globals.dart';
import '../dialog/view_markdown_dialog.dart';
import '../dialog/confirm_dialog.dart';

///pane showing one proposal - paneKey is 'proposal/id'
class ProposalPane extends BasePane {
  int _proposalId;
  bool _clickedInCode = false;

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);
    bool loggedIn = Globals.userId != 0;

    //get proposal
    _proposalId = pk.part1AsInt;
    ProposalGetResponse proposal = await RpcLib.proposalGet(new ProposalGetRequest() ..proposalId = _proposalId);

    //build pane - readonly info
    buildSkeletonHtml2(paneClass: 'proposal', iconHoverText: 'Proposal', iconName: 'paneproposal', title: proposal.title);
    clearLoadingMessage();
    CardBuilder card = new CardBuilder(bodyElement);
    card.addText('Title', proposal.title);
    card.addText('Status', proposal.statusDescription);
    card.addText('Summary', proposal.summary);
    String summaryHtml = proposal.summaryHtml ?? '';
    if (summaryHtml.length > 0) {
        Element htmlParent = card.addAny('Changes');
        htmlParent.setInnerHtml(summaryHtml, treeSanitizer: NodeTreeSanitizer.trusted);
    }

    //if closed show winning option
    if (proposal.active != 'Y') {
      Element resultsDiv = card.addAny('Poll results');
      UListElement bullets = new UListElement();
      resultsDiv.append(bullets);
      for (ProposalOptionItem opt in proposal.options) {
        bool isWinner = opt.optionNo == proposal.winningOption;
        LIElement li = new LIElement() ..text = '${opt.optionDesc} (${opt.voteCount} votes)';
        if (isWinner) li.style.fontWeight = 'bold';
        bullets.append(li);
      }
    }

    //show checkboxes for user's votes - only if eligible
    Element myVoteDiv;
    List<CheckboxInputElement> allChecks = new List<CheckboxInputElement>();
    var handleCheckbox = (Event e) {
      if (_clickedInCode) return;
      _clickedInCode = true;
      CheckboxInputElement clickedChk = e.target;
      String clickedOptionNo = clickedChk.dataset['opt']; //'0', '1',...
      if (clickedChk.checked) {
        //uncheck all others
        for (CheckboxInputElement chk in allChecks)
          if (chk.dataset['opt'] != clickedOptionNo)
            chk.checked = false;
      }
      _clickedInCode = false;
      _handleVote(clickedChk.checked ? int.parse(clickedOptionNo) : null);
    };
    CheckboxInputElement add1Checkbox(bool value, String text, int optionNo) {
      DivElement div = new DivElement();
      CheckboxInputElement chk = new CheckboxInputElement()
        ..checked = value;
      chk.dataset['opt'] = optionNo.toString();
      div.append(chk);
      div.appendText(' ' + text);
      myVoteDiv.append(div);
      chk.onChange.listen(handleCheckbox);
      return chk;
    }
    if (proposal.myEligible == 'Y' && proposal.active == 'Y') {
      myVoteDiv = card.addAny('My vote');
      for (ProposalOptionItem opt in proposal.options) {
        CheckboxInputElement chk = add1Checkbox(proposal.myVote == opt.optionNo, opt.optionDesc, opt.optionNo);
        allChecks.add(chk);
      }
    }

    //button bar - open root doc proposals: allow showing current full text and proposed new full text
    if (proposal.kind == 'ROOT' && proposal.active == 'Y') {
      paneMenuBar.addButton('Show Current Full Text', (e) async {
        DocGetRequest req = new DocGetRequest()..docId = proposal.docId;
        DocGetResponse doc = await RpcLib.docGet(req);
        ViewMarkdownDialog dlg = new ViewMarkdownDialog(doc.body);
        await dlg.show();
      });
      paneMenuBar.addButton('Show Proposed Full Text', (e) async {
        ViewMarkdownDialog dlg = new ViewMarkdownDialog(proposal.dtext);
        await dlg.show();
      });
    }

    //button bar - allow user to retract their own proposal
    bool isRetractableKind = proposal.kind == 'PROJ' || proposal.kind == 'SYS' || proposal.kind == 'ROOT';
    if (loggedIn && proposal.active == 'Y' && isRetractableKind && proposal.createdBy == Globals.userId) {
      paneMenuBar.addButton('Retract Proposal', (e) async {
        ConfirmDialog dlg = new ConfirmDialog('Really delete proposal?', ConfirmDialog.YesNoOptions);
        int btnIdx = await dlg.show();
        if (btnIdx == 0) {
          ProposalGetRequest req = new ProposalGetRequest() ..proposalId = _proposalId;
          APIResponseBase response = await RpcLib.command('ProposalDelete', req);
          if (response.isOK) PaneFactory.delete(this);
        }
      });
    }
  }

  //record vote for optionNo or null
  Future _handleVote(int optionNo) async {
    if (!Messages.checkLoggedIn()) return;
    ProposalUserSaveRequest req = new ProposalUserSaveRequest()
      ..proposalId = _proposalId
      ..vote = optionNo;
    await RpcLib.command('ProposalUserSave', req);
    Messages.timed('We recorded your vote.');
  }
}
