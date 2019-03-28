import 'dart:html';
import 'dart:async';
import 'base_pane.dart';
import '../root/pane_key.dart';
import '../root/globals.dart';
import '../lib/outline_builder.dart';
import '../lib/html_lib.dart';
import '../lib/button_bar_builder.dart';
import 'package:models/models.dart';
import '../rpc_lib.dart';
import '../lib/category_node.dart';
import '../dialog/confirm_dialog.dart';
import '../dialog/category_dialog.dart';
import '../dialog/node_select_dialog.dart';
import '../dialog/select_multiple_dialog.dart';
import '../dialog/category_move_mode_dialog.dart';

///base class for project and resource outline panes
class BaseTreePane extends BasePane {

  //vars set in derived classes for buildSkeletonHtml
  String paneClass, paneTitle, categoryKind, paneIconName;

  //category storage
  List<CategoryNode> _topCats; //as tree shaped
  List<CategoryItemResponse> _allCats; //as flat list

  //detailbox or null
  DivElement _detailBox;

  //about the currently selected category
  int _selectedCatId;
  CategoryItemResponse _selectedCat;

  int get selectedCatId => _selectedCatId;

  @override
  Future init(PaneKey pk) async {
    await super.init(pk);
    buildSkeletonHtml2(paneClass: paneClass, iconName: paneIconName, title: paneTitle);

    //load categories, which comes back as a flat list; then convert to
    //tree-shaped data
    CategoryQueryResponse cats = await RpcLib.categoryQuery(new CategoryQueryRequest(kind: categoryKind));
    _allCats = cats.categories.cast<CategoryItemResponse>();
    List<CategoryNode> convertImmediateChildren(int parentId) {
      return _allCats.where((c) => c.parentId == parentId)
        .map((c) => new CategoryNode() ..title = c.title ..description = c.description ..id = c.iid)
        .toList();
    }
    void buildRecur(CategoryNode node) {
      List<CategoryNode> children = convertImmediateChildren(node.id);
      node.children = children;
      for (CategoryNode node in children) buildRecur(node);
    }
    _topCats = convertImmediateChildren(null);
    for (CategoryNode node in _topCats) buildRecur(node);

    //build outline
    clearLoadingMessage();
    OutlineBuilder outline = new OutlineBuilder(bodyElement, _nodeSelectHandler);
    void addToOutlineRecur(Element parentElement, CategoryNode node, int level) {
      Element el = outline.add(parentElement, node.title, node.id.toString(), childrenCollapsed: level > 1);
      if (node.children != null) {
        for (CategoryNode cnode in node.children) addToOutlineRecur(el, cnode, level + 1);
      }
    }
    for (CategoryNode node in _topCats) addToOutlineRecur(null, node, 0);
  }

  ///handle node selection: create detail box
  void _nodeSelectHandler(dynamic node0) async {
    final node = node0 as Element;

    //delete old detail box
    if (_detailBox != null) _detailBox.remove();

    //create and add detail box to DOM
    Element detailBoxParent = OutlineBuilder.getChildBox(node);
    _detailBox = new DivElement() ..className = 'subform-group';
    detailBoxParent.insertBefore(_detailBox, detailBoxParent.firstChild);

    //get the category details
    String idS = OutlineBuilder.getId(node);
    _selectedCatId = int.parse(idS);
    _selectedCat = _allCats.firstWhere((c) => c.iid == _selectedCatId, orElse: () => null);
    if (_selectedCat == null) return;

    //detail box contents
    //_detailBox.appendHtml('<b>${_selectedCat.title}</b>: ');
    HtmlLib.insertCollapsed1(_detailBox, _selectedCat.description ?? '');
    await insertDetails(_detailBox, _selectedCatId);

    //add button bar and let subclass fill it in
    ButtonBarBuilder bar = new ButtonBarBuilder(_detailBox);
    insertDetailButtons(bar, _selectedCatId);

    //for site admins, also add category controls
    if (Globals.isSiteAdmin) {
      bar.addButton('Delete Category', deleteCategoryHandler);
      bar.addButton('Create Category', createCategoryHandler);
      bar.addButton('Edit Category', editCategoryHandler);
      bar.addButton('Move Category', moveCategoryHandler);
      bar.addButton('Recategorize Contents', moveContentsHandler);
    }
  }

