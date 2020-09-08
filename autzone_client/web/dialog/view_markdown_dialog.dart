import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
import '../lib/button_bar_builder.dart';
import '../lib/js_interop.dart';

///show any markdown doc
class ViewMarkdownDialog extends DialogBox {
  String _dtext; //markdown text to show

  ViewMarkdownDialog(this._dtext) : super() {}

  @override
  int dialogHeight() {
    return window.innerHeight - 10;
  }

  @override
  Future build() async {
    //convert to html
    //var converter = markdownConverter();
    //var converter = new MarkdownConverter();
    var converter = MarkdownGetSanitizingConverter();
    String html = converter.makeHtml(_dtext);

    //show html and close button
    frame.appendHtml(html);
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('Close', (e) {
      hide(false);
      return null;
    });
  }
}
