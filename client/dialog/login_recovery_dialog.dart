import 'dart:html';
import 'dart:async';
import '../messages.dart';
import '../lib/dialog_box.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../rpc_lib.dart';
import '../twotier/wtypes.dart';
import '../twotier/wlib.dart';

///dialog to call UserRecoverPassword
class LoginRecoveryDialog extends DialogBox {
  String _nick;

  LoginRecoveryDialog(this._nick) : super() {}

  Future build() async {
    //main content
    FormBuilder form = new FormBuilder(frame, 'Recover Password');
    InputElement nickInput = form.addInput('Nickname', typicalControlWidth(), 40, _nick ?? '');
    if (_nick != null) nickInput.disabled = true;
    InputElement codeInput = form.addInput('Recovery code from email', 200, 10);
    InputElement pw1Input = form.addInput('New password', 200, 40);
    InputElement pw2Input = form.addInput('Repeat password', 200, 40);

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('Recover', (e) async {
      //validate
      String pw1 = trimInput(pw1Input), pw2 = trimInput(pw2Input), code = trimInput(codeInput),
        nick = trimInput(nickInput);
      if (pw1 != pw2) {form.showError('Passwords do not match'); return;}
      String err = WLib.passwordComplexityError(pw1);
      if (err != null) {form.showError(err); return;}

      //tell server; handle error
      UserRecoverPasswordRequest args = new UserRecoverPasswordRequest()
        ..recoveryNick = nick
        ..recoveryPassword = pw1
        ..code = code
        ..mode = 'V';
      APIResponseBase response = await RpcLib.command('UserRecoverPassword', args);
      if (!response.isOK) {form.showError(response.errorMessage); return;}

      //success
      Messages.timed('Account recovered.');
      hide(false);
    });
    bar.addButton('Cancel', (e) {
      hide(false);
    });
  }
}
