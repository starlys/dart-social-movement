import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
//import '../lib/html_lib.dart';
import '../messages.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../rpc_lib.dart';
import '../../models/models.dart';
import '../root/globals.dart';

///edit one resource record; show method returns true if saved
class ResourceDialog extends DialogBox {
  int resourceId;
  int newCategoryId; //cat for a newly created resource

  ///create dlog; for new resources, pass id=0 and category (else just pass the resource id)
  ResourceDialog(this.resourceId, this.newCategoryId) : super() {}

  @override
  Future build() async {
    //get resource or blank for new record
    bool isNew = resourceId == 0;
    var resourceGetArgs = new ResourceGetRequest(iid: resourceId);
    ResourceGetResponse resource;
    if (!isNew) resource = await RpcLib.resourceGet(resourceGetArgs);
    else resource = new ResourceGetResponse();

    //main content
    FormBuilder form = new FormBuilder(frame, 'Resource');
    InputElement titleInput = form.addInput('Title', typicalControlWidth(), Globals.maxTitleLength, resource.title);
    TextAreaElement descInput = form.addTextArea('Description', typicalControlWidth(), 90, Globals.maxDescriptionLength, resource.description);
    var kindInput = new SelectElement();
    for (String kindOption in Globals.allResourceKinds)
      kindInput.append(new OptionElement() ..value = kindOption ..text = kindOption);
    kindInput.value = resource.kind;
    form.addAny('Resource kind', kindInput);
    InputElement urlInput = form.addInput('Web URL', typicalControlWidth(), 1000, resource.url);

    //define validation
    bool isValid() {
      String title = trimInput(titleInput);
      if (title.length == 0) {form.showError('Title required'); return false;}
      return true;
    }

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('Save', (e) async {
      //prepend http for them if they forgot
      String url = trimInput(urlInput);
      if (!url.contains('://')) {
        urlInput.value = 'http://' + url;
        Messages.timed('Your web URL was corrected; please double check it and try again.');
        return;
      }

      //validate and save
      if (!isValid()) return;
      ResourceSaveRequest saveArgs = new ResourceSaveRequest(
        iid: resourceId,
        categoryId: newCategoryId, //ignored if this is an update of existing rec
        title: trimInput(titleInput),
        description: trimTextArea(descInput),
        kind: kindInput.value,
        url: trimInput(urlInput));
      APIResponseBase response = await RpcLib.resourceSave(saveArgs);
      if (response.isOK) {
        hide(true);
        if (isNew)
          Messages.criticalMessage('The new resource will be reviewed by admins, then posted later.');
        else
          Messages.timed('Resource saved.');
      }
    });

    bar.addButton('Cancel', (e) {
      hide(false);
    });
  }
}
