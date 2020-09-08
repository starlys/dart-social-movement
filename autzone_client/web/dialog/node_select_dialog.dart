import 'dart:html';
import 'dart:async';
import '../lib/dialog_box.dart';
//import '../lib/html_lib.dart';
import '../lib/button_bar_builder.dart';
import '../lib/form_builder.dart';
import '../lib/outline_builder.dart';
import '../lib/category_node.dart';

///allows selecting a node from a tree of categories; returns the int id value of the
/// CategoryNode if one is selected, or null if canceled
class NodeSelectDialog extends DialogBox {
  List<CategoryNode> _topOptions;
  String _instructionText;

  NodeSelectDialog(this._topOptions, this._instructionText) : super() {}

  @override
  Future build() async {
    //define handling node selection
    OutlineBuilder outline;
    Future<dynamic> _nodeSelectHandler(Element node) {
      int id = int.parse(OutlineBuilder.getId(node));
      hide(id);
      return Future.value(null);
    }

    //main content - outline
    new FormBuilder(
        frame, _instructionText); //the form is just used to format the title
    outline = new OutlineBuilder(frame, (el) => _nodeSelectHandler(el));
    void addToOutlineRecur(
        Element parentElement, CategoryNode node, int level) {
      Element el = outline.add(parentElement, node.title, node.id.toString(),
          childrenCollapsed: level > 1);
      if (node.children != null) {
        for (CategoryNode cnode in node.children)
          addToOutlineRecur(el, cnode, level + 1);
      }
    }

    for (CategoryNode node in _topOptions) addToOutlineRecur(null, node, 0);

    //buttons
    ButtonBarBuilder bar = new ButtonBarBuilder(frame);
    bar.addButton('Cancel', (e) {
      hide(null);
      return null;
    });
  }
}
