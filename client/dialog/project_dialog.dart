import 'dart:html';
import 'dart:async';
import '../messages.dart';
import '../lib/dialog_box.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../root/globals.dart';
import '../rpc_lib.dart';
import '../../models/models.dart';

///dialog for creating a project or changing its settings; returns true if saved, else false
class ProjectDialog extends DialogBox {
  int _projectId, _categoryId; //0 if new
  ProjectGetResponse project;

  ///pass 0 for new project
  ProjectDialog(this._projectId, this._categoryId) : super() {}

  @override
  Future build() async {
    //get project
    if (_projectId == 0)
      project = new ProjectGetResponse(leadership: 'D');
    else
      project = await RpcLib.projectGet(new ProjectGetRequest(projectId: _projectId));

    //main content
    FormBuilder form = new FormBuilder(frame, 'Project');
    InputElement titleInput = form.addInput('Title', typicalControlWidth(), Globals.maxTitleLength, project.title);
    TextAreaElement descrInput = form.addTextArea('Description', typicalControlWidth(), 130, Globals.maxDescriptionLength, project.description);
    SelectElement privacyInput = new SelectElement();
    Globals.allProjectPrivacy.forEach((value, text) {
      privacyInput.append(new OptionElement() ..value = value ..text = text);
    });
    privacyInput.value = project.privacy;
    form.addAny('Privacy', privacyInput);
    DivElement leadershipDiv = new DivElement();
    RadioButtonInputElement radioDemocratic = new RadioButtonInputElement() ..name = 'leadermode'
      ..checked = project.leadership == 'D';
    RadioButtonInputElement radioFixed = new RadioButtonInputElement() ..name = 'leadermode'
      ..checked = project.leadership == 'F';
    leadershipDiv
      ..append(radioDemocratic)
      ..appendText('Democratic - leadership changes over time by vote')
      ..appendHtml('<br/>')
      ..append(radioFixed)
      ..appendText('Fixed - leadership remains with those who create the project')
      ..appendHtml('<br/>Note that once a project is democratic, it cannot go back to being fixed.');
    form.addAny('Leadership', leadershipDiv);

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('Save', (e) async {
      String leadershipCode = radioFixed.checked ? 'F' : 'D';
      ProjectSaveRequest req = new ProjectSaveRequest(
        projectId: _projectId,
        title: trimInput(titleInput),
        description: trimTextArea(descrInput),
        privacy: privacyInput.value,
        leadership: leadershipCode,
        categoryId: _categoryId);

      APIResponseBase response = await RpcLib.projectSave(req);
      if (response.isOK) {
        hide(true);
        if (_projectId == 0) Messages.timed('Project will be reviewed for spam, then posted later.');
      }
    });

    bar.addButton('Cancel', (e) {
      hide(false);
    });
  }

}
