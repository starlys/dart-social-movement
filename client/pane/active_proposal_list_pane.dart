//import 'dart:html';
import 'dart:async';
import '../../models/models.dart';
import '../rpc_lib.dart';
import 'proposal_list_pane.dart';

///pane showing all active ROOT and SYS proposals - paneKey is 'proposals-active'
class ActiveProposalListPane extends ProposalListPane {
    @override
    Future load() async {
      paneClass = 'proposals-active';
      paneTitle = 'Active Proposals';
      ProposalQueryRequest req = new ProposalQueryRequest() ..mode = 'A';
      proposals = await RpcLib.proposalQuery(req);
    }
}
