import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/html_lib.dart';
import '../messages.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../rpc_lib.dart';
import '../../models/models.dart';
import '../root/globals.dart';

///dialog to create a PROJ or SYS proposal; show method returns int proposalId if saved, true if saved but
/// no number assigned, else returns false
class ProposalDialog extends DialogBox {
  String _kind; //from proposal.kind
  int _projectId;
  String _projectTitle;

  ///create dlog
  ProposalDialog(this._kind, this._projectId, this._projectTitle) : super() {}

  @override
  Future build() async {
    bool isKindProj = _kind == 'PROJ', isKindSys = _kind == 'SYS';

    //main content
    FormBuilder form = new FormBuilder(frame, 'Create Proposal/Survey');
    InputElement titleInput = form.addInput('Title', typicalControlWidth(), Globals.maxTitleLength);
    TextAreaElement descInput = form.addTextArea('Proposal details', typicalControlWidth(), 90, Globals.maxDescriptionLength);
    TextAreaElement optionsInput = form.addTextArea('Available options (one per line)', typicalControlWidth(), 90, Globals.maxDescriptionLength);
    optionsInput.value = 'Yes\r\nNo';

    //fields for project proposals only
    SelectElement eligibleInput;
    if (isKindProj) {
      eligibleInput = new SelectElement();
      eligibleInput.append(new OptionElement() ..value = 'P' ..text = 'All project members');
      eligibleInput.append(new OptionElement() ..value = 'L' ..text = 'Project leaders only');
      form.addAny('Who may vote', eligibleInput);
      eligibleInput.value = 'P';
    }

    var daysInput = new SelectElement();
    List<int> dayChoices = [14];
    if (isKindProj) dayChoices = [3,5,7,10,14,21,30,45];
    for (int i in dayChoices)
      daysInput.append(new OptionElement() ..value = i.toString() ..text = '${i} days');
    daysInput.value = '14';
    form.addAny('Voting period (days)', daysInput);

    //information about how it works
    String kindNotice = '';
    if (isKindProj) kindNotice = 'The proposal or survey will be part of the project "${_projectTitle}".';
    if (isKindSys) kindNotice = 'The proposal must be about the way this platform operates, and it will be voted on by the entire site membership.';
    frame.appendText(kindNotice);

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('Create Proposal', (e) async {
      //parse and validate
      String title = trimInput(titleInput);
      if (title.length == 0) {form.showError('Title is required'); return; }
      List<String> options = _parseOptions(optionsInput);
      if (options.length < 2) {form.showError('There must be at least 2 options'); return; }

      //who's eligible?
      String eligible = 'E';
      if (isKindProj) eligible = eligibleInput.value;

      //save it
      ProposalSaveRequest saveArgs = new ProposalSaveRequest(
        kind: _kind,
        projectId: _projectId,
        eligible: eligible,
        title: title,
        summary: trimTextArea(descInput),
        days: int.parse(daysInput.value),
        options: options);
      APIResponseBase response = await RpcLib.proposalSave(saveArgs);
      if (response.isOK) {
        bool hasId = response.newId != null;
        hide(hasId ? response.newId : true); //true means "saved but we dont know the id"
        Messages.timed('Proposal created.');
      }
    });

    bar.addButton('Cancel', (e) {
      hide(false);
    });
  }

  List<String> _parseOptions(TextAreaElement optionsInput) {
    List<String> opts = HtmlLib.textAreaValueToLines(optionsInput, removeBlanks: true);
    return opts;
  }
}
