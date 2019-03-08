import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../rpc_lib.dart';
import '../../models/models.dart';
import 'login_recovery_dialog.dart';
import 'user_dialog.dart';

///handler that returns null on success or an error message
typedef Future<String> LoginHandler(String nick, String pw, bool savePW);

///request credentials from user; show method returns bool
/// (true if accepted)
class LoginDialog extends DialogBox {
  LoginHandler _loginHandler;

  LoginDialog(this._loginHandler) : super() {
  }

  @override int dialogHeight() { return 150; }

  @override
  Future build() async {
    //main content
    FormBuilder form = new FormBuilder(frame, 'Log In');
    InputElement nickInput = form.addInput('Nickname', 200, 40);
    PasswordInputElement pwInput = form.addPasswordInput('Password', 200, 40);
    var saveChk = new CheckboxInputElement();
    form.addAny('Save password on this computer', saveChk);

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('Log In', (e) async {
      String message = await _loginHandler(trimInput(nickInput), trimInput(pwInput), saveChk.checked);
      if (message == null) hide(true);
      else form.showError(message);
    });

    bar.addButton('Create Account', (e) {
      hide(false);
      var ud = new UserDialog(0);
      ud.show();
    });

    bar.addButton('Recover Password', (e) async {
      //validate
      String nick = trimInput(nickInput);
      if (nick.length == 0) {
        form.showError('First enter the nickname, then press Recover Password');
        return;
      }

      //tell server to email the recovery code
      UserRecoverPasswordRequest args = new UserRecoverPasswordRequest(
        recoveryNick: trimInput(nickInput),
        mode: 'E');
      APIResponseBase response = await RpcLib.command('UserRecoverPassword', args);
      if (!response.isOK) {form.showError(response.errorMessage); return;}

      //hide this; show recovery dialog
      hide(false);
      var rd = new LoginRecoveryDialog(nick);
      rd.show();
    });

    bar.addButton('Cancel', (e) {
      hide(false);
    });
  }
}
