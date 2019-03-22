import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../rpc_lib.dart';
import '../../models/models.dart';

///dialog to upload an image for 2 specific cases: user avatars and conv posts;
/// returns true if upload happened, false on cancel
class ImageUploadDialog extends DialogBox {
  String _mode, _helpText; //see ctor
  int _convId; //used for conv images only
  String _priorPostText; //used for conv images only, seeds the post

  ///create dialog with mode "U" for user avatar or "P" for conv post;
  /// for conv post, _convId and _priorPostText (partially entered post) are required
  ImageUploadDialog(this._mode, this._helpText, [this._convId, this._priorPostText]) : super() {
  }

  @override int dialogHeight() {
    return _mode == 'P' ? 300 : 150;
  }

  @override
  Future build() async {
    //main content
    FormBuilder form = new FormBuilder(frame, 'Upload Image');
    FileUploadInputElement fileInput = new FileUploadInputElement() ..accept = 'image/*';
    form.addAny('Image', fileInput);
    TextAreaElement ptext;
    if (_mode == 'P') ptext = form.addTextArea('Image description', typicalControlWidth(), 70, 10000, _priorPostText ?? '');
    frame.appendText(_helpText);

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    ButtonElement uploadButton;
    uploadButton = bar.addButton('Upload', (e) async {
      //prevent double click upload (since this is a fairly slow method)
      uploadButton.disabled = true;

      //define continuation after reading file
      FileReader rdr = new FileReader();
      rdr.onLoad.listen((e) async {
        List<int> imageBytes = rdr.result;
        bool ok;
        if (_mode == 'P') ok = await _uploadPost(imageBytes, ptext.value);
        if (_mode == 'U') ok = await _uploadAvatar(imageBytes);
        if (ok) hide(true);
        uploadButton.disabled = false;
      });

      //validate
      if (fileInput.files.length == 0) { form.showError('Select a file first.'); return; }
      File file = fileInput.files[0];
      if (file.size > 5000000) { form.showError('The file exceeds the maximum size of 5BM.'); return; }

      //start reading file (see continuation above)
      rdr.readAsArrayBuffer(file.slice());
    });

    bar.addButton('Cancel', (e) {
      hide(false);
    });
  }

  Future<bool> _uploadPost(List<int> imageBytes, String ptext) async {
    ConvPostImageSaveRequest req = ConvPostImageSaveRequest(
      imageBytes: imageBytes,
      ptext: ptext,
      convId: _convId);
    APIResponseBase response = await RpcLib.convPostImageSave(req);
    return response.isOK;
  }

  Future<bool> _uploadAvatar(List<int> imageBytes) async {
    UserAvatarSaveRequest req = UserAvatarSaveRequest(imageBytes: imageBytes);
    APIResponseBase response = await RpcLib.userAvatarSave(req);
    return response.isOK;
  }
}
