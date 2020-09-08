import 'dart:async';
import 'package:autzone_models/autzone_models.dart';
import '../rpc_lib.dart';
import '../pane_factory.dart';
import 'proposal_list_pane.dart';
import '../dialog/confirm_dialog.dart';
import '../dialog/proposal_dialog.dart';

///pane showing all closed SYS proposals for 1 year - paneKey is 'proposals-sys/{year}'
class SysProposalListPane extends ProposalListPane {
  int _year; //year to show proposals for

  @override
  Future load() async {
    _year = paneKey.part1AsInt;
    paneClass = 'proposals-sys';
    paneTitle = 'Archive of System Proposals ${_year}';
    ProposalQueryRequest req = new ProposalQueryRequest(mode: 'S', year: _year);
    proposals = await RpcLib.proposalQuery(req);
  }

  Future makeButtonBar() async {
    paneMenuBar.addButton('Previous Year', (e) {
      PaneFactory.createFromString('proposals-sys/${_year - 1}');
      return null;
    });
    paneMenuBar.addButton('Propose a Change', (e) async {
      var conf = new ConfirmDialog(
          'Use this feature with care! You are about to propose a change in the way the system operates, which '
          'can be voted on by all users. Please be specific and provide the resources necessary if you are proposing substantial changes. '
          'Continue?',
          ConfirmDialog.YesNoOptions);
      int btnIdx = await conf.show();
      if (btnIdx != 0) return;
      var propDialog = new ProposalDialog('SYS', null, null);
      await propDialog.show();
    });
  }
}
