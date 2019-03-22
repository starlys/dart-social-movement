import 'dart:html';
//import 'html_lib.dart';

typedef OutlineNodeHandler = Future Functon(Element);

///manages creating outlines (trees) with expand/collapse and node
/// selection
class OutlineBuilder {
  Element _parent; //all root items get added here
  OutlineNodeHandler _selectHandler;

  //general idea: Every node is a div.outline-node, which contains a
  // div.outline-icon and additional text. The outline-node has a property
  // data-id to identify it. Following every node is
  //an expansion div (.outline-childbox) containing its child nodes.
  //The caller can add other elements to the childbox

  OutlineBuilder(this._parent, this._selectHandler) {}

  //add a node to the outline; parentNode should be null to add to root,
  // or a value that was returned by add() for a child node
  Element add(Element parentNode, String text, String id, {bool childrenCollapsed: false}) {
    //add the node and childbox
    DivElement node = new DivElement() ..className = 'outline-node';
    node.dataset['id'] = id;
    Element addTo = _parent;
    if (parentNode != null) addTo = parentNode.querySelector('.outline-childbox');
    addTo.append(node);
    DivElement expander = new DivElement() ..className = 'outline-icon outline-icon-leaf';
    node.append(expander);
    SpanElement textSpan = new SpanElement() ..text = text ..className = 'outline-text';
    node.append(textSpan);
    DivElement childBox = new DivElement() ..className = 'outline-childbox';
    if (childrenCollapsed) childBox.style.display = 'none';
    node.append(childBox);

    //change parent's icon to branch
    if (parentNode != null) {
        Element parentIcon = parentNode.querySelector('.outline-icon');
        if (parentIcon.classes.contains('outline-icon-leaf')) {
          parentIcon.classes.remove('outline-icon-leaf');
          parentIcon.classes.add('outline-icon-branch');
        }
    }

    //handle node selection
    textSpan.onClick.listen((e) {
      //skip if already selected
      if (textSpan.classes.contains('selected')) return;

      //deselect all and select this one
      _parent.querySelectorAll('.outline-text.selected').classes.remove('selected');
      textSpan.classes.add('selected');

      //expand
      childBox.style.display = 'block';

      e.preventDefault();
      e.stopPropagation();

      //caller's handler
      if (_selectHandler != null) _selectHandler(node);
    });

    //handle node expansion
    expander.onClick.listen((e) {
      bool isVisible = childBox.style.display != 'none';

      //expand or collapse
      childBox.style.display = isVisible ? 'none' : 'block';
      e.preventDefault();
      e.stopPropagation();
    });

    return node;
  }

  ///get the id passed in add() for the node element
  static String getId(Element el) {
    return el.dataset['id'];
  }

  ///get the childbox for a given node (where el is returned by add())
  static Element getChildBox(Element el) {
    return el.querySelector('.outline-childbox');
  }
}
