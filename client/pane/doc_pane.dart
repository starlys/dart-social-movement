import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/globals.dart';
import '../root/pane_key.dart';
import '../twotier/wtypes.dart';
import '../rpc_lib.dart';
import '../lib/js_interop.dart';
import '../messages.dart';
import '../lib/string_dialog.dart';
import '../dialog/title_desc_dialog.dart';
import '../dialog/edit_markdown_dialog.dart';
import '../dialog/confirm_dialog.dart';

//Note concerning setInnerHtml and sanitizing:
//The simple assignment of html (_docContentElement.innerHtml = docHtml)
//will sanitize when the url is file://... so that images won't show.
//This is an issue when debugging but it should work in production. If
//it doesn't, a custom sanitizer and/or validator might need to be written.

///pane showing one document - paneKey is 'doc/id' or 'doc/s=specialcode'
class DocPane extends BasePane {
  DocGetResponse _doc;
  DivElement _docContentElement;
  //bool _hasEdits = false;
  //String _editedBody; //edited doc content (markdown), only set if _hasEdits is true

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);

    //get doc
    DocGetRequest req = new DocGetRequest();
    String docIdOrCode = pk.part1; //either an int or s=specialcode
    if (docIdOrCode.startsWith('s=')) req.specialCode = docIdOrCode.substring(2);
    else req.docId = int.parse(docIdOrCode);
    _doc = await RpcLib.docGet(req);

    //build pane
    buildSkeletonHtml2(paneClass: 'doc', iconHoverText: 'Document', iconName: 'panedoc', title: _doc.title);
    clearLoadingMessage();
    bodyElement.append(new DivElement() ..text = 'Created on ' + _doc.createdAt);
    //rev deatils section here
    var converter = MarkdownGetSanitizingConverter();
    String docHtml = converter.makeHtml(_doc.body);
    _docContentElement = new DivElement() ..className = 'content';
    bodyElement.append(_docContentElement);
    _docContentElement.setInnerHtml(docHtml, validator: null, treeSanitizer: null); //see note at top
    String editableMessage = _doc.reasonNotEditable ??
      (_doc.projectId != null ? 'You can save changes to this document' : 'You can make changes and submit the proposed changes for a vote');
    bodyElement.append(new DivElement() ..text = editableMessage);
    //history goes here

    //buttons
    if (_doc.allowSave == 'Y') {
      paneMenuBar.addButton('Edit Document', (e) async {
        if (!Messages.checkLoggedIn()) return;
        if (_doc.projectId == null) await Messages.criticalMessage('You may make proposed edits to this document, then those changes will be voted on by all users. Once you submit the proposal, it cannot be modified.');

        String newbody = _doc.body;
        while (true) { //loop for multiple edit cycles
          //edit in dialog; exit if canceled
          EditMarkdownDialog editDialog = new EditMarkdownDialog(newbody);
          newbody = await editDialog.show();
          if (newbody == null) return;

          //project doc, just save it
          if (_doc.projectId != null) {
            await _saveProjectDocChanges(newbody);
            return;
          }

          //root doc: ask if they really want to submit for vote
          ConfirmDialog conf = new ConfirmDialog('Submit proposed changes for vote now?', ['Yes', 'Make More Edits', 'Abandon Edits']);
          int btnIdx = await conf.show();
          if (btnIdx == 2) return; //abandon
          if (btnIdx == 0) {//go to vote
            await _proposeRootDocChanges(newbody);
            return;
          }
          //else loop back to editing
        }
      });
    }
    if (_doc.allowSave == 'Y' && _doc.isProjectManager == 'Y') {
      paneMenuBar.addButton('Retitle', (e) async {
        StringDialog titleDialog = new StringDialog('New Title', _doc.title, Globals.maxTitleLength);
        String title = await titleDialog.show();
        if (title != null) {
          var req = new DocSaveRequest()
            ..docId = _doc.docId
            ..projectId = _doc.projectId
            ..retitleMode = 'R'
            ..title = title;
          APIResponseBase resp = await RpcLib.command('DocSave', req);
          if (resp.ok == 'Y') {
            Messages.timed('Title changed.');
            _doc.title = title;
            retitle(title);
          }
        }
      });
    }
  }

  Future _proposeRootDocChanges(String newbody) async {
    TitleDescDialog titleDialog = new TitleDescDialog('Enter short summary of your changes for voting', false)
      ..title = 'Changes proposed to: ${_doc.title}';
    bool ok = await titleDialog.show();
    if (!ok) return;
    String summary = titleDialog.description;
    var req = new DocSaveRequest()
      ..docId = _doc.docId
      ..title = _doc.title
      ..body = newbody
      ..summary = summary;
    APIResponseBase resp = await RpcLib.command('DocSave', req);
    if (resp.ok == 'Y') Messages.criticalMessage('Document changes awaiting review. Once they are approved as non-spam, all users will have the opportunity to vote on the changes.');
  }

  Future _saveProjectDocChanges(String newbody) async {
    //save to server
    var req = new DocSaveRequest()
      ..docId = _doc.docId
      ..projectId = _doc.projectId
      ..title = _doc.title
      ..body = newbody;
    APIResponseBase resp = await RpcLib.command('DocSave', req);
    if (resp.ok == 'Y') Messages.timed('Document saved.');

    //update the preview
    var converter = MarkdownGetSanitizingConverter();
    String docHtml = converter.makeHtml(newbody);
    _docContentElement.setInnerHtml(docHtml, validator: null, treeSanitizer: null); //see note at top
  }
}
