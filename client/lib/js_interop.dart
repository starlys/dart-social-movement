@JS()
library interop;

import 'package:js/js.dart';

//jGrowl
@JS()
@anonymous
class JGrowlOptions {
  external int get life; //in ms
  //could add any other option here if needed
  external factory JGrowlOptions({int life});
}
@JS('jQuery.jGrowl')
@anonymous
external void jGrowl(String s, JGrowlOptions options);
@JS('jQuery.jGrowl.defaults.position')
@anonymous
external set jGrowlPosition(String s);

///converts markdown to html
@JS('Markdown.Converter')
class MarkdownConverter {
  external MarkdownConverter();
  external makeHtml(String s);
}

@JS('Markdown.getSanitizingConverter')
external MarkdownConverter MarkdownGetSanitizingConverter();

@JS('Markdown.Editor')
class MarkdownEditor {
  ///attaches editor to elements #wmd-button-bar, #wmd-input, #wmd-preview (idSuffix being appended to the ids)
  external MarkdownEditor(MarkdownConverter cvt, String idSuffix);
  external run();
  external refreshPreview();
}
