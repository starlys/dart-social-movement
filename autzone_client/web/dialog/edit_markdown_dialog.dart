import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/html_lib.dart';
import '../lib/button_bar_builder.dart';
import '../lib/js_interop.dart';

///edit any markdown doc; show method returns the new text or null if canceled
class EditMarkdownDialog extends DialogBox {

  String _dtext; //markdown text to show
  String _idSuffix; //part of the DOM ids

  EditMarkdownDialog(this._dtext) : super() {
  }

  @override
  int dialogHeight() {return window.innerHeight - 10;}

  @override
  Future build() async {
    //create editor and button bar placeholders
    _idSuffix = '-' + HtmlLib.uniqueId();
    frame.append(new DivElement() ..id = 'wmd-button-bar' + _idSuffix);
    TextAreaElement edElement = new TextAreaElement()
      ..id = 'wmd-input' + _idSuffix
      ..style.width = HtmlLib.asPx(550)
      ..style.height = HtmlLib.asPx((dialogHeight() * 0.6).round())
      ..value = _dtext ?? '';
    frame.append(edElement);
    frame.appendHtml('<div class="explain">This site uses <a target="_blank" href="https://gist.github.com/budparr/9257428">Markdown</a> for editing.</div>', treeSanitizer: NodeTreeSanitizer.trusted);

    //close/cancel buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('OK', (e) {
      hide(edElement.value);
    });
    bar.addButton('Cancel', (e) {
      hide(null);
    });

    //preview
    frame.appendHtml('<h2>Preview</h2>');
    frame.append(new DivElement() ..id = 'wmd-preview' + _idSuffix); //maybe put this in separate tab?
  }

  @override
  Future afterShown() async {
    //convert regular divs to markdown editor
    var converter = MarkdownGetSanitizingConverter();
    MarkdownEditor editor = new MarkdownEditor(converter, _idSuffix);
    editor.run();
  }
}
