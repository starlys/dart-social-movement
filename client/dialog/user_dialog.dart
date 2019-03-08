import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/html_lib.dart';
import '../lib/string_dialog.dart';
import '../messages.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../root/globals.dart';
import '../rpc_lib.dart';
import '../lib/js_interop.dart';
import '../lib/string_tuple.dart';
import '../../models/models.dart';

///edit user's own record or create account; return true if edited else false
class UserDialog extends DialogBox {
  int userId;

  ///function to log out when account is deleted or created; must be set
  /// by app initializer
  static VoidCallback onLogoutAccount;

  ///function to rebuild display when public name might have changed; must be set
  /// by app initializer
  static VoidCallback onChangeAccount;

  ///pass userid 0 for new user
  UserDialog(this.userId) : super() {}

  @override int dialogHeight() {
    return 500;
  }

  @override
  Future build() async {
    //get user info or blank data for defaults
    bool isNewUser = userId == 0;
    var userGetArgs = new UserGetRequest()
      ..userId = userId
      ..includeEditing = 'Y';
    UserGetResponse user = await RpcLib.userGet(userGetArgs);

    //if new user GetDoc with special code UA
    DocGetResponse userAgreement;
    if (isNewUser) userAgreement = await RpcLib.docGet(new DocGetRequest() ..specialCode = 'UA');

    //main content - nick, pw, kind, prefs, timezone
    FormBuilder form = new FormBuilder(frame, 'User Account');
    InputElement nickInput = form.addInput('Nickname', 200, 40, user.nick);
    if (!isNewUser) nickInput.disabled = true;
    else form.addExplanation(nickInput, 'Your nickname (screen name) is shown to all users; use 5 or more characters.');
    InputElement pw1Input = form.addPasswordInput(isNewUser ? 'Password' : 'Change password', 200, 40);
    if (isNewUser) form.addExplanation(pw1Input, 'Passwords must be 5 or more characters');
    InputElement pw2Input = form.addPasswordInput('Repeat password', 200, 40);
    InputElement emailInput = form.addInput('Private email address', 200, 200, user.email);
    form.addExplanation(emailInput, 'Include your email address to allow the system to email you and to recover a password. (optional)');
    var kindInput = new SelectElement();
    Globals.allUserKinds.forEach((value, text) {
      kindInput.append(new OptionElement() ..value = value ..text = text);
    });
    kindInput.value = user.kind;
    form.addAny('User type', kindInput);
    if (isNewUser) form.addExplanation(kindInput, 'Select your affiliation with the movement.');
    FormBuilder publicSubform = form.addSubformFrame('About Me (optional public information shown to all users)');
    var prefEmailNotifyChk = new CheckboxInputElement()
      ..checked = user.prefEmailNotify == 'Y';
    form.addAny('Email me notifications', prefEmailNotifyChk);
    var timeZoneInput = new SelectElement();
    HtmlLib.addOptionElements(timeZoneInput, user.allTimeZones);
    timeZoneInput.value = user.timeZone;
    form.addAny('Time zone', timeZoneInput);

    //define how to add public links rows; and define storage for
    //the added rows' kind and value elements
    List<SelectElement> publicLinkKinds = new List<SelectElement>();
    List<TextInputElement> publicLinkValues = new List<TextInputElement>();
    void add1PublicLink(String linkKind, String linkValue) {
      SelectElement kindEl = new SelectElement();
      kindEl.append(new OptionElement());//blank at top
      for (String k in Globals.allPublicLinkKinds)
        kindEl.append(new OptionElement(value: k) ..text = k);
      kindEl.value = linkKind;
      TextInputElement valEl = new TextInputElement()
        ..style.width = '200px'
        ..maxLength = 1000
        ..value = linkValue;
      publicSubform.addAnyAny(kindEl, valEl);
      publicLinkKinds.add(kindEl);
      publicLinkValues.add(valEl);
    }

    //render 'About me' public link fields in a subform;
    //start by making a row for each existing value in user
    InputElement publicNameInput = publicSubform.addInput('Real name', 200, 100, user.publicName);
    int nLinksCreated = 0;
    if (user.publicLinks != null) {
      user.publicLinks.forEach((kind, value) {
        add1PublicLink(kind, value);
        ++nLinksCreated;
      });
    }

    //now add more blank public links rows for a total of 5, using the
    //kinds that were not used above, for suggested kinds
    List<String> remainingKinds = Globals.allPublicLinkKinds.toList();
    if (user.publicLinks != null) {
      user.publicLinks.forEach((kind, value) {
        remainingKinds.remove(kind);
      });
    }
    int remainingIdx = 0;
    for (int i = nLinksCreated; i < 5; ++i)
      add1PublicLink(remainingKinds[remainingIdx++], '');

    //new user agreement box - only initialized/shown if new user
    FormBuilder newUserSubform;
    CheckboxInputElement iAgreeChk;
    if (isNewUser) {
      newUserSubform = form.addSubformFrame('Agreement');
      DivElement docDiv = new DivElement() ..style.overflowY = 'scroll' ..style.maxHeight = '350px';
      newUserSubform.parent.append(docDiv);
      String userAgreementHtml = MarkdownGetSanitizingConverter().makeHtml(userAgreement.body);
      docDiv.appendHtml(userAgreementHtml);
      iAgreeChk = new CheckboxInputElement();
      newUserSubform.addAny('I agree to the terms of service', iAgreeChk);

      //CAPTCHA would go here
    }

    //define how to grab the public link kinds/values from the DOM;
    //returns null if validation error
    List<StringTuple> getPublicLinksFromDom() {
      int n = publicLinkKinds.length;
      var ret = new List<StringTuple>();
      for (int i = 0; i < n; ++i) {
        String kind = publicLinkKinds[i].value ?? '';
        String value = (publicLinkValues[i].value ?? '').trim();
        if (value.length > 0) {
          if (kind.length == 0) return null;
          ret.add(new StringTuple() ..name = kind ..value = value);
        }
      }
      return ret;
    }

    //define validation
    bool isValid() {
      if (isNewUser) {
        String nick = trimInput(nickInput);
        String err = WLib.nickValidationError(nick);
        if (err != null) {form.showError(err); return false;}
      }
      String pw1 = trimInput(pw1Input), pw2 = trimInput(pw2Input);
      if (isNewUser || pw1.length > 0) {
        String err = WLib.passwordComplexityError(pw1);
        if (err != null) {form.showError(err); return false;}
      }
      if (pw1 != pw2) {form.showError('Passwords do not match'); return false;}
      if (isNewUser && !iAgreeChk.checked) {form.showError('You must agree to the terms of service.'); return false;}

      //find duplicate public link kinds
      List<StringTuple> links = getPublicLinksFromDom();
      if (links == null) {form.showError('You must select a kind of link for each item in About Me.'); return false; }
      List<String> linkKinds = links.map((v) => v.name).toList();
      if (hasDuplicates(linkKinds)) {form.showError('The items in About Me must not repeat.'); return false; }
      return true;
    }

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton(isNewUser ? 'Create Account' : 'Save', (e) async {
      if (!isValid()) return;

      //convert links to map
      List<StringTuple> links = getPublicLinksFromDom();
      Map<String, String> linksMap = new Map<String, String>();
      links.forEach((st) { linksMap[st.name] = st.value; });

      UserSaveRequest saveArgs = new UserSaveRequest()
        ..isNew = isNewUser ? 'Y' : 'N'
        ..saveNick = trimInput(nickInput)
        ..savePW = trimInput(pw1Input)
        ..kind = kindInput.value
        ..email = trimInput(emailInput)
        ..publicName = trimInput(publicNameInput)
        ..prefEmailNotify = prefEmailNotifyChk.checked ? 'Y' : 'N'
        ..timeZone = timeZoneInput.value
        ..publicLinks = linksMap
        ;
      if (saveArgs.savePW.length == 0) saveArgs.savePW = null; //required by server to avoid updating
      APIResponseBase response = await RpcLib.command('UserSave', saveArgs);
      if (response.isOK) {
        //for new accounts force them to login (this makes sure they really know the pw and uses the code
        // for storing creds in local storage)
        if (isNewUser) {
          onLogoutAccount();
          Messages.criticalMessage('Account created! Click "Log in" in the upper right corner to log in to your new account.');
        }
        hide(true);
        onChangeAccount();
      }
    });

    if (!isNewUser) {
      bar.addButton('Delete Account', (e) async {
        StringDialog confirm = new StringDialog('Type the word "delete" to delete your account', '', 6);
        String word = await confirm.show();
        if (word != null && word.toLowerCase() == 'delete') {
          hide(true);
          UserSaveRequest deleteArgs = new UserSaveRequest()..isDelete = 'Y';
          RpcLib.command('UserSave', deleteArgs); //not awaited!
          onLogoutAccount();
        }
      });
    }

    bar.addButton('Cancel', (e) {
      hide(false);
    });
  }

  ///determine if a list has duplicate items
  static bool hasDuplicates(List list) {
    Set s = new Set();
    for (int i = 0; i < list.length; ++i) {
      if (s.contains(list[i])) return true;
      s.add(list[i]);
    }
    return false;
  }

}
