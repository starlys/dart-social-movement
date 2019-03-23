import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../root/globals.dart';
import '../rpc_lib.dart';
import '../../models/models.dart';

///dialog for requeting to join a project or change ones membership type;
/// returns true if changes saved, else false if canceled
class ProjectMembershipDialog extends DialogBox {
  int _projectId;
  String _userKind;

  ///create dialog from the project and project_xuser.kind value
  ProjectMembershipDialog(this._projectId, this._userKind) : super() {}

  @override int dialogHeight() {return 160;}

  @override
  Future build() async {
    //main content
    FormBuilder form = new FormBuilder(frame, 'Project Membership');
    String oldRoleDesc = 'You are currently not connected to this project.';
    if (_userKind == 'M') oldRoleDesc = 'You are a manager of this project.';
    if (_userKind == 'A') oldRoleDesc = 'You are an active participant of this project.';
    if (_userKind == 'V') oldRoleDesc = 'You are a visiting participant of this project.';
    if (_userKind == 'O') oldRoleDesc = 'You are an observer of this project - no posting permitted.';
    form.addAny('Current role', new SpanElement() ..text = oldRoleDesc);
    SelectElement newRole = new SelectElement();
    newRole.append(new OptionElement() ..value = 'O' ..text = 'Join as observer - no posting');
    newRole.append(new OptionElement() ..value = 'V' ..text = 'Join as visitor (default)');
    newRole.append(new OptionElement() ..value = 'A' ..text = 'Join as active participant');
    newRole.append(new OptionElement() ..value = 'N' ..text = 'Quit');
    newRole.value = 'A';
    form.addAny('New role', newRole);

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('Change Membership', (e) async {
      ProjectUserSaveRequest req = new ProjectUserSaveRequest(
        projectId: _projectId,
        userId: Globals.userId,
        kind: newRole.value);
      APIResponseBase response = await RpcLib.projectUserSave(req);
      if (response.isOK) {
        hide(true);
      }
    });

    bar.addButton('Cancel', (e) {
      hide(false);
    });
  }

}