  ///when overridden appends html to detailBox to show more info on the given category
  Future insertDetails(Element detailBox, int catId) async {}

  ///when overridden appends buttons to detailBox button bar
  void insertDetailButtons(ButtonBarBuilder bar, int catId) {}

  ///delete selected category after confirmation
  Future deleteCategoryHandler(dynamic e0) async {
    ConfirmDialog dialog = new ConfirmDialog('Delete category? Items at this level will be moved up a level', ConfirmDialog.YesNoOptions);
    int btnNo = await dialog.show();
    if (btnNo != 0) return;
    CategoryDeleteRequest req = new CategoryDeleteRequest(catId: _selectedCatId, kind: categoryKind);
    APIResponseBase response = await RpcLib.categoryDelete(req);
    if (response.isOK) recreatePane();
  }

  ///create a new category as a sister or child of the selected one
  Future createCategoryHandler(dynamic e0) async {
    CategoryDialog dlg = new CategoryDialog(categoryKind, null, null, null, _selectedCatId, _selectedCat.title);
    bool saved = await dlg.show();
    if (saved) recreatePane(); //hack, might be better to update this pane so the same cat stays selected
  }

  ///edit the title/desc of the selected category
  Future editCategoryHandler(dynamic e0) async {
    CategoryDialog dlg = new CategoryDialog(categoryKind, _selectedCatId, _selectedCat.title,
      _selectedCat.description, null, null);
    bool saved = await dlg.show();
    if (saved) recreatePane(); //hack, might be better to update this pane so the same cat stays selected
  }

  ///move the selected category to the sister or child position relative to another reference category
  Future moveCategoryHandler(dynamic e0) async {
    //select the reference cat
    NodeSelectDialog dlg = new NodeSelectDialog(_topCats, 'Choose the target category (where this category will move to)');
    int referenceCatId = await dlg.show();
    if (referenceCatId == null) return;
    CategoryItemResponse referenceCat = _allCats.singleWhere((i) => i.iid == referenceCatId);

    //ask user if sister or child
    CategoryMoveModeDialog dlg2 = new CategoryMoveModeDialog(_selectedCat.title, referenceCat.title);
    String moveMode = await dlg2.show();
    if (moveMode == null) return;

    //save change
    CategorySaveRequest req = new CategorySaveRequest(
      catId: _selectedCatId,
      kind: categoryKind,
      referenceId: referenceCatId,
      referenceMode: moveMode,
      title: _selectedCat.title,
      description: _selectedCat.description);
    APIResponseBase response = await RpcLib.categorySave(req);
    if (response.isOK) recreatePane();
  }

  ///move some/all of the projects/resources in this category to another category
  Future moveContentsHandler(dynamic e0) async {
    //chose projects/resources to move
    SelectMultipleDialog dlg1 = new SelectMultipleDialog(getContentTitles(), 'Choose items to move to a new category');
    List<String> titlesToMove = await dlg1.show();
    if (titlesToMove == null) return;

    //select cat to move to
    NodeSelectDialog dlg2 = new NodeSelectDialog(_topCats, 'Choose category for moved contents');
    int targetCatId = await dlg2.show();
    if (targetCatId == null) return;
    CategoryItemResponse targetCat = _allCats.singleWhere((c) => c.iid == targetCatId);

    //confirm move
    String confMsg = '${titlesToMove.length} items will be moved to the category "${targetCat.title}". Continue?';
    ConfirmDialog dlg3 = new ConfirmDialog(confMsg, ConfirmDialog.YesNoOptions);
    int btnIdx = await dlg3.show();
    if (btnIdx != 0) return;

    //save changes
    List<int> idsToMove = getContentIds(titlesToMove);
    CategoryMoveContentsRequest req = new CategoryMoveContentsRequest(
      catId: targetCatId,
      kind: categoryKind,
      relatedIds: idsToMove);
    APIResponseBase response = await RpcLib.categoryMoveContents(req);
    if (response.isOK) recreatePane();
  }

  ///when overriden, returns all the titles of the contents in the selected category
  List<String> getContentTitles() {
    return null;
  }

  ///when overriden, returns all the ids for the given titles of the contents in the selected category
  List<int> getContentIds(List<String> contentTitles) {
    return null;
  }
}
