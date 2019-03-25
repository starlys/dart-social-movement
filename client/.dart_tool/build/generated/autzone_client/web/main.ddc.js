define(['dart_sdk', 'packages/models/models', 'packages/models/wlib'], function(dart_sdk, models, wlib) {
  'use strict';
  const core = dart_sdk.core;
  const async = dart_sdk.async;
  const convert = dart_sdk.convert;
  const html = dart_sdk.html;
  const math = dart_sdk.math;
  const _interceptors = dart_sdk._interceptors;
  const js = dart_sdk.js;
  const _js_helper = dart_sdk._js_helper;
  const collection = dart_sdk.collection;
  const dart = dart_sdk.dart;
  const dartx = dart_sdk.dartx;
  const src__models__wtypes = models.src__models__wtypes;
  const wlib$ = wlib.wlib;
  const _root = Object.create(null);
  const main = Object.create(_root);
  const client_store = Object.create(_root);
  const lib__html_lib = Object.create(_root);
  const lib__dialog_box = Object.create(_root);
  const lib__button_bar_builder = Object.create(_root);
  const lib__form_builder = Object.create(_root);
  const root__pane_key = Object.create(_root);
  const lib__js_interop = Object.create(_root);
  const dialog__confirm_dialog = Object.create(_root);
  const lib__outline_builder = Object.create(_root);
  const lib__category_node = Object.create(_root);
  const dialog__node_select_dialog = Object.create(_root);
  const dialog__select_multiple_dialog = Object.create(_root);
  const dialog__category_move_mode_dialog = Object.create(_root);
  const lib__string_dialog = Object.create(_root);
  const lib__card_builder = Object.create(_root);
  const dialog__edit_markdown_dialog = Object.create(_root);
  const dialog__view_markdown_dialog = Object.create(_root);
  const lib__string_tuple = Object.create(_root);
  const lib__primitive_datetime = Object.create(_root);
  const pane__user_pane = Object.create(_root);
  const pane__user_search_pane = Object.create(_root);
  const pane__resource_pane = Object.create(_root);
  const pane__resource_search_pane = Object.create(_root);
  const pane__event_pane = Object.create(_root);
  const dialog__event_dialog = Object.create(_root);
  const main_menu_handler = Object.create(_root);
  const dialog__location_dialog = Object.create(_root);
  const dialog__user_dialog = Object.create(_root);
  const dialog__login_recovery_dialog = Object.create(_root);
  const dialog__login_dialog = Object.create(_root);
  const main_controller = Object.create(_root);
  const pane__event_search_pane = Object.create(_root);
  const pane__proposal_pane = Object.create(_root);
  const pane__sys_proposal_list_pane = Object.create(_root);
  const pane__proposal_list_pane = Object.create(_root);
  const pane__active_proposal_list_pane = Object.create(_root);
  const dialog__resource_dialog = Object.create(_root);
  const pane__resource_tree_pane = Object.create(_root);
  const dialog__title_desc_dialog = Object.create(_root);
  const pane__doc_pane = Object.create(_root);
  const pane__root_docs_pane = Object.create(_root);
  const dialog__image_upload_dialog = Object.create(_root);
  const pane__conv_pane = Object.create(_root);
  const pane__conv_search_pane = Object.create(_root);
  const pane__project_members_pane = Object.create(_root);
  const pane__project_search_pane = Object.create(_root);
  const dialog__project_membership_dialog = Object.create(_root);
  const dialog__proposal_dialog = Object.create(_root);
  const dialog__conv_dialog = Object.create(_root);
  const pane__project_pane = Object.create(_root);
  const dialog__project_dialog = Object.create(_root);
  const pane__base_tree_pane = Object.create(_root);
  const pane__project_tree_pane = Object.create(_root);
  const pane__notify_pane = Object.create(_root);
  const messages = Object.create(_root);
  const rpc_lib = Object.create(_root);
  const push_queue_handler = Object.create(_root);
  const pane_factory = Object.create(_root);
  const pane__base_pane = Object.create(_root);
  const root__globals = Object.create(_root);
  const dialog__category_dialog = Object.create(_root);
  const $_get = dartx._get;
  const $_set = dartx._set;
  const $toString = dartx.toString;
  const $remove = dartx.remove;
  const $onStorage = dartx.onStorage;
  const $toInt = dartx.toInt;
  const $height = dartx.height;
  const $width = dartx.width;
  const $display = dartx.display;
  const $substring = dartx.substring;
  const $appendHtml = dartx.appendHtml;
  const $text = dartx.text;
  const $append = dartx.append;
  const $onClick = dartx.onClick;
  const $maxHeight = dartx.maxHeight;
  const $toList = dartx.toList;
  const $cast = dartx.cast;
  const $replaceAll = dartx.replaceAll;
  const $map = dartx.map;
  const $split = dartx.split;
  const $where = dartx.where;
  const $trim = dartx.trim;
  const $setInnerHtml = dartx.setInnerHtml;
  const $classes = dartx.classes;
  const $scrollIntoView = dartx.scrollIntoView;
  const $style = dartx.style;
  const $maxLength = dartx.maxLength;
  const $value = dartx.value;
  const $addRow = dartx.addRow;
  const $addCell = dartx.addCell;
  const $verticalAlign = dartx.verticalAlign;
  const $insertAdjacentElement = dartx.insertAdjacentElement;
  const $length = dartx.length;
  const $join = dartx.join;
  const $appendText = dartx.appendText;
  const $indexOf = dartx.indexOf;
  const $dataset = dartx.dataset;
  const $querySelectorAll = dartx.querySelectorAll;
  const $add = dartx.add;
  const $forEach = dartx.forEach;
  const $name = dartx.name;
  const $checked = dartx.checked;
  const $round = dartx.round;
  const $padLeft = dartx.padLeft;
  const $modulo = dartx['%'];
  const $floor = dartx.floor;
  const $onChange = dartx.onChange;
  const $innerHtml = dartx.innerHtml;
  const $marginBottom = dartx.marginBottom;
  const $first = dartx.first;
  const $marginLeft = dartx.marginLeft;
  const $zIndex = dartx.zIndex;
  const $margin = dartx.margin;
  const $overflowY = dartx.overflowY;
  const $toLowerCase = dartx.toLowerCase;
  const $onHashChange = dartx.onHashChange;
  const $onResize = dartx.onResize;
  const $onKeyDown = dartx.onKeyDown;
  const $clear = dartx.clear;
  const $bottom = dartx.bottom;
  const $top = dartx.top;
  const $last = dartx.last;
  const $skip = dartx.skip;
  const $location = dartx.location;
  const $borderTopWidth = dartx.borderTopWidth;
  const $left = dartx.left;
  const $valueAsNumber = dartx.valueAsNumber;
  const $min = dartx.min;
  const $max = dartx.max;
  const $fontWeight = dartx.fontWeight;
  const $target = dartx.target;
  const $contains = dartx.contains;
  const $firstWhere = dartx.firstWhere;
  const $singleWhere = dartx.singleWhere;
  const $startsWith = dartx.startsWith;
  const $accept = dartx.accept;
  const $result = dartx.result;
  const $onLoad = dartx.onLoad;
  const $files = dartx.files;
  const $disabled = dartx.disabled;
  const $placeholder = dartx.placeholder;
  const $textAlign = dartx.textAlign;
  const $parent = dartx.parent;
  const $replaceWith = dartx.replaceWith;
  const $any = dartx.any;
  const $removeWhere = dartx.removeWhere;
  const $addAll = dartx.addAll;
  const $title = dartx.title;
  const $scrollHeight = dartx.scrollHeight;
  const $scrollTop = dartx.scrollTop;
  const $animate = dartx.animate;
  const $onFinish = dartx.onFinish;
  let VoidToFuture = () => (VoidToFuture = dart.constFn(dart.fnType(async.Future, [])))();
  let StorageEventToNull = () => (StorageEventToNull = dart.constFn(dart.fnType(core.Null, [html.StorageEvent])))();
  let MouseEventToNull = () => (MouseEventToNull = dart.constFn(dart.fnType(core.Null, [html.MouseEvent])))();
  let StringToString = () => (StringToString = dart.constFn(dart.fnType(core.String, [core.String])))();
  let IterableOfString = () => (IterableOfString = dart.constFn(core.Iterable$(core.String)))();
  let StringTobool = () => (StringTobool = dart.constFn(dart.fnType(core.bool, [core.String])))();
  let ListOfString = () => (ListOfString = dart.constFn(core.List$(core.String)))();
  let dynamicToFuture = () => (dynamicToFuture = dart.constFn(dart.fnType(async.Future, [dart.dynamic])))();
  let JSArrayOfString = () => (JSArrayOfString = dart.constFn(_interceptors.JSArray$(core.String)))();
  let dynamicTovoid = () => (dynamicTovoid = dart.constFn(dart.fnType(dart.void, [dart.dynamic])))();
  let ListOfCategoryNode = () => (ListOfCategoryNode = dart.constFn(core.List$(lib__category_node.CategoryNode)))();
  let ElementToFuture = () => (ElementToFuture = dart.constFn(dart.fnType(async.Future, [html.Element])))();
  let ElementAndCategoryNodeAndintTovoid = () => (ElementAndCategoryNodeAndintTovoid = dart.constFn(dart.fnType(dart.void, [html.Element, lib__category_node.CategoryNode, core.int])))();
  let dynamicToNull = () => (dynamicToNull = dart.constFn(dart.fnType(core.Null, [dart.dynamic])))();
  let OptionElementToNull = () => (OptionElementToNull = dart.constFn(dart.fnType(core.Null, [html.OptionElement])))();
  let ListOfOptionElement = () => (ListOfOptionElement = dart.constFn(core.List$(html.OptionElement)))();
  let FutureOfNull = () => (FutureOfNull = dart.constFn(async.Future$(core.Null)))();
  let dynamicToFutureOfNull = () => (dynamicToFutureOfNull = dart.constFn(dart.fnType(FutureOfNull(), [dart.dynamic])))();
  let StringAndStringToNull = () => (StringAndStringToNull = dart.constFn(dart.fnType(core.Null, [core.String, core.String])))();
  let boolAndStringToCheckboxInputElement = () => (boolAndStringToCheckboxInputElement = dart.constFn(dart.fnType(html.CheckboxInputElement, [core.bool, core.String])))();
  let ListOfAPIResponseAssociation = () => (ListOfAPIResponseAssociation = dart.constFn(core.List$(src__models__wtypes.APIResponseAssociation)))();
  let StringAndListOfAPIResponseAssociationAndStringTovoid = () => (StringAndListOfAPIResponseAssociationAndStringTovoid = dart.constFn(dart.fnType(dart.void, [core.String, ListOfAPIResponseAssociation(), core.String])))();
  let _EventGetUserResponseTobool = () => (_EventGetUserResponseTobool = dart.constFn(dart.fnType(core.bool, [src__models__wtypes._EventGetUserResponse])))();
  let EventToFutureOfNull = () => (EventToFutureOfNull = dart.constFn(dart.fnType(FutureOfNull(), [html.Event])))();
  let ListOfdouble = () => (ListOfdouble = dart.constFn(core.List$(core.double)))();
  let MouseEventToFutureOfNull = () => (MouseEventToFutureOfNull = dart.constFn(dart.fnType(FutureOfNull(), [html.MouseEvent])))();
  let JSArrayOfdouble = () => (JSArrayOfdouble = dart.constFn(_interceptors.JSArray$(core.double)))();
  let FutureOfBasePane = () => (FutureOfBasePane = dart.constFn(async.Future$(pane__base_pane.BasePane)))();
  let VoidToFutureOfBasePane = () => (VoidToFutureOfBasePane = dart.constFn(dart.fnType(FutureOfBasePane(), [])))();
  let VoidTovoid = () => (VoidTovoid = dart.constFn(dart.fnType(dart.void, [])))();
  let VoidToNull = () => (VoidToNull = dart.constFn(dart.fnType(core.Null, [])))();
  let JSArrayOfElement = () => (JSArrayOfElement = dart.constFn(_interceptors.JSArray$(html.Element)))();
  let EventToNull = () => (EventToNull = dart.constFn(dart.fnType(core.Null, [html.Event])))();
  let ElementAndboolTovoid = () => (ElementAndboolTovoid = dart.constFn(dart.fnType(dart.void, [html.Element, core.bool])))();
  let IdentityMapOfString$dynamic = () => (IdentityMapOfString$dynamic = dart.constFn(_js_helper.IdentityMap$(core.String, dart.dynamic)))();
  let IdentityMapOfString$String = () => (IdentityMapOfString$String = dart.constFn(_js_helper.IdentityMap$(core.String, core.String)))();
  let dynamicAnddynamicToNull = () => (dynamicAnddynamicToNull = dart.constFn(dart.fnType(core.Null, [dart.dynamic, dart.dynamic])))();
  let JSArrayOfObject = () => (JSArrayOfObject = dart.constFn(_interceptors.JSArray$(core.Object)))();
  let JSArrayOfNull = () => (JSArrayOfNull = dart.constFn(_interceptors.JSArray$(core.Null)))();
  let JSArrayOfSelectElement = () => (JSArrayOfSelectElement = dart.constFn(_interceptors.JSArray$(html.SelectElement)))();
  let JSArrayOfTextInputElement = () => (JSArrayOfTextInputElement = dart.constFn(_interceptors.JSArray$(html.TextInputElement)))();
  let StringAndStringTovoid = () => (StringAndStringTovoid = dart.constFn(dart.fnType(dart.void, [core.String, core.String])))();
  let JSArrayOfStringTuple = () => (JSArrayOfStringTuple = dart.constFn(_interceptors.JSArray$(lib__string_tuple.StringTuple)))();
  let ListOfStringTuple = () => (ListOfStringTuple = dart.constFn(core.List$(lib__string_tuple.StringTuple)))();
  let VoidToListOfStringTuple = () => (VoidToListOfStringTuple = dart.constFn(dart.fnType(ListOfStringTuple(), [])))();
  let StringTupleToString = () => (StringTupleToString = dart.constFn(dart.fnType(core.String, [lib__string_tuple.StringTuple])))();
  let VoidTobool = () => (VoidTobool = dart.constFn(dart.fnType(core.bool, [])))();
  let StringTupleToNull = () => (StringTupleToNull = dart.constFn(dart.fnType(core.Null, [lib__string_tuple.StringTuple])))();
  let FutureOfString = () => (FutureOfString = dart.constFn(async.Future$(core.String)))();
  let StringAndStringAndboolToFutureOfString = () => (StringAndStringAndboolToFutureOfString = dart.constFn(dart.fnType(FutureOfString(), [core.String, core.String, core.bool])))();
  let MouseEventTovoid = () => (MouseEventTovoid = dart.constFn(dart.fnType(dart.void, [html.MouseEvent])))();
  let EventToFuture = () => (EventToFuture = dart.constFn(dart.fnType(async.Future, [html.Event])))();
  let EventTovoid = () => (EventTovoid = dart.constFn(dart.fnType(dart.void, [html.Event])))();
  let KeyboardEventTovoid = () => (KeyboardEventTovoid = dart.constFn(dart.fnType(dart.void, [html.KeyboardEvent])))();
  let MapOfString$VoidToFuture = () => (MapOfString$VoidToFuture = dart.constFn(core.Map$(core.String, VoidToFuture())))();
  let StringAndFnToFuture = () => (StringAndFnToFuture = dart.constFn(dart.fnType(async.Future, [core.String, VoidToFuture()])))();
  let JSArrayOfCheckboxInputElement = () => (JSArrayOfCheckboxInputElement = dart.constFn(_interceptors.JSArray$(html.CheckboxInputElement)))();
  let boolAndStringAndintToCheckboxInputElement = () => (boolAndStringAndintToCheckboxInputElement = dart.constFn(dart.fnType(html.CheckboxInputElement, [core.bool, core.String, core.int])))();
  let _ResourceItemToString = () => (_ResourceItemToString = dart.constFn(dart.fnType(core.String, [src__models__wtypes._ResourceItem])))();
  let intTobool = () => (intTobool = dart.constFn(dart.fnType(core.bool, [core.int])))();
  let _ResourceItemTobool = () => (_ResourceItemTobool = dart.constFn(dart.fnType(core.bool, [src__models__wtypes._ResourceItem])))();
  let StringToint = () => (StringToint = dart.constFn(dart.fnType(core.int, [core.String])))();
  let IterableOfint = () => (IterableOfint = dart.constFn(core.Iterable$(core.int)))();
  let ListOfCategoryItemResponse = () => (ListOfCategoryItemResponse = dart.constFn(core.List$(src__models__wtypes.CategoryItemResponse)))();
  let CategoryItemResponseToCategoryNode = () => (CategoryItemResponseToCategoryNode = dart.constFn(dart.fnType(lib__category_node.CategoryNode, [src__models__wtypes.CategoryItemResponse])))();
  let CategoryItemResponseTobool = () => (CategoryItemResponseTobool = dart.constFn(dart.fnType(core.bool, [src__models__wtypes.CategoryItemResponse])))();
  let IterableOfCategoryNode = () => (IterableOfCategoryNode = dart.constFn(core.Iterable$(lib__category_node.CategoryNode)))();
  let intToListOfCategoryNode = () => (intToListOfCategoryNode = dart.constFn(dart.fnType(ListOfCategoryNode(), [core.int])))();
  let CategoryNodeTovoid = () => (CategoryNodeTovoid = dart.constFn(dart.fnType(dart.void, [lib__category_node.CategoryNode])))();
  let ListOfint = () => (ListOfint = dart.constFn(core.List$(core.int)))();
  let ProgressEventToFutureOfNull = () => (ProgressEventToFutureOfNull = dart.constFn(dart.fnType(FutureOfNull(), [html.ProgressEvent])))();
  let LinkedMapOfConvGetPostItem$Element = () => (LinkedMapOfConvGetPostItem$Element = dart.constFn(_js_helper.LinkedMap$(src__models__wtypes.ConvGetPostItem, html.Element)))();
  let ConvGetPostItemAndElementToNull = () => (ConvGetPostItemAndElementToNull = dart.constFn(dart.fnType(core.Null, [src__models__wtypes.ConvGetPostItem, html.Element])))();
  let MouseEventToFuture = () => (MouseEventToFuture = dart.constFn(dart.fnType(async.Future, [html.MouseEvent])))();
  let KeyboardEventToNull = () => (KeyboardEventToNull = dart.constFn(dart.fnType(core.Null, [html.KeyboardEvent])))();
  let JSArrayOfPushQueueItem = () => (JSArrayOfPushQueueItem = dart.constFn(_interceptors.JSArray$(src__models__wtypes.PushQueueItem)))();
  let MapOfConvGetPostItem$Element = () => (MapOfConvGetPostItem$Element = dart.constFn(core.Map$(src__models__wtypes.ConvGetPostItem, html.Element)))();
  let IdentityMapOfint$String = () => (IdentityMapOfint$String = dart.constFn(_js_helper.IdentityMap$(core.int, core.String)))();
  let ProjectUserItemTobool = () => (ProjectUserItemTobool = dart.constFn(dart.fnType(core.bool, [src__models__wtypes.ProjectUserItem])))();
  let ListOfProjectUserItem = () => (ListOfProjectUserItem = dart.constFn(core.List$(src__models__wtypes.ProjectUserItem)))();
  let MapOfint$String = () => (MapOfint$String = dart.constFn(core.Map$(core.int, core.String)))();
  let JSArrayOfint = () => (JSArrayOfint = dart.constFn(_interceptors.JSArray$(core.int)))();
  let _ProjectQueryItemToString = () => (_ProjectQueryItemToString = dart.constFn(dart.fnType(core.String, [src__models__wtypes._ProjectQueryItem])))();
  let _ProjectQueryItemTobool = () => (_ProjectQueryItemTobool = dart.constFn(dart.fnType(core.bool, [src__models__wtypes._ProjectQueryItem])))();
  let ListOfProjectQueryItem = () => (ListOfProjectQueryItem = dart.constFn(core.List$(src__models__wtypes.ProjectQueryItem)))();
  let PushQueueItemTobool = () => (PushQueueItemTobool = dart.constFn(dart.fnType(core.bool, [src__models__wtypes.PushQueueItem])))();
  let MapOfString$dynamic = () => (MapOfString$dynamic = dart.constFn(core.Map$(core.String, dart.dynamic)))();
  let FutureOrOfMapOfString$dynamic = () => (FutureOrOfMapOfString$dynamic = dart.constFn(async.FutureOr$(MapOfString$dynamic())))();
  let StringAnddynamicToNull = () => (StringAnddynamicToNull = dart.constFn(dart.fnType(core.Null, [core.String, dart.dynamic])))();
  let ListOfPushQueueItem = () => (ListOfPushQueueItem = dart.constFn(core.List$(src__models__wtypes.PushQueueItem)))();
  let BasePaneTobool = () => (BasePaneTobool = dart.constFn(dart.fnType(core.bool, [pane__base_pane.BasePane])))();
  let dynamicToPushQueueItem = () => (dynamicToPushQueueItem = dart.constFn(dart.fnType(src__models__wtypes.PushQueueItem, [dart.dynamic])))();
  let IdentityMapOfString$Object = () => (IdentityMapOfString$Object = dart.constFn(_js_helper.IdentityMap$(core.String, core.Object)))();
  let MapOfString$Object = () => (MapOfString$Object = dart.constFn(core.Map$(core.String, core.Object)))();
  let PushQueueItemToMapOfString$Object = () => (PushQueueItemToMapOfString$Object = dart.constFn(dart.fnType(MapOfString$Object(), [src__models__wtypes.PushQueueItem])))();
  let IterableOfMapOfString$Object = () => (IterableOfMapOfString$Object = dart.constFn(core.Iterable$(MapOfString$Object())))();
  let PushQueueItemToString = () => (PushQueueItemToString = dart.constFn(dart.fnType(core.String, [src__models__wtypes.PushQueueItem])))();
  let StringAndboolAndFunctionTovoid = () => (StringAndboolAndFunctionTovoid = dart.constFn(dart.fnType(dart.void, [core.String, core.bool, core.Function])))();
  let dynamicTobool = () => (dynamicTobool = dart.constFn(dart.fnType(core.bool, [dart.dynamic])))();
  let VoidToPushQueueItem = () => (VoidToPushQueueItem = dart.constFn(dart.fnType(src__models__wtypes.PushQueueItem, [])))();
  let VoidToint = () => (VoidToint = dart.constFn(dart.fnType(core.int, [])))();
  let JSArrayOfMapOfString$dynamic = () => (JSArrayOfMapOfString$dynamic = dart.constFn(_interceptors.JSArray$(MapOfString$dynamic())))();
  let JSArrayOfBasePane = () => (JSArrayOfBasePane = dart.constFn(_interceptors.JSArray$(pane__base_pane.BasePane)))();
  let IdentityMapOfString$VoidToFuture = () => (IdentityMapOfString$VoidToFuture = dart.constFn(_js_helper.IdentityMap$(core.String, VoidToFuture())))();
  main.main = function() {
    return async.async(dart.dynamic, function* main() {
      async.Timer.run(dart.fn(() => main_controller.MainController.startApp(), VoidToFuture()));
    });
  };
  client_store.ClientStore = class ClientStore extends core.Object {
    static get fontTheme() {
      return client_store.ClientStore._store[$_get]("font-theme");
    }
    static set fontTheme(name) {
      client_store.ClientStore._store[$_set]("font-theme", name);
    }
    static get colorTheme() {
      return client_store.ClientStore._store[$_get]("color-theme");
    }
    static set colorTheme(name) {
      client_store.ClientStore._store[$_set]("color-theme", name);
    }
    static get nick() {
      return client_store.ClientStore._store[$_get]("nick");
    }
    static set nick(name) {
      client_store.ClientStore._store[$_set]("nick", name);
    }
    static get password() {
      return client_store.ClientStore._store[$_get]("password");
    }
    static set password(name) {
      client_store.ClientStore._store[$_set]("password", name);
    }
    static get lat() {
      let l = core.double.tryParse((() => {
        let l = client_store.ClientStore._store[$_get]("lat");
        return l != null ? l : "0";
      })());
      return l != null ? l : 0.0;
    }
    static set lat(d) {
      client_store.ClientStore._store[$_set]("lat", dart.toString(d));
    }
    static get lon() {
      let l = core.double.tryParse((() => {
        let l = client_store.ClientStore._store[$_get]("lon");
        return l != null ? l : "0";
      })());
      return l != null ? l : 0.0;
    }
    static set lon(d) {
      client_store.ClientStore._store[$_set]("lon", dart.toString(d));
    }
    static sendMessage(msg) {
      let json2 = convert.json.encode(msg);
      client_store.ClientStore._store[$_set]("message", json2);
      client_store.ClientStore._store[$remove]("message");
    }
    static registerReceiveMessage(f) {
      html.window[$onStorage].listen(dart.fn(e => {
        let message = convert.json.decode(e.newValue);
        f(message);
      }, StorageEventToNull()));
    }
  };
  (client_store.ClientStore.new = function() {
  }).prototype = client_store.ClientStore.prototype;
  dart.addTypeTests(client_store.ClientStore);
  dart.defineLazy(client_store.ClientStore, {
    /*client_store.ClientStore._store*/get _store() {
      return html.window.localStorage;
    },
    set _store(_) {}
  });
  let const$;
  lib__html_lib.HtmlLib = class HtmlLib extends core.Object {
    static asPx(n) {
      if (typeof n == 'number') return n[$toInt]()[$toString]() + "px";
      return dart.notNull(dart.toString(n)) + "px";
    }
    static uniqueId() {
      return "e" + (lib__html_lib.HtmlLib._maxid = dart.notNull(lib__html_lib.HtmlLib._maxid) + 1)[$toString]();
    }
    static height(selector, h) {
      html.querySelector(selector).style[$height] = lib__html_lib.HtmlLib.asPx(h);
    }
    static width(selector, h) {
      html.querySelector(selector).style[$width] = lib__html_lib.HtmlLib.asPx(h);
    }
    static showViaStyle(selector, show) {
      html.querySelector(selector).style[$display] = dart.test(show) ? "inline-block" : "none";
    }
    static insertCollapsed1(parent, collapsible, opts) {
      let collapsePosition = opts && 'collapsePosition' in opts ? opts.collapsePosition : 150;
      let moreMessage = opts && 'moreMessage' in opts ? opts.moreMessage : null;
      let hideInitial = opts && 'hideInitial' in opts ? opts.hideInitial : false;
      collapsible = collapsible != null ? collapsible : "";
      if (collapsible.length > dart.notNull(collapsePosition) + 20) {
        let first = collapsible[$substring](0, collapsePosition);
        let second = collapsible[$substring](collapsePosition);
        lib__html_lib.HtmlLib.insertCollapsed2(parent, first, second, {moreMessage: moreMessage, hideInitial: hideInitial});
      } else {
        parent[$appendHtml](lib__html_lib.HtmlLib.unsafeStringToSafeHtmlWithLineBreaks(collapsible), {treeSanitizer: html.NodeTreeSanitizer.trusted});
      }
    }
    static insertCollapsed2(parent, first, second, opts) {
      let moreMessage = opts && 'moreMessage' in opts ? opts.moreMessage : null;
      let hideInitial = opts && 'hideInitial' in opts ? opts.hideInitial : false;
      if (moreMessage == null) moreMessage = lib__html_lib.HtmlLib.MORE;
      let firstE = html.SpanElement.new();
      lib__html_lib.HtmlLib.setTextWithLineBreaks(firstE, first);
      let moreE = html.SpanElement.new();
      moreE[$text] = moreMessage;
      moreE.className = "text-expander";
      let secondE = html.SpanElement.new();
      secondE.style[$display] = "none";
      lib__html_lib.HtmlLib.setTextWithLineBreaks(secondE, second);
      parent[$append](firstE);
      parent[$append](moreE);
      parent[$append](secondE);
      moreE[$onClick].listen(dart.fn(e => {
        if (dart.test(hideInitial)) firstE[$remove]();
        moreE[$remove]();
        secondE.style[$display] = "";
      }, MouseEventToNull()));
    }
    static addOptionElements(sel, options) {
      for (let opt of options)
        sel[$append]((() => {
          let _ = html.OptionElement.new();
          _.value = dart.toString(opt);
          _[$text] = dart.toString(opt);
          return _;
        })());
    }
    static appendScrollingDiv(parent, opts) {
      let maxHeight = opts && 'maxHeight' in opts ? opts.maxHeight : 200;
      let s = html.DivElement.new();
      s.className = "scroll-list";
      s.style[$maxHeight] = lib__html_lib.HtmlLib.asPx(maxHeight);
      parent[$append](s);
      return s;
    }
    static appendLinkToPane(parent, title, paneKey, opts) {
      let asDiv = opts && 'asDiv' in opts ? opts.asDiv : true;
      let a = html.AnchorElement.new();
      a.href = "#" + dart.notNull(paneKey);
      a[$text] = title;
      if (dart.test(asDiv)) a.style[$display] = "block";
      parent[$append](a);
    }
    static textAreaValueToLines(el, opts) {
      let removeBlanks = opts && 'removeBlanks' in opts ? opts.removeBlanks : false;
      let lines = IterableOfString()._check(IterableOfString()._check(el.value[$split]("\n")[$map](core.String, dart.fn(s => s[$replaceAll]("\r", ""), StringToString())))[$cast](core.String))[$toList]();
      if (dart.test(removeBlanks)) {
        lines = IterableOfString()._check(lines[$map](core.String, dart.fn(o => o[$trim](), StringToString())))[$where](dart.fn(o => o.length > 0, StringTobool()))[$toList]();
      }
      return lines;
    }
    static unsafeStringToSafeHtmlWithLineBreaks(s) {
      let escaper = const$ || (const$ = dart.const(new convert.HtmlEscape.new()));
      s = escaper.convert(s);
      s = s[$replaceAll]("\r", "")[$replaceAll]("\n", "<br/>");
      return s;
    }
    static setTextWithLineBreaks(el, text) {
      el[$setInnerHtml](lib__html_lib.HtmlLib.unsafeStringToSafeHtmlWithLineBreaks(text), {treeSanitizer: html.NodeTreeSanitizer.trusted, validator: null});
    }
  };
  (lib__html_lib.HtmlLib.new = function() {
  }).prototype = lib__html_lib.HtmlLib.prototype;
  dart.addTypeTests(lib__html_lib.HtmlLib);
  dart.defineLazy(lib__html_lib.HtmlLib, {
    /*lib__html_lib.HtmlLib._maxid*/get _maxid() {
      return 0;
    },
    set _maxid(_) {},
    /*lib__html_lib.HtmlLib.MORE*/get MORE() {
      return "More";
    }
  });
  const _showing = Symbol('_showing');
  const _continuation = Symbol('_continuation');
  const _backdrop = Symbol('_backdrop');
  lib__dialog_box.DialogBox = class DialogBox extends core.Object {
    get frame() {
      return this[frame];
    }
    set frame(value) {
      this[frame] = value;
    }
    build() {
      return async.async(dart.dynamic, function* build() {
      });
    }
    afterShown() {
      return async.async(dart.dynamic, function* afterShown() {
      });
    }
    dialogHeight() {
      return 300;
    }
    typicalControlWidth() {
      return 400;
    }
    show() {
      return async.async(dart.dynamic, (function* show() {
        if (dart.test(this[_showing])) return this[_continuation].future;
        yield this.build();
        let width = math.min(core.int, 600, dart.notNull(html.window.innerWidth) - 10);
        let height = math.min(core.int, this.dialogHeight(), dart.notNull(html.window.innerHeight) - 90);
        this.frame.style[$height] = lib__html_lib.HtmlLib.asPx(height);
        this.frame.style[$width] = lib__html_lib.HtmlLib.asPx(width);
        let l = client_store.ClientStore.fontTheme;
        let fontTheme = l != null ? l : "";
        if (fontTheme.length > 0) this.frame[$classes].add(fontTheme);
        html.document.body[$append](this[_backdrop]);
        html.document.body[$append](this.frame);
        this[_showing] = true;
        yield this.afterShown();
        this[_continuation] = async.Completer.new();
        return yield this[_continuation].future;
      }).bind(this));
    }
    hide(value) {
      if (!dart.test(this[_showing])) return;
      this.frame[$remove]();
      this[_backdrop][$remove]();
      this[_showing] = false;
      this[_continuation].complete(value);
    }
    trimInput(i) {
      return i.value[$trim]();
    }
    trimTextArea(i) {
      return i.value[$trim]();
    }
  };
  (lib__dialog_box.DialogBox.new = function() {
    this[_showing] = false;
    this[_continuation] = null;
    this[_backdrop] = null;
    this[frame] = null;
    let _ = html.DivElement.new();
    _.className = "dialog-backdrop";
    this[_backdrop] = _;
    let _$ = html.DivElement.new();
    _$.className = "dialog-frame";
    this.frame = _$;
  }).prototype = lib__dialog_box.DialogBox.prototype;
  dart.addTypeTests(lib__dialog_box.DialogBox);
  const frame = Symbol("DialogBox.frame");
  dart.setMethodSignature(lib__dialog_box.DialogBox, () => ({
    __proto__: dart.getMethods(lib__dialog_box.DialogBox.__proto__),
    build: dart.fnType(async.Future, []),
    afterShown: dart.fnType(async.Future, []),
    dialogHeight: dart.fnType(core.int, []),
    typicalControlWidth: dart.fnType(core.int, []),
    show: dart.fnType(async.Future, []),
    hide: dart.fnType(dart.void, [dart.dynamic]),
    trimInput: dart.fnType(core.String, [html.InputElement]),
    trimTextArea: dart.fnType(core.String, [html.TextAreaElement])
  }));
  dart.setFieldSignature(lib__dialog_box.DialogBox, () => ({
    __proto__: dart.getFields(lib__dialog_box.DialogBox.__proto__),
    [_showing]: dart.fieldType(core.bool),
    [_continuation]: dart.fieldType(async.Completer),
    [_backdrop]: dart.fieldType(html.Element),
    frame: dart.fieldType(html.Element)
  }));
  const _buttonsDiv = Symbol('_buttonsDiv');
  lib__button_bar_builder.ButtonBarBuilder = class ButtonBarBuilder extends core.Object {
    addButton(text, handler) {
      let b = html.ButtonElement.new();
      b[$text] = text;
      b.className = "button";
      b[$onClick].listen(dart.fn(e => {
        if (lib__button_bar_builder.ButtonBarBuilder.systemButtonHandler != null) lib__button_bar_builder.ButtonBarBuilder.systemButtonHandler();
        handler(e);
      }, MouseEventToNull()));
      this[_buttonsDiv][$append](b);
      return b;
    }
    addElement(child) {
      this[_buttonsDiv][$append](child);
    }
  };
  (lib__button_bar_builder.ButtonBarBuilder.new = function(parent, opts) {
    let className = opts && 'className' in opts ? opts.className : null;
    let _ = html.DivElement.new();
    _.className = "button-bar";
    this[_buttonsDiv] = _;
    if (className != null) {
      let o = this[_buttonsDiv];
      o.className = dart.notNull(o.className) + (" " + dart.notNull(className));
    }
    parent[$append](this[_buttonsDiv]);
  }).prototype = lib__button_bar_builder.ButtonBarBuilder.prototype;
  dart.addTypeTests(lib__button_bar_builder.ButtonBarBuilder);
  dart.setMethodSignature(lib__button_bar_builder.ButtonBarBuilder, () => ({
    __proto__: dart.getMethods(lib__button_bar_builder.ButtonBarBuilder.__proto__),
    addButton: dart.fnType(html.ButtonElement, [core.String, dart.fnType(async.Future, [dart.dynamic])]),
    addElement: dart.fnType(dart.void, [html.Element])
  }));
  dart.setFieldSignature(lib__button_bar_builder.ButtonBarBuilder, () => ({
    __proto__: dart.getFields(lib__button_bar_builder.ButtonBarBuilder.__proto__),
    [_buttonsDiv]: dart.fieldType(html.DivElement)
  }));
  dart.defineLazy(lib__button_bar_builder.ButtonBarBuilder, {
    /*lib__button_bar_builder.ButtonBarBuilder.systemButtonHandler*/get systemButtonHandler() {
      return null;
    },
    set systemButtonHandler(_) {}
  });
  const _parent = Symbol('_parent');
  const _table = Symbol('_table');
  const _error = Symbol('_error');
  lib__form_builder.FormBuilder = class FormBuilder extends core.Object {
    get parent() {
      return this[_parent];
    }
    showError(s) {
      this[_error][$text] = s;
      this[_error][$scrollIntoView]();
    }
    addInput(caption, width, maxLength, value) {
      if (value === void 0) value = "";
      let inp = html.TextInputElement.new();
      inp[$style][$width] = lib__html_lib.HtmlLib.asPx(width);
      inp[$maxLength] = maxLength;
      inp[$value] = value;
      this.addAny(caption, inp);
      return html.InputElement._check(inp);
    }
    addPasswordInput(caption, width, maxLength, value) {
      if (value === void 0) value = "";
      let inp = html.PasswordInputElement.new();
      inp[$style][$width] = lib__html_lib.HtmlLib.asPx(width);
      inp[$maxLength] = maxLength;
      inp[$value] = value;
      this.addAny(caption, inp);
      return inp;
    }
    addTextArea(caption, width, height, maxLength, value) {
      if (value === void 0) value = "";
      let inp = html.TextAreaElement.new();
      inp.style[$width] = lib__html_lib.HtmlLib.asPx(width);
      inp.style[$height] = lib__html_lib.HtmlLib.asPx(height);
      inp.maxLength = maxLength;
      inp.value = value;
      this.addAny(caption, inp);
      return inp;
    }
    addAny(caption, ctrl) {
      let row = this[_table][$addRow]();
      let _ = row[$addCell]();
      _[$text] = caption;
      _.style[$verticalAlign] = "top";
      row[$addCell]()[$append](ctrl);
    }
    addExplanation(el, text) {
      let div = html.DivElement.new();
      div.className = "explain";
      div[$text] = text;
      el[$insertAdjacentElement]("afterEnd", div);
    }
    addAnyAny(leftCtrl, rightCtrl) {
      let row = this[_table][$addRow]();
      row[$addCell]()[$append](leftCtrl);
      row[$addCell]()[$append](rightCtrl);
    }
    addSubformFrame(caption) {
      let row = this[_table][$addRow]();
      let cell = row[$addCell]();
      cell.colSpan = 2;
      let border = html.DivElement.new();
      border.className = "subform-group";
      cell[$append](border);
      let subform = new lib__form_builder.FormBuilder.new(border, caption);
      return subform;
    }
  };
  (lib__form_builder.FormBuilder.new = function(parent, formTitle) {
    this[_parent] = null;
    let _ = html.TableElement.new();
    _.className = "formtable";
    this[_table] = _;
    let _$ = html.DivElement.new();
    _$.className = "error";
    this[_error] = _$;
    this[_parent] = parent;
    this[_parent][$appendHtml]("<b>" + dart.str(formTitle) + "</b>");
    this[_parent][$append](this[_error]);
    this[_parent][$append](this[_table]);
  }).prototype = lib__form_builder.FormBuilder.prototype;
  dart.addTypeTests(lib__form_builder.FormBuilder);
  dart.setMethodSignature(lib__form_builder.FormBuilder, () => ({
    __proto__: dart.getMethods(lib__form_builder.FormBuilder.__proto__),
    showError: dart.fnType(dart.void, [core.String]),
    addInput: dart.fnType(html.InputElement, [core.String, core.int, core.int], [core.String]),
    addPasswordInput: dart.fnType(html.PasswordInputElement, [core.String, core.int, core.int], [core.String]),
    addTextArea: dart.fnType(html.TextAreaElement, [core.String, core.int, core.int, core.int], [core.String]),
    addAny: dart.fnType(dart.void, [core.String, html.Element]),
    addExplanation: dart.fnType(dart.void, [html.Element, core.String]),
    addAnyAny: dart.fnType(dart.void, [html.Element, html.Element]),
    addSubformFrame: dart.fnType(lib__form_builder.FormBuilder, [core.String])
  }));
  dart.setGetterSignature(lib__form_builder.FormBuilder, () => ({
    __proto__: dart.getGetters(lib__form_builder.FormBuilder.__proto__),
    parent: html.Element
  }));
  dart.setFieldSignature(lib__form_builder.FormBuilder, () => ({
    __proto__: dart.getFields(lib__form_builder.FormBuilder.__proto__),
    [_parent]: dart.fieldType(html.Element),
    [_table]: dart.fieldType(html.TableElement),
    [_error]: dart.fieldType(html.DivElement)
  }));
  const _keyParts = Symbol('_keyParts');
  const _key = Symbol('_key');
  root__pane_key.PaneKey = class PaneKey extends core.Object {
    get full() {
      return this[_key];
    }
    get paneKind() {
      return this[_keyParts][$_get](0);
    }
    get part1() {
      return dart.notNull(this.length) >= 2 ? this[_keyParts][$_get](1) : null;
    }
    get part1AsInt() {
      return core.int.parse(this[_keyParts][$_get](1));
    }
    part(i) {
      return this[_keyParts][$_get](i);
    }
    get length() {
      return this[_keyParts][$length];
    }
    isIdenticalTo(k2) {
      return this[_key] == k2[_key];
    }
    isLike(k2) {
      if (this[_keyParts][$_get](0) != k2[_keyParts][$_get](0)) return false;
      if (this.length === 1) return true;
      if (this[_keyParts][$_get](1) != k2[_keyParts][$_get](1)) return false;
      return true;
    }
  };
  (root__pane_key.PaneKey.new = function(k) {
    this[_keyParts] = null;
    this[_key] = null;
    this[_key] = k;
    this[_keyParts] = k[$split]("/");
    if (dart.notNull(this[_keyParts][$length]) < 1) dart.throw(core.Exception.new("Invalid pane key " + dart.notNull(k)));
  }).prototype = root__pane_key.PaneKey.prototype;
  (root__pane_key.PaneKey.fromList = function(l) {
    this[_keyParts] = null;
    this[_key] = null;
    this[_key] = l[$join]("/");
    this[_keyParts] = l;
    if (dart.notNull(this[_keyParts][$length]) < 1) dart.throw(core.Exception.new("Invalid pane key " + dart.notNull(this[_key])));
  }).prototype = root__pane_key.PaneKey.prototype;
  dart.addTypeTests(root__pane_key.PaneKey);
  dart.setMethodSignature(root__pane_key.PaneKey, () => ({
    __proto__: dart.getMethods(root__pane_key.PaneKey.__proto__),
    part: dart.fnType(core.String, [core.int]),
    isIdenticalTo: dart.fnType(core.bool, [root__pane_key.PaneKey]),
    isLike: dart.fnType(core.bool, [root__pane_key.PaneKey])
  }));
  dart.setGetterSignature(root__pane_key.PaneKey, () => ({
    __proto__: dart.getGetters(root__pane_key.PaneKey.__proto__),
    full: core.String,
    paneKind: core.String,
    part1: core.String,
    part1AsInt: core.int,
    length: core.int
  }));
  dart.setFieldSignature(root__pane_key.PaneKey, () => ({
    __proto__: dart.getFields(root__pane_key.PaneKey.__proto__),
    [_keyParts]: dart.fieldType(ListOfString()),
    [_key]: dart.fieldType(core.String)
  }));
  const _message = Symbol('_message');
  const _options = Symbol('_options');
  dialog__confirm_dialog.ConfirmDialog = class ConfirmDialog extends lib__dialog_box.DialogBox {
    dialogHeight() {
      return 100;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        this.frame[$appendText](this[_message]);
        const buttonHandler = (function(e) {
          let text = core.String._check(dart.dload(dart.dload(e, 'currentTarget'), 'text'));
          let idx = this[_options][$indexOf](text);
          this.hide(idx);
          return async.Future.value(0);
        }).bind(this);
        dart.fn(buttonHandler, dynamicToFuture());
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        for (let s of this[_options])
          bar.addButton(s, buttonHandler);
      }).bind(this));
    }
  };
  (dialog__confirm_dialog.ConfirmDialog.new = function(message, options) {
    this[_message] = message;
    this[_options] = options;
    dialog__confirm_dialog.ConfirmDialog.__proto__.new.call(this);
  }).prototype = dialog__confirm_dialog.ConfirmDialog.prototype;
  dart.addTypeTests(dialog__confirm_dialog.ConfirmDialog);
  dart.setFieldSignature(dialog__confirm_dialog.ConfirmDialog, () => ({
    __proto__: dart.getFields(dialog__confirm_dialog.ConfirmDialog.__proto__),
    [_message]: dart.fieldType(core.String),
    [_options]: dart.fieldType(ListOfString())
  }));
  dart.defineLazy(dialog__confirm_dialog.ConfirmDialog, {
    /*dialog__confirm_dialog.ConfirmDialog.YesNoOptions*/get YesNoOptions() {
      return JSArrayOfString().of(["Yes", "No"]);
    }
  });
  const _parent$ = Symbol('_parent');
  const _selectHandler = Symbol('_selectHandler');
  lib__outline_builder.OutlineBuilder = class OutlineBuilder extends core.Object {
    add(parentNode, text, id, opts) {
      let childrenCollapsed = opts && 'childrenCollapsed' in opts ? opts.childrenCollapsed : false;
      let node = html.DivElement.new();
      node.className = "outline-node";
      node[$dataset][$_set]("id", id);
      let addTo = this[_parent$];
      if (parentNode != null) addTo = parentNode.querySelector(".outline-childbox");
      addTo[$append](node);
      let expander = html.DivElement.new();
      expander.className = "outline-icon outline-icon-leaf";
      node[$append](expander);
      let textSpan = html.SpanElement.new();
      textSpan[$text] = text;
      textSpan.className = "outline-text";
      node[$append](textSpan);
      let childBox = html.DivElement.new();
      childBox.className = "outline-childbox";
      if (dart.test(childrenCollapsed)) childBox.style[$display] = "none";
      node[$append](childBox);
      if (parentNode != null) {
        let parentIcon = parentNode.querySelector(".outline-icon");
        if (dart.test(parentIcon[$classes].contains("outline-icon-leaf"))) {
          parentIcon[$classes].remove("outline-icon-leaf");
          parentIcon[$classes].add("outline-icon-branch");
        }
      }
      textSpan[$onClick].listen(dart.fn(e => {
        if (dart.test(textSpan[$classes].contains("selected"))) return;
        this[_parent$][$querySelectorAll](html.Element, ".outline-text.selected").classes.remove("selected");
        textSpan[$classes].add("selected");
        childBox.style[$display] = "block";
        e.preventDefault();
        e.stopPropagation();
        if (this[_selectHandler] != null) this[_selectHandler](node);
      }, MouseEventToNull()));
      expander[$onClick].listen(dart.fn(e => {
        let isVisible = childBox.style[$display] !== "none";
        childBox.style[$display] = isVisible ? "none" : "block";
        e.preventDefault();
        e.stopPropagation();
      }, MouseEventToNull()));
      return node;
    }
    static getId(el) {
      return el[$dataset][$_get]("id");
    }
    static getChildBox(el) {
      return el.querySelector(".outline-childbox");
    }
  };
  (lib__outline_builder.OutlineBuilder.new = function(parent, selectHandler) {
    this[_parent$] = parent;
    this[_selectHandler] = selectHandler;
  }).prototype = lib__outline_builder.OutlineBuilder.prototype;
  dart.addTypeTests(lib__outline_builder.OutlineBuilder);
  dart.setMethodSignature(lib__outline_builder.OutlineBuilder, () => ({
    __proto__: dart.getMethods(lib__outline_builder.OutlineBuilder.__proto__),
    add: dart.fnType(html.Element, [html.Element, core.String, core.String], {childrenCollapsed: core.bool})
  }));
  dart.setFieldSignature(lib__outline_builder.OutlineBuilder, () => ({
    __proto__: dart.getFields(lib__outline_builder.OutlineBuilder.__proto__),
    [_parent$]: dart.fieldType(html.Element),
    [_selectHandler]: dart.fieldType(dynamicTovoid())
  }));
  lib__category_node.CategoryNode = class CategoryNode extends core.Object {
    get title() {
      return this[title];
    }
    set title(value) {
      this[title] = value;
    }
    get description() {
      return this[description];
    }
    set description(value) {
      this[description] = value;
    }
    get id() {
      return this[id];
    }
    set id(value) {
      this[id] = value;
    }
    get parent() {
      return this[parent];
    }
    set parent(value) {
      this[parent] = value;
    }
    get children() {
      return this[children];
    }
    set children(value) {
      this[children] = value;
    }
  };
  (lib__category_node.CategoryNode.new = function() {
    this[title] = null;
    this[description] = null;
    this[id] = null;
    this[parent] = null;
    this[children] = null;
  }).prototype = lib__category_node.CategoryNode.prototype;
  dart.addTypeTests(lib__category_node.CategoryNode);
  const title = Symbol("CategoryNode.title");
  const description = Symbol("CategoryNode.description");
  const id = Symbol("CategoryNode.id");
  const parent = Symbol("CategoryNode.parent");
  const children = Symbol("CategoryNode.children");
  dart.setFieldSignature(lib__category_node.CategoryNode, () => ({
    __proto__: dart.getFields(lib__category_node.CategoryNode.__proto__),
    title: dart.fieldType(core.String),
    description: dart.fieldType(core.String),
    id: dart.fieldType(core.int),
    parent: dart.fieldType(lib__category_node.CategoryNode),
    children: dart.fieldType(ListOfCategoryNode())
  }));
  const _topOptions = Symbol('_topOptions');
  const _instructionText = Symbol('_instructionText');
  dialog__node_select_dialog.NodeSelectDialog = class NodeSelectDialog extends lib__dialog_box.DialogBox {
    build() {
      return async.async(dart.dynamic, (function* build() {
        let outline = null;
        const _nodeSelectHandler = (function(node) {
          let id = core.int.parse(lib__outline_builder.OutlineBuilder.getId(node));
          this.hide(id);
          return async.Future.value(null);
        }).bind(this);
        dart.fn(_nodeSelectHandler, ElementToFuture());
        new lib__form_builder.FormBuilder.new(this.frame, this[_instructionText]);
        outline = new lib__outline_builder.OutlineBuilder.new(this.frame, dart.fn(el => _nodeSelectHandler(html.Element._check(el)), dynamicToFuture()));
        function addToOutlineRecur(parentElement, node, level) {
          let el = outline.add(parentElement, node.title, dart.toString(node.id), {childrenCollapsed: dart.notNull(level) > 1});
          if (node.children != null) {
            for (let cnode of node.children)
              addToOutlineRecur(el, cnode, dart.notNull(level) + 1);
          }
        }
        dart.fn(addToOutlineRecur, ElementAndCategoryNodeAndintTovoid());
        for (let node of this[_topOptions])
          addToOutlineRecur(null, node, 0);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(null);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__node_select_dialog.NodeSelectDialog.new = function(topOptions, instructionText) {
    this[_topOptions] = topOptions;
    this[_instructionText] = instructionText;
    dialog__node_select_dialog.NodeSelectDialog.__proto__.new.call(this);
  }).prototype = dialog__node_select_dialog.NodeSelectDialog.prototype;
  dart.addTypeTests(dialog__node_select_dialog.NodeSelectDialog);
  dart.setFieldSignature(dialog__node_select_dialog.NodeSelectDialog, () => ({
    __proto__: dart.getFields(dialog__node_select_dialog.NodeSelectDialog.__proto__),
    [_topOptions]: dart.fieldType(ListOfCategoryNode()),
    [_instructionText]: dart.fieldType(core.String)
  }));
  const _options$ = Symbol('_options');
  const _title = Symbol('_title');
  dialog__select_multiple_dialog.SelectMultipleDialog = class SelectMultipleDialog extends lib__dialog_box.DialogBox {
    build() {
      return async.async(dart.dynamic, (function* build() {
        new lib__form_builder.FormBuilder.new(this.frame, this[_title]);
        this.frame[$appendText]("Select one or more options - use Ctrl/Command to select multiple");
        let sel = html.SelectElement.new();
        sel.multiple = true;
        sel.style[$width] = "80%";
        sel.style[$height] = "200px";
        this.frame[$append](sel);
        for (let option of this[_options$])
          sel[$append](html.OptionElement.new({data: option, value: option}));
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("OK", dart.fn(e => async.async(core.Null, (function*() {
          let selected = JSArrayOfString().of([]);
          ListOfOptionElement()._check(sel[$querySelectorAll](html.Element, "option").cast(html.OptionElement))[$forEach](dart.fn(option => {
            if (dart.test(option.selected)) selected[$add](option.value);
          }, OptionElementToNull()));
          this.hide(selected);
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(null);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__select_multiple_dialog.SelectMultipleDialog.new = function(options, title) {
    this[_options$] = options;
    this[_title] = title;
    dialog__select_multiple_dialog.SelectMultipleDialog.__proto__.new.call(this);
  }).prototype = dialog__select_multiple_dialog.SelectMultipleDialog.prototype;
  dart.addTypeTests(dialog__select_multiple_dialog.SelectMultipleDialog);
  dart.setFieldSignature(dialog__select_multiple_dialog.SelectMultipleDialog, () => ({
    __proto__: dart.getFields(dialog__select_multiple_dialog.SelectMultipleDialog.__proto__),
    [_options$]: dart.fieldType(ListOfString()),
    [_title]: dart.fieldType(core.String)
  }));
  const _title$ = Symbol('_title');
  const _referenceTitle = Symbol('_referenceTitle');
  dialog__category_move_mode_dialog.CategoryMoveModeDialog = class CategoryMoveModeDialog extends lib__dialog_box.DialogBox {
    dialogHeight() {
      return 100;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        new lib__form_builder.FormBuilder.new(this.frame, "Category Move");
        let sameLevelRadio = html.RadioButtonInputElement.new();
        sameLevelRadio[$name] = "catmode";
        let subLevelRadio = html.RadioButtonInputElement.new();
        subLevelRadio[$name] = "catmode";
        subLevelRadio[$checked] = true;
        let _ = this.frame;
        _[$append](sameLevelRadio);
        _[$appendText](dart.str(this[_title$]) + " at same level as " + dart.str(this[_referenceTitle]));
        _[$appendHtml]("<br/>");
        _[$append](subLevelRadio);
        _[$appendText](dart.str(this[_title$]) + " as sub-category of " + dart.str(this[_referenceTitle]));
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("OK", dart.fn(e => {
          if (sameLevelRadio !== null && dart.test(sameLevelRadio[$checked])) this.hide("S");
          if (subLevelRadio !== null && dart.test(subLevelRadio[$checked])) this.hide("C");
        }, dynamicToNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(null);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__category_move_mode_dialog.CategoryMoveModeDialog.new = function(title, referenceTitle) {
    this[_title$] = title;
    this[_referenceTitle] = referenceTitle;
    dialog__category_move_mode_dialog.CategoryMoveModeDialog.__proto__.new.call(this);
  }).prototype = dialog__category_move_mode_dialog.CategoryMoveModeDialog.prototype;
  dart.addTypeTests(dialog__category_move_mode_dialog.CategoryMoveModeDialog);
  dart.setFieldSignature(dialog__category_move_mode_dialog.CategoryMoveModeDialog, () => ({
    __proto__: dart.getFields(dialog__category_move_mode_dialog.CategoryMoveModeDialog.__proto__),
    [_title$]: dart.fieldType(core.String),
    [_referenceTitle]: dart.fieldType(core.String)
  }));
  lib__string_dialog.StringDialog = class StringDialog extends lib__dialog_box.DialogBox {
    dialogHeight() {
      return 150;
    }
  };
  (lib__string_dialog.StringDialog.new = function(caption, priorValue, maxLength) {
    lib__string_dialog.StringDialog.__proto__.new.call(this);
    let form = new lib__form_builder.FormBuilder.new(this.frame, caption);
    let inp = form.addInput("", 300, maxLength, priorValue);
    let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
    bar.addButton("OK", dart.fn(e => {
      this.hide(inp.value);
    }, dynamicToNull()));
    bar.addButton("Cancel", dart.fn(e => {
      this.hide(null);
    }, dynamicToNull()));
  }).prototype = lib__string_dialog.StringDialog.prototype;
  dart.addTypeTests(lib__string_dialog.StringDialog);
  const _parent$0 = Symbol('_parent');
  const _table$ = Symbol('_table');
  lib__card_builder.CardBuilder = class CardBuilder extends core.Object {
    addAny(caption) {
      let row = this[_table$][$addRow]();
      row[$append]((() => {
        let _ = html.Element.th();
        _[$text] = caption;
        return _;
      })());
      let c = row[$addCell]();
      return c;
    }
    addText(caption, text, opts) {
      let useCollapser = opts && 'useCollapser' in opts ? opts.useCollapser : false;
      let c = this.addAny(caption);
      if (dart.test(useCollapser))
        lib__html_lib.HtmlLib.insertCollapsed1(c, text);
      else
        c[$text] = text;
    }
    addHyperlink(caption, text, href) {
      let c = this.addAny(caption);
      c[$append]((() => {
        let _ = html.AnchorElement.new();
        _.href = href;
        _[$text] = text;
        _.target = "_blank";
        return _;
      })());
    }
    addPaneLink(caption, text, paneKey) {
      let c = this.addAny(caption);
      lib__html_lib.HtmlLib.appendLinkToPane(c, text, paneKey);
    }
  };
  (lib__card_builder.CardBuilder.new = function(parent) {
    this[_parent$0] = null;
    let _ = html.TableElement.new();
    _.className = "cardtable";
    this[_table$] = _;
    this[_parent$0] = parent;
    this[_parent$0][$append](this[_table$]);
  }).prototype = lib__card_builder.CardBuilder.prototype;
  dart.addTypeTests(lib__card_builder.CardBuilder);
  dart.setMethodSignature(lib__card_builder.CardBuilder, () => ({
    __proto__: dart.getMethods(lib__card_builder.CardBuilder.__proto__),
    addAny: dart.fnType(html.Element, [core.String]),
    addText: dart.fnType(dart.void, [core.String, core.String], {useCollapser: core.bool}),
    addHyperlink: dart.fnType(dart.void, [core.String, core.String, core.String]),
    addPaneLink: dart.fnType(dart.void, [core.String, core.String, core.String])
  }));
  dart.setFieldSignature(lib__card_builder.CardBuilder, () => ({
    __proto__: dart.getFields(lib__card_builder.CardBuilder.__proto__),
    [_parent$0]: dart.fieldType(html.Element),
    [_table$]: dart.fieldType(html.TableElement)
  }));
  const _dtext = Symbol('_dtext');
  const _idSuffix = Symbol('_idSuffix');
  dialog__edit_markdown_dialog.EditMarkdownDialog = class EditMarkdownDialog extends lib__dialog_box.DialogBox {
    dialogHeight() {
      return dart.notNull(html.window.innerHeight) - 10;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        this[_idSuffix] = "-" + dart.notNull(lib__html_lib.HtmlLib.uniqueId());
        this.frame[$append]((() => {
          let _ = html.DivElement.new();
          _.id = "wmd-button-bar" + dart.notNull(this[_idSuffix]);
          return _;
        })());
        let edElement = html.TextAreaElement.new();
        edElement.id = "wmd-input" + dart.notNull(this[_idSuffix]);
        edElement.style[$width] = lib__html_lib.HtmlLib.asPx(550);
        edElement.style[$height] = lib__html_lib.HtmlLib.asPx((dart.notNull(this.dialogHeight()) * 0.6)[$round]());
        edElement.value = (() => {
          let l = this[_dtext];
          return l != null ? l : "";
        })();
        this.frame[$append](edElement);
        this.frame[$appendHtml]("<div class=\"explain\">This site uses <a target=\"_blank\" href=\"https://gist.github.com/budparr/9257428\">Markdown</a> for editing.</div>", {treeSanitizer: html.NodeTreeSanitizer.trusted});
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("OK", dart.fn(e => {
          this.hide(edElement.value);
        }, dynamicToNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(null);
        }, dynamicToNull()));
        this.frame[$appendHtml]("<h2>Preview</h2>");
        this.frame[$append]((() => {
          let _ = html.DivElement.new();
          _.id = "wmd-preview" + dart.notNull(this[_idSuffix]);
          return _;
        })());
      }).bind(this));
    }
    afterShown() {
      return async.async(dart.dynamic, (function* afterShown() {
        let converter = dart.global.Markdown.getSanitizingConverter();
        let editor = new dart.global.Markdown.Editor(converter, this[_idSuffix]);
        editor.run();
      }).bind(this));
    }
  };
  (dialog__edit_markdown_dialog.EditMarkdownDialog.new = function(dtext) {
    this[_idSuffix] = null;
    this[_dtext] = dtext;
    dialog__edit_markdown_dialog.EditMarkdownDialog.__proto__.new.call(this);
  }).prototype = dialog__edit_markdown_dialog.EditMarkdownDialog.prototype;
  dart.addTypeTests(dialog__edit_markdown_dialog.EditMarkdownDialog);
  dart.setFieldSignature(dialog__edit_markdown_dialog.EditMarkdownDialog, () => ({
    __proto__: dart.getFields(dialog__edit_markdown_dialog.EditMarkdownDialog.__proto__),
    [_dtext]: dart.fieldType(core.String),
    [_idSuffix]: dart.fieldType(core.String)
  }));
  const _dtext$ = Symbol('_dtext');
  dialog__view_markdown_dialog.ViewMarkdownDialog = class ViewMarkdownDialog extends lib__dialog_box.DialogBox {
    dialogHeight() {
      return dart.notNull(html.window.innerHeight) - 10;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        let converter = dart.global.Markdown.getSanitizingConverter();
        let html = core.String._check(converter.makeHtml(this[_dtext$]));
        this.frame[$appendHtml](html);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("Close", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__view_markdown_dialog.ViewMarkdownDialog.new = function(dtext) {
    this[_dtext$] = dtext;
    dialog__view_markdown_dialog.ViewMarkdownDialog.__proto__.new.call(this);
  }).prototype = dialog__view_markdown_dialog.ViewMarkdownDialog.prototype;
  dart.addTypeTests(dialog__view_markdown_dialog.ViewMarkdownDialog);
  dart.setFieldSignature(dialog__view_markdown_dialog.ViewMarkdownDialog, () => ({
    __proto__: dart.getFields(dialog__view_markdown_dialog.ViewMarkdownDialog.__proto__),
    [_dtext$]: dart.fieldType(core.String)
  }));
  lib__string_tuple.StringTuple = class StringTuple extends core.Object {
    get name() {
      return this[name];
    }
    set name(value) {
      this[name] = value;
    }
    get value() {
      return this[value$];
    }
    set value(value) {
      this[value$] = value;
    }
  };
  (lib__string_tuple.StringTuple.new = function() {
    this[name] = null;
    this[value$] = null;
  }).prototype = lib__string_tuple.StringTuple.prototype;
  dart.addTypeTests(lib__string_tuple.StringTuple);
  const name = Symbol("StringTuple.name");
  const value$ = Symbol("StringTuple.value");
  dart.setFieldSignature(lib__string_tuple.StringTuple, () => ({
    __proto__: dart.getFields(lib__string_tuple.StringTuple.__proto__),
    name: dart.fieldType(core.String),
    value: dart.fieldType(core.String)
  }));
  const _year = Symbol('_year');
  const _month = Symbol('_month');
  const _day = Symbol('_day');
  const _time = Symbol('_time');
  lib__primitive_datetime.PrimitiveDateTime = class PrimitiveDateTime extends core.Object {
    get monthAbbrevs() {
      return this[monthAbbrevs];
    }
    set monthAbbrevs(value) {
      this[monthAbbrevs] = value;
    }
    get parentDiv() {
      return this[parentDiv$];
    }
    set parentDiv(value) {
      this[parentDiv$] = value;
    }
    render(value) {
      let thisYear = new core.DateTime.now().year;
      for (let year = dart.notNull(thisYear) - 4; year < dart.notNull(thisYear) + 5; ++year)
        this[_year][$append]((() => {
          let _ = html.OptionElement.new();
          _.value = year[$toString]();
          _[$text] = year[$toString]();
          return _;
        })());
      for (let month = 1; month <= 12; ++month)
        this[_month][$append]((() => {
          let _ = html.OptionElement.new();
          _.value = month[$toString]();
          _[$text] = dart.str(month) + " - " + dart.str(this.monthAbbrevs[$_get](month - 1));
          return _;
        })());
      for (let day = 1; day <= 31; ++day)
        this[_day][$append]((() => {
          let _ = html.OptionElement.new();
          _.value = day[$toString]();
          _[$text] = day[$toString]();
          return _;
        })());
      for (let hour = 0; hour < 24; ++hour) {
        for (let minute = 0; minute <= 45; minute = minute + 15) {
          let totalMin = hour * 60 + minute;
          this[_time][$append]((() => {
            let _ = html.OptionElement.new();
            _.value = totalMin[$toString]();
            _[$text] = dart.str(hour) + ":" + minute[$toString]()[$padLeft](2, "0");
            return _;
          })());
        }
      }
      this.parentDiv[$append](this[_year]);
      this.parentDiv[$appendText](" - ");
      this.parentDiv[$append](this[_month]);
      this.parentDiv[$appendText](" - ");
      this.parentDiv[$append](this[_day]);
      this.parentDiv[$appendText](" at ");
      this.parentDiv[$append](this[_time]);
      this[_year].value = dart.toString(value.year);
      this[_month].value = dart.toString(value.month);
      this[_day].value = dart.toString(value.day);
      let forcedMinute = dart.notNull(value.hour) * 60 + dart.notNull(value.minute) - value.minute[$modulo](15);
      this[_time].value = forcedMinute[$toString]();
    }
    getValue() {
      let totalMinutes = core.int.parse(this[_time].value);
      return new core.DateTime.new(core.int.parse(this[_year].value), core.int.parse(this[_month].value), core.int.parse(this[_day].value), (dart.notNull(totalMinutes) / 60)[$floor](), totalMinutes[$modulo](60));
    }
  };
  (lib__primitive_datetime.PrimitiveDateTime.new = function(parentDiv) {
    this[monthAbbrevs] = JSArrayOfString().of(["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]);
    this[_year] = html.SelectElement.new();
    this[_month] = html.SelectElement.new();
    this[_day] = html.SelectElement.new();
    this[_time] = html.SelectElement.new();
    this[parentDiv$] = parentDiv;
  }).prototype = lib__primitive_datetime.PrimitiveDateTime.prototype;
  dart.addTypeTests(lib__primitive_datetime.PrimitiveDateTime);
  const monthAbbrevs = Symbol("PrimitiveDateTime.monthAbbrevs");
  const parentDiv$ = Symbol("PrimitiveDateTime.parentDiv");
  dart.setMethodSignature(lib__primitive_datetime.PrimitiveDateTime, () => ({
    __proto__: dart.getMethods(lib__primitive_datetime.PrimitiveDateTime.__proto__),
    render: dart.fnType(dart.void, [core.DateTime]),
    getValue: dart.fnType(core.DateTime, [])
  }));
  dart.setFieldSignature(lib__primitive_datetime.PrimitiveDateTime, () => ({
    __proto__: dart.getFields(lib__primitive_datetime.PrimitiveDateTime.__proto__),
    monthAbbrevs: dart.fieldType(ListOfString()),
    parentDiv: dart.fieldType(html.DivElement),
    [_year]: dart.fieldType(html.SelectElement),
    [_month]: dart.fieldType(html.SelectElement),
    [_day]: dart.fieldType(html.SelectElement),
    [_time]: dart.fieldType(html.SelectElement)
  }));
  const _userId = Symbol('_userId');
  const _clickedInCode = Symbol('_clickedInCode');
  const _handleVote = Symbol('_handleVote');
  const _isCollapsed = Symbol('_isCollapsed');
  pane__base_pane.BasePane = class BasePane extends core.Object {
    get paneKey() {
      return this[paneKey];
    }
    set paneKey(value) {
      this[paneKey] = value;
    }
    get borderId() {
      return this[borderId];
    }
    set borderId(value) {
      this[borderId] = value;
    }
    get borderElement() {
      return this[borderElement];
    }
    set borderElement(value) {
      this[borderElement] = value;
    }
    get bodyId() {
      return this[bodyId];
    }
    set bodyId(value) {
      this[bodyId] = value;
    }
    get bodyElement() {
      return this[bodyElement];
    }
    set bodyElement(value) {
      this[bodyElement] = value;
    }
    get paneMenuBar() {
      return this[paneMenuBar];
    }
    set paneMenuBar(value) {
      this[paneMenuBar] = value;
    }
    get onCollapse() {
      return this[onCollapse];
    }
    set onCollapse(value) {
      this[onCollapse] = value;
    }
    get onChanePaneKey() {
      return this[onChanePaneKey];
    }
    set onChanePaneKey(value) {
      this[onChanePaneKey] = value;
    }
    get isCollapsed() {
      return this[_isCollapsed];
    }
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        this.paneKey = pk;
      }).bind(this));
    }
    changePaneKey(pk) {
      this.paneKey = pk;
      if (this.onChanePaneKey != null) this.onChanePaneKey(this);
    }
    collapse() {
      if (dart.test(this[_isCollapsed])) return;
      this[_isCollapsed] = true;
      this.borderElement.querySelector(".pane-body")[$remove]();
      this.borderElement.querySelector(".pane-menubar")[$remove]();
      let reopener = html.AnchorElement.new();
      reopener.href = "#" + dart.notNull(this.paneKey.full);
      reopener[$text] = "reopen";
      let header = this.borderElement.querySelector(".pane-header");
      header[$appendText](" (");
      header[$append](reopener);
      header[$appendText](")");
      if (this.onCollapse != null) this.onCollapse(this);
    }
    handleHotKey(e) {
      return false;
    }
    buildSkeletonHtml2(opts) {
      let paneClass = opts && 'paneClass' in opts ? opts.paneClass : null;
      let iconHoverText = opts && 'iconHoverText' in opts ? opts.iconHoverText : null;
      let iconName = opts && 'iconName' in opts ? opts.iconName : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let subtitle = opts && 'subtitle' in opts ? opts.subtitle : null;
      let subtitlePaneKey = opts && 'subtitlePaneKey' in opts ? opts.subtitlePaneKey : null;
      title = wlib$.WLib.chop(title != null ? title : "", 45, {addEllipsis: true});
      let main2 = html.querySelector("#main2");
      let paneBorder = (() => {
        let _ = html.DivElement.new();
        _.id = this.borderId;
        _.className = "pane-border";
        return _;
      })(), pane = (() => {
        let _ = html.DivElement.new();
        _.className = "pane " + dart.notNull(paneClass);
        return _;
      })(), paneHeader = (() => {
        let _ = html.DivElement.new();
        _.className = "pane-header";
        return _;
      })(), paneSubheader = (() => {
        let _ = html.DivElement.new();
        _.className = "pane-subheader";
        return _;
      })(), paneBody = (() => {
        let _ = html.DivElement.new();
        _.id = this.bodyId;
        _.className = "pane-body";
        return _;
      })();
      let paneReopen = (() => {
        let _ = html.ButtonElement.new();
        _.className = "pane-reopen";
        _.title = "Refresh";
        return _;
      })(), paneClose = (() => {
        let _ = html.ButtonElement.new();
        _.className = "pane-close";
        _.title = "Close";
        return _;
      })(), paneMin = (() => {
        let _ = html.ButtonElement.new();
        _.className = "pane-min";
        _.title = "Collapse";
        return _;
      })();
      paneBorder[$append](pane);
      pane[$append](paneHeader);
      if (iconName != null) paneHeader[$append]((() => {
        let _ = html.ImageElement.new();
        _.src = "images/" + dart.str(iconName) + ".png";
        _.title = iconHoverText != null ? iconHoverText : "";
        return _;
      })());
      paneHeader[$append]((() => {
        let _ = html.SpanElement.new();
        _[$text] = title;
        _.className = "pane-title";
        return _;
      })());
      paneHeader[$append](paneSubheader);
      if (subtitle != null) {
        paneSubheader[$append]((() => {
          let _ = html.AnchorElement.new();
          _[$text] = subtitle;
          _.href = "#" + dart.notNull(subtitlePaneKey);
          return _;
        })());
      }
      pane[$append](paneBody);
      paneBody[$text] = "loading...";
      this.paneMenuBar = new lib__button_bar_builder.ButtonBarBuilder.new(pane, {className: "pane-menubar"});
      this.paneMenuBar.addElement(paneMin);
      this.paneMenuBar.addElement(paneReopen);
      main2.insertBefore(paneBorder, html.querySelector("#scrollspace"));
      this.borderElement = paneBorder;
      this.bodyElement = paneBody;
      paneMin[$onClick].listen(dart.fn(e => {
        this.collapse();
      }, MouseEventToNull()));
      paneReopen[$onClick].listen(dart.fn(e => {
        this.recreatePane();
      }, MouseEventToNull()));
    }
    retitle(title) {
      let el = this.borderElement.querySelector(".pane-title");
      el[$text] = title;
    }
    clearLoadingMessage() {
      this.bodyElement[$text] = "";
    }
    trimInput(i) {
      return i.value[$trim]();
    }
    trimInputArea(i) {
      return i.value[$trim]();
    }
    recreatePane() {
      pane_factory.PaneFactory.create(this.paneKey);
    }
  };
  (pane__base_pane.BasePane.new = function() {
    this[_isCollapsed] = false;
    this[paneKey] = null;
    this[borderId] = lib__html_lib.HtmlLib.uniqueId();
    this[borderElement] = null;
    this[bodyId] = lib__html_lib.HtmlLib.uniqueId();
    this[bodyElement] = null;
    this[paneMenuBar] = null;
    this[onCollapse] = null;
    this[onChanePaneKey] = null;
  }).prototype = pane__base_pane.BasePane.prototype;
  dart.addTypeTests(pane__base_pane.BasePane);
  const paneKey = Symbol("BasePane.paneKey");
  const borderId = Symbol("BasePane.borderId");
  const borderElement = Symbol("BasePane.borderElement");
  const bodyId = Symbol("BasePane.bodyId");
  const bodyElement = Symbol("BasePane.bodyElement");
  const paneMenuBar = Symbol("BasePane.paneMenuBar");
  const onCollapse = Symbol("BasePane.onCollapse");
  const onChanePaneKey = Symbol("BasePane.onChanePaneKey");
  dart.setMethodSignature(pane__base_pane.BasePane, () => ({
    __proto__: dart.getMethods(pane__base_pane.BasePane.__proto__),
    init: dart.fnType(async.Future, [root__pane_key.PaneKey]),
    changePaneKey: dart.fnType(dart.void, [root__pane_key.PaneKey]),
    collapse: dart.fnType(dart.void, []),
    handleHotKey: dart.fnType(core.bool, [html.KeyboardEvent]),
    buildSkeletonHtml2: dart.fnType(dart.void, [], {paneClass: core.String, iconHoverText: core.String, iconName: core.String, title: core.String, subtitle: core.String, subtitlePaneKey: core.String}),
    retitle: dart.fnType(dart.void, [core.String]),
    clearLoadingMessage: dart.fnType(dart.void, []),
    trimInput: dart.fnType(core.String, [html.InputElement]),
    trimInputArea: dart.fnType(core.String, [html.TextAreaElement]),
    recreatePane: dart.fnType(dart.void, [])
  }));
  dart.setGetterSignature(pane__base_pane.BasePane, () => ({
    __proto__: dart.getGetters(pane__base_pane.BasePane.__proto__),
    isCollapsed: core.bool
  }));
  dart.setFieldSignature(pane__base_pane.BasePane, () => ({
    __proto__: dart.getFields(pane__base_pane.BasePane.__proto__),
    [_isCollapsed]: dart.fieldType(core.bool),
    paneKey: dart.fieldType(root__pane_key.PaneKey),
    borderId: dart.fieldType(core.String),
    borderElement: dart.fieldType(html.DivElement),
    bodyId: dart.fieldType(core.String),
    bodyElement: dart.fieldType(html.DivElement),
    paneMenuBar: dart.fieldType(lib__button_bar_builder.ButtonBarBuilder),
    onCollapse: dart.fieldType(dynamicTovoid()),
    onChanePaneKey: dart.fieldType(dynamicTovoid())
  }));
  const init = Symbol("init");
  pane__user_pane.UserPane = class UserPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init$() {
        yield this[init](pk);
        let loggedIn = root__globals.Globals.userId !== 0;
        this[_userId] = pk.part1AsInt;
        let user = (yield rpc_lib.RpcLib.userGet(new src__models__wtypes.UserGetRequest.new({userId: this[_userId], includeDetail: "Y"})));
        this.buildSkeletonHtml2({paneClass: "user", iconHoverText: "User", iconName: "paneuser", title: user.nick});
        this.clearLoadingMessage();
        let card = new lib__card_builder.CardBuilder.new(this.bodyElement);
        let avatarParent = card.addAny("Avatar");
        if (user.avatarUrl != null)
          avatarParent[$append](html.ImageElement.new({src: user.avatarUrl}));
        else
          avatarParent[$appendText]("(none)");
        card.addText("Nickname", user.nick);
        card.addText("Name", user.publicName);
        if (user.publicLinks != null) {
          user.publicLinks[$forEach](dart.fn((linkKind, linkValue) => {
            card.addText(linkKind, linkValue);
          }, StringAndStringToNull()));
        }
        card.addText("Time zone", user.timeZone);
        card.addText("Kind of user", root__globals.Globals.allUserKinds[$_get](user.kind));
        if (user.status === "D") card.addText("Status", "User has been deleted");
        if (user.isSiteAdmin === "Y") card.addText("Admin status", "User is currently a site-wide administrator");
        const add1Checkbox = (function(value, text) {
          let div = html.DivElement.new();
          let chk = html.CheckboxInputElement.new();
          chk[$checked] = value;
          div[$append](chk);
          div[$appendText](" " + dart.notNull(text));
          this.bodyElement[$append](div);
          return chk;
        }).bind(this);
        dart.fn(add1Checkbox, boolAndStringToCheckboxInputElement());
        let followCheck = null, blockCheck = null;
        if (loggedIn && root__globals.Globals.nick != user.nick) {
          followCheck = add1Checkbox(user.userUserKind === "F", "Follow this user");
          blockCheck = add1Checkbox(user.userUserKind === "B", "Block this user");
          let handleCheckbox = e => {
            if (dart.test(this[_clickedInCode])) return;
            this[_clickedInCode] = true;
            if (dart.test(followCheck[$checked])) blockCheck[$checked] = false;
            if (dart.test(blockCheck[$checked])) followCheck[$checked] = false;
            this[_clickedInCode] = false;
            this[_handleVote](followCheck[$checked], blockCheck[$checked]);
          };
          dart.fn(handleCheckbox, dynamicToNull());
          followCheck[$onChange].listen(handleCheckbox);
          blockCheck[$onChange].listen(handleCheckbox);
        }
        let assocBox = html.DivElement.new();
        assocBox.className = "associations";
        this.bodyElement[$append](assocBox);
        function build1AssocSection(sectName, assocs, iconName) {
          if (assocs == null || assocs[$length] === 0) return;
          assocBox[$appendHtml]("<h3><img src=\"images/" + dart.str(iconName) + ".png\" /> " + dart.str(sectName) + "</h3>");
          for (let assoc of assocs)
            lib__html_lib.HtmlLib.appendLinkToPane(assocBox, assoc.linkText, assoc.linkPaneKey);
        }
        dart.fn(build1AssocSection, StringAndListOfAPIResponseAssociationAndStringTovoid());
        build1AssocSection("Events attending", ListOfAPIResponseAssociation()._check(user.events[$cast](src__models__wtypes.APIResponseAssociation)), "paneevent");
        build1AssocSection("Projects", ListOfAPIResponseAssociation()._check(user.projects[$cast](src__models__wtypes.APIResponseAssociation)), "paneproject");
        build1AssocSection("Resources submitted", ListOfAPIResponseAssociation()._check(user.resources[$cast](src__models__wtypes.APIResponseAssociation)), "paneresource");
        if (loggedIn && root__globals.Globals.nick == user.nick) {
          this.paneMenuBar.addButton("Edit", dart.fn(e => async.async(core.Null, (function*() {
            let editDialog = new dialog__user_dialog.UserDialog.new(this[_userId]);
            let dialogOk = core.bool._check(yield editDialog.show());
            if (dart.test(dialogOk)) this.recreatePane();
          }).bind(this)), dynamicToFutureOfNull()));
          this.paneMenuBar.addButton("Change Avatar", dart.fn(e => async.async(core.Null, (function*() {
            let uploadDialog = new dialog__image_upload_dialog.ImageUploadDialog.new("U", "The image will be resized and cropped to be square.");
            let dialogOk = core.bool._check(yield uploadDialog.show());
            if (dart.test(dialogOk)) this.recreatePane();
          }).bind(this)), dynamicToFutureOfNull()));
        }
      }).bind(this));
    }
    [_handleVote](follow, block) {
      return async.async(dart.dynamic, (function* _handleVote() {
        let vote = null;
        if (dart.test(follow))
          vote = "F";
        else if (dart.test(block)) vote = "B";
        if (!dart.test(messages.Messages.checkLoggedIn())) return;
        let req = new src__models__wtypes.UserUserSaveRequest.new({aboutId: this[_userId], kind: vote});
        yield rpc_lib.RpcLib.userUserSave(req);
      }).bind(this));
    }
    [init](pk) {
      return super.init(pk);
    }
  };
  (pane__user_pane.UserPane.new = function() {
    this[_userId] = null;
    this[_clickedInCode] = false;
    pane__user_pane.UserPane.__proto__.new.call(this);
  }).prototype = pane__user_pane.UserPane.prototype;
  dart.addTypeTests(pane__user_pane.UserPane);
  dart.setMethodSignature(pane__user_pane.UserPane, () => ({
    __proto__: dart.getMethods(pane__user_pane.UserPane.__proto__),
    [_handleVote]: dart.fnType(async.Future, [core.bool, core.bool])
  }));
  dart.setFieldSignature(pane__user_pane.UserPane, () => ({
    __proto__: dart.getFields(pane__user_pane.UserPane.__proto__),
    [_userId]: dart.fieldType(core.int),
    [_clickedInCode]: dart.fieldType(core.bool)
  }));
  const _resultsDiv = Symbol('_resultsDiv');
  const _doSearch = Symbol('_doSearch');
  const init$ = Symbol("init");
  pane__user_search_pane.UserSearchPane = class UserSearchPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$](pk);
        this.buildSkeletonHtml2({paneClass: "users", title: "User Search", iconName: "paneuser"});
        this.clearLoadingMessage();
        let _ = lib__html_lib.HtmlLib.appendScrollingDiv(this.bodyElement);
        _.style[$display] = "none";
        this[_resultsDiv] = _;
        let form = new lib__form_builder.FormBuilder.new(this.bodyElement, "Criteria");
        let nickInp = form.addInput("Any part of nickname or name", 100, 20);
        this.paneMenuBar.addButton("Search", dart.fn(e => this[_doSearch](this.trimInput(nickInp)), dynamicToFuture()));
      }).bind(this));
    }
    [_doSearch](nick) {
      return async.async(dart.dynamic, (function* _doSearch() {
        this[_resultsDiv].style[$display] = "block";
        this[_resultsDiv][$innerHtml] = "Loading...";
        let response = (yield rpc_lib.RpcLib.userQuery(new src__models__wtypes.UserQueryRequest.new({name: nick})));
        this[_resultsDiv][$innerHtml] = "";
        for (let u of response.users) {
          src__models__wtypes.UserQueryItem._check(u);
          let d1 = html.DivElement.new();
          d1.className = "avatar";
          this[_resultsDiv][$append](d1);
          if (u.avatarUrl != null) d1[$append](html.ImageElement.new({src: u.avatarUrl}));
          lib__html_lib.HtmlLib.appendLinkToPane(d1, u.nick, "user/" + dart.str(u.iid), {asDiv: false});
          d1[$appendText](" (" + dart.str(u.publicName) + ")");
        }
        if (response.users[$length] === 0) this[_resultsDiv][$innerHtml] = "(none)";
      }).bind(this));
    }
    [init$](pk) {
      return super.init(pk);
    }
  };
  (pane__user_search_pane.UserSearchPane.new = function() {
    this[_resultsDiv] = null;
    pane__user_search_pane.UserSearchPane.__proto__.new.call(this);
  }).prototype = pane__user_search_pane.UserSearchPane.prototype;
  dart.addTypeTests(pane__user_search_pane.UserSearchPane);
  dart.setMethodSignature(pane__user_search_pane.UserSearchPane, () => ({
    __proto__: dart.getMethods(pane__user_search_pane.UserSearchPane.__proto__),
    [_doSearch]: dart.fnType(async.Future, [core.String])
  }));
  dart.setFieldSignature(pane__user_search_pane.UserSearchPane, () => ({
    __proto__: dart.getFields(pane__user_search_pane.UserSearchPane.__proto__),
    [_resultsDiv]: dart.fieldType(html.DivElement)
  }));
  const _resourceId = Symbol('_resourceId');
  const _clickedInCode$ = Symbol('_clickedInCode');
  const _handleVote$ = Symbol('_handleVote');
  const init$0 = Symbol("init");
  pane__resource_pane.ResourcePane = class ResourcePane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$0](pk);
        this[_resourceId] = pk.part1AsInt;
        let resource = (yield rpc_lib.RpcLib.resourceGet(new src__models__wtypes.ResourceGetRequest.new({iid: this[_resourceId]})));
        this.buildSkeletonHtml2({paneClass: "resource", iconHoverText: "Resource", iconName: "paneresource", title: resource.title});
        this.clearLoadingMessage();
        let card = new lib__card_builder.CardBuilder.new(this.bodyElement);
        card.addText("Title", resource.title);
        if (resource.url != null && resource.url.length > 0) card.addHyperlink("Web URL", resource.url, resource.url);
        card.addText("Description", resource.description);
        card.addPaneLink("Created by", resource.nick, "user/" + dart.str(resource.userId));
        if (resource.visible !== "Y") card.addText("Hidden", "This resource is not visible because users marked it as inappropriate.");
        let myVoteCell = card.addAny("My vote");
        function add1Checkbox(value, text) {
          let div = html.DivElement.new();
          let chk = html.CheckboxInputElement.new();
          chk[$checked] = value;
          div[$append](chk);
          div[$appendText](" " + dart.notNull(text));
          myVoteCell[$append](div);
          return chk;
        }
        dart.fn(add1Checkbox, boolAndStringToCheckboxInputElement());
        let importantCheck = add1Checkbox(resource.userKind === "I", "Important");
        let removeCheck = add1Checkbox(resource.userKind === "R", "Remove");
        let handleCheckbox = e => {
          if (dart.test(this[_clickedInCode$])) return;
          this[_clickedInCode$] = true;
          if (dart.dtest(dart.dload(dart.dload(e, 'target'), 'checked'))) {
            if (dart.equals(dart.dload(e, 'target'), importantCheck)) removeCheck[$checked] = false;
            if (dart.equals(dart.dload(e, 'target'), removeCheck)) importantCheck[$checked] = false;
          }
          this[_clickedInCode$] = false;
          this[_handleVote$](importantCheck[$checked], removeCheck[$checked]);
        };
        dart.fn(handleCheckbox, dynamicToNull());
        importantCheck[$onChange].listen(handleCheckbox);
        removeCheck[$onChange].listen(handleCheckbox);
        let loggedIn = root__globals.Globals.userId !== 0;
        let editable = resource.isCreator === "Y" || resource.isSiteAdmin === "Y";
        if (loggedIn && editable) {
          this.paneMenuBar.addButton("Edit", dart.fn(e => async.async(core.Null, (function*() {
            let editDialog = new dialog__resource_dialog.ResourceDialog.new(this[_resourceId], 0);
            let dialogOk = core.bool._check(yield editDialog.show());
            if (dart.test(dialogOk)) this.recreatePane();
          }).bind(this)), dynamicToFutureOfNull()));
        }
        if (loggedIn && resource.isSiteAdmin === "Y" && resource.visible === "N") {
          this.paneMenuBar.addButton("Delete", dart.fn(e => async.async(core.Null, (function*() {
            yield rpc_lib.RpcLib.resourceTriage(new src__models__wtypes.ResourceTriageRequest.new({iid: this[_resourceId], mode: "D"}));
            pane_factory.PaneFactory.delete(this);
          }).bind(this)), dynamicToFutureOfNull()));
          this.paneMenuBar.addButton("Reset To Visible", dart.fn(e => async.async(core.Null, (function*() {
            yield rpc_lib.RpcLib.resourceTriage(new src__models__wtypes.ResourceTriageRequest.new({iid: this[_resourceId], mode: "R"}));
            this.recreatePane();
          }).bind(this)), dynamicToFutureOfNull()));
        }
      }).bind(this));
    }
    [_handleVote$](important, remove) {
      return async.async(dart.dynamic, (function* _handleVote() {
        let vote = null;
        if (dart.test(important))
          vote = "I";
        else if (dart.test(remove)) vote = "R";
        if (!dart.test(messages.Messages.checkLoggedIn())) return;
        let req = new src__models__wtypes.ResourceUserSaveRequest.new({iid: this[_resourceId], kind: vote});
        yield rpc_lib.RpcLib.resourceUserSave(req);
      }).bind(this));
    }
    [init$0](pk) {
      return super.init(pk);
    }
  };
  (pane__resource_pane.ResourcePane.new = function() {
    this[_resourceId] = null;
    this[_clickedInCode$] = false;
    pane__resource_pane.ResourcePane.__proto__.new.call(this);
  }).prototype = pane__resource_pane.ResourcePane.prototype;
  dart.addTypeTests(pane__resource_pane.ResourcePane);
  dart.setMethodSignature(pane__resource_pane.ResourcePane, () => ({
    __proto__: dart.getMethods(pane__resource_pane.ResourcePane.__proto__),
    [_handleVote$]: dart.fnType(async.Future, [core.bool, core.bool])
  }));
  dart.setFieldSignature(pane__resource_pane.ResourcePane, () => ({
    __proto__: dart.getFields(pane__resource_pane.ResourcePane.__proto__),
    [_resourceId]: dart.fieldType(core.int),
    [_clickedInCode$]: dart.fieldType(core.bool)
  }));
  const _resultDiv = Symbol('_resultDiv');
  const _doSearch$ = Symbol('_doSearch');
  const init$1 = Symbol("init");
  pane__resource_search_pane.ResourceSearchPane = class ResourceSearchPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$1](pk);
        this.buildSkeletonHtml2({paneClass: "resources", title: "Resource Search", iconName: "paneresource"});
        this.clearLoadingMessage();
        let _ = lib__html_lib.HtmlLib.appendScrollingDiv(this.bodyElement);
        _.style[$marginBottom] = lib__html_lib.HtmlLib.asPx(6);
        _.style[$display] = "hidden";
        this[_resultDiv] = _;
        let form = new lib__form_builder.FormBuilder.new(this.bodyElement, "Criteria");
        let titleInp = form.addInput("Title", 100, 50);
        let kindInput = html.SelectElement.new();
        kindInput[$append](html.OptionElement.new());
        for (let kindOption of root__globals.Globals.allResourceKinds)
          kindInput[$append]((() => {
            let _ = html.OptionElement.new();
            _.value = kindOption;
            _[$text] = kindOption;
            return _;
          })());
        form.addAny("Kind", kindInput);
        this.paneMenuBar.addButton("Search", dart.fn(e => this[_doSearch$](this.trimInput(titleInp), kindInput.value), dynamicToFuture()));
      }).bind(this));
    }
    [_doSearch$](title, kind) {
      return async.async(dart.dynamic, (function* _doSearch() {
        this[_resultDiv].style[$display] = "block";
        this[_resultDiv][$innerHtml] = "Loading...";
        let response = (yield rpc_lib.RpcLib.resourceQuery(new src__models__wtypes.ResourceQueryRequest.new({title: title, kind: kind})));
        this[_resultDiv][$innerHtml] = "";
        for (let res of response.items) {
          src__models__wtypes.ResourceItem._check(res);
          let itemDiv = html.DivElement.new();
          itemDiv.className = "space1";
          this[_resultDiv][$append](itemDiv);
          if (res.url != null && res.url.length > 0) {
            let a = html.AnchorElement.new({href: res.url});
            a[$innerHtml] = "<img src=\"images/ext_link.png\"/>";
            a.target = "_blank";
            itemDiv[$append](a);
            itemDiv[$appendText](" ");
          }
          lib__html_lib.HtmlLib.appendLinkToPane(itemDiv, res.title, "resource/" + dart.str(res.iid), {asDiv: false});
          itemDiv[$appendText](" - ");
          lib__html_lib.HtmlLib.insertCollapsed1(itemDiv, res.description);
        }
        if (response.items[$length] === 0) this[_resultDiv][$appendText]("(none)");
      }).bind(this));
    }
    [init$1](pk) {
      return super.init(pk);
    }
  };
  (pane__resource_search_pane.ResourceSearchPane.new = function() {
    this[_resultDiv] = null;
    pane__resource_search_pane.ResourceSearchPane.__proto__.new.call(this);
  }).prototype = pane__resource_search_pane.ResourceSearchPane.prototype;
  dart.addTypeTests(pane__resource_search_pane.ResourceSearchPane);
  dart.setMethodSignature(pane__resource_search_pane.ResourceSearchPane, () => ({
    __proto__: dart.getMethods(pane__resource_search_pane.ResourceSearchPane.__proto__),
    [_doSearch$]: dart.fnType(async.Future, [core.String, core.String])
  }));
  dart.setFieldSignature(pane__resource_search_pane.ResourceSearchPane, () => ({
    __proto__: dart.getFields(pane__resource_search_pane.ResourceSearchPane.__proto__),
    [_resultDiv]: dart.fieldType(html.DivElement)
  }));
  const _eventId = Symbol('_eventId');
  const init$2 = Symbol("init");
  pane__event_pane.EventPane = class EventPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$2](pk);
        this[_eventId] = pk.part1AsInt;
        let getArgs = new src__models__wtypes.EventRequest.new({eventId: this[_eventId]});
        let event = (yield rpc_lib.RpcLib.eventGet(getArgs));
        let loggedIn = root__globals.Globals.userId !== 0;
        let editable = event.isCreator === "Y";
        this.buildSkeletonHtml2({paneClass: "event", iconHoverText: "Event", iconName: "paneevent", title: event.title});
        this.clearLoadingMessage();
        let card = new lib__card_builder.CardBuilder.new(this.bodyElement);
        card.addText("Title", event.title);
        card.addText("Date/time", event.startTimeR);
        card.addText("Duration", event.duration);
        card.addText("Description", event.description);
        card.addText("Location", event.location);
        card.addPaneLink("Created by", event.creatorNick, "user/" + dart.str(event.creatorId));
        let myStatus = "D", myStatusDesc = "";
        if (loggedIn) {
          let myselfs = event.users[$where](dart.fn(u => u.userId == root__globals.Globals.userId, _EventGetUserResponseTobool()));
          if (dart.notNull(myselfs[$length]) > 0) {
            myStatus = myselfs[$first].status;
            myStatusDesc = myselfs[$first].statusDesc;
          }
        }
        let myVoteCell = card.addAny("My response");
        let myVoteChk = html.CheckboxInputElement.new();
        myVoteChk[$checked] = myStatus === "A";
        myVoteCell[$append](myVoteChk);
        myVoteCell[$appendText](" I am attending");
        myVoteChk[$onChange].listen(dart.fn(e => async.async(core.Null, (function*() {
          if (!dart.test(messages.Messages.checkLoggedIn())) return;
          let vote = dart.test(myVoteChk[$checked]) ? "A" : "D";
          let statusDescDlg = new lib__string_dialog.StringDialog.new("Optionally enter a reason or message for your attendance", myStatusDesc, 100);
          let newStatusDesc = core.String._check(yield statusDescDlg.show());
          myStatusDesc = newStatusDesc != null ? newStatusDesc : myStatusDesc;
          let req = new src__models__wtypes.EventUserSaveRequest.new({eventId: this[_eventId], status: vote, statusDesc: myStatusDesc});
          yield rpc_lib.RpcLib.eventUserSave(req);
        }).bind(this)), EventToFutureOfNull()));
        if (event.convs != null && dart.notNull(event.convs[$length]) > 0) {
          this.bodyElement[$appendHtml]("<h2><img src=\"images/paneconv.png\"/>Conversations</h2>");
          let scroll = lib__html_lib.HtmlLib.appendScrollingDiv(this.bodyElement);
          for (let conv of event.convs) {
            src__models__wtypes.EventGetConvResponse._check(conv);
            lib__html_lib.HtmlLib.appendLinkToPane(scroll, conv.title, "conv/" + dart.str(conv.iid));
          }
        }
        if (event.users != null && dart.notNull(event.users[$length]) > 0) {
          this.bodyElement[$appendHtml]("<h2><img src=\"images/paneuser.png\"/>Attendees</h2>");
          let scroll = lib__html_lib.HtmlLib.appendScrollingDiv(this.bodyElement);
          for (let user of event.users) {
            src__models__wtypes.EventGetUserResponse._check(user);
            if (user.status !== "A") continue;
            let d1 = html.DivElement.new();
            d1.className = "avatar";
            scroll[$append](d1);
            if (user.avatarUrl != null) d1[$append](html.ImageElement.new({src: user.avatarUrl}));
            lib__html_lib.HtmlLib.appendLinkToPane(d1, user.nick, "user/" + dart.str(user.userId), {asDiv: false});
            d1[$appendText](" (" + dart.str(user.publicName) + ") " + dart.str(user.statusDesc));
          }
        }
        if (loggedIn && editable) {
          this.paneMenuBar.addButton("Edit", dart.fn(e => async.async(core.Null, (function*() {
            let editDialog = new dialog__event_dialog.EventDialog.new(this[_eventId], event);
            let dialogOk = core.bool._check(yield editDialog.show());
            if (dart.test(dialogOk)) this.recreatePane();
          }).bind(this)), dynamicToFutureOfNull()));
          this.paneMenuBar.addButton("Delete Event", dart.fn(e => async.async(core.Null, (function*() {
            let dlg = new dialog__confirm_dialog.ConfirmDialog.new("Really delete event?", dialog__confirm_dialog.ConfirmDialog.YesNoOptions);
            let btnIndex = core.int._check(yield dlg.show());
            if (btnIndex === 0) {
              yield rpc_lib.RpcLib.eventDelete(new src__models__wtypes.EventRequest.new({eventId: this[_eventId]}));
              pane_factory.PaneFactory.delete(this);
            }
          }).bind(this)), dynamicToFutureOfNull()));
        }
        if (loggedIn) {
          this.paneMenuBar.addButton("New Conversation", dart.fn(e => async.async(core.Null, (function*() {
            let dlg = new dialog__conv_dialog.ConvDialog.new(null, null, this[_eventId]);
            let convId = core.int._check(yield dlg.show());
            if (convId == null) return;
            this.recreatePane();
            pane_factory.PaneFactory.createFromString("conv/" + dart.str(convId));
          }).bind(this)), dynamicToFutureOfNull()));
        }
      }).bind(this));
    }
    [init$2](pk) {
      return super.init(pk);
    }
  };
  (pane__event_pane.EventPane.new = function() {
    this[_eventId] = null;
    pane__event_pane.EventPane.__proto__.new.call(this);
  }).prototype = pane__event_pane.EventPane.prototype;
  dart.addTypeTests(pane__event_pane.EventPane);
  dart.setFieldSignature(pane__event_pane.EventPane, () => ({
    __proto__: dart.getFields(pane__event_pane.EventPane.__proto__),
    [_eventId]: dart.fieldType(core.int)
  }));
  const _eventId$ = Symbol('_eventId');
  const _event = Symbol('_event');
  const _changedLat = Symbol('_changedLat');
  const _changedLon = Symbol('_changedLon');
  const _currentLatLon = Symbol('_currentLatLon');
  dialog__event_dialog.EventDialog = class EventDialog extends lib__dialog_box.DialogBox {
    dialogHeight() {
      return 400;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        let isNewEvent = this[_eventId$] === 0;
        if (!(this[_eventId$] != null)) dart.assertFailed();
        if (isNewEvent) {
          let nowLocal = new core.DateTime.now();
          this[_event] = new src__models__wtypes.EventGetResponse.new({startTimeU: wlib$.WLib.packDateEntry(nowLocal.year, nowLocal.month, nowLocal.day, nowLocal.hour, nowLocal.minute)});
        }
        let form = new lib__form_builder.FormBuilder.new(this.frame, "Event");
        let titleInput = form.addInput("Title", this.typicalControlWidth(), root__globals.Globals.maxTitleLength, this[_event].title);
        let descInput = form.addTextArea("Description", this.typicalControlWidth(), 90, root__globals.Globals.maxDescriptionLength, this[_event].description);
        let startsAtDiv = html.DivElement.new();
        form.addAny("Starts at", startsAtDiv);
        let startsAtInput = new lib__primitive_datetime.PrimitiveDateTime.new(startsAtDiv);
        startsAtInput.render(wlib$.WLib.unpackDateEntry(this[_event].startTimeU));
        let durationInput = form.addInput("Duration", this.typicalControlWidth(), root__globals.Globals.maxTitleLength, this[_event].duration);
        let mapButton = html.ButtonElement.new();
        mapButton[$text] = isNewEvent ? "Set Location On Map" : "Change Map Location";
        form.addAny("Map location", mapButton);
        let locationInput = form.addTextArea("Location/directions", this.typicalControlWidth(), 90, root__globals.Globals.maxDescriptionLength, this[_event].location);
        mapButton[$onClick].listen(dart.fn(e => async.async(core.Null, (function*() {
          let latlon = this[_currentLatLon]();
          let dlg = new dialog__location_dialog.LocationDialog.new(latlon[$_get](0), latlon[$_get](1));
          let dlgResult = ListOfdouble()._check(yield dlg.show());
          if (dlgResult != null) {
            this[_changedLat] = dlgResult[$_get](0);
            this[_changedLon] = dlgResult[$_get](1);
            mapButton[$text] = "Change Map Location";
          }
        }).bind(this)), MouseEventToFutureOfNull()));
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("OK", dart.fn(e => async.async(core.Null, (function*() {
          if (isNewEvent && this[_changedLat] == null) {
            form.showError("You must choose a map location to save an event.");
            return;
          }
          let newTitle = this.trimInput(titleInput);
          if (newTitle.length === 0) {
            form.showError("Title is required");
            return;
          }
          let latlon = this[_currentLatLon]();
          let startsAt = startsAtInput.getValue();
          let saveArgs = new src__models__wtypes.EventSaveRequest.new({eventId: this[_eventId$], title: newTitle, description: this.trimTextArea(descInput), duration: this.trimInput(durationInput), location: this.trimTextArea(locationInput), startTime: wlib$.WLib.packDateEntry(startsAt.year, startsAt.month, startsAt.day, startsAt.hour, startsAt.minute), lat: dart.toString(latlon[$_get](0)), lon: dart.toString(latlon[$_get](1))});
          let response = (yield rpc_lib.RpcLib.eventSave(saveArgs));
          if (dart.test(response.isOK)) {
            if (isNewEvent) messages.Messages.criticalMessage("The event will be reviewed and posted later");
            this.hide(true);
          }
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
    [_currentLatLon]() {
      let lat = this[_changedLat];
      let lon = this[_changedLon];
      if (lat == null) {
        if (this[_event].lat == null) return JSArrayOfdouble().of([null, null]);
        lat = core.double.parse(this[_event].lat);
        lon = core.double.parse(this[_event].lon);
      }
      return JSArrayOfdouble().of([lat, lon]);
    }
  };
  (dialog__event_dialog.EventDialog.new = function(eventId, event) {
    this[_changedLat] = null;
    this[_changedLon] = null;
    this[_eventId$] = eventId;
    this[_event] = event;
    dialog__event_dialog.EventDialog.__proto__.new.call(this);
  }).prototype = dialog__event_dialog.EventDialog.prototype;
  dart.addTypeTests(dialog__event_dialog.EventDialog);
  dart.setMethodSignature(dialog__event_dialog.EventDialog, () => ({
    __proto__: dart.getMethods(dialog__event_dialog.EventDialog.__proto__),
    [_currentLatLon]: dart.fnType(core.List$(core.double), [])
  }));
  dart.setFieldSignature(dialog__event_dialog.EventDialog, () => ({
    __proto__: dart.getFields(dialog__event_dialog.EventDialog.__proto__),
    [_eventId$]: dart.fieldType(core.int),
    [_event]: dart.fieldType(src__models__wtypes.EventGetResponse),
    [_changedLat]: dart.fieldType(core.double),
    [_changedLon]: dart.fieldType(core.double)
  }));
  main_menu_handler.MainMenuHandler = class MainMenuHandler extends core.Object {
    static init() {
      let colorThemeIndex = main_controller.MainController.colorThemes[$indexOf](client_store.ClientStore.colorTheme);
      let fontThemeIndex = main_controller.MainController.fontThemes[$indexOf](client_store.ClientStore.fontTheme);
      let $ = dart.bind(html.document, 'querySelector');
      main_menu_handler.MainMenuHandler._panel = html.DivElement._check($("#menu2"));
      let year = new core.DateTime.now().year;
      main_menu_handler.MainMenuHandler.addHeading("Resources - books, web, etc.", "HELPRES");
      main_menu_handler.MainMenuHandler.addItem("Browse/Create resources by category", "paneresource", dart.fn(() => pane_factory.PaneFactory.createFromString("resourcetree"), VoidToFutureOfBasePane()));
      main_menu_handler.MainMenuHandler.addItem("Search resources by keyword", "paneresource", dart.fn(() => pane_factory.PaneFactory.createFromString("resources"), VoidToFutureOfBasePane()));
      main_menu_handler.MainMenuHandler.addHeading("Projects and conversations", "HELPPROJ");
      main_menu_handler.MainMenuHandler.addItem("Browse/Create projects by category", "paneproject", dart.fn(() => pane_factory.PaneFactory.createFromString("projecttree"), VoidToFutureOfBasePane()));
      main_menu_handler.MainMenuHandler.addItem("Search projects by keyword", "paneproject", dart.fn(() => pane_factory.PaneFactory.createFromString("projectsearch"), VoidToFutureOfBasePane()));
      main_menu_handler.MainMenuHandler.addItem("Search in all conversations", "paneconv", dart.fn(() => pane_factory.PaneFactory.createFromString("convsearch"), VoidToFutureOfBasePane()));
      main_menu_handler.MainMenuHandler.addHeading("Local events", "HELPEV");
      main_menu_handler.MainMenuHandler.addItem("Find events", "paneevent", dart.fn(() => pane_factory.PaneFactory.createFromString("events"), VoidToFutureOfBasePane()));
      main_menu_handler.MainMenuHandler.addItem("Create an event", "paneevent", dart.fn(() => new dialog__event_dialog.EventDialog.new(0, null).show(), VoidToFuture()));
      main_menu_handler.MainMenuHandler.addHeading("Organizing the movement", "HELPORG");
      main_menu_handler.MainMenuHandler.addItem("Movement agenda & documents", "panedoc", dart.fn(() => pane_factory.PaneFactory.createFromString("rootdocs"), VoidToFutureOfBasePane()));
      main_menu_handler.MainMenuHandler.addItem("Proposed changes - active", "paneproposal", dart.fn(() => pane_factory.PaneFactory.createFromString("proposals-active"), VoidToFutureOfBasePane()));
      main_menu_handler.MainMenuHandler.addItem("System changes", "paneproposal", dart.fn(() => pane_factory.PaneFactory.createFromString("proposals-sys/" + dart.str(year)), VoidToFutureOfBasePane()));
      main_menu_handler.MainMenuHandler.addHeading("Accounts and settings", "HELPSET");
      let loginItem = main_menu_handler.MainMenuHandler.addItem("Log In", null, dart.fn(() => main_controller.MainController.toggleLogin(), VoidTovoid()));
      let profileItem = main_menu_handler.MainMenuHandler.addItem("My Profile", "paneuser", dart.fn(() => pane_factory.PaneFactory.createFromString("user/" + dart.str(root__globals.Globals.userId)), VoidToFutureOfBasePane()));
      let logoutItem = main_menu_handler.MainMenuHandler.addItem("Log Out", null, dart.fn(() => main_controller.MainController.toggleLogin(), VoidTovoid()), {hover: "Shortcut: Ctrl-Q"});
      let createAccountItem = main_menu_handler.MainMenuHandler.addItem("Create Account", null, dart.fn(() => {
        new dialog__user_dialog.UserDialog.new(0).show();
      }, VoidToNull()));
      main_menu_handler.MainMenuHandler.addItem("Find a user", "paneuser", dart.fn(() => pane_factory.PaneFactory.createFromString("users"), VoidToFutureOfBasePane()));
      main_menu_handler.MainMenuHandler.addItem("Collapse All", null, dart.fn(() => main_controller.MainController.collapseAll(), VoidTovoid()), {hover: "Shortcut: Ctrl-H"});
      let colorSelect = html.SelectElement._check(main_menu_handler.MainMenuHandler.addDropdown("Colors", main_controller.MainController.colorThemeNames, colorThemeIndex));
      let fontSelect = html.SelectElement._check(main_menu_handler.MainMenuHandler.addDropdown(" Fonts", main_controller.MainController.fontThemeNames, fontThemeIndex));
      main_menu_handler.MainMenuHandler._loggedInOnlyItems = JSArrayOfElement().of([profileItem, logoutItem]);
      main_menu_handler.MainMenuHandler._loggedOutOnlyItems = JSArrayOfElement().of([loginItem, createAccountItem]);
      colorSelect[$onChange].listen(dart.fn(e => {
        let code = main_controller.MainController.colorThemes[$_get](colorSelect.selectedIndex);
        client_store.ClientStore.colorTheme = code;
        main_controller.MainController.applyThemes();
      }, EventToNull()));
      fontSelect[$onChange].listen(dart.fn(e => {
        let code = main_controller.MainController.fontThemes[$_get](fontSelect.selectedIndex);
        client_store.ClientStore.fontTheme = code;
        main_controller.MainController.applyThemes();
      }, EventToNull()));
    }
    static setVisibility(isLoggedIn) {
      function makevis(e2, v2) {
        let styleDisplay = dart.test(v2) ? "inline-block" : "none";
        e2.style[$display] = styleDisplay;
        let assocIcon = e2.previousElementSibling;
        if (html.ImageElement.is(assocIcon)) assocIcon.style[$display] = styleDisplay;
      }
      dart.fn(makevis, ElementAndboolTovoid());
      for (let e of main_menu_handler.MainMenuHandler._loggedInOnlyItems)
        makevis(e, isLoggedIn);
      for (let e of main_menu_handler.MainMenuHandler._loggedOutOnlyItems)
        makevis(e, !dart.test(isLoggedIn));
    }
    static addHeading(heading, helpDocCode) {
      main_menu_handler.MainMenuHandler._panel[$appendHtml]("<h2>" + dart.str(heading) + " <a href=\"#doc/s=" + dart.str(helpDocCode) + "\"><img src=\"images/help_dim.png\" /></a></h2>");
    }
    static addItem(s, iconName, handler, opts) {
      let hover = opts && 'hover' in opts ? opts.hover : null;
      let div = html.DivElement.new();
      main_menu_handler.MainMenuHandler._panel[$append](div);
      if (iconName != null) div[$appendHtml]("<img src=\"images/" + dart.str(iconName) + ".png\" />");
      let link = html.ButtonElement.new();
      link[$text] = s;
      if (iconName == null) link.style[$marginLeft] = "26px";
      div[$append](link);
      if (hover != null) link.title = hover;
      link[$onClick].listen(dart.fn(e => {
        handler();
      }, MouseEventToNull()));
      return link;
    }
    static addDropdown(title, values, selectedIndex) {
      let dd = html.SelectElement.new();
      lib__html_lib.HtmlLib.addOptionElements(dd, values);
      if (dart.notNull(selectedIndex) >= 0) dd.selectedIndex = selectedIndex;
      let div = html.DivElement.new();
      div.style[$display] = "inline-block";
      div[$appendText](title);
      div[$appendText](": ");
      div[$append](dd);
      main_menu_handler.MainMenuHandler._panel[$append](div);
      return dd;
    }
  };
  (main_menu_handler.MainMenuHandler.new = function() {
  }).prototype = main_menu_handler.MainMenuHandler.prototype;
  dart.addTypeTests(main_menu_handler.MainMenuHandler);
  dart.defineLazy(main_menu_handler.MainMenuHandler, {
    /*main_menu_handler.MainMenuHandler._panel*/get _panel() {
      return null;
    },
    set _panel(_) {},
    /*main_menu_handler.MainMenuHandler._loggedInOnlyItems*/get _loggedInOnlyItems() {
      return null;
    },
    set _loggedInOnlyItems(_) {},
    /*main_menu_handler.MainMenuHandler._loggedOutOnlyItems*/get _loggedOutOnlyItems() {
      return null;
    },
    set _loggedOutOnlyItems(_) {}
  });
  const _latLon = Symbol('_latLon');
  const _marker = Symbol('_marker');
  const _mapClickSubscription = Symbol('_mapClickSubscription');
  const _setMarker = Symbol('_setMarker');
  const _googleLocToLatLon = Symbol('_googleLocToLatLon');
  dialog__location_dialog.LocationDialog = class LocationDialog extends lib__dialog_box.DialogBox {
    static _staticInit() {
      if (dialog__location_dialog.LocationDialog._googleMaps != null) return;
      dialog__location_dialog.LocationDialog._googleMaps = dart.dindex(js.context._get("google"), "maps");
      dialog__location_dialog.LocationDialog._mapCubbyhole = (() => {
        let _ = html.DivElement.new();
        _.style[$display] = "none";
        return _;
      })();
      html.document.body[$append](dialog__location_dialog.LocationDialog._mapCubbyhole);
      dialog__location_dialog.LocationDialog._mapDiv = (() => {
        let _ = html.DivElement.new();
        _.id = lib__html_lib.HtmlLib.uniqueId();
        return _;
      })();
      dialog__location_dialog.LocationDialog._mapCubbyhole[$append](dialog__location_dialog.LocationDialog._mapDiv);
      dialog__location_dialog.LocationDialog._mapDiv.style[$zIndex] = "5";
      dialog__location_dialog.LocationDialog._mapDiv.style[$margin] = "4px";
      dialog__location_dialog.LocationDialog._mapDiv.style[$width] = "100%";
      dialog__location_dialog.LocationDialog._mapDiv.style[$height] = "380px";
      let mapTypeId = dart.dindex(dart.dindex(dialog__location_dialog.LocationDialog._googleMaps, "MapTypeId"), "ROADMAP");
      let mapOptions = js.JsObject.jsify(new (IdentityMapOfString$dynamic()).from(["zoom", 15, "mapTypeId", mapTypeId, "mapTypeControl", false, "streetViewControl", false, "fullscreenControl", false]));
      dialog__location_dialog.LocationDialog._map = js.JsObject.new(js.JsFunction._check(dart.dindex(dialog__location_dialog.LocationDialog._googleMaps, "Map")), [dialog__location_dialog.LocationDialog._mapDiv, mapOptions]);
      dialog__location_dialog.LocationDialog._geocoder = js.JsObject.new(js.JsFunction._check(dart.dindex(dialog__location_dialog.LocationDialog._googleMaps, "Geocoder")), []);
    }
    dialogHeight() {
      return 500;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        let streetDiv = html.DivElement.new();
        let streetInp = html.TextInputElement.new();
        streetInp[$maxLength] = 400;
        streetInp[$style][$width] = "170px";
        streetDiv[$append](streetInp);
        let streetBtn = html.ButtonElement.new();
        streetBtn[$text] = "Lookup Address or Zip/Postal code";
        streetDiv[$append](streetBtn);
        this.frame[$append](streetDiv);
        let mapBorrower = html.DivElement.new();
        this.frame[$append](mapBorrower);
        this.frame[$appendText]("You can drag the map to scroll, zoom in or out, then click on the exact location to set the marker.");
        dialog__location_dialog.LocationDialog._staticInit();
        mapBorrower[$append](dialog__location_dialog.LocationDialog._mapDiv);
        if (this[_latLon] != null) {
          let center = js.JsObject.new(js.JsFunction._check(dart.dindex(dialog__location_dialog.LocationDialog._googleMaps, "LatLng")), this[_latLon]);
          this[_setMarker](center, true);
        }
        streetBtn[$onClick].listen(dart.fn(e => {
          let addr = streetInp[$value][$trim]();
          if (addr.length === 0) return;
          let geoOptions = js.JsObject.jsify(new (IdentityMapOfString$String()).from(["address", addr]));
          dart.dsend(dialog__location_dialog.LocationDialog._geocoder, 'callMethod', ["geocode", JSArrayOfObject().of([geoOptions, dart.fn((results, status) => {
                if (dart.equals(status, dart.dindex(dart.dindex(dialog__location_dialog.LocationDialog._googleMaps, "GeocoderStatus"), "OK"))) {
                  let loc = dart.dindex(dart.dindex(dart.dindex(results, 0), "geometry"), "location");
                  this[_setMarker](loc, true);
                } else {
                  messages.Messages.timed("Geocode was not successful: " + dart.notNull(core.String._check(status)));
                }
              }, dynamicAnddynamicToNull())])]);
        }, MouseEventToNull()));
        this[_mapClickSubscription] = dart.dsend(dart.dindex(dialog__location_dialog.LocationDialog._googleMaps, "event"), 'callMethod', ["addListener", [dialog__location_dialog.LocationDialog._map, "click", dart.fn(e => {
              let loc = dart.dindex(e, "latLng");
              this[_setMarker](loc, false);
            }, dynamicToNull())]]);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("Use This Location", dart.fn(e => {
          if (this[_latLon] == null) {
            messages.Messages.timed("Search for location or click map first");
            return;
          }
          this.hide(this[_latLon]);
        }, dynamicToNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(null);
        }, dynamicToNull()));
      }).bind(this));
    }
    hide(value) {
      if (this[_marker] != null) {
        dart.dsend(this[_marker], 'callMethod', ["setMap", JSArrayOfNull().of([null])]);
        this[_marker] = null;
      }
      dialog__location_dialog.LocationDialog._mapCubbyhole[$append](dialog__location_dialog.LocationDialog._mapDiv);
      super.hide(value);
      dart.dsend(dart.dindex(dialog__location_dialog.LocationDialog._googleMaps, "event"), 'callMethod', ["removeListener", [this[_mapClickSubscription]]]);
    }
    [_googleLocToLatLon](loc) {
      let s = dart.toString(loc);
      s = s[$substring](1, s.length - 2);
      let parts = s[$split](",");
      let lat = core.double.parse(parts[$_get](0));
      let lon = core.double.parse(parts[$_get](1));
      return JSArrayOfdouble().of([lat, lon]);
    }
    [_setMarker](loc, centerMap) {
      if (this[_marker] != null) {
        dart.dsend(this[_marker], 'callMethod', ["setMap", JSArrayOfNull().of([null])]);
        this[_marker] = null;
      }
      if (dart.test(centerMap)) dart.dsend(dialog__location_dialog.LocationDialog._map, 'callMethod', ["setCenter", [loc]]);
      let markerOptions = js.JsObject.jsify(new (IdentityMapOfString$dynamic()).from(["map", dialog__location_dialog.LocationDialog._map, "position", loc]));
      this[_marker] = js.JsObject.new(js.JsFunction._check(dart.dindex(dialog__location_dialog.LocationDialog._googleMaps, "Marker")), [markerOptions]);
      this[_latLon] = this[_googleLocToLatLon](dart.toString(loc));
    }
  };
  (dialog__location_dialog.LocationDialog.new = function(lat, lon) {
    this[_latLon] = null;
    this[_marker] = null;
    this[_mapClickSubscription] = null;
    dialog__location_dialog.LocationDialog.__proto__.new.call(this);
    if (lat != null && lat !== 0) {
      this[_latLon] = JSArrayOfdouble().of([lat, lon]);
    }
  }).prototype = dialog__location_dialog.LocationDialog.prototype;
  dart.addTypeTests(dialog__location_dialog.LocationDialog);
  dart.setMethodSignature(dialog__location_dialog.LocationDialog, () => ({
    __proto__: dart.getMethods(dialog__location_dialog.LocationDialog.__proto__),
    [_googleLocToLatLon]: dart.fnType(core.List$(core.double), [dart.dynamic]),
    [_setMarker]: dart.fnType(dart.void, [dart.dynamic, core.bool])
  }));
  dart.setFieldSignature(dialog__location_dialog.LocationDialog, () => ({
    __proto__: dart.getFields(dialog__location_dialog.LocationDialog.__proto__),
    [_latLon]: dart.fieldType(ListOfdouble()),
    [_marker]: dart.fieldType(dart.dynamic),
    [_mapClickSubscription]: dart.fieldType(dart.dynamic)
  }));
  dart.defineLazy(dialog__location_dialog.LocationDialog, {
    /*dialog__location_dialog.LocationDialog._googleMaps*/get _googleMaps() {
      return null;
    },
    set _googleMaps(_) {},
    /*dialog__location_dialog.LocationDialog._map*/get _map() {
      return null;
    },
    set _map(_) {},
    /*dialog__location_dialog.LocationDialog._geocoder*/get _geocoder() {
      return null;
    },
    set _geocoder(_) {},
    /*dialog__location_dialog.LocationDialog._mapCubbyhole*/get _mapCubbyhole() {
      return null;
    },
    set _mapCubbyhole(_) {},
    /*dialog__location_dialog.LocationDialog._mapDiv*/get _mapDiv() {
      return null;
    },
    set _mapDiv(_) {}
  });
  dialog__user_dialog.UserDialog = class UserDialog extends lib__dialog_box.DialogBox {
    get userId() {
      return this[userId$];
    }
    set userId(value) {
      this[userId$] = value;
    }
    dialogHeight() {
      return 500;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        let isNewUser = this.userId === 0;
        let userGetArgs = new src__models__wtypes.UserGetRequest.new({userId: this.userId, includeEditing: "Y"});
        let user = (yield rpc_lib.RpcLib.userGet(userGetArgs));
        let userAgreement = null;
        if (isNewUser) userAgreement = (yield rpc_lib.RpcLib.docGet(new src__models__wtypes.DocGetRequest.new({specialCode: "UA"})));
        let form = new lib__form_builder.FormBuilder.new(this.frame, "User Account");
        let nickInput = form.addInput("Nickname", 200, 40, user.nick);
        if (!isNewUser)
          nickInput.disabled = true;
        else
          form.addExplanation(nickInput, "Your nickname (screen name) is shown to all users; use 5 or more characters.");
        let pw1Input = html.InputElement._check(form.addPasswordInput(isNewUser ? "Password" : "Change password", 200, 40));
        if (isNewUser) form.addExplanation(pw1Input, "Passwords must be 5 or more characters");
        let pw2Input = html.InputElement._check(form.addPasswordInput("Repeat password", 200, 40));
        let emailInput = form.addInput("Private email address", 200, 200, user.email);
        form.addExplanation(emailInput, "Include your email address to allow the system to email you and to recover a password. (optional)");
        let kindInput = html.SelectElement.new();
        root__globals.Globals.allUserKinds[$forEach](dart.fn((value, text) => {
          kindInput[$append]((() => {
            let _ = html.OptionElement.new();
            _.value = value;
            _[$text] = text;
            return _;
          })());
        }, StringAndStringToNull()));
        kindInput.value = user.kind;
        form.addAny("User type", kindInput);
        if (isNewUser) form.addExplanation(kindInput, "Select your affiliation with the movement.");
        let publicSubform = form.addSubformFrame("About Me (optional public information shown to all users)");
        let prefEmailNotifyChk = html.CheckboxInputElement.new();
        prefEmailNotifyChk[$checked] = user.prefEmailNotify === "Y";
        form.addAny("Email me notifications", prefEmailNotifyChk);
        let timeZoneInput = html.SelectElement.new();
        lib__html_lib.HtmlLib.addOptionElements(timeZoneInput, user.allTimeZones);
        timeZoneInput.value = user.timeZone;
        form.addAny("Time zone", timeZoneInput);
        let publicLinkKinds = JSArrayOfSelectElement().of([]);
        let publicLinkValues = JSArrayOfTextInputElement().of([]);
        function add1PublicLink(linkKind, linkValue) {
          let kindEl = html.SelectElement.new();
          kindEl[$append](html.OptionElement.new());
          for (let k of root__globals.Globals.allPublicLinkKinds)
            kindEl[$append]((() => {
              let _ = html.OptionElement.new({value: k});
              _[$text] = k;
              return _;
            })());
          kindEl.value = linkKind;
          let valEl = html.TextInputElement.new();
          valEl[$style][$width] = "200px";
          valEl[$maxLength] = 1000;
          valEl[$value] = linkValue;
          publicSubform.addAnyAny(kindEl, valEl);
          publicLinkKinds[$add](kindEl);
          publicLinkValues[$add](valEl);
        }
        dart.fn(add1PublicLink, StringAndStringTovoid());
        let publicNameInput = publicSubform.addInput("Real name", 200, 100, user.publicName);
        let nLinksCreated = 0;
        if (user.publicLinks != null) {
          user.publicLinks[$forEach](dart.fn((kind, value) => {
            add1PublicLink(kind, value);
            ++nLinksCreated;
          }, StringAndStringToNull()));
        }
        let remainingKinds = root__globals.Globals.allPublicLinkKinds[$toList]();
        if (user.publicLinks != null) {
          user.publicLinks[$forEach](dart.fn((kind, value) => {
            remainingKinds[$remove](kind);
          }, StringAndStringToNull()));
        }
        let remainingIdx = 0;
        for (let i = nLinksCreated; i < 5; ++i)
          add1PublicLink(remainingKinds[$_get](remainingIdx++), "");
        let newUserSubform = null;
        let iAgreeChk = null;
        if (isNewUser) {
          newUserSubform = form.addSubformFrame("Agreement");
          let docDiv = html.DivElement.new();
          docDiv.style[$overflowY] = "scroll";
          docDiv.style[$maxHeight] = "350px";
          newUserSubform.parent[$append](docDiv);
          let userAgreementHtml = core.String._check(dart.global.Markdown.getSanitizingConverter().makeHtml(userAgreement.body));
          docDiv[$appendHtml](userAgreementHtml);
          iAgreeChk = html.CheckboxInputElement.new();
          newUserSubform.addAny("I agree to the terms of service", iAgreeChk);
        }
        function getPublicLinksFromDom() {
          let n = publicLinkKinds[$length];
          let ret = JSArrayOfStringTuple().of([]);
          for (let i = 0; i < dart.notNull(n); ++i) {
            let l = publicLinkKinds[$_get](i).value;
            let kind = l != null ? l : "";
            let value = (() => {
              let l = publicLinkValues[$_get](i)[$value];
              return l != null ? l : "";
            })()[$trim]();
            if (value.length > 0) {
              if (kind.length === 0) return null;
              ret[$add]((() => {
                let _ = new lib__string_tuple.StringTuple.new();
                _.name = kind;
                _.value = value;
                return _;
              })());
            }
          }
          return ret;
        }
        dart.fn(getPublicLinksFromDom, VoidToListOfStringTuple());
        const isValid = (function() {
          if (isNewUser) {
            let nick = this.trimInput(nickInput);
            let err = wlib$.WLib.nickValidationError(nick);
            if (err != null) {
              form.showError(err);
              return false;
            }
          }
          let pw1 = this.trimInput(pw1Input), pw2 = this.trimInput(pw2Input);
          if (isNewUser || pw1.length > 0) {
            let err = wlib$.WLib.passwordComplexityError(pw1);
            if (err != null) {
              form.showError(err);
              return false;
            }
          }
          if (pw1 != pw2) {
            form.showError("Passwords do not match");
            return false;
          }
          if (isNewUser && !dart.test(iAgreeChk[$checked])) {
            form.showError("You must agree to the terms of service.");
            return false;
          }
          let links = getPublicLinksFromDom();
          if (links == null) {
            form.showError("You must select a kind of link for each item in About Me.");
            return false;
          }
          let linkKinds = IterableOfString()._check(links[$map](core.String, dart.fn(v => v.name, StringTupleToString())))[$toList]();
          if (dart.test(dialog__user_dialog.UserDialog.hasDuplicates(linkKinds))) {
            form.showError("The items in About Me must not repeat.");
            return false;
          }
          return true;
        }).bind(this);
        dart.fn(isValid, VoidTobool());
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton(isNewUser ? "Create Account" : "Save", dart.fn(e => async.async(core.Null, (function*() {
          if (!dart.test(isValid())) return;
          let links = getPublicLinksFromDom();
          let linksMap = new (IdentityMapOfString$String()).new();
          links[$forEach](dart.fn(st => {
            linksMap[$_set](st.name, st.value);
          }, StringTupleToNull()));
          let savePW = this.trimInput(pw1Input);
          if (savePW.length === 0) savePW = null;
          let saveArgs = new src__models__wtypes.UserSaveRequest.new({isNew: isNewUser ? "Y" : "N", saveNick: this.trimInput(nickInput), savePW: savePW, kind: kindInput.value, email: this.trimInput(emailInput), publicName: this.trimInput(publicNameInput), prefEmailNotify: dart.test(prefEmailNotifyChk[$checked]) ? "Y" : "N", timeZone: timeZoneInput.value, publicLinks: linksMap});
          let response = (yield rpc_lib.RpcLib.userSave(saveArgs));
          if (dart.test(response.isOK)) {
            if (isNewUser) {
              dialog__user_dialog.UserDialog.onLogoutAccount();
              messages.Messages.criticalMessage("Account created! Click \"Log in\" in the upper right corner to log in to your new account.");
            }
            this.hide(true);
            dialog__user_dialog.UserDialog.onChangeAccount();
          }
        }).bind(this)), dynamicToFutureOfNull()));
        if (!isNewUser) {
          bar.addButton("Delete Account", dart.fn(e => async.async(core.Null, (function*() {
            let confirm = new lib__string_dialog.StringDialog.new("Type the word \"delete\" to delete your account", "", 6);
            let word = core.String._check(yield confirm.show());
            if (word != null && word[$toLowerCase]() === "delete") {
              this.hide(true);
              let deleteArgs = new src__models__wtypes.UserSaveRequest.new({isDelete: "Y"});
              rpc_lib.RpcLib.userSave(deleteArgs);
              dialog__user_dialog.UserDialog.onLogoutAccount();
            }
          }).bind(this)), dynamicToFutureOfNull()));
        }
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
    static hasDuplicates(list) {
      let s = new collection._HashSet.new();
      for (let i = 0; i < dart.notNull(list[$length]); ++i) {
        if (dart.test(s.contains(list[$_get](i)))) return true;
        s.add(list[$_get](i));
      }
      return false;
    }
  };
  (dialog__user_dialog.UserDialog.new = function(userId) {
    this[userId$] = userId;
    dialog__user_dialog.UserDialog.__proto__.new.call(this);
  }).prototype = dialog__user_dialog.UserDialog.prototype;
  dart.addTypeTests(dialog__user_dialog.UserDialog);
  const userId$ = Symbol("UserDialog.userId");
  dart.setFieldSignature(dialog__user_dialog.UserDialog, () => ({
    __proto__: dart.getFields(dialog__user_dialog.UserDialog.__proto__),
    userId: dart.fieldType(core.int)
  }));
  dart.defineLazy(dialog__user_dialog.UserDialog, {
    /*dialog__user_dialog.UserDialog.onLogoutAccount*/get onLogoutAccount() {
      return null;
    },
    set onLogoutAccount(_) {},
    /*dialog__user_dialog.UserDialog.onChangeAccount*/get onChangeAccount() {
      return null;
    },
    set onChangeAccount(_) {}
  });
  const _nick = Symbol('_nick');
  dialog__login_recovery_dialog.LoginRecoveryDialog = class LoginRecoveryDialog extends lib__dialog_box.DialogBox {
    build() {
      return async.async(dart.dynamic, (function* build() {
        let form = new lib__form_builder.FormBuilder.new(this.frame, "Recover Password");
        let nickInput = form.addInput("Nickname", this.typicalControlWidth(), 40, (() => {
          let l = this[_nick];
          return l != null ? l : "";
        })());
        if (this[_nick] != null) nickInput.disabled = true;
        form.addExplanation(nickInput, "An email has been sent to you. Leave this open, but go check your email and note the code given in the email. Then copy the code below.");
        let codeInput = form.addInput("Recovery code from email", 200, 10);
        let pw1Input = form.addInput("New password", 200, 40);
        let pw2Input = form.addInput("Repeat password", 200, 40);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("Recover", dart.fn(e => async.async(core.Null, (function*() {
          let pw1 = this.trimInput(pw1Input), pw2 = this.trimInput(pw2Input), code = this.trimInput(codeInput), nick = this.trimInput(nickInput);
          if (pw1 != pw2) {
            form.showError("Passwords do not match");
            return;
          }
          let err = wlib$.WLib.passwordComplexityError(pw1);
          if (err != null) {
            form.showError(err);
            return;
          }
          let args = new src__models__wtypes.UserRecoverPasswordRequest.new({recoveryNick: nick, recoveryPassword: pw1, code: code, mode: "V"});
          let response = (yield rpc_lib.RpcLib.userRecoverPassword(args));
          if (!dart.test(response.isOK)) {
            form.showError(response.errorMessage);
            return;
          }
          messages.Messages.timed("Account recovered. Please log in again.");
          this.hide(false);
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__login_recovery_dialog.LoginRecoveryDialog.new = function(nick) {
    this[_nick] = nick;
    dialog__login_recovery_dialog.LoginRecoveryDialog.__proto__.new.call(this);
  }).prototype = dialog__login_recovery_dialog.LoginRecoveryDialog.prototype;
  dart.addTypeTests(dialog__login_recovery_dialog.LoginRecoveryDialog);
  dart.setFieldSignature(dialog__login_recovery_dialog.LoginRecoveryDialog, () => ({
    __proto__: dart.getFields(dialog__login_recovery_dialog.LoginRecoveryDialog.__proto__),
    [_nick]: dart.fieldType(core.String)
  }));
  const _loginHandler = Symbol('_loginHandler');
  dialog__login_dialog.LoginDialog = class LoginDialog extends lib__dialog_box.DialogBox {
    dialogHeight() {
      return 150;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        let form = new lib__form_builder.FormBuilder.new(this.frame, "Log In");
        let nickInput = form.addInput("Nickname", 200, 40);
        let pwInput = form.addPasswordInput("Password", 200, 40);
        let saveChk = html.CheckboxInputElement.new();
        form.addAny("Save password on this computer", saveChk);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("Log In", dart.fn(e => async.async(core.Null, (function*() {
          let message = (yield this[_loginHandler](this.trimInput(nickInput), this.trimInput(html.InputElement._check(pwInput)), saveChk[$checked]));
          if (message == null)
            this.hide(true);
          else
            form.showError(message);
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Create Account", dart.fn(e => {
          this.hide(false);
          let ud = new dialog__user_dialog.UserDialog.new(0);
          ud.show();
        }, dynamicToNull()));
        bar.addButton("Recover Password", dart.fn(e => async.async(core.Null, (function*() {
          let nick = this.trimInput(nickInput);
          if (nick.length === 0) {
            form.showError("First enter the nickname, then press Recover Password");
            return;
          }
          let args = new src__models__wtypes.UserRecoverPasswordRequest.new({recoveryNick: this.trimInput(nickInput), mode: "E"});
          let response = (yield rpc_lib.RpcLib.userRecoverPassword(args));
          if (!dart.test(response.isOK)) {
            form.showError(response.errorMessage);
            return;
          }
          this.hide(false);
          let rd = new dialog__login_recovery_dialog.LoginRecoveryDialog.new(nick);
          rd.show();
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__login_dialog.LoginDialog.new = function(loginHandler) {
    this[_loginHandler] = loginHandler;
    dialog__login_dialog.LoginDialog.__proto__.new.call(this);
  }).prototype = dialog__login_dialog.LoginDialog.prototype;
  dart.addTypeTests(dialog__login_dialog.LoginDialog);
  dart.setFieldSignature(dialog__login_dialog.LoginDialog, () => ({
    __proto__: dart.getFields(dialog__login_dialog.LoginDialog.__proto__),
    [_loginHandler]: dart.fieldType(StringAndStringAndboolToFutureOfString())
  }));
  main_controller.MainController = class MainController extends core.Object {
    static startApp() {
      return async.async(dart.dynamic, function* startApp() {
        rpc_lib.RpcLib.init();
        messages.Messages.init();
        main_menu_handler.MainMenuHandler.init();
        dialog__user_dialog.UserDialog.onLogoutAccount = dart.fn(() => main_controller.MainController.logOut(true, true), VoidTovoid());
        dialog__user_dialog.UserDialog.onChangeAccount = dart.fn(main_controller.MainController.setVisibility, VoidTovoid());
        lib__button_bar_builder.ButtonBarBuilder.systemButtonHandler = dart.fn(main_controller.MainController.doOnUserAction, VoidTovoid());
        messages.Messages.timed("Welcome!");
        main_controller.MainController.logOut(false, false);
        main_controller.MainController.setVisibility();
        main_controller.MainController.sizeEverything();
        main_controller.MainController.applyThemes();
        html.querySelector("#button-mystuff")[$onClick].listen(dart.fn(e => main_controller.MainController.showMyStuff({allowHide: true}), MouseEventTovoid()));
        html.querySelector("#button-menu")[$onClick].listen(dart.fn(e => main_controller.MainController.showMenu({allowHide: true}), MouseEventTovoid()));
        html.querySelector("#button-next")[$onClick].listen(dart.fn(e => main_controller.MainController.showNextInPushQueue(), MouseEventTovoid()));
        html.querySelector("#button-refresh")[$onClick].listen(dart.fn(e => push_queue_handler.PushQueueHandler.refreshClicked(), MouseEventTovoid()));
        html.window[$onHashChange].listen(dart.fn(e => main_controller.MainController.processUrl(), EventToFuture()));
        html.window[$onResize].listen(dart.fn(e => main_controller.MainController.sizeEverything(), EventTovoid()));
        html.document[$onKeyDown].listen(dart.fn(e => main_controller.MainController.handleHotKey(e), KeyboardEventTovoid()));
        let l = client_store.ClientStore.nick;
        let nick = l != null ? l : "";
        if (nick.length > 0) {
          try {
            yield main_controller.MainController.logIn(nick, client_store.ClientStore.password, false, true);
          } catch (e) {
            let ex = dart.getThrown(e);
          }
        }
        try {
          yield main_controller.MainController.processUrl();
        } catch (e$) {
          let ex = dart.getThrown(e$);
        }
        try {
          if (root__globals.Globals.nick == null && root__globals.Globals.panes[$length] === 0) {
            yield pane_factory.PaneFactory.create(new root__pane_key.PaneKey.new("doc/s=PUB"), {doScroll: false});
            yield pane_factory.PaneFactory.create(new root__pane_key.PaneKey.new("resourcetree"), {doScroll: false});
          }
        } catch (e$0) {
          let ex = dart.getThrown(e$0);
        }
        if ((() => {
          let l = root__globals.Globals.isLargeScreen;
          return l != null ? l : false;
        })()) {
          if (root__globals.Globals.nick == null) {
            main_controller.MainController.showMenu();
          } else {
            main_controller.MainController.showMyStuff();
          }
        } else {
          if (root__globals.Globals.panes[$length] === 0 && root__globals.Globals.nick != null) {
            main_controller.MainController.showMyStuff();
          }
        }
        push_queue_handler.PushQueueHandler.init();
      });
    }
    static doOnUserAction() {
      root__globals.Globals.lastActivityUtc = wlib$.WLib.utcNow();
      let actions = MapOfString$VoidToFuture().from(root__globals.Globals.doOnUserAction);
      root__globals.Globals.doOnUserAction[$clear]();
      actions[$forEach](dart.fn((k, v) => v(), StringAndFnToFuture()));
    }
    static logOut(forget, notifyUser) {
      let wasLoggedIn = root__globals.Globals.nick != null;
      root__globals.Globals.nick = null;
      root__globals.Globals.userId = 0;
      root__globals.Globals.publicName = null;
      root__globals.Globals.lastPollUtc = new core.DateTime.new(1970);
      root__globals.Globals.lastFullPollUtc = new core.DateTime.new(1970);
      root__globals.Globals.pushQueue[$clear]();
      main_controller.MainController.setVisibility();
      main_controller.MainController.collapseAll();
      if (dart.test(forget)) {
        client_store.ClientStore.nick = null;
        client_store.ClientStore.password = null;
      }
      if (dart.test(notifyUser) && wasLoggedIn) {
        messages.Messages.timed("Logged out");
      }
    }
    static toggleLogin() {
      if (root__globals.Globals.nick != null) {
        main_controller.MainController.logOut(true, true);
        return;
      }
      function loginHandlerFromDialog(nick, pw, savePW) {
        return async.async(core.String, function* loginHandlerFromDialog() {
          let ok = (yield main_controller.MainController.logIn(nick, pw, true, savePW));
          if (dart.test(ok)) return null;
          return "Account nickname or password is incorrect.";
        });
      }
      dart.fn(loginHandlerFromDialog, StringAndStringAndboolToFutureOfString());
      let dlg = new dialog__login_dialog.LoginDialog.new(loginHandlerFromDialog);
      dlg.show();
    }
    static logIn(nick, password, notifyUser, savePW) {
      return async.async(core.bool, function* logIn() {
        let req = new src__models__wtypes.APIRequestBase.new({nick: nick, password: password});
        let auth = (yield rpc_lib.RpcLib.authenticate(req));
        if (dart.test(auth.base.isOK)) {
          root__globals.Globals.nick = auth.nick;
          root__globals.Globals.password = password;
          root__globals.Globals.userId = auth.userId;
          root__globals.Globals.publicName = auth.publicName;
          root__globals.Globals.isSiteAdmin = auth.isSiteAdmin === "Y";
          if (dart.test(savePW)) {
            client_store.ClientStore.nick = nick;
            client_store.ClientStore.password = password;
          } else {
            client_store.ClientStore.password = null;
          }
          if (dart.test(notifyUser)) messages.Messages.timed("Logged in.");
          main_controller.MainController.setVisibility();
          main_controller.MainController.sizeEverything();
          push_queue_handler.PushQueueHandler.init();
          if (dart.test(root__globals.Globals.isLargeScreen)) main_controller.MainController.showMyStuff();
        } else {
          if (dart.test(notifyUser)) messages.Messages.timed("Account nickname or password is incorrect.");
        }
        return auth.base.isOK;
      });
    }
    static sizeScrollSpace(big) {
      let h = math.max(core.int, 20, dart.notNull(html.window.innerHeight) - 500);
      if (dart.test(big)) h = 500;
      lib__html_lib.HtmlLib.height("#scrollspace", h);
    }
    static sizeEverything() {
      let delayed = () => {
        let wh = html.window.innerHeight, hh = html.querySelector("#header").clientHeight;
        let mh = dart.notNull(wh) - dart.notNull(hh) - 20;
        let isLargeScreen = dart.notNull(html.window.innerWidth) > 1200;
        let leftw = isLargeScreen ? 400 : 0;
        let modeChanged = isLargeScreen !== root__globals.Globals.isLargeScreen;
        root__globals.Globals.isLargeScreen = isLargeScreen;
        lib__html_lib.HtmlLib.height("#middle", mh);
        main_controller.MainController.sizeScrollSpace(false);
        lib__html_lib.HtmlLib.width("#main1", math.min(core.int, 700, dart.notNull(html.window.innerWidth) - leftw - 2));
        let popupmax = lib__html_lib.HtmlLib.asPx(mh - 70);
        let $ = dart.bind(html.document, 'querySelector');
        $("#mystuff1").style[$maxHeight] = popupmax;
        $("#menu1").style[$maxHeight] = popupmax;
        $("#mystuff2").style[$maxHeight] = popupmax;
        $("#menu2").style[$maxHeight] = popupmax;
        let btnrect = $("#button-menu").getBoundingClientRect();
        $("#popupconnector").style[$bottom] = lib__html_lib.HtmlLib.asPx(dart.notNull(wh) - dart.notNull(btnrect[$top]) - 1);
        if (modeChanged) {
          lib__html_lib.HtmlLib.width("#left", leftw);
          main_controller.MainController.hideMenuPanels();
        }
      };
      dart.fn(delayed, VoidToNull());
      async.Timer.run(delayed);
    }
    static handleHotKey(e) {
      let handled = false;
      if (dart.test(e.ctrlKey)) {
        handled = true;
        if (e.keyCode === html.KeyCode.SPACE)
          main_controller.MainController.showNextInPushQueue();
        else if (e.keyCode === html.KeyCode.M)
          main_controller.MainController.showMenu();
        else if (e.keyCode === html.KeyCode.I)
          main_controller.MainController.showMyStuff();
        else if (e.keyCode === html.KeyCode.Q)
          main_controller.MainController.logOut(true, true);
        else if (e.keyCode === html.KeyCode.H)
          main_controller.MainController.collapseAll();
        else
          handled = false;
      }
      if (!dart.test(handled) && dart.notNull(root__globals.Globals.panes[$length]) > 1) handled = root__globals.Globals.panes[$last].handleHotKey(e);
      if (!dart.test(handled) && e.keyCode === html.KeyCode.ESC) {
        handled = true;
        main_controller.MainController.hideMenuPanels();
      }
      if (dart.test(handled)) e.preventDefault();
    }
    static applyThemes() {
      let page = html.querySelector("#page");
      for (let c of main_controller.MainController.fontThemes[$skip](1))
        page[$classes].remove(c);
      for (let c of main_controller.MainController.colorThemes[$skip](1))
        page[$classes].remove(c);
      let l = client_store.ClientStore.fontTheme;
      let fontTheme = l != null ? l : "";
      if (fontTheme.length > 0) page[$classes].add(fontTheme);
      let l$ = client_store.ClientStore.colorTheme;
      let colorTheme = l$ != null ? l$ : "";
      if (colorTheme.length > 0) page[$classes].add(colorTheme);
    }
    static changeUrlFragment(pkfull) {
      let oldFragment = core.Uri.base.fragment;
      if (oldFragment == pkfull) return;
      let newUrl = dart.notNull(dart.toString(core.Uri.base.removeFragment())) + "#" + dart.notNull(pkfull);
      root__globals.Globals.urlChangedInCode = true;
      html.window[$location].assign(newUrl);
    }
    static processUrl() {
      return async.async(dart.dynamic, function* processUrl() {
        if (dart.test(root__globals.Globals.urlChangedInCode)) {
          root__globals.Globals.urlChangedInCode = false;
          return;
        }
        let paneKey = core.Uri.base.fragment;
        if (dart.notNull(root__globals.Globals.panes[$length]) > 0) {
          let lastPane = root__globals.Globals.panes[$last];
          if (lastPane.paneKey.full == paneKey && !dart.test(lastPane.isCollapsed)) return;
        }
        if (paneKey.length === 0) return;
        yield pane_factory.PaneFactory.create(new root__pane_key.PaneKey.new(paneKey));
      });
    }
    static setVisibility() {
      let $ = dart.bind(html.document, 'querySelector');
      let logInOut = html.ButtonElement.new();
      logInOut[$onClick].listen(dart.fn(e => main_controller.MainController.toggleLogin(), MouseEventTovoid()));
      let hello = $("#hello");
      hello[$innerHtml] = "";
      let isLoggedIn = root__globals.Globals.nick != null;
      let wasLoggedIn = $("#button-next").style[$display] !== "hidden";
      let changedStatus = wasLoggedIn !== isLoggedIn;
      if (changedStatus) {
        main_controller.MainController.hideMenuPanels();
      }
      if (isLoggedIn) {
        logInOut[$text] = "Log Out";
        hello[$appendText]("Hello " + dart.str(root__globals.Globals.publicName) + " ");
        $("#button-next").style[$display] = "inline-block";
        $("#button-mystuff").style[$display] = "inline-block";
      } else {
        logInOut[$text] = "Log In";
        hello[$appendText]("(not logged in) ");
        $("#mystuff1").style[$display] = "none";
        $("#button-next").style[$display] = "none";
        $("#button-mystuff").style[$display] = "none";
      }
      hello[$append](logInOut);
      main_menu_handler.MainMenuHandler.setVisibility(isLoggedIn);
    }
    static hideMenuPanels() {
      root__globals.Globals.myStuffShowing = false;
      root__globals.Globals.menuShowing = false;
      let $ = dart.bind(html.document, 'querySelector');
      $("#mystuff1").style[$display] = "none";
      $("#menu1").style[$display] = "none";
      $("#popupconnector").style[$display] = "none";
      $("#button-mystuff").style[$borderTopWidth] = "1px";
      $("#button-menu").style[$borderTopWidth] = "1px";
    }
    static showMyStuff(opts) {
      let allowHide = opts && 'allowHide' in opts ? opts.allowHide : false;
      let $ = dart.bind(html.document, 'querySelector');
      let wasShowing = root__globals.Globals.myStuffShowing;
      main_controller.MainController.hideMenuPanels();
      if (dart.test(allowHide) && dart.test(wasShowing)) return;
      $("#mystuff1").style[$display] = "inline-block";
      root__globals.Globals.myStuffShowing = true;
      main_controller.MainController._showPopupConnector($("#button-mystuff"));
    }
    static showMenu(opts) {
      let allowHide = opts && 'allowHide' in opts ? opts.allowHide : false;
      let wasShowing = root__globals.Globals.menuShowing;
      main_controller.MainController.hideMenuPanels();
      if (dart.test(allowHide) && dart.test(wasShowing)) return;
      html.querySelector("#menu1").style[$display] = "inline-block";
      root__globals.Globals.menuShowing = true;
      main_controller.MainController._showPopupConnector(html.querySelector("#button-menu"));
    }
    static _showPopupConnector(over) {
      let btnrect = over.getBoundingClientRect();
      let _ = html.querySelector("#popupconnector").style;
      _[$display] = "block";
      _[$width] = lib__html_lib.HtmlLib.asPx(dart.notNull(btnrect[$width]) - 2);
      _[$left] = lib__html_lib.HtmlLib.asPx(btnrect[$left]);
    }
    static showNextInPushQueue() {
      push_queue_handler.PushQueueHandler.showNext();
    }
    static collapseAll() {
      for (let p of root__globals.Globals.panes)
        p.collapse();
    }
    static userSetLocation(forced) {
      return async.async(dart.dynamic, function* userSetLocation() {
        if (!dart.test(forced) && client_store.ClientStore.lon !== 0) return;
        let dlg = new dialog__location_dialog.LocationDialog.new(client_store.ClientStore.lat, client_store.ClientStore.lon);
        let latlon = ListOfdouble()._check(yield dlg.show());
        if (latlon != null) {
          client_store.ClientStore.lat = latlon[$_get](0);
          client_store.ClientStore.lon = latlon[$_get](1);
        }
      });
    }
  };
  (main_controller.MainController.new = function() {
  }).prototype = main_controller.MainController.prototype;
  dart.addTypeTests(main_controller.MainController);
  dart.defineLazy(main_controller.MainController, {
    /*main_controller.MainController.fontThemes*/get fontThemes() {
      return JSArrayOfString().of(["", "theme-small", "theme-large", "theme-fancy"]);
    },
    set fontThemes(_) {},
    /*main_controller.MainController.fontThemeNames*/get fontThemeNames() {
      return JSArrayOfString().of(["Default", "Small", "Large", "Fancy"]);
    },
    set fontThemeNames(_) {},
    /*main_controller.MainController.colorThemes*/get colorThemes() {
      return JSArrayOfString().of(["", "theme-dark", "theme-muted", "theme-princess", "theme-forest"]);
    },
    set colorThemes(_) {},
    /*main_controller.MainController.colorThemeNames*/get colorThemeNames() {
      return JSArrayOfString().of(["Default", "Dark", "Muted", "Princess", "Forest"]);
    },
    set colorThemeNames(_) {}
  });
  const _resultDiv$ = Symbol('_resultDiv');
  const _myLocKnown = Symbol('_myLocKnown');
  const init$3 = Symbol("init");
  pane__event_search_pane.EventSearchPane = class EventSearchPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$3](pk);
        this[_myLocKnown] = client_store.ClientStore.lon !== 0;
        this.buildSkeletonHtml2({paneClass: "events", title: "Event Search", iconName: "paneevent"});
        this.clearLoadingMessage();
        let _ = lib__html_lib.HtmlLib.appendScrollingDiv(this.bodyElement);
        _.style[$marginBottom] = lib__html_lib.HtmlLib.asPx(6);
        _.style[$display] = "hidden";
        this[_resultDiv$] = _;
        let form = new lib__form_builder.FormBuilder.new(this.bodyElement, "Criteria");
        let titleInp = form.addInput("Title", 100, 50);
        let locDiv = html.DivElement.new();
        let locCheck = html.CheckboxInputElement.new();
        locCheck[$checked] = this[_myLocKnown];
        locDiv[$append](locCheck);
        locDiv[$appendText](" Within ");
        let milesInp = html.NumberInputElement.new();
        milesInp[$style][$width] = "60px";
        milesInp[$valueAsNumber] = 20;
        milesInp[$min] = "1";
        milesInp[$max] = "9999";
        locDiv[$append](milesInp);
        locDiv[$appendText](" miles of ");
        let setLocationButton = html.ButtonElement.new();
        setLocationButton[$text] = "My Location";
        setLocationButton.className = "linkbutton";
        locDiv[$append](setLocationButton);
        form.addAny("Location", locDiv);
        let dateInput = html.SelectElement.new();
        dateInput[$append]((() => {
          let _ = html.OptionElement.new();
          _.value = "7";
          _[$text] = "Next week";
          return _;
        })());
        dateInput[$append]((() => {
          let _ = html.OptionElement.new();
          _.value = "30";
          _[$text] = "Next month";
          return _;
        })());
        dateInput[$append]((() => {
          let _ = html.OptionElement.new();
          _.value = "60";
          _[$text] = "Next 2 months";
          return _;
        })());
        dateInput[$append]((() => {
          let _ = html.OptionElement.new();
          _.value = "180";
          _[$text] = "Next 6 months";
          return _;
        })());
        dateInput[$append]((() => {
          let _ = html.OptionElement.new();
          _.value = "365";
          _[$text] = "Next year";
          return _;
        })());
        dateInput.value = "60";
        form.addAny("When", dateInput);
        const _doSearch = (function() {
          return async.async(dart.dynamic, (function* _doSearch() {
            if (!dart.test(this[_myLocKnown]) && dart.test(locCheck[$checked])) {
              form.showError("You have not yet set your location.");
              return;
            }
            let today = new core.DateTime.now();
            let dateTo = today.add(new core.Duration.new({days: core.int.parse(dateInput.value)}));
            let req = new src__models__wtypes.EventQueryRequest.new({title: this.trimInput(titleInp), dateFrom: wlib$.WLib.packDateEntry(today.year, today.month, today.day, 0, 0), dateTo: wlib$.WLib.packDateEntry(dateTo.year, dateTo.month, dateTo.day, 0, 0), miles: dart.asInt(dart.test(locCheck[$checked]) ? milesInp[$valueAsNumber] : 0), lat: dart.toString(client_store.ClientStore.lat), lon: dart.toString(client_store.ClientStore.lon)});
            this[_resultDiv$].style[$display] = "block";
            this[_resultDiv$][$innerHtml] = "Loading...";
            let response = (yield rpc_lib.RpcLib.eventQuery(req));
            this[_resultDiv$][$innerHtml] = "";
            for (let event of response.events) {
              src__models__wtypes.EventItemResponse._check(event);
              let itemDiv = html.DivElement.new();
              itemDiv.className = "space1";
              this[_resultDiv$][$append](itemDiv);
              itemDiv[$appendText](event.startTime);
              itemDiv[$appendText](" - ");
              lib__html_lib.HtmlLib.appendLinkToPane(itemDiv, event.title, "event/" + dart.str(event.iid), {asDiv: false});
            }
            if (response.events[$length] === 0) this[_resultDiv$][$innerHtml] = "(none)";
          }).bind(this));
        }).bind(this);
        dart.fn(_doSearch, VoidToFuture());
        if (dart.test(this[_myLocKnown])) _doSearch();
        setLocationButton[$onClick].listen(dart.fn(e => async.async(core.Null, (function*() {
          yield main_controller.MainController.userSetLocation(true);
          this[_myLocKnown] = client_store.ClientStore.lon !== 0;
          if (dart.test(this[_myLocKnown])) locCheck[$checked] = true;
        }).bind(this)), MouseEventToFutureOfNull()));
        this.paneMenuBar.addButton("Search", dart.fn(e => _doSearch(), dynamicToFuture()));
      }).bind(this));
    }
    [init$3](pk) {
      return super.init(pk);
    }
  };
  (pane__event_search_pane.EventSearchPane.new = function() {
    this[_resultDiv$] = null;
    this[_myLocKnown] = false;
    pane__event_search_pane.EventSearchPane.__proto__.new.call(this);
  }).prototype = pane__event_search_pane.EventSearchPane.prototype;
  dart.addTypeTests(pane__event_search_pane.EventSearchPane);
  dart.setFieldSignature(pane__event_search_pane.EventSearchPane, () => ({
    __proto__: dart.getFields(pane__event_search_pane.EventSearchPane.__proto__),
    [_resultDiv$]: dart.fieldType(html.DivElement),
    [_myLocKnown]: dart.fieldType(core.bool)
  }));
  const _proposalId = Symbol('_proposalId');
  const _clickedInCode$0 = Symbol('_clickedInCode');
  const _handleVote$0 = Symbol('_handleVote');
  const init$4 = Symbol("init");
  pane__proposal_pane.ProposalPane = class ProposalPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$4](pk);
        let loggedIn = root__globals.Globals.userId !== 0;
        this[_proposalId] = pk.part1AsInt;
        let proposal = (yield rpc_lib.RpcLib.proposalGet(new src__models__wtypes.ProposalGetRequest.new({proposalId: this[_proposalId]})));
        this.buildSkeletonHtml2({paneClass: "proposal", iconHoverText: "Proposal", iconName: "paneproposal", title: proposal.title});
        this.clearLoadingMessage();
        let card = new lib__card_builder.CardBuilder.new(this.bodyElement);
        card.addText("Title", proposal.title);
        card.addText("Status", proposal.statusDescription);
        card.addText("Summary", proposal.summary);
        let summaryHtml = proposal.summaryHtml != null ? proposal.summaryHtml : "";
        if (summaryHtml.length > 0) {
          let htmlParent = card.addAny("Changes");
          htmlParent[$setInnerHtml](summaryHtml, {treeSanitizer: html.NodeTreeSanitizer.trusted});
        }
        if (proposal.active !== "Y") {
          let resultsDiv = card.addAny("Poll results");
          let bullets = html.UListElement.new();
          resultsDiv[$append](bullets);
          for (let opt of proposal.options) {
            src__models__wtypes.ProposalOptionItem._check(opt);
            let isWinner = opt.optionNo == proposal.winningOption;
            let li = html.LIElement.new();
            li[$text] = dart.str(opt.optionDesc) + " (" + dart.str(opt.voteCount) + " votes)";
            if (isWinner) li.style[$fontWeight] = "bold";
            bullets[$append](li);
          }
        }
        let myVoteDiv = null;
        let allChecks = JSArrayOfCheckboxInputElement().of([]);
        let handleCheckbox = e => {
          if (dart.test(this[_clickedInCode$0])) return;
          this[_clickedInCode$0] = true;
          let clickedChk = html.CheckboxInputElement._check(e[$target]);
          let clickedOptionNo = clickedChk[$dataset][$_get]("opt");
          if (dart.test(clickedChk[$checked])) {
            for (let chk of allChecks)
              if (chk[$dataset][$_get]("opt") != clickedOptionNo) chk[$checked] = false;
          }
          this[_clickedInCode$0] = false;
          this[_handleVote$0](dart.test(clickedChk[$checked]) ? core.int.parse(clickedOptionNo) : null);
        };
        dart.fn(handleCheckbox, EventToNull());
        function add1Checkbox(value, text, optionNo) {
          let div = html.DivElement.new();
          let chk = html.CheckboxInputElement.new();
          chk[$checked] = value;
          chk[$dataset][$_set]("opt", dart.toString(optionNo));
          div[$append](chk);
          div[$appendText](" " + dart.notNull(text));
          myVoteDiv[$append](div);
          chk[$onChange].listen(handleCheckbox);
          return chk;
        }
        dart.fn(add1Checkbox, boolAndStringAndintToCheckboxInputElement());
        if (proposal.myEligible === "Y" && proposal.active === "Y") {
          myVoteDiv = card.addAny("My vote");
          for (let opt of proposal.options) {
            src__models__wtypes.ProposalOptionItem._check(opt);
            let chk = add1Checkbox(proposal.myVote == opt.optionNo, opt.optionDesc, opt.optionNo);
            allChecks[$add](chk);
          }
        }
        if (proposal.kind === "ROOT" && proposal.active === "Y") {
          this.paneMenuBar.addButton("Show Current Full Text", dart.fn(e => async.async(core.Null, function*() {
            let req = new src__models__wtypes.DocGetRequest.new({docId: proposal.docId});
            let doc = (yield rpc_lib.RpcLib.docGet(req));
            let dlg = new dialog__view_markdown_dialog.ViewMarkdownDialog.new(doc.body);
            yield dlg.show();
          }), dynamicToFutureOfNull()));
          this.paneMenuBar.addButton("Show Proposed Full Text", dart.fn(e => async.async(core.Null, function*() {
            let dlg = new dialog__view_markdown_dialog.ViewMarkdownDialog.new(proposal.dtext);
            yield dlg.show();
          }), dynamicToFutureOfNull()));
        }
        let isRetractableKind = proposal.kind === "PROJ" || proposal.kind === "SYS" || proposal.kind === "ROOT";
        if (loggedIn && proposal.active === "Y" && isRetractableKind && proposal.createdBy == root__globals.Globals.userId) {
          this.paneMenuBar.addButton("Retract Proposal", dart.fn(e => async.async(core.Null, (function*() {
            let dlg = new dialog__confirm_dialog.ConfirmDialog.new("Really delete proposal?", dialog__confirm_dialog.ConfirmDialog.YesNoOptions);
            let btnIdx = core.int._check(yield dlg.show());
            if (btnIdx === 0) {
              let req = new src__models__wtypes.ProposalGetRequest.new({proposalId: this[_proposalId]});
              let response = (yield rpc_lib.RpcLib.proposalDelete(req));
              if (dart.test(response.isOK)) pane_factory.PaneFactory.delete(this);
            }
          }).bind(this)), dynamicToFutureOfNull()));
        }
      }).bind(this));
    }
    [_handleVote$0](optionNo) {
      return async.async(dart.dynamic, (function* _handleVote() {
        if (!dart.test(messages.Messages.checkLoggedIn())) return;
        let req = new src__models__wtypes.ProposalUserSaveRequest.new({proposalId: this[_proposalId], vote: optionNo});
        let resp = (yield rpc_lib.RpcLib.proposalUserSave(req));
        if (resp.ok === "Y") messages.Messages.timed("We recorded your vote.");
      }).bind(this));
    }
    [init$4](pk) {
      return super.init(pk);
    }
  };
  (pane__proposal_pane.ProposalPane.new = function() {
    this[_proposalId] = null;
    this[_clickedInCode$0] = false;
    pane__proposal_pane.ProposalPane.__proto__.new.call(this);
  }).prototype = pane__proposal_pane.ProposalPane.prototype;
  dart.addTypeTests(pane__proposal_pane.ProposalPane);
  dart.setMethodSignature(pane__proposal_pane.ProposalPane, () => ({
    __proto__: dart.getMethods(pane__proposal_pane.ProposalPane.__proto__),
    [_handleVote$0]: dart.fnType(async.Future, [core.int])
  }));
  dart.setFieldSignature(pane__proposal_pane.ProposalPane, () => ({
    __proto__: dart.getFields(pane__proposal_pane.ProposalPane.__proto__),
    [_proposalId]: dart.fieldType(core.int),
    [_clickedInCode$0]: dart.fieldType(core.bool)
  }));
  const _year$ = Symbol('_year');
  const init$5 = Symbol("init");
  pane__proposal_list_pane.ProposalListPane = class ProposalListPane extends pane__base_pane.BasePane {
    get paneClass() {
      return this[paneClass];
    }
    set paneClass(value) {
      this[paneClass] = value;
    }
    get paneTitle() {
      return this[paneTitle];
    }
    set paneTitle(value) {
      this[paneTitle] = value;
    }
    get proposals() {
      return this[proposals];
    }
    set proposals(value) {
      this[proposals] = value;
    }
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$5](pk);
        yield this.load();
        this.buildSkeletonHtml2({paneClass: this.paneClass, iconName: "paneproposal", title: this.paneTitle});
        this.clearLoadingMessage();
        for (let item of this.proposals.items) {
          src__models__wtypes.ProposalQueryItem._check(item);
          lib__html_lib.HtmlLib.appendLinkToPane(this.bodyElement, item.title, "proposal/" + dart.str(item.iid));
        }
        if (this.proposals.items[$length] === 0) this.bodyElement[$appendText]("(none found)");
        this.makeButtonBar();
      }).bind(this));
    }
    load() {
      return async.async(dart.dynamic, function* load() {
      });
    }
    makeButtonBar() {
      return async.async(dart.dynamic, function* makeButtonBar() {
      });
    }
    [init$5](pk) {
      return super.init(pk);
    }
  };
  (pane__proposal_list_pane.ProposalListPane.new = function() {
    this[paneClass] = null;
    this[paneTitle] = null;
    this[proposals] = null;
    pane__proposal_list_pane.ProposalListPane.__proto__.new.call(this);
  }).prototype = pane__proposal_list_pane.ProposalListPane.prototype;
  dart.addTypeTests(pane__proposal_list_pane.ProposalListPane);
  const paneClass = Symbol("ProposalListPane.paneClass");
  const paneTitle = Symbol("ProposalListPane.paneTitle");
  const proposals = Symbol("ProposalListPane.proposals");
  dart.setMethodSignature(pane__proposal_list_pane.ProposalListPane, () => ({
    __proto__: dart.getMethods(pane__proposal_list_pane.ProposalListPane.__proto__),
    load: dart.fnType(async.Future, []),
    makeButtonBar: dart.fnType(async.Future, [])
  }));
  dart.setFieldSignature(pane__proposal_list_pane.ProposalListPane, () => ({
    __proto__: dart.getFields(pane__proposal_list_pane.ProposalListPane.__proto__),
    paneClass: dart.fieldType(core.String),
    paneTitle: dart.fieldType(core.String),
    proposals: dart.fieldType(src__models__wtypes.ProposalQueryResponse)
  }));
  pane__sys_proposal_list_pane.SysProposalListPane = class SysProposalListPane extends pane__proposal_list_pane.ProposalListPane {
    load() {
      return async.async(dart.dynamic, (function* load() {
        this[_year$] = this.paneKey.part1AsInt;
        this.paneClass = "proposals-sys";
        this.paneTitle = "Archive of System Proposals " + dart.str(this[_year$]);
        let req = new src__models__wtypes.ProposalQueryRequest.new({mode: "S", year: this[_year$]});
        this.proposals = (yield rpc_lib.RpcLib.proposalQuery(req));
      }).bind(this));
    }
    makeButtonBar() {
      return async.async(dart.dynamic, (function* makeButtonBar() {
        this.paneMenuBar.addButton("Previous Year", dart.fn(e => {
          pane_factory.PaneFactory.createFromString("proposals-sys/" + dart.str(dart.notNull(this[_year$]) - 1));
        }, dynamicToNull()));
        this.paneMenuBar.addButton("Propose a Change", dart.fn(e => async.async(core.Null, function*() {
          let conf = new dialog__confirm_dialog.ConfirmDialog.new("Use this feature with care! You are about to propose a change in the way the system operates, which " + "can be voted on by all users. Please be specific and provide the resources necessary if you are proposing substantial changes. " + "Continue?", dialog__confirm_dialog.ConfirmDialog.YesNoOptions);
          let btnIdx = core.int._check(yield conf.show());
          if (btnIdx !== 0) return;
          let propDialog = new dialog__proposal_dialog.ProposalDialog.new("SYS", null, null);
          yield propDialog.show();
        }), dynamicToFutureOfNull()));
      }).bind(this));
    }
  };
  (pane__sys_proposal_list_pane.SysProposalListPane.new = function() {
    this[_year$] = null;
    pane__sys_proposal_list_pane.SysProposalListPane.__proto__.new.call(this);
  }).prototype = pane__sys_proposal_list_pane.SysProposalListPane.prototype;
  dart.addTypeTests(pane__sys_proposal_list_pane.SysProposalListPane);
  dart.setFieldSignature(pane__sys_proposal_list_pane.SysProposalListPane, () => ({
    __proto__: dart.getFields(pane__sys_proposal_list_pane.SysProposalListPane.__proto__),
    [_year$]: dart.fieldType(core.int)
  }));
  pane__active_proposal_list_pane.ActiveProposalListPane = class ActiveProposalListPane extends pane__proposal_list_pane.ProposalListPane {
    load() {
      return async.async(dart.dynamic, (function* load() {
        this.paneClass = "proposals-active";
        this.paneTitle = "Active Proposals";
        let req = new src__models__wtypes.ProposalQueryRequest.new({mode: "A"});
        this.proposals = (yield rpc_lib.RpcLib.proposalQuery(req));
      }).bind(this));
    }
  };
  (pane__active_proposal_list_pane.ActiveProposalListPane.new = function() {
    pane__active_proposal_list_pane.ActiveProposalListPane.__proto__.new.call(this);
  }).prototype = pane__active_proposal_list_pane.ActiveProposalListPane.prototype;
  dart.addTypeTests(pane__active_proposal_list_pane.ActiveProposalListPane);
  dialog__resource_dialog.ResourceDialog = class ResourceDialog extends lib__dialog_box.DialogBox {
    get resourceId() {
      return this[resourceId$];
    }
    set resourceId(value) {
      this[resourceId$] = value;
    }
    get newCategoryId() {
      return this[newCategoryId$];
    }
    set newCategoryId(value) {
      this[newCategoryId$] = value;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        let isNew = this.resourceId === 0;
        let resourceGetArgs = new src__models__wtypes.ResourceGetRequest.new({iid: this.resourceId});
        let resource = null;
        if (!isNew)
          resource = (yield rpc_lib.RpcLib.resourceGet(resourceGetArgs));
        else
          resource = new src__models__wtypes.ResourceGetResponse.new();
        let form = new lib__form_builder.FormBuilder.new(this.frame, "Resource");
        let titleInput = form.addInput("Title", this.typicalControlWidth(), root__globals.Globals.maxTitleLength, resource.title);
        let descInput = form.addTextArea("Description", this.typicalControlWidth(), 90, root__globals.Globals.maxDescriptionLength, resource.description);
        let kindInput = html.SelectElement.new();
        for (let kindOption of root__globals.Globals.allResourceKinds)
          kindInput[$append]((() => {
            let _ = html.OptionElement.new();
            _.value = kindOption;
            _[$text] = kindOption;
            return _;
          })());
        kindInput.value = resource.kind;
        form.addAny("Resource kind", kindInput);
        let urlInput = form.addInput("Web URL", this.typicalControlWidth(), 1000, resource.url);
        const isValid = (function() {
          let title = this.trimInput(titleInput);
          if (title.length === 0) {
            form.showError("Title required");
            return false;
          }
          return true;
        }).bind(this);
        dart.fn(isValid, VoidTobool());
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("Save", dart.fn(e => async.async(core.Null, (function*() {
          let url = this.trimInput(urlInput);
          if (!url[$contains]("://")) {
            urlInput.value = "http://" + dart.notNull(url);
            messages.Messages.timed("Your web URL was corrected; please double check it and try again.");
            return;
          }
          if (!dart.test(isValid())) return;
          let saveArgs = new src__models__wtypes.ResourceSaveRequest.new({iid: this.resourceId, categoryId: this.newCategoryId, title: this.trimInput(titleInput), description: this.trimTextArea(descInput), kind: kindInput.value, url: this.trimInput(urlInput)});
          let response = (yield rpc_lib.RpcLib.resourceSave(saveArgs));
          if (dart.test(response.isOK)) {
            this.hide(true);
            if (isNew)
              messages.Messages.criticalMessage("The new resource will be reviewed by admins, then posted later.");
            else
              messages.Messages.timed("Resource saved.");
          }
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__resource_dialog.ResourceDialog.new = function(resourceId, newCategoryId) {
    this[resourceId$] = resourceId;
    this[newCategoryId$] = newCategoryId;
    dialog__resource_dialog.ResourceDialog.__proto__.new.call(this);
  }).prototype = dialog__resource_dialog.ResourceDialog.prototype;
  dart.addTypeTests(dialog__resource_dialog.ResourceDialog);
  const resourceId$ = Symbol("ResourceDialog.resourceId");
  const newCategoryId$ = Symbol("ResourceDialog.newCategoryId");
  dart.setFieldSignature(dialog__resource_dialog.ResourceDialog, () => ({
    __proto__: dart.getFields(dialog__resource_dialog.ResourceDialog.__proto__),
    resourceId: dart.fieldType(core.int),
    newCategoryId: dart.fieldType(core.int)
  }));
  const _resourceCount = Symbol('_resourceCount');
  const _resources = Symbol('_resources');
  const _topCats = Symbol('_topCats');
  const _allCats = Symbol('_allCats');
  const _detailBox = Symbol('_detailBox');
  const _selectedCatId = Symbol('_selectedCatId');
  const _selectedCat = Symbol('_selectedCat');
  const _nodeSelectHandler = Symbol('_nodeSelectHandler');
  const init$6 = Symbol("init");
  pane__base_tree_pane.BaseTreePane = class BaseTreePane extends pane__base_pane.BasePane {
    get paneClass() {
      return this[paneClass$];
    }
    set paneClass(value) {
      this[paneClass$] = value;
    }
    get paneTitle() {
      return this[paneTitle$];
    }
    set paneTitle(value) {
      this[paneTitle$] = value;
    }
    get categoryKind() {
      return this[categoryKind];
    }
    set categoryKind(value) {
      this[categoryKind] = value;
    }
    get paneIconName() {
      return this[paneIconName];
    }
    set paneIconName(value) {
      this[paneIconName] = value;
    }
    get selectedCatId() {
      return this[_selectedCatId];
    }
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$6](pk);
        this.buildSkeletonHtml2({paneClass: this.paneClass, iconName: this.paneIconName, title: this.paneTitle});
        let cats = (yield rpc_lib.RpcLib.categoryQuery(new src__models__wtypes.CategoryQueryRequest.new({kind: this.categoryKind})));
        this[_allCats] = ListOfCategoryItemResponse()._check(cats.categories[$cast](src__models__wtypes.CategoryItemResponse));
        const convertImmediateChildren = (function(parentId) {
          return IterableOfCategoryNode()._check(this[_allCats][$where](dart.fn(c => c.parentId == parentId, CategoryItemResponseTobool()))[$map](lib__category_node.CategoryNode, dart.fn(c => {
            let _ = new lib__category_node.CategoryNode.new();
            _.title = c.title;
            _.description = c.description;
            _.id = c.iid;
            return _;
          }, CategoryItemResponseToCategoryNode())))[$toList]();
        }).bind(this);
        dart.fn(convertImmediateChildren, intToListOfCategoryNode());
        function buildRecur(node) {
          let children = convertImmediateChildren(node.id);
          node.children = children;
          for (let node of children)
            buildRecur(node);
        }
        dart.fn(buildRecur, CategoryNodeTovoid());
        this[_topCats] = convertImmediateChildren(null);
        for (let node of this[_topCats])
          buildRecur(node);
        this.clearLoadingMessage();
        let outline = new lib__outline_builder.OutlineBuilder.new(this.bodyElement, dart.bind(this, _nodeSelectHandler));
        function addToOutlineRecur(parentElement, node, level) {
          let el = outline.add(parentElement, node.title, dart.toString(node.id), {childrenCollapsed: dart.notNull(level) > 1});
          if (node.children != null) {
            for (let cnode of node.children)
              addToOutlineRecur(el, cnode, dart.notNull(level) + 1);
          }
        }
        dart.fn(addToOutlineRecur, ElementAndCategoryNodeAndintTovoid());
        for (let node of this[_topCats])
          addToOutlineRecur(null, node, 0);
      }).bind(this));
    }
    [_nodeSelectHandler](node0) {
      return async.async(dart.dynamic, (function* _nodeSelectHandler() {
        let node = html.Element.as(node0);
        if (this[_detailBox] != null) this[_detailBox][$remove]();
        let detailBoxParent = lib__outline_builder.OutlineBuilder.getChildBox(node);
        let _ = html.DivElement.new();
        _.className = "subform-group";
        this[_detailBox] = _;
        detailBoxParent.insertBefore(this[_detailBox], detailBoxParent.firstChild);
        let idS = lib__outline_builder.OutlineBuilder.getId(node);
        this[_selectedCatId] = core.int.parse(idS);
        this[_selectedCat] = this[_allCats][$firstWhere](dart.fn(c => c.iid == this[_selectedCatId], CategoryItemResponseTobool()), {orElse: dart.fn(() => null, VoidToNull())});
        if (this[_selectedCat] == null) return;
        lib__html_lib.HtmlLib.insertCollapsed1(this[_detailBox], this[_selectedCat].description != null ? this[_selectedCat].description : "");
        yield this.insertDetails(this[_detailBox], this[_selectedCatId]);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this[_detailBox]);
        this.insertDetailButtons(bar, this[_selectedCatId]);
        if (dart.test(root__globals.Globals.isSiteAdmin)) {
          bar.addButton("Delete Category", dart.bind(this, 'deleteCategoryHandler'));
          bar.addButton("Create Category", dart.bind(this, 'createCategoryHandler'));
          bar.addButton("Edit Category", dart.bind(this, 'editCategoryHandler'));
          bar.addButton("Move Category", dart.bind(this, 'moveCategoryHandler'));
          bar.addButton("Recategorize Contents", dart.bind(this, 'moveContentsHandler'));
        }
      }).bind(this));
    }
    insertDetails(detailBox, catId) {
      return async.async(dart.dynamic, function* insertDetails() {
      });
    }
    insertDetailButtons(bar, catId) {}
    deleteCategoryHandler(e0) {
      return async.async(dart.dynamic, (function* deleteCategoryHandler() {
        let dialog = new dialog__confirm_dialog.ConfirmDialog.new("Delete category? Items at this level will be moved up a level", dialog__confirm_dialog.ConfirmDialog.YesNoOptions);
        let btnNo = core.int._check(yield dialog.show());
        if (btnNo !== 0) return;
        let req = new src__models__wtypes.CategoryDeleteRequest.new({catId: this[_selectedCatId], kind: this.categoryKind});
        let response = (yield rpc_lib.RpcLib.categoryDelete(req));
        if (dart.test(response.isOK)) this.recreatePane();
      }).bind(this));
    }
    createCategoryHandler(e0) {
      return async.async(dart.dynamic, (function* createCategoryHandler() {
        let dlg = new dialog__category_dialog.CategoryDialog.new(this.categoryKind, null, null, null, this[_selectedCatId], this[_selectedCat].title);
        let saved = core.bool._check(yield dlg.show());
        if (dart.test(saved)) this.recreatePane();
      }).bind(this));
    }
    editCategoryHandler(e0) {
      return async.async(dart.dynamic, (function* editCategoryHandler() {
        let dlg = new dialog__category_dialog.CategoryDialog.new(this.categoryKind, this[_selectedCatId], this[_selectedCat].title, this[_selectedCat].description, null, null);
        let saved = core.bool._check(yield dlg.show());
        if (dart.test(saved)) this.recreatePane();
      }).bind(this));
    }
    moveCategoryHandler(e0) {
      return async.async(dart.dynamic, (function* moveCategoryHandler() {
        let dlg = new dialog__node_select_dialog.NodeSelectDialog.new(this[_topCats], "Choose the target category (where this category will move to)");
        let referenceCatId = core.int._check(yield dlg.show());
        if (referenceCatId == null) return;
        let referenceCat = this[_allCats][$singleWhere](dart.fn(i => i.iid == referenceCatId, CategoryItemResponseTobool()));
        let dlg2 = new dialog__category_move_mode_dialog.CategoryMoveModeDialog.new(this[_selectedCat].title, referenceCat.title);
        let moveMode = core.String._check(yield dlg2.show());
        if (moveMode == null) return;
        let req = new src__models__wtypes.CategorySaveRequest.new({catId: this[_selectedCatId], kind: this.categoryKind, referenceId: referenceCatId, referenceMode: moveMode, title: this[_selectedCat].title, description: this[_selectedCat].description});
        let response = (yield rpc_lib.RpcLib.categorySave(req));
        if (dart.test(response.isOK)) this.recreatePane();
      }).bind(this));
    }
    moveContentsHandler(e0) {
      return async.async(dart.dynamic, (function* moveContentsHandler() {
        let dlg1 = new dialog__select_multiple_dialog.SelectMultipleDialog.new(this.getContentTitles(), "Choose items to move to a new category");
        let titlesToMove = ListOfString()._check(yield dlg1.show());
        if (titlesToMove == null) return;
        let dlg2 = new dialog__node_select_dialog.NodeSelectDialog.new(this[_topCats], "Choose category for moved contents");
        let targetCatId = core.int._check(yield dlg2.show());
        if (targetCatId == null) return;
        let targetCat = this[_allCats][$singleWhere](dart.fn(c => c.iid == targetCatId, CategoryItemResponseTobool()));
        let confMsg = dart.str(titlesToMove[$length]) + " items will be moved to the category \"" + dart.str(targetCat.title) + "\". Continue?";
        let dlg3 = new dialog__confirm_dialog.ConfirmDialog.new(confMsg, dialog__confirm_dialog.ConfirmDialog.YesNoOptions);
        let btnIdx = core.int._check(yield dlg3.show());
        if (btnIdx !== 0) return;
        let idsToMove = this.getContentIds(titlesToMove);
        let req = new src__models__wtypes.CategoryMoveContentsRequest.new({catId: targetCatId, kind: this.categoryKind, relatedIds: idsToMove});
        let response = (yield rpc_lib.RpcLib.categoryMoveContents(req));
        if (dart.test(response.isOK)) this.recreatePane();
      }).bind(this));
    }
    getContentTitles() {
      return null;
    }
    getContentIds(contentTitles) {
      return null;
    }
    [init$6](pk) {
      return super.init(pk);
    }
  };
  (pane__base_tree_pane.BaseTreePane.new = function() {
    this[paneClass$] = null;
    this[paneTitle$] = null;
    this[categoryKind] = null;
    this[paneIconName] = null;
    this[_topCats] = null;
    this[_allCats] = null;
    this[_detailBox] = null;
    this[_selectedCatId] = null;
    this[_selectedCat] = null;
    pane__base_tree_pane.BaseTreePane.__proto__.new.call(this);
  }).prototype = pane__base_tree_pane.BaseTreePane.prototype;
  dart.addTypeTests(pane__base_tree_pane.BaseTreePane);
  const paneClass$ = Symbol("BaseTreePane.paneClass");
  const paneTitle$ = Symbol("BaseTreePane.paneTitle");
  const categoryKind = Symbol("BaseTreePane.categoryKind");
  const paneIconName = Symbol("BaseTreePane.paneIconName");
  dart.setMethodSignature(pane__base_tree_pane.BaseTreePane, () => ({
    __proto__: dart.getMethods(pane__base_tree_pane.BaseTreePane.__proto__),
    [_nodeSelectHandler]: dart.fnType(dart.void, [dart.dynamic]),
    insertDetails: dart.fnType(async.Future, [html.Element, core.int]),
    insertDetailButtons: dart.fnType(dart.void, [lib__button_bar_builder.ButtonBarBuilder, core.int]),
    deleteCategoryHandler: dart.fnType(async.Future, [dart.dynamic]),
    createCategoryHandler: dart.fnType(async.Future, [dart.dynamic]),
    editCategoryHandler: dart.fnType(async.Future, [dart.dynamic]),
    moveCategoryHandler: dart.fnType(async.Future, [dart.dynamic]),
    moveContentsHandler: dart.fnType(async.Future, [dart.dynamic]),
    getContentTitles: dart.fnType(core.List$(core.String), []),
    getContentIds: dart.fnType(core.List$(core.int), [core.List$(core.String)])
  }));
  dart.setGetterSignature(pane__base_tree_pane.BaseTreePane, () => ({
    __proto__: dart.getGetters(pane__base_tree_pane.BaseTreePane.__proto__),
    selectedCatId: core.int
  }));
  dart.setFieldSignature(pane__base_tree_pane.BaseTreePane, () => ({
    __proto__: dart.getFields(pane__base_tree_pane.BaseTreePane.__proto__),
    paneClass: dart.fieldType(core.String),
    paneTitle: dart.fieldType(core.String),
    categoryKind: dart.fieldType(core.String),
    paneIconName: dart.fieldType(core.String),
    [_topCats]: dart.fieldType(ListOfCategoryNode()),
    [_allCats]: dart.fieldType(ListOfCategoryItemResponse()),
    [_detailBox]: dart.fieldType(html.DivElement),
    [_selectedCatId]: dart.fieldType(core.int),
    [_selectedCat]: dart.fieldType(src__models__wtypes.CategoryItemResponse)
  }));
  const init$7 = Symbol("init");
  pane__resource_tree_pane.ResourceTreePane = class ResourceTreePane extends pane__base_tree_pane.BaseTreePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        this.paneClass = "resourcetree";
        this.paneTitle = "Resource Categories";
        this.paneIconName = "paneresource";
        this.categoryKind = "R";
        yield this[init$7](pk);
      }).bind(this));
    }
    insertDetails(detailBox, catId) {
      return async.async(dart.dynamic, (function* insertDetails() {
        this[_resources] = (yield rpc_lib.RpcLib.resourceQuery(new src__models__wtypes.ResourceQueryRequest.new({categoryId: catId})));
        detailBox[$append]((() => {
          let _ = html.HeadingElement.h3();
          _[$text] = "Resources in this category";
          return _;
        })());
        for (let re of this[_resources].items) {
          src__models__wtypes.ResourceItem._check(re);
          let pdiv = html.DivElement.new();
          if (re.url != null && re.url.length > 0) {
            let link = html.AnchorElement.new();
            link.target = "_blank";
            link.href = re.url;
            link[$append](html.ImageElement.new({src: "images/ext_link.png"}));
            pdiv[$append](link);
          }
          lib__html_lib.HtmlLib.appendLinkToPane(pdiv, re.title, "resource/" + dart.str(re.iid), {asDiv: false});
          detailBox[$append](pdiv);
        }
        if (this[_resources].items[$length] === 0) detailBox[$appendText]("(none)");
        this[_resourceCount] = this[_resources].items[$length];
      }).bind(this));
    }
    insertDetailButtons(bar, catId) {
      bar.addButton("Create Resource", dart.fn(e => {
        if (dart.notNull(this[_resourceCount]) >= 100) {
          messages.Messages.timed("There are too many resources in this category. Please choose a more detailed sub-category.");
          return;
        }
        let dlg = new dialog__resource_dialog.ResourceDialog.new(0, catId);
        dlg.show();
      }, dynamicToNull()));
    }
    getContentTitles() {
      return IterableOfString()._check(this[_resources].items[$map](core.String, dart.fn(i => i.title, _ResourceItemToString())))[$toList]();
    }
    getContentIds(contentTitles) {
      return IterableOfint()._check(contentTitles[$map](core.int, dart.fn(s => {
        let matches = this[_resources].items[$where](dart.fn(i => i.title == s, _ResourceItemTobool()))[$toList]();
        if (dart.notNull(matches[$length]) > 0) return matches[$_get](0).iid;
        return null;
      }, StringToint())))[$where](dart.fn(i => i != null, intTobool()))[$toList]();
    }
    [init$7](pk) {
      return super.init(pk);
    }
  };
  (pane__resource_tree_pane.ResourceTreePane.new = function() {
    this[_resourceCount] = 0;
    this[_resources] = null;
    pane__resource_tree_pane.ResourceTreePane.__proto__.new.call(this);
  }).prototype = pane__resource_tree_pane.ResourceTreePane.prototype;
  dart.addTypeTests(pane__resource_tree_pane.ResourceTreePane);
  dart.setFieldSignature(pane__resource_tree_pane.ResourceTreePane, () => ({
    __proto__: dart.getFields(pane__resource_tree_pane.ResourceTreePane.__proto__),
    [_resourceCount]: dart.fieldType(core.int),
    [_resources]: dart.fieldType(src__models__wtypes.ResourceQueryResponse)
  }));
  const _prompt = Symbol('_prompt');
  const _titleEditable = Symbol('_titleEditable');
  dialog__title_desc_dialog.TitleDescDialog = class TitleDescDialog extends lib__dialog_box.DialogBox {
    get title() {
      return this[title$];
    }
    set title(value) {
      this[title$] = value;
    }
    get description() {
      return this[description$];
    }
    set description(value) {
      this[description$] = value;
    }
    dialogHeight() {
      return 150;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        let form = new lib__form_builder.FormBuilder.new(this.frame, this[_prompt]);
        let titleInput = form.addInput("Title", this.typicalControlWidth(), root__globals.Globals.maxTitleLength, this.title);
        if (!dart.test(this[_titleEditable])) titleInput.readOnly = true;
        let descInput = form.addTextArea("Description", this.typicalControlWidth(), 80, 10000, this.description);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("OK", dart.fn(e => {
          this.title = titleInput.value;
          this.description = descInput.value;
          this.hide(true);
        }, dynamicToNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__title_desc_dialog.TitleDescDialog.new = function(prompt, titleEditable) {
    this[title$] = "";
    this[description$] = "";
    this[_prompt] = prompt;
    this[_titleEditable] = titleEditable;
    dialog__title_desc_dialog.TitleDescDialog.__proto__.new.call(this);
  }).prototype = dialog__title_desc_dialog.TitleDescDialog.prototype;
  dart.addTypeTests(dialog__title_desc_dialog.TitleDescDialog);
  const title$ = Symbol("TitleDescDialog.title");
  const description$ = Symbol("TitleDescDialog.description");
  dart.setFieldSignature(dialog__title_desc_dialog.TitleDescDialog, () => ({
    __proto__: dart.getFields(dialog__title_desc_dialog.TitleDescDialog.__proto__),
    [_prompt]: dart.fieldType(core.String),
    [_titleEditable]: dart.fieldType(core.bool),
    title: dart.fieldType(core.String),
    description: dart.fieldType(core.String)
  }));
  const _doc = Symbol('_doc');
  const _docContentElement = Symbol('_docContentElement');
  const _saveProjectDocChanges = Symbol('_saveProjectDocChanges');
  const _proposeRootDocChanges = Symbol('_proposeRootDocChanges');
  const init$8 = Symbol("init");
  pane__doc_pane.DocPane = class DocPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$8](pk);
        let docIdOrCode = pk.part1;
        let isSpecialCode = docIdOrCode[$startsWith]("s=");
        let req = new src__models__wtypes.DocGetRequest.new({specialCode: isSpecialCode ? docIdOrCode[$substring](2) : null, docId: isSpecialCode ? null : core.int.parse(docIdOrCode)});
        this[_doc] = (yield rpc_lib.RpcLib.docGet(req));
        this.buildSkeletonHtml2({paneClass: "doc", iconHoverText: "Document", iconName: "panedoc", title: this[_doc].title});
        this.clearLoadingMessage();
        this.bodyElement[$append]((() => {
          let _ = html.DivElement.new();
          _[$text] = "Created on " + dart.notNull(this[_doc].createdAtR);
          return _;
        })());
        let converter = dart.global.Markdown.getSanitizingConverter();
        let docHtml = core.String._check(converter.makeHtml(this[_doc].body));
        let _ = html.DivElement.new();
        _.className = "content";
        this[_docContentElement] = _;
        this.bodyElement[$append](this[_docContentElement]);
        this[_docContentElement][$setInnerHtml](docHtml, {validator: null, treeSanitizer: null});
        let editableMessage = this[_doc].reasonNotEditable != null ? this[_doc].reasonNotEditable : this[_doc].projectId != null ? "You can save changes to this document" : "You can make changes and submit the proposed changes for a vote";
        this.bodyElement[$append]((() => {
          let _ = html.DivElement.new();
          _[$text] = editableMessage;
          return _;
        })());
        if (this[_doc].allowSave === "Y") {
          this.paneMenuBar.addButton("Edit Document", dart.fn(e => async.async(core.Null, (function*() {
            if (!dart.test(messages.Messages.checkLoggedIn())) return;
            if (this[_doc].projectId == null) yield messages.Messages.criticalMessage("You may make proposed edits to this document, then those changes will be voted on by all users. Once you submit the proposal, it cannot be modified.");
            let newbody = this[_doc].body;
            while (true) {
              let editDialog = new dialog__edit_markdown_dialog.EditMarkdownDialog.new(newbody);
              newbody = core.String._check(yield editDialog.show());
              if (newbody == null) return;
              if (this[_doc].projectId != null) {
                yield this[_saveProjectDocChanges](newbody);
                return;
              }
              let conf = new dialog__confirm_dialog.ConfirmDialog.new("Submit proposed changes for vote now?", JSArrayOfString().of(["Yes", "Make More Edits", "Abandon Edits"]));
              let btnIdx = core.int._check(yield conf.show());
              if (btnIdx === 2) return;
              if (btnIdx === 0) {
                yield this[_proposeRootDocChanges](newbody);
                return;
              }
            }
          }).bind(this)), dynamicToFutureOfNull()));
        }
        if (this[_doc].allowSave === "Y" && this[_doc].isProjectManager === "Y") {
          this.paneMenuBar.addButton("Retitle", dart.fn(e => async.async(core.Null, (function*() {
            let titleDialog = new lib__string_dialog.StringDialog.new("New Title", this[_doc].title, root__globals.Globals.maxTitleLength);
            let title = core.String._check(yield titleDialog.show());
            if (title != null) {
              let req = new src__models__wtypes.DocSaveRequest.new({docId: this[_doc].docId, projectId: this[_doc].projectId, retitleMode: "R", title: title});
              let resp = (yield rpc_lib.RpcLib.docSave(req));
              if (resp.ok === "Y") {
                messages.Messages.timed("Title changed.");
                this.retitle(title);
              }
            }
          }).bind(this)), dynamicToFutureOfNull()));
        }
      }).bind(this));
    }
    [_proposeRootDocChanges](newbody) {
      return async.async(dart.dynamic, (function* _proposeRootDocChanges() {
        let titleDialog = new dialog__title_desc_dialog.TitleDescDialog.new("Enter short summary of your changes for voting", false);
        titleDialog.title = "Changes proposed to: " + dart.str(this[_doc].title);
        let ok = core.bool._check(yield titleDialog.show());
        if (!dart.test(ok)) return;
        let summary = titleDialog.description;
        let req = new src__models__wtypes.DocSaveRequest.new({docId: this[_doc].docId, title: this[_doc].title, body: newbody, summary: summary});
        let resp = (yield rpc_lib.RpcLib.docSave(req));
        if (resp.ok === "Y") messages.Messages.criticalMessage("Document changes awaiting review. Once they are approved as non-spam, all users will have the opportunity to vote on the changes.");
      }).bind(this));
    }
    [_saveProjectDocChanges](newbody) {
      return async.async(dart.dynamic, (function* _saveProjectDocChanges() {
        let req = new src__models__wtypes.DocSaveRequest.new({docId: this[_doc].docId, projectId: this[_doc].projectId, title: this[_doc].title, body: newbody});
        let resp = (yield rpc_lib.RpcLib.docSave(req));
        if (resp.ok === "Y") messages.Messages.timed("Document saved.");
        let converter = dart.global.Markdown.getSanitizingConverter();
        let docHtml = core.String._check(converter.makeHtml(newbody));
        this[_docContentElement][$setInnerHtml](docHtml, {validator: null, treeSanitizer: null});
      }).bind(this));
    }
    [init$8](pk) {
      return super.init(pk);
    }
  };
  (pane__doc_pane.DocPane.new = function() {
    this[_doc] = null;
    this[_docContentElement] = null;
    pane__doc_pane.DocPane.__proto__.new.call(this);
  }).prototype = pane__doc_pane.DocPane.prototype;
  dart.addTypeTests(pane__doc_pane.DocPane);
  dart.setMethodSignature(pane__doc_pane.DocPane, () => ({
    __proto__: dart.getMethods(pane__doc_pane.DocPane.__proto__),
    [_proposeRootDocChanges]: dart.fnType(async.Future, [core.String]),
    [_saveProjectDocChanges]: dart.fnType(async.Future, [core.String])
  }));
  dart.setFieldSignature(pane__doc_pane.DocPane, () => ({
    __proto__: dart.getFields(pane__doc_pane.DocPane.__proto__),
    [_doc]: dart.fieldType(src__models__wtypes.DocGetResponse),
    [_docContentElement]: dart.fieldType(html.DivElement)
  }));
  const init$9 = Symbol("init");
  pane__root_docs_pane.RootDocsPane = class RootDocsPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$9](pk);
        let docs = (yield rpc_lib.RpcLib.docQuery(new src__models__wtypes.DocQueryRequest.new({mode: "R"})));
        this.buildSkeletonHtml2({paneClass: "rootdocs", title: "Documents", iconName: "panedoc"});
        this.clearLoadingMessage();
        for (let item of docs.docs) {
          src__models__wtypes.DocQueryItem._check(item);
          lib__html_lib.HtmlLib.appendLinkToPane(this.bodyElement, item.title, "doc/" + dart.str(item.iid));
        }
      }).bind(this));
    }
    [init$9](pk) {
      return super.init(pk);
    }
  };
  (pane__root_docs_pane.RootDocsPane.new = function() {
    pane__root_docs_pane.RootDocsPane.__proto__.new.call(this);
  }).prototype = pane__root_docs_pane.RootDocsPane.prototype;
  dart.addTypeTests(pane__root_docs_pane.RootDocsPane);
  const _mode = Symbol('_mode');
  const _helpText = Symbol('_helpText');
  const _convId = Symbol('_convId');
  const _priorPostText = Symbol('_priorPostText');
  const _uploadPost = Symbol('_uploadPost');
  const _uploadAvatar = Symbol('_uploadAvatar');
  dialog__image_upload_dialog.ImageUploadDialog = class ImageUploadDialog extends lib__dialog_box.DialogBox {
    dialogHeight() {
      return this[_mode] === "P" ? 300 : 150;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        let form = new lib__form_builder.FormBuilder.new(this.frame, "Upload Image");
        let fileInput = html.FileUploadInputElement.new();
        fileInput[$accept] = "image/*";
        form.addAny("Image", fileInput);
        let ptext = null;
        if (this[_mode] === "P") ptext = form.addTextArea("Image description", this.typicalControlWidth(), 70, 10000, (() => {
          let l = this[_priorPostText];
          return l != null ? l : "";
        })());
        this.frame[$appendText](this[_helpText]);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        let uploadButton = null;
        uploadButton = bar.addButton("Upload", dart.fn(e => async.async(core.Null, (function*() {
          uploadButton.disabled = true;
          let rdr = html.FileReader.new();
          rdr[$onLoad].listen(dart.fn(e => async.async(core.Null, (function*() {
            let imageBytes = ListOfint()._check(rdr[$result]);
            let ok = null;
            if (this[_mode] === "P") ok = (yield this[_uploadPost](imageBytes, ptext.value));
            if (this[_mode] === "U") ok = (yield this[_uploadAvatar](imageBytes));
            if (dart.test(ok)) this.hide(true);
            uploadButton.disabled = false;
          }).bind(this)), ProgressEventToFutureOfNull()));
          if (fileInput[$files][$length] === 0) {
            form.showError("Select a file first.");
            return;
          }
          let file = fileInput[$files][$_get](0);
          if (dart.notNull(file.size) > 5000000) {
            form.showError("The file exceeds the maximum size of 5BM.");
            return;
          }
          rdr.readAsArrayBuffer(file.slice());
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
    [_uploadPost](imageBytes, ptext) {
      return async.async(core.bool, (function* _uploadPost() {
        let req = new src__models__wtypes.ConvPostImageSaveRequest.new({imageBytes: imageBytes, ptext: ptext, convId: this[_convId]});
        let response = (yield rpc_lib.RpcLib.convPostImageSave(req));
        return response.isOK;
      }).bind(this));
    }
    [_uploadAvatar](imageBytes) {
      return async.async(core.bool, function* _uploadAvatar() {
        let req = new src__models__wtypes.UserAvatarSaveRequest.new({imageBytes: imageBytes});
        let response = (yield rpc_lib.RpcLib.userAvatarSave(req));
        return response.isOK;
      });
    }
  };
  (dialog__image_upload_dialog.ImageUploadDialog.new = function(mode, helpText, convId, priorPostText) {
    if (convId === void 0) convId = null;
    if (priorPostText === void 0) priorPostText = null;
    this[_mode] = mode;
    this[_helpText] = helpText;
    this[_convId] = convId;
    this[_priorPostText] = priorPostText;
    dialog__image_upload_dialog.ImageUploadDialog.__proto__.new.call(this);
  }).prototype = dialog__image_upload_dialog.ImageUploadDialog.prototype;
  dart.addTypeTests(dialog__image_upload_dialog.ImageUploadDialog);
  dart.setMethodSignature(dialog__image_upload_dialog.ImageUploadDialog, () => ({
    __proto__: dart.getMethods(dialog__image_upload_dialog.ImageUploadDialog.__proto__),
    [_uploadPost]: dart.fnType(async.Future$(core.bool), [core.List$(core.int), core.String]),
    [_uploadAvatar]: dart.fnType(async.Future$(core.bool), [core.List$(core.int)])
  }));
  dart.setFieldSignature(dialog__image_upload_dialog.ImageUploadDialog, () => ({
    __proto__: dart.getFields(dialog__image_upload_dialog.ImageUploadDialog.__proto__),
    [_mode]: dart.fieldType(core.String),
    [_helpText]: dart.fieldType(core.String),
    [_convId]: dart.fieldType(core.int),
    [_priorPostText]: dart.fieldType(core.String)
  }));
  const _convId$ = Symbol('_convId');
  const _conv = Symbol('_conv');
  const _hilite = Symbol('_hilite');
  const _isJoined = Symbol('_isJoined');
  const _isManager = Symbol('_isManager');
  const _postDiv = Symbol('_postDiv');
  const _postExpandBox = Symbol('_postExpandBox');
  const _postExpandBoxForPost = Symbol('_postExpandBoxForPost');
  const _autoReadPositionKey = Symbol('_autoReadPositionKey');
  const _lastPost = Symbol('_lastPost');
  const _appendOnePost = Symbol('_appendOnePost');
  const _appendMissingPosts = Symbol('_appendMissingPosts');
  const _buildReplyControls = Symbol('_buildReplyControls');
  const _buildMainButtonBar = Symbol('_buildMainButtonBar');
  const _tellServerReadPosition = Symbol('_tellServerReadPosition');
  const _resetReadDotImages = Symbol('_resetReadDotImages');
  const _appendCollapsedPostText = Symbol('_appendCollapsedPostText');
  const _removePostExpandBox = Symbol('_removePostExpandBox');
  const _buildPostExpandBox = Symbol('_buildPostExpandBox');
  const _inappropriateClicked = Symbol('_inappropriateClicked');
  const _deletePostClicked = Symbol('_deletePostClicked');
  const _savePost = Symbol('_savePost');
  const init$10 = Symbol("init");
  pane__conv_pane.ConvPane = class ConvPane extends pane__base_pane.BasePane {
    get postElements() {
      return this[postElements];
    }
    set postElements(value) {
      this[postElements] = value;
    }
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        this[_convId$] = pk.part1AsInt;
        if (dart.notNull(pk.length) > 2) {
          let part2 = pk.part(2);
          if (part2[$startsWith]("h=")) this[_hilite] = part2[$substring](2);
        }
        yield this[init$10](pk);
        this[_conv] = (yield rpc_lib.RpcLib.convGet(new src__models__wtypes.ConvGetRequest.new({convId: this[_convId$], mode: "U"})));
        this[_isJoined] = this[_conv].isJoined === "Y";
        this[_isManager] = this[_conv].isManager === "Y";
        this.buildSkeletonHtml2({paneClass: "conv", iconHoverText: "Conversation", iconName: "paneconv", title: this[_conv].title, subtitle: "in project: " + dart.str(this[_conv].parentTitle), subtitlePaneKey: this[_conv].parentPaneKey});
        this.clearLoadingMessage();
        let card = new lib__card_builder.CardBuilder.new(this.bodyElement);
        card.addText("Title", this[_conv].title);
        if (!dart.test(this[_isJoined])) card.addText("Joined", "You have not yet joined this conversation");
        if (this[_conv].deleteMessage != null) card.addText("Status", this[_conv].deleteMessage);
        this.bodyElement[$append](this[_postDiv]);
        let postNo = 0;
        for (let post of this[_conv].posts) {
          src__models__wtypes.ConvGetPostItem._check(post);
          this[_appendOnePost](post, true);
          if (!dart.test(this[_isJoined])) break;
          if (postNo === 0 && this[_conv].anySkipped === "Y") this[_appendMissingPosts]();
          ++postNo;
          this[_lastPost] = post;
        }
        if (this[_conv].replyAllowed === "Y") {
          this[_buildReplyControls]();
        } else {
          let replyAllowed = html.DivElement.new();
          replyAllowed[$text] = this[_conv].replyAllowedDesc;
          replyAllowed.className = "instruct";
          this.bodyElement[$append](replyAllowed);
        }
        this[_buildMainButtonBar]();
        if (dart.notNull(this[_conv].posts[$length]) > 0) {
          let lastpos = wlib$.WLib.wireToDateTime(this[_conv].posts[$last].createdAtWDT);
          let readpos = wlib$.WLib.wireToDateTime(this[_conv].readPositionWDT);
          if (dart.test(readpos.isBefore(lastpos))) {
            let action = () => {
              this[_tellServerReadPosition](lastpos);
            };
            dart.fn(action, VoidToNull());
            this[_autoReadPositionKey] = "c" + dart.str(this[_convId$]) + "_readpos";
            root__globals.Globals.doOnUserAction[$_set](this[_autoReadPositionKey], action);
          }
        }
      }).bind(this));
    }
    [_tellServerReadPosition](readpos) {
      this[_resetReadDotImages](readpos);
      rpc_lib.RpcLib.convSetReadPosition(new src__models__wtypes.ConvSetReadPositionRequest.new({convId: this[_convId$], positionWDT: wlib$.WLib.dateTimeToWire(readpos)}));
      root__globals.Globals.doOnUserAction[$remove](this[_autoReadPositionKey]);
      this[_autoReadPositionKey] = null;
    }
    [_appendOnePost](post, isFromServer, opts) {
      let afterElement = opts && 'afterElement' in opts ? opts.afterElement : null;
      let createdAt = wlib$.WLib.wireToDateTime(post.createdAtWDT), readPos = wlib$.WLib.wireToDateTime(this[_conv].readPositionWDT);
      let isUnread = dart.test(isFromServer) && dart.test(createdAt.isAfter(readPos));
      let postEl = html.DivElement.new();
      postEl.className = "post";
      if (afterElement == null)
        this[_postDiv][$append](postEl);
      else {
        let ewrap = afterElement.nextElementSibling;
        if (ewrap != null && dart.test(ewrap[$classes].contains("post-expand-wrap"))) afterElement = ewrap;
        afterElement[$insertAdjacentElement]("afterEnd", postEl);
      }
      this.postElements[$_set](post, postEl);
      let readDot = null;
      if (dart.test(isFromServer)) {
        readDot = html.DivElement.new();
        readDot.className = "read-dot";
        postEl[$append](readDot);
        let readDotImageName = isUnread ? "unread-dot.png" : "read-dot.png";
        readDot[$appendHtml]("<img src=\"images/" + readDotImageName + "\" title=\"Set read/unread\"/>");
        let avatar = html.DivElement.new();
        avatar.className = "avatar";
        postEl[$append](avatar);
        if (post.avatarUrl != null) avatar[$append](html.ImageElement.new({src: post.avatarUrl}));
        let nick = html.AnchorElement.new();
        nick.className = "nick";
        nick[$text] = post.authorNick;
        nick.href = "#user/" + dart.str(post.authorId);
        postEl[$append](nick);
        let ago = html.SpanElement.new();
        ago.className = "ago";
        ago[$text] = post.ago;
        postEl[$append](ago);
      }
      this[_appendCollapsedPostText](post, postEl);
      if (post.imageUrl != null && post.imageUrl.length > 0) {
        postEl[$append]((() => {
          let _ = html.ImageElement.new({src: post.imageUrl});
          _.className = "post-image";
          return _;
        })());
      }
      let expandWrap = null, expand = null;
      let expandImg = null;
      if (dart.test(isFromServer)) {
        expandWrap = html.DivElement.new();
        expandWrap.className = "post-expand-wrap";
        expand = html.DivElement.new();
        expand.className = "post-expand";
        expand.title = "Options for this post";
        expandImg = html.ImageElement.new();
        expandImg.src = "images/post-expand.png";
        expand[$append](expandImg);
        postEl[$insertAdjacentElement]("afterEnd", expandWrap);
        afterElement = expandWrap;
        expandWrap[$append](expand);
      }
      if (expand != null) {
        expand[$onClick].listen(dart.fn(e => {
          if (dart.equals(this[_postExpandBoxForPost], postEl)) {
            this[_removePostExpandBox]();
          } else {
            expandImg.src = "images/post-collapse.png";
            this[_buildPostExpandBox](post, postEl);
          }
        }, MouseEventToNull()));
      }
      if (readDot != null) {
        readDot[$onClick].listen(dart.fn(e => async.async(core.Null, (function*() {
          let readpos = wlib$.WLib.wireToDateTime(post.createdAtWDT);
          if (isUnread) {
          } else {
            readpos = readpos.subtract(new core.Duration.new({milliseconds: 1}));
          }
          this[_tellServerReadPosition](readpos);
        }).bind(this)), MouseEventToFutureOfNull()));
      }
      return postEl;
    }
    [_resetReadDotImages](readpos) {
      this.postElements[$forEach](dart.fn((post, div) => {
        let createdAt = wlib$.WLib.wireToDateTime(post.createdAtWDT);
        let isUnread = createdAt.isAfter(readpos);
        let readDotImageName = dart.test(isUnread) ? "unread-dot.png" : "read-dot.png";
        let dot = html.ImageElement._check(div.querySelector(".read-dot img"));
        if (dot != null) dot.src = "images/" + readDotImageName;
      }, ConvGetPostItemAndElementToNull()));
    }
    [_buildPostExpandBox](post, postEl) {
      return async.async(dart.dynamic, (function* _buildPostExpandBox() {
        this[_removePostExpandBox]();
        postEl[$classes].add("expanded");
        let _ = html.DivElement.new();
        _.className = "post-expand-box";
        this[_postExpandBox] = _;
        this[_postExpandBox][$append](html.HRElement.new());
        let createdAtDiv = html.DivElement.new();
        createdAtDiv[$text] = "Posted...";
        this[_postExpandBox][$append](createdAtDiv);
        let throttleDiv = html.DivElement.new();
        this[_postExpandBox][$append](throttleDiv);
        this[_postExpandBox][$append](html.HRElement.new());
        let inappropriateCheck = html.CheckboxInputElement.new();
        inappropriateCheck[$disabled] = true;
        this[_postExpandBox][$append]((() => {
          let _ = html.DivElement.new();
          _[$append](inappropriateCheck);
          _[$appendText](" Inappropriate");
          return _;
        })());
        let btns = new lib__button_bar_builder.ButtonBarBuilder.new(this[_postExpandBox]);
        postEl.nextElementSibling[$insertAdjacentElement]("afterEnd", this[_postExpandBox]);
        this[_postExpandBoxForPost] = html.DivElement._check(postEl);
        inappropriateCheck[$onChange].listen(dart.fn(e => async.async(core.Null, (function*() {
          this[_inappropriateClicked](post, inappropriateCheck[$checked]);
        }).bind(this)), EventToFutureOfNull()));
        btns.addButton("New Conversation From Here", dart.fn(e => async.async(core.Null, (function*() {
          let dlg = new dialog__conv_dialog.ConvDialog.spawn(this[_convId$], post.iid, post.ptext);
          let spawnedConvId = core.int._check(yield dlg.show());
          pane_factory.PaneFactory.createFromString("conv/" + dart.str(spawnedConvId));
        }).bind(this)), dynamicToFutureOfNull()));
        let moreInfo = (yield rpc_lib.RpcLib.convPostGet(new src__models__wtypes.ConvPostGetRequest.new({postId: post.iid})));
        createdAtDiv[$text] = "Posted on " + dart.notNull(moreInfo.createdAtReadable);
        if ((moreInfo.throttleDescription != null ? moreInfo.throttleDescription : "").length > 0) throttleDiv[$text] = dart.notNull(moreInfo.throttleDescription) + " ";
        if ((moreInfo.allReasons != null ? moreInfo.allReasons : "").length > 0) throttleDiv[$appendText]("This post was considered inappropriate, and the following reasons were given: " + dart.notNull(moreInfo.allReasons));
        if (moreInfo.reaction === "X") inappropriateCheck[$checked] = true;
        inappropriateCheck[$disabled] = false;
        let isOwnPost = post.authorId == root__globals.Globals.userId;
        let canCensor = moreInfo.canCensor === "Y";
        if (isOwnPost || canCensor) {
          btns.addButton("Delete Post", dart.fn(e => async.async(core.Null, (function*() {
            this[_deletePostClicked](post, postEl, moreInfo);
          }).bind(this)), dynamicToFutureOfNull()));
        }
      }).bind(this));
    }
    [_removePostExpandBox]() {
      if (this[_postExpandBox] != null) {
        this[_postExpandBox][$remove]();
        this[_postExpandBox] = null;
      }
      if (this[_postExpandBoxForPost] != null) {
        this[_postExpandBoxForPost][$classes].remove("expanded");
        let expandWrap = this[_postExpandBoxForPost].nextElementSibling;
        if (dart.test(expandWrap[$classes].contains("post-expand-wrap"))) {
          let img = html.ImageElement._check(expandWrap.querySelector("img"));
          img.src = "images/post-expand.png";
        }
        this[_postExpandBoxForPost] = null;
      }
    }
    [_deletePostClicked](post, postEl, postInfo) {
      return async.async(dart.dynamic, (function* _deletePostClicked() {
        let conf = new dialog__confirm_dialog.ConfirmDialog.new("Really delete post?", dialog__confirm_dialog.ConfirmDialog.YesNoOptions);
        let btnIdx = core.int._check(yield conf.show());
        if (btnIdx !== 0) return;
        let isOwnPost = post.authorId == root__globals.Globals.userId;
        let deleteReq = new src__models__wtypes.ConvPostSaveRequest.new({convId: this[_convId$], postId: post.iid, delete: isOwnPost ? "Y" : "N", censored: isOwnPost ? "" : "C", ptext: isOwnPost ? null : "Post deleted by: " + dart.notNull(root__globals.Globals.nick)});
        this[_removePostExpandBox]();
        let expandWrap = postEl.nextElementSibling;
        if (dart.test(expandWrap[$classes].contains("post-expand-wrap"))) expandWrap[$remove]();
        postEl[$remove]();
        yield rpc_lib.RpcLib.convPostSave(deleteReq);
      }).bind(this));
    }
    [_inappropriateClicked](post, isChecked) {
      return async.async(dart.dynamic, function* _inappropriateClicked() {
        let reason = "";
        if (dart.test(isChecked)) {
          let dlg = new lib__string_dialog.StringDialog.new("Enter reason for flagging this post", "", 50);
          reason = core.String._check(yield dlg.show());
        }
        yield rpc_lib.RpcLib.convPostUserSave(new src__models__wtypes.ConvPostUserSaveRequest.new({postId: post.iid, reason: reason, reaction: dart.test(isChecked) ? "X" : ""}));
      });
    }
    [_appendCollapsedPostText](post, parent) {
      let div = html.DivElement.new();
      parent[$append](div);
      let mode = post.collapseMode;
      let pos = post.collapsePosition;
      let expandLinkText = "More";
      let hideInitial = mode !== "Normal";
      if (mode === "AuthorBlocked")
        expandLinkText = "Show content from blocked author";
      else if (mode === "PostInappropriate")
        expandLinkText = "View inappropriate content";
      else if (mode === "UserSuspcicious")
        expandLinkText = "View possibly inappropriate content";
      else if (mode === "Trigger") expandLinkText = "Continue past trigger warning";
      lib__html_lib.HtmlLib.insertCollapsed1(div, post.ptext, {collapsePosition: pos, moreMessage: expandLinkText, hideInitial: hideInitial});
      if (this[_hilite] != null) {
      }
    }
    [_appendMissingPosts]() {
      let expander = html.ButtonElement.new();
      expander[$text] = "Show older posts";
      this[_postDiv][$append](expander);
      expander[$onClick].listen(dart.fn(e => async.async(core.Null, (function*() {
        if (dart.notNull(this[_conv].posts[$length]) < 2) return;
        let openingElement = expander.previousElementSibling;
        expander[$remove]();
        let req = new src__models__wtypes.ConvGetRequest.new({convId: this[_convId$], mode: "R", rangeFromWDT: this[_conv].posts[$_get](0).createdAtWDT, rangeToWDT: this[_conv].posts[$_get](1).createdAtWDT});
        let conv2 = (yield rpc_lib.RpcLib.convGet(req));
        let priorElement = null;
        for (let post of conv2.posts) {
          src__models__wtypes.ConvGetPostItem._check(post);
          priorElement = this[_appendOnePost](post, true, {afterElement: priorElement != null ? priorElement : openingElement});
        }
      }).bind(this)), MouseEventToFutureOfNull()));
    }
    [_buildReplyControls]() {
      let replyInp = html.TextAreaElement.new();
      replyInp.rows = 1;
      replyInp.placeholder = "Reply...";
      replyInp.maxLength = this[_conv].replyMaxLength;
      replyInp.style[$width] = "100%";
      if (this[_conv].posts[$length] === 0) replyInp.placeholder = "Start conversation";
      this.bodyElement[$append](replyInp);
      replyInp.focus();
      let postControlsBox = html.DivElement.new();
      postControlsBox.style[$display] = "none";
      let isExpanded = false;
      this.bodyElement[$append](postControlsBox);
      let replyAllowed = html.DivElement.new();
      replyAllowed[$text] = this[_conv].replyAllowedDesc;
      replyAllowed.className = "instruct";
      postControlsBox[$append](replyAllowed);
      let twInp = html.TextInputElement.new();
      twInp[$style][$width] = lib__html_lib.HtmlLib.asPx(125);
      twInp[$maxLength] = 100;
      twInp[$placeholder] = "Trigger warning";
      postControlsBox[$append](twInp);
      let imageButton = html.ButtonElement.new();
      imageButton[$text] = "Upload Image";
      imageButton.className = "button";
      postControlsBox[$append](imageButton);
      let postButton = html.ButtonElement.new();
      postButton[$text] = "Post (ctrl-Enter)";
      postButton.className = "button";
      postControlsBox[$append](postButton);
      const expandCollapsePostControlsBox = (function() {
        let hasText = this.trimInputArea(replyInp).length > 0;
        if (hasText === isExpanded) return;
        isExpanded = hasText;
        if (isExpanded) {
          postControlsBox.style[$display] = "block";
          replyInp.rows = 5;
        } else {
          postControlsBox.style[$display] = "none";
          replyInp.rows = 1;
        }
      }).bind(this);
      dart.fn(expandCollapsePostControlsBox, VoidTovoid());
      function setNonpostable() {
        replyInp.value = "";
        replyInp[$remove]();
        twInp[$text] = "";
        postControlsBox[$remove]();
        expandCollapsePostControlsBox();
      }
      dart.fn(setNonpostable, VoidToNull());
      imageButton[$onClick].listen(dart.fn(e => async.async(core.Null, (function*() {
        let dialog = new dialog__image_upload_dialog.ImageUploadDialog.new("P", "Image will be reduced if it is very large.", this[_convId$], replyInp.value);
        let ok = core.bool._check(yield dialog.show());
        if (dart.test(ok)) {
          setNonpostable();
          messages.Messages.timed("Posted. Refresh conversation to view post.");
        }
      }).bind(this)), MouseEventToFutureOfNull()));
      const doPost0 = (function() {
        return async.async(dart.dynamic, (function* doPost0() {
          yield this[_savePost](this.trimInputArea(replyInp), this.trimInput(html.InputElement._check(twInp)));
          setNonpostable();
        }).bind(this));
      }).bind(this);
      dart.fn(doPost0, VoidToFuture());
      postButton[$onClick].listen(dart.fn(e => doPost0(), MouseEventToFuture()));
      replyInp[$onKeyDown].listen(dart.fn(e => {
        if (dart.test(e.ctrlKey) && e.keyCode === html.KeyCode.ENTER) {
          doPost0();
          e.preventDefault();
        }
        async.Timer.new(new core.Duration.new({milliseconds: 20}), expandCollapsePostControlsBox);
      }, KeyboardEventToNull()));
    }
    [_savePost](text, tw) {
      return async.async(dart.dynamic, (function* _savePost() {
        this[_resetReadDotImages](wlib$.WLib.utcNow());
        let lastPostWDT = this[_lastPost] != null ? this[_lastPost].createdAtWDT : null;
        let response = (yield rpc_lib.RpcLib.convPostSave(new src__models__wtypes.ConvPostSaveRequest.new({convId: this[_convId$], triggerWarning: tw, ptext: text, lastKnownWDT: lastPostWDT})));
        if (dart.test(response.isOK)) {
          let item = new src__models__wtypes.ConvGetPostItem.new({ptext: text, collapseMode: "Normal", collapsePosition: 300, createdAtWDT: wlib$.WLib.dateTimeToWire(wlib$.WLib.utcNow())});
          this[_appendOnePost](item, false);
        }
      }).bind(this));
    }
    [_buildMainButtonBar]() {
      if (dart.test(this[_isJoined])) {
        let imp = html.CheckboxInputElement.new();
        let impWrap = html.SpanElement.new();
        impWrap.className = "check";
        impWrap[$append](imp);
        impWrap[$appendText]("Important");
        if (this[_conv].like === "I") imp[$checked] = true;
        this.paneMenuBar.addElement(impWrap);
        imp[$onChange].listen(dart.fn(e => async.async(core.Null, (function*() {
          let req = new src__models__wtypes.ConvUserSaveRequest.new({convId: this[_convId$], like: dart.test(imp[$checked]) ? "I" : "N"});
          yield rpc_lib.RpcLib.convUserSave(req);
        }).bind(this)), EventToFutureOfNull()));
      }
      if (dart.test(this[_isJoined])) {
        let bm = html.CheckboxInputElement.new();
        let bmWrap = html.SpanElement.new();
        bmWrap.className = "check";
        bmWrap[$append](bm);
        bmWrap[$appendText]("Bookmarked");
        if (this[_conv].bookmarked === "Y") bm[$checked] = true;
        this.paneMenuBar.addElement(bmWrap);
        bm[$onChange].listen(dart.fn(e => async.async(core.Null, (function*() {
          let it = new src__models__wtypes.PushQueueItem.new({kind: "B", why: "G", iid: this[_convId$], linkText: this[_conv].title, linkPaneKey: this.paneKey.full});
          if (dart.test(bm[$checked])) {
            push_queue_handler.PushQueueHandler.itemsReceived(false, JSArrayOfPushQueueItem().of([it]), "B");
          } else {
            push_queue_handler.PushQueueHandler.removeItem(it, "!");
          }
          let req = new src__models__wtypes.ConvUserSaveRequest.new({convId: this[_convId$], bookmarked: dart.test(bm[$checked]) ? "Y" : "N"});
          yield rpc_lib.RpcLib.convUserSave(req);
        }).bind(this)), EventToFutureOfNull()));
      }
      if (!dart.test(this[_isJoined])) {
        this.paneMenuBar.addButton("Join", dart.fn(e => async.async(core.Null, (function*() {
          if (!dart.test(messages.Messages.checkLoggedIn())) return;
          let response = (yield rpc_lib.RpcLib.convUserSave(new src__models__wtypes.ConvUserSaveRequest.new({convId: this[_convId$], status: "J"})));
          if (dart.test(response.base.isOK)) {
            this.recreatePane();
          }
          if (response.action === "J") messages.Messages.timed("Joined!");
          if (response.action === "R") messages.Messages.timed("A join request was sent to the project leadership for their approval.");
          if (response.action === "X") messages.Messages.timed("You are not allowed to join this private project.");
        }).bind(this)), dynamicToFutureOfNull()));
      }
      if (dart.test(this[_isJoined])) {
        this.paneMenuBar.addButton("Leave", dart.fn(e => async.async(core.Null, (function*() {
          this.collapse();
          yield rpc_lib.RpcLib.convUserSave(new src__models__wtypes.ConvUserSaveRequest.new({convId: this[_convId$], status: "Q"}));
        }).bind(this)), dynamicToFutureOfNull()));
      }
      if (dart.test(this[_isJoined]) && dart.test(this[_isManager])) {
        this.paneMenuBar.addButton("Edit Rules", dart.fn(e => async.async(core.Null, (function*() {
          let dlg = new dialog__conv_dialog.ConvDialog.new(this[_convId$], null, null);
          let editedId = core.int._check(yield dlg.show());
          if (editedId == null) return;
          this.recreatePane();
        }).bind(this)), dynamicToFutureOfNull()));
      }
    }
    [init$10](pk) {
      return super.init(pk);
    }
  };
  (pane__conv_pane.ConvPane.new = function() {
    this[_convId$] = null;
    this[_conv] = null;
    this[_hilite] = null;
    this[_isJoined] = false;
    this[_isManager] = false;
    this[_postDiv] = html.DivElement.new();
    this[_postExpandBox] = null;
    this[_postExpandBoxForPost] = null;
    this[_autoReadPositionKey] = null;
    this[postElements] = new (LinkedMapOfConvGetPostItem$Element()).new();
    this[_lastPost] = null;
    pane__conv_pane.ConvPane.__proto__.new.call(this);
  }).prototype = pane__conv_pane.ConvPane.prototype;
  dart.addTypeTests(pane__conv_pane.ConvPane);
  const postElements = Symbol("ConvPane.postElements");
  dart.setMethodSignature(pane__conv_pane.ConvPane, () => ({
    __proto__: dart.getMethods(pane__conv_pane.ConvPane.__proto__),
    [_tellServerReadPosition]: dart.fnType(dart.void, [core.DateTime]),
    [_appendOnePost]: dart.fnType(html.Element, [src__models__wtypes.ConvGetPostItem, core.bool], {afterElement: html.Element}),
    [_resetReadDotImages]: dart.fnType(dart.void, [core.DateTime]),
    [_buildPostExpandBox]: dart.fnType(async.Future, [src__models__wtypes.ConvGetPostItem, html.Element]),
    [_removePostExpandBox]: dart.fnType(dart.void, []),
    [_deletePostClicked]: dart.fnType(async.Future, [src__models__wtypes.ConvGetPostItem, html.Element, src__models__wtypes.ConvPostGetResponse]),
    [_inappropriateClicked]: dart.fnType(async.Future, [src__models__wtypes.ConvGetPostItem, core.bool]),
    [_appendCollapsedPostText]: dart.fnType(dart.void, [src__models__wtypes.ConvGetPostItem, html.Element]),
    [_appendMissingPosts]: dart.fnType(dart.void, []),
    [_buildReplyControls]: dart.fnType(dart.void, []),
    [_savePost]: dart.fnType(async.Future, [core.String, core.String]),
    [_buildMainButtonBar]: dart.fnType(dart.void, [])
  }));
  dart.setFieldSignature(pane__conv_pane.ConvPane, () => ({
    __proto__: dart.getFields(pane__conv_pane.ConvPane.__proto__),
    [_convId$]: dart.fieldType(core.int),
    [_conv]: dart.fieldType(src__models__wtypes.ConvGetResponse),
    [_hilite]: dart.fieldType(core.String),
    [_isJoined]: dart.fieldType(core.bool),
    [_isManager]: dart.fieldType(core.bool),
    [_postDiv]: dart.fieldType(html.DivElement),
    [_postExpandBox]: dart.fieldType(html.DivElement),
    [_postExpandBoxForPost]: dart.fieldType(html.DivElement),
    [_autoReadPositionKey]: dart.fieldType(core.String),
    postElements: dart.fieldType(MapOfConvGetPostItem$Element()),
    [_lastPost]: dart.fieldType(src__models__wtypes.ConvGetPostItem)
  }));
  const _resultDiv$0 = Symbol('_resultDiv');
  const _searchTerm = Symbol('_searchTerm');
  const _doSearch$0 = Symbol('_doSearch');
  const init$11 = Symbol("init");
  pane__conv_search_pane.ConvSearchPane = class ConvSearchPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$11](pk);
        this.buildSkeletonHtml2({paneClass: "convs", title: "Conversation Search", iconName: "paneconv"});
        this.clearLoadingMessage();
        let _ = lib__html_lib.HtmlLib.appendScrollingDiv(this.bodyElement);
        _.style[$display] = "none";
        this[_resultDiv$0] = _;
        let form = new lib__form_builder.FormBuilder.new(this.bodyElement, "Criteria");
        let termInp = form.addInput("Search term", 100, 50);
        this.paneMenuBar.addButton("Search", dart.fn(e => {
          this[_searchTerm] = this.trimInput(termInp);
          this[_doSearch$0]();
        }, dynamicToNull()));
        if (dart.notNull(pk.length) > 1) {
          let key1 = pk.part1;
          if (key1[$startsWith]("s=")) {
            this[_searchTerm] = key1[$substring](2);
            this[_doSearch$0]();
          }
        }
      }).bind(this));
    }
    [_doSearch$0]() {
      return async.async(dart.dynamic, (function* _doSearch() {
        this[_resultDiv$0].style[$display] = "block";
        this[_resultDiv$0][$innerHtml] = "Loading...";
        let response = (yield rpc_lib.RpcLib.convQuery(new src__models__wtypes.ConvQueryRequest.new({term: this[_searchTerm]})));
        this.changePaneKey(new root__pane_key.PaneKey.new("convs/s=" + dart.notNull(this[_searchTerm])));
        this[_resultDiv$0][$innerHtml] = "<h2>Conversations</h2>";
        let hasAny = response.convs != null && dart.notNull(response.convs[$length]) > 0;
        if (hasAny) {
          for (let conv of response.convs) {
            let itemDiv = html.DivElement.new();
            itemDiv.className = "space1";
            this[_resultDiv$0][$append](itemDiv);
            lib__html_lib.HtmlLib.appendLinkToPane(itemDiv, conv.hitText, "conv/" + dart.str(conv.convId) + "/h=" + dart.str(this[_searchTerm]));
            let indented = html.DivElement.new();
            indented.style[$marginLeft] = lib__html_lib.HtmlLib.asPx(18);
            itemDiv[$append](indented);
            for (let post of conv.posts) {
              indented[$appendText](post.hitText);
              indented[$appendHtml]("<br/>");
            }
          }
        }
        if (!hasAny) this[_resultDiv$0][$innerHtml] = "(none)";
      }).bind(this));
    }
    [init$11](pk) {
      return super.init(pk);
    }
  };
  (pane__conv_search_pane.ConvSearchPane.new = function() {
    this[_resultDiv$0] = null;
    this[_searchTerm] = null;
    pane__conv_search_pane.ConvSearchPane.__proto__.new.call(this);
  }).prototype = pane__conv_search_pane.ConvSearchPane.prototype;
  dart.addTypeTests(pane__conv_search_pane.ConvSearchPane);
  dart.setMethodSignature(pane__conv_search_pane.ConvSearchPane, () => ({
    __proto__: dart.getMethods(pane__conv_search_pane.ConvSearchPane.__proto__),
    [_doSearch$0]: dart.fnType(async.Future, [])
  }));
  dart.setFieldSignature(pane__conv_search_pane.ConvSearchPane, () => ({
    __proto__: dart.getFields(pane__conv_search_pane.ConvSearchPane.__proto__),
    [_resultDiv$0]: dart.fieldType(html.DivElement),
    [_searchTerm]: dart.fieldType(core.String)
  }));
  const _resultTable = Symbol('_resultTable');
  const _projectId = Symbol('_projectId');
  const _project = Symbol('_project');
  const _filteredUsers = Symbol('_filteredUsers');
  const _pageNo = Symbol('_pageNo');
  const _voteKindByUserId = Symbol('_voteKindByUserId');
  const _userKindByUserId = Symbol('_userKindByUserId');
  const _loadProject = Symbol('_loadProject');
  const _doSearch$1 = Symbol('_doSearch');
  const _buildOutputTable = Symbol('_buildOutputTable');
  const _userKindImage = Symbol('_userKindImage');
  const _userKindDropdown = Symbol('_userKindDropdown');
  const _voteCheckbox = Symbol('_voteCheckbox');
  const init$12 = Symbol("init");
  pane__project_members_pane.ProjectMembersPane = class ProjectMembersPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$12](pk);
        this[_projectId] = pk.part1AsInt;
        yield this[_loadProject](null);
        this.buildSkeletonHtml2({paneClass: "project-members", iconHoverText: "Project Members", iconName: "paneproject", title: this[_project].projectTitle});
        this.clearLoadingMessage();
        let scroll = lib__html_lib.HtmlLib.appendScrollingDiv(this.bodyElement);
        let _ = html.TableElement.new();
        _.className = "datatable";
        _.style[$marginBottom] = lib__html_lib.HtmlLib.asPx(6);
        this[_resultTable] = _;
        scroll[$append](this[_resultTable]);
        let form = new lib__form_builder.FormBuilder.new(this.bodyElement, "Criteria");
        let nameInp = form.addInput("Filter by name", 100, 50);
        this.paneMenuBar.addButton("Search", dart.fn(e => this[_doSearch$1](this.trimInput(nameInp)), dynamicToFuture()));
        if (this[_project].completeLoad !== "Y") {
          this.paneMenuBar.addButton("Next Page", dart.fn(e => {
            this[_pageNo] = dart.notNull(this[_pageNo]) + 1;
            this[_loadProject](this.trimInput(nameInp));
            this[_buildOutputTable]();
          }, dynamicToNull()));
        }
        this[_buildOutputTable]();
      }).bind(this));
    }
    [_doSearch$1](name) {
      return async.async(dart.dynamic, (function* _doSearch() {
        name = name[$toLowerCase]();
        this[_resultTable][$innerHtml] = "<tr><td>Loading...</td></tr>";
        if (this[_project] != null && this[_project].completeLoad === "Y") {
          this[_filteredUsers] = ListOfProjectUserItem()._check(this[_project].users[$cast](src__models__wtypes.ProjectUserItem))[$where](dart.fn(u => u.nick[$toLowerCase]()[$contains](name) || u.publicName[$toLowerCase]()[$contains](name), ProjectUserItemTobool()))[$toList]();
        } else {
          this[_pageNo] = 0;
          yield this[_loadProject](name);
        }
        this[_buildOutputTable]();
      }).bind(this));
    }
    [_buildOutputTable]() {
      this[_resultTable][$innerHtml] = "<tr><th>Type</th><th></th><th>Vote</th><th>Nickname (name)</th></tr>";
      for (let user of this[_filteredUsers]) {
        let tr = this[_resultTable][$addRow]();
        let td = tr[$addCell]();
        td.style[$textAlign] = "right";
        td[$append](this[_userKindImage](user));
        td[$appendHtml]("<br/>");
        td[$append](this[_userKindDropdown](user));
        td = tr[$addCell]();
        td.className = "avatar";
        if (user.avatarUrl != null) td[$append](html.ImageElement.new({src: user.avatarUrl}));
        td = tr[$addCell]();
        let chk = this[_voteCheckbox](user);
        if (chk != null) td[$append](chk);
        td = tr[$addCell]();
        lib__html_lib.HtmlLib.appendLinkToPane(td, user.nick, "user/" + dart.str(user.userId), {asDiv: false});
        if (user.publicName != null && user.publicName.length > 0) td[$appendText](" - " + dart.str(user.publicName));
      }
    }
    [_userKindImage](user) {
      let imgName = "user_reg", hoverText = "";
      if (user.throttle != null) {
        imgName = "user_throttled";
        hoverText = user.throttle;
      } else if (user.kind === "M") {
        imgName = "user_manager";
        hoverText = "Project manager";
      }
      return html.Element.html("<img src=\"images/" + imgName + ".png\" title=\"" + dart.str(hoverText) + "\" />");
    }
    [_voteCheckbox](user) {
      if (root__globals.Globals.userId == null) return null;
      if (root__globals.Globals.userId == user.userId) return null;
      let chk = html.CheckboxInputElement.new();
      chk[$checked] = this[_voteKindByUserId][$_get](user.userId) === "L";
      chk[$dataset][$_set]("uid", dart.toString(user.userId));
      chk[$onChange].listen(dart.fn(e => async.async(core.Null, (function*() {
        let chk2 = html.CheckboxInputElement._check(e[$target]);
        let userId = core.int.parse(chk2[$dataset][$_get]("uid"));
        let voteKind = dart.test(chk2[$checked]) ? "L" : null;
        let req = new src__models__wtypes.ProjectUserUserSaveRequest.new({projectId: this[_projectId], aboutId: userId, kind: voteKind});
        yield rpc_lib.RpcLib.projectUserUserSave(req);
        this[_voteKindByUserId][$_set](userId, voteKind);
      }).bind(this)), EventToFutureOfNull()));
      return chk;
    }
    [_userKindDropdown](user) {
      if (this[_project].editable !== "Y") {
        let _ = html.SpanElement.new();
        _[$text] = root__globals.Globals.allProjectUserKinds[$_get](user.kind);
        return _;
      }
      let sel = html.SelectElement.new();
      root__globals.Globals.allProjectUserKinds[$forEach](dart.fn((code, text) => {
        sel[$append]((() => {
          let _ = html.OptionElement.new({value: code});
          _[$text] = text;
          return _;
        })());
      }, StringAndStringToNull()));
      sel.value = this[_userKindByUserId][$_get](user.userId);
      sel[$dataset][$_set]("uid", dart.toString(user.userId));
      sel[$onChange].listen(dart.fn(e => async.async(core.Null, (function*() {
        let sel2 = html.SelectElement._check(e[$target]);
        let userId = core.int.parse(sel2[$dataset][$_get]("uid"));
        let kind = sel2.value;
        let req = new src__models__wtypes.ProjectUserSaveRequest.new({projectId: this[_projectId], userId: userId, kind: kind});
        yield rpc_lib.RpcLib.projectUserSave(req);
        this[_userKindByUserId][$_set](userId, kind);
        let icon = sel2[$parent].querySelector("img");
        icon[$replaceWith](this[_userKindImage](user));
      }).bind(this)), EventToFutureOfNull()));
      return sel;
    }
    [_loadProject](nameFilter) {
      return async.async(dart.dynamic, (function* _loadProject() {
        let req = new src__models__wtypes.ProjectUserQueryRequest.new({projectId: this[_projectId], resultPage: this[_pageNo], name: nameFilter});
        this[_project] = (yield rpc_lib.RpcLib.projectUserQuery(req));
        this[_filteredUsers] = ListOfProjectUserItem()._check(this[_project].users[$cast](src__models__wtypes.ProjectUserItem));
        for (let user of this[_project].users) {
          this[_voteKindByUserId][$_set](user.userId, user.voteKind);
          this[_userKindByUserId][$_set](user.userId, user.kind);
        }
      }).bind(this));
    }
    [init$12](pk) {
      return super.init(pk);
    }
  };
  (pane__project_members_pane.ProjectMembersPane.new = function() {
    this[_resultTable] = null;
    this[_projectId] = null;
    this[_project] = null;
    this[_filteredUsers] = null;
    this[_pageNo] = 0;
    this[_voteKindByUserId] = new (IdentityMapOfint$String()).new();
    this[_userKindByUserId] = new (IdentityMapOfint$String()).new();
    pane__project_members_pane.ProjectMembersPane.__proto__.new.call(this);
  }).prototype = pane__project_members_pane.ProjectMembersPane.prototype;
  dart.addTypeTests(pane__project_members_pane.ProjectMembersPane);
  dart.setMethodSignature(pane__project_members_pane.ProjectMembersPane, () => ({
    __proto__: dart.getMethods(pane__project_members_pane.ProjectMembersPane.__proto__),
    [_doSearch$1]: dart.fnType(async.Future, [core.String]),
    [_buildOutputTable]: dart.fnType(dart.void, []),
    [_userKindImage]: dart.fnType(html.Element, [src__models__wtypes.ProjectUserItem]),
    [_voteCheckbox]: dart.fnType(html.Element, [src__models__wtypes.ProjectUserItem]),
    [_userKindDropdown]: dart.fnType(html.Element, [src__models__wtypes.ProjectUserItem]),
    [_loadProject]: dart.fnType(async.Future, [core.String])
  }));
  dart.setFieldSignature(pane__project_members_pane.ProjectMembersPane, () => ({
    __proto__: dart.getFields(pane__project_members_pane.ProjectMembersPane.__proto__),
    [_resultTable]: dart.fieldType(html.TableElement),
    [_projectId]: dart.fieldType(core.int),
    [_project]: dart.fieldType(src__models__wtypes.ProjectUserQueryResponse),
    [_filteredUsers]: dart.fieldType(ListOfProjectUserItem()),
    [_pageNo]: dart.fieldType(core.int),
    [_voteKindByUserId]: dart.finalFieldType(MapOfint$String()),
    [_userKindByUserId]: dart.finalFieldType(MapOfint$String())
  }));
  const _resultDiv$1 = Symbol('_resultDiv');
  const _doSearch$2 = Symbol('_doSearch');
  const init$13 = Symbol("init");
  pane__project_search_pane.ProjectSearchPane = class ProjectSearchPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$13](pk);
        this.buildSkeletonHtml2({paneClass: "projectsearch", title: "Project Search", iconName: "paneproject"});
        this.clearLoadingMessage();
        let _ = lib__html_lib.HtmlLib.appendScrollingDiv(this.bodyElement);
        _.style[$marginBottom] = lib__html_lib.HtmlLib.asPx(6);
        _.style[$display] = "none";
        this[_resultDiv$1] = _;
        let form = new lib__form_builder.FormBuilder.new(this.bodyElement, "Criteria");
        let titleInp = form.addInput("Title", 100, 50);
        this.paneMenuBar.addButton("Search", dart.fn(e => this[_doSearch$2](this.trimInput(titleInp)), dynamicToFuture()));
      }).bind(this));
    }
    [_doSearch$2](title) {
      return async.async(dart.dynamic, (function* _doSearch() {
        this[_resultDiv$1].style[$display] = "block";
        this[_resultDiv$1][$innerHtml] = "Loading...";
        let response = (yield rpc_lib.RpcLib.projectQuery(new src__models__wtypes.ProjectQueryRequest.new({title: title})));
        this[_resultDiv$1][$innerHtml] = "";
        for (let proj of response.projects) {
          src__models__wtypes.ProjectQueryItem._check(proj);
          let itemDiv = html.DivElement.new();
          itemDiv.className = "space1";
          this[_resultDiv$1][$append](itemDiv);
          lib__html_lib.HtmlLib.appendLinkToPane(itemDiv, proj.title, "project/" + dart.str(proj.projectId), {asDiv: false});
          itemDiv[$appendText](" - ");
          lib__html_lib.HtmlLib.insertCollapsed1(itemDiv, proj.description);
        }
        if (response.projects[$length] === 0) this[_resultDiv$1][$innerHtml] = "(none)";
      }).bind(this));
    }
    [init$13](pk) {
      return super.init(pk);
    }
  };
  (pane__project_search_pane.ProjectSearchPane.new = function() {
    this[_resultDiv$1] = null;
    pane__project_search_pane.ProjectSearchPane.__proto__.new.call(this);
  }).prototype = pane__project_search_pane.ProjectSearchPane.prototype;
  dart.addTypeTests(pane__project_search_pane.ProjectSearchPane);
  dart.setMethodSignature(pane__project_search_pane.ProjectSearchPane, () => ({
    __proto__: dart.getMethods(pane__project_search_pane.ProjectSearchPane.__proto__),
    [_doSearch$2]: dart.fnType(async.Future, [core.String])
  }));
  dart.setFieldSignature(pane__project_search_pane.ProjectSearchPane, () => ({
    __proto__: dart.getFields(pane__project_search_pane.ProjectSearchPane.__proto__),
    [_resultDiv$1]: dart.fieldType(html.DivElement)
  }));
  const _projectId$ = Symbol('_projectId');
  const _userKind = Symbol('_userKind');
  dialog__project_membership_dialog.ProjectMembershipDialog = class ProjectMembershipDialog extends lib__dialog_box.DialogBox {
    dialogHeight() {
      return 160;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        let form = new lib__form_builder.FormBuilder.new(this.frame, "Project Membership");
        let oldRoleDesc = "You are currently not connected to this project.";
        if (this[_userKind] === "M") oldRoleDesc = "You are a manager of this project.";
        if (this[_userKind] === "A") oldRoleDesc = "You are an active participant of this project.";
        if (this[_userKind] === "V") oldRoleDesc = "You are a visiting participant of this project.";
        if (this[_userKind] === "O") oldRoleDesc = "You are an observer of this project - no posting permitted.";
        form.addAny("Current role", (() => {
          let _ = html.SpanElement.new();
          _[$text] = oldRoleDesc;
          return _;
        })());
        let newRole = html.SelectElement.new();
        newRole[$append]((() => {
          let _ = html.OptionElement.new();
          _.value = "O";
          _[$text] = "Join as observer - no posting";
          return _;
        })());
        newRole[$append]((() => {
          let _ = html.OptionElement.new();
          _.value = "V";
          _[$text] = "Join as visitor (default)";
          return _;
        })());
        newRole[$append]((() => {
          let _ = html.OptionElement.new();
          _.value = "A";
          _[$text] = "Join as active participant";
          return _;
        })());
        newRole[$append]((() => {
          let _ = html.OptionElement.new();
          _.value = "N";
          _[$text] = "Quit";
          return _;
        })());
        newRole.value = "A";
        form.addAny("New role", newRole);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("Change Membership", dart.fn(e => async.async(core.Null, (function*() {
          let req = new src__models__wtypes.ProjectUserSaveRequest.new({projectId: this[_projectId$], userId: root__globals.Globals.userId, kind: newRole.value});
          let response = (yield rpc_lib.RpcLib.projectUserSave(req));
          if (dart.test(response.isOK)) {
            this.hide(true);
          }
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__project_membership_dialog.ProjectMembershipDialog.new = function(projectId, userKind) {
    this[_projectId$] = projectId;
    this[_userKind] = userKind;
    dialog__project_membership_dialog.ProjectMembershipDialog.__proto__.new.call(this);
  }).prototype = dialog__project_membership_dialog.ProjectMembershipDialog.prototype;
  dart.addTypeTests(dialog__project_membership_dialog.ProjectMembershipDialog);
  dart.setFieldSignature(dialog__project_membership_dialog.ProjectMembershipDialog, () => ({
    __proto__: dart.getFields(dialog__project_membership_dialog.ProjectMembershipDialog.__proto__),
    [_projectId$]: dart.fieldType(core.int),
    [_userKind]: dart.fieldType(core.String)
  }));
  const _kind = Symbol('_kind');
  const _projectId$0 = Symbol('_projectId');
  const _projectTitle = Symbol('_projectTitle');
  const _parseOptions = Symbol('_parseOptions');
  dialog__proposal_dialog.ProposalDialog = class ProposalDialog extends lib__dialog_box.DialogBox {
    build() {
      return async.async(dart.dynamic, (function* build() {
        let isKindProj = this[_kind] === "PROJ", isKindSys = this[_kind] === "SYS";
        let form = new lib__form_builder.FormBuilder.new(this.frame, "Create Proposal/Survey");
        let titleInput = form.addInput("Title", this.typicalControlWidth(), root__globals.Globals.maxTitleLength);
        let descInput = form.addTextArea("Proposal details", this.typicalControlWidth(), 90, root__globals.Globals.maxDescriptionLength);
        let optionsInput = form.addTextArea("Available options (one per line)", this.typicalControlWidth(), 90, root__globals.Globals.maxDescriptionLength);
        optionsInput.value = "Yes\r\nNo";
        let eligibleInput = null;
        if (isKindProj) {
          eligibleInput = html.SelectElement.new();
          eligibleInput[$append]((() => {
            let _ = html.OptionElement.new();
            _.value = "P";
            _[$text] = "All project members";
            return _;
          })());
          eligibleInput[$append]((() => {
            let _ = html.OptionElement.new();
            _.value = "L";
            _[$text] = "Project leaders only";
            return _;
          })());
          form.addAny("Who may vote", eligibleInput);
          eligibleInput.value = "P";
        }
        let daysInput = html.SelectElement.new();
        let dayChoices = JSArrayOfint().of([14]);
        if (isKindProj) dayChoices = JSArrayOfint().of([3, 5, 7, 10, 14, 21, 30, 45]);
        for (let i of dayChoices)
          daysInput[$append]((() => {
            let _ = html.OptionElement.new();
            _.value = dart.toString(i);
            _[$text] = dart.str(i) + " days";
            return _;
          })());
        daysInput.value = "14";
        form.addAny("Voting period (days)", daysInput);
        let kindNotice = "";
        if (isKindProj) kindNotice = "The proposal or survey will be part of the project \"" + dart.str(this[_projectTitle]) + "\".";
        if (isKindSys) kindNotice = "The proposal must be about the way this platform operates, and it will be voted on by the entire site membership.";
        this.frame[$appendText](kindNotice);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("Create Proposal", dart.fn(e => async.async(core.Null, (function*() {
          let title = this.trimInput(titleInput);
          if (title.length === 0) {
            form.showError("Title is required");
            return;
          }
          let options = this[_parseOptions](optionsInput);
          if (dart.notNull(options[$length]) < 2) {
            form.showError("There must be at least 2 options");
            return;
          }
          let eligible = "E";
          if (isKindProj) eligible = eligibleInput.value;
          let saveArgs = new src__models__wtypes.ProposalSaveRequest.new({kind: this[_kind], projectId: this[_projectId$0], eligible: eligible, title: title, summary: this.trimTextArea(descInput), days: core.int.parse(daysInput.value), options: options});
          let response = (yield rpc_lib.RpcLib.proposalSave(saveArgs));
          if (dart.test(response.isOK)) {
            let hasId = response.newId != null;
            this.hide(hasId ? response.newId : true);
            messages.Messages.timed("Proposal created.");
          }
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
    [_parseOptions](optionsInput) {
      let opts = lib__html_lib.HtmlLib.textAreaValueToLines(optionsInput, {removeBlanks: true});
      return opts;
    }
  };
  (dialog__proposal_dialog.ProposalDialog.new = function(kind, projectId, projectTitle) {
    this[_kind] = kind;
    this[_projectId$0] = projectId;
    this[_projectTitle] = projectTitle;
    dialog__proposal_dialog.ProposalDialog.__proto__.new.call(this);
  }).prototype = dialog__proposal_dialog.ProposalDialog.prototype;
  dart.addTypeTests(dialog__proposal_dialog.ProposalDialog);
  dart.setMethodSignature(dialog__proposal_dialog.ProposalDialog, () => ({
    __proto__: dart.getMethods(dialog__proposal_dialog.ProposalDialog.__proto__),
    [_parseOptions]: dart.fnType(core.List$(core.String), [html.TextAreaElement])
  }));
  dart.setFieldSignature(dialog__proposal_dialog.ProposalDialog, () => ({
    __proto__: dart.getFields(dialog__proposal_dialog.ProposalDialog.__proto__),
    [_kind]: dart.fieldType(core.String),
    [_projectId$0]: dart.fieldType(core.int),
    [_projectTitle]: dart.fieldType(core.String)
  }));
  const _convId$0 = Symbol('_convId');
  const _projectId$1 = Symbol('_projectId');
  const _eventId$0 = Symbol('_eventId');
  const _fromConvId = Symbol('_fromConvId');
  const _openingPostId = Symbol('_openingPostId');
  const _seedPostText = Symbol('_seedPostText');
  const _convRules = Symbol('_convRules');
  dialog__conv_dialog.ConvDialog = class ConvDialog extends lib__dialog_box.DialogBox {
    dialogHeight() {
      return 160;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        let isNew = this[_convId$0] == null;
        let isSpawning = this[_fromConvId] != null;
        if (!isNew)
          this[_convRules] = (yield rpc_lib.RpcLib.convGetRules(new src__models__wtypes.ConvGetRulesRequest.new({convId: this[_convId$0]})));
        else
          this[_convRules] = new src__models__wtypes.ConvGetRulesResponse.new({postMaxSize: 5000, userDailyMax: 3});
        let form = new lib__form_builder.FormBuilder.new(this.frame, "Conversation");
        let titleInput = form.addInput("Title", this.typicalControlWidth(), root__globals.Globals.maxTitleLength, this[_convRules].title);
        if (isSpawning) {
          let seedParent = html.DivElement.new();
          form.addAny("Opening post", seedParent);
          lib__html_lib.HtmlLib.insertCollapsed1(seedParent, this[_seedPostText]);
        }
        let postMaxSizeInput = html.NumberInputElement.new();
        postMaxSizeInput[$min] = "10";
        postMaxSizeInput[$max] = "100000";
        postMaxSizeInput[$valueAsNumber] = this[_convRules].postMaxSize;
        form.addAny("Maximum post size (characters)", postMaxSizeInput);
        let userDailyMaxInput = html.NumberInputElement.new();
        userDailyMaxInput[$min] = "1";
        userDailyMaxInput[$max] = "100000";
        userDailyMaxInput[$valueAsNumber] = this[_convRules].userDailyMax;
        form.addAny("Maximum times per day a user can post", userDailyMaxInput);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("Save", dart.fn(e => async.async(core.Null, (function*() {
          let req = new src__models__wtypes.ConvSaveRequest.new({convId: this[_convId$0], projectId: this[_projectId$1], eventId: this[_eventId$0], fromConvId: this[_fromConvId], openingPostId: this[_openingPostId], title: this.trimInput(titleInput), postMaxSize: dart.asInt(postMaxSizeInput[$valueAsNumber]), userDailyMax: dart.asInt(userDailyMaxInput[$valueAsNumber])});
          let response = (yield rpc_lib.RpcLib.convSave(req));
          if (dart.test(response.isOK)) {
            this.hide(response.newId);
          }
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(null);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__conv_dialog.ConvDialog.new = function(convId, projectId, eventId) {
    this[_fromConvId] = null;
    this[_openingPostId] = null;
    this[_seedPostText] = null;
    this[_convRules] = null;
    this[_convId$0] = convId;
    this[_projectId$1] = projectId;
    this[_eventId$0] = eventId;
    dialog__conv_dialog.ConvDialog.__proto__.new.call(this);
  }).prototype = dialog__conv_dialog.ConvDialog.prototype;
  (dialog__conv_dialog.ConvDialog.spawn = function(fromConvId, openingPostId, seedPostText) {
    this[_convId$0] = null;
    this[_projectId$1] = null;
    this[_eventId$0] = null;
    this[_convRules] = null;
    this[_fromConvId] = fromConvId;
    this[_openingPostId] = openingPostId;
    this[_seedPostText] = seedPostText;
    dialog__conv_dialog.ConvDialog.__proto__.new.call(this);
  }).prototype = dialog__conv_dialog.ConvDialog.prototype;
  dart.addTypeTests(dialog__conv_dialog.ConvDialog);
  dart.setFieldSignature(dialog__conv_dialog.ConvDialog, () => ({
    __proto__: dart.getFields(dialog__conv_dialog.ConvDialog.__proto__),
    [_convId$0]: dart.fieldType(core.int),
    [_fromConvId]: dart.fieldType(core.int),
    [_projectId$1]: dart.fieldType(core.int),
    [_eventId$0]: dart.fieldType(core.int),
    [_openingPostId]: dart.fieldType(core.String),
    [_seedPostText]: dart.fieldType(core.String),
    [_convRules]: dart.fieldType(src__models__wtypes.ConvGetRulesResponse)
  }));
  const _projectId$2 = Symbol('_projectId');
  const _project$ = Symbol('_project');
  const _editHandler = Symbol('_editHandler');
  const _newConvHandler = Symbol('_newConvHandler');
  const _newDocHandler = Symbol('_newDocHandler');
  const _newProposalHandler = Symbol('_newProposalHandler');
  const _myRoleHandler = Symbol('_myRoleHandler');
  const _membersHandler = Symbol('_membersHandler');
  const init$14 = Symbol("init");
  pane__project_pane.ProjectPane = class ProjectPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$14](pk);
        this[_projectId$2] = pk.part1AsInt;
        this[_project$] = (yield rpc_lib.RpcLib.projectGet(new src__models__wtypes.ProjectGetRequest.new({projectId: this[_projectId$2]})));
        let canView = JSArrayOfString().of(["O", "V", "A", "M"])[$contains](this[_project$].userKind);
        this.buildSkeletonHtml2({paneClass: "project", iconHoverText: "Project", iconName: "paneproject", title: this[_project$].title});
        this.clearLoadingMessage();
        let card = new lib__card_builder.CardBuilder.new(this.bodyElement);
        card.addText("Title", this[_project$].title);
        card.addText("Visible to", pane__project_pane.ProjectPane.privacyToReadble(this[_project$].privacy));
        card.addText("Leadership", pane__project_pane.ProjectPane.leadershipToReadble(this[_project$].leadership));
        card.addText("Description", this[_project$].description, {useCollapser: true});
        if (dart.test(canView) && this[_project$].docs != null && dart.notNull(this[_project$].docs[$length]) > 0) {
          this.bodyElement[$appendHtml]("<h2><img src=\"images/panedoc.png\"/>Documents</h2>");
          let scroll = lib__html_lib.HtmlLib.appendScrollingDiv(this.bodyElement);
          for (let doc of this[_project$].docs) {
            src__models__wtypes.ProjectDocItem._check(doc);
            lib__html_lib.HtmlLib.appendLinkToPane(scroll, doc.title, "doc/" + dart.str(doc.iid));
          }
        }
        if (this[_project$].convs != null && dart.notNull(this[_project$].convs[$length]) > 0) {
          this.bodyElement[$appendHtml]("<h2><img src=\"images/paneconv.png\"/>Conversations</h2>");
          let scroll = lib__html_lib.HtmlLib.appendScrollingDiv(this.bodyElement);
          for (let conv of this[_project$].convs) {
            src__models__wtypes.ProjectConvItem._check(conv);
            let titlePlus = dart.notNull(conv.title) + (conv.open !== "Y" ? " (closed)" : "");
            lib__html_lib.HtmlLib.appendLinkToPane(scroll, titlePlus, "conv/" + dart.str(conv.iid));
          }
        }
        if (dart.test(canView) && this[_project$].proposals != null && dart.notNull(this[_project$].proposals[$length]) > 0) {
          this.bodyElement[$appendHtml]("<h2><img src=\"images/paneproposal.png\"/>Proposals/Surveys</h2>");
          let scroll = lib__html_lib.HtmlLib.appendScrollingDiv(this.bodyElement);
          for (let prop of this[_project$].proposals) {
            src__models__wtypes.ProjectProposalItem._check(prop);
            lib__html_lib.HtmlLib.appendLinkToPane(scroll, prop.title, "proposal/" + dart.str(prop.iid));
          }
        }
        if (this[_project$].userKind === "M") {
          this.paneMenuBar.addButton("Edit", dart.fn(e => this[_editHandler](), dynamicToFuture()));
        }
        if (dart.test(canView)) {
          this.paneMenuBar.addButton("New Conversation", dart.fn(e => this[_newConvHandler](), dynamicToFuture()));
          this.paneMenuBar.addButton("New Document", dart.fn(e => this[_newDocHandler](), dynamicToFuture()));
          this.paneMenuBar.addButton("New Poll/Proposal", dart.fn(e => this[_newProposalHandler](), dynamicToFuture()));
          this.paneMenuBar.addButton("My Role", dart.fn(e => this[_myRoleHandler](), dynamicToFuture()));
        }
        this.paneMenuBar.addButton("Members", dart.fn(e => this[_membersHandler](), dynamicToFuture()));
      }).bind(this));
    }
    [_editHandler]() {
      return async.async(dart.dynamic, (function* _editHandler() {
        let dlg = new dialog__project_dialog.ProjectDialog.new(this[_projectId$2], this[_project$].categoryId);
        let saved = core.bool._check(yield dlg.show());
        if (dart.test(saved)) this.recreatePane();
      }).bind(this));
    }
    [_myRoleHandler]() {
      return async.async(dart.dynamic, (function* _myRoleHandler() {
        let dlg = new dialog__project_membership_dialog.ProjectMembershipDialog.new(this[_projectId$2], this[_project$].userKind);
        let saved = core.bool._check(yield dlg.show());
        if (dart.test(saved)) this.recreatePane();
      }).bind(this));
    }
    [_membersHandler]() {
      return async.async(dart.dynamic, (function* _membersHandler() {
        if (!dart.test(messages.Messages.checkLoggedIn())) return;
        pane_factory.PaneFactory.createFromString("project-members/" + dart.str(this[_projectId$2]));
      }).bind(this));
    }
    [_newConvHandler]() {
      return async.async(dart.dynamic, (function* _newConvHandler() {
        let dlg = new dialog__conv_dialog.ConvDialog.new(null, this[_projectId$2], null);
        let convId = core.int._check(yield dlg.show());
        if (convId == null) return;
        this.recreatePane();
        pane_factory.PaneFactory.createFromString("conv/" + dart.str(convId));
      }).bind(this));
    }
    [_newDocHandler]() {
      return async.async(dart.dynamic, (function* _newDocHandler() {
        let dlg = new lib__string_dialog.StringDialog.new("Document title", "", root__globals.Globals.maxTitleLength);
        let title = core.String._check(yield dlg.show());
        if (title == null || title.length === 0) return;
        let req = new src__models__wtypes.DocSaveRequest.new({docId: 0, projectId: this[_projectId$2], body: "", title: title});
        let resp = (yield rpc_lib.RpcLib.docSave(req));
        if (resp.ok === "Y") {
          messages.Messages.timed("Document created. Press Edit to start entering content.");
          pane_factory.PaneFactory.createFromString("doc/" + dart.str(resp.newId));
          this.recreatePane();
        }
      }).bind(this));
    }
    [_newProposalHandler]() {
      return async.async(dart.dynamic, (function* _newProposalHandler() {
        let dlg = new dialog__proposal_dialog.ProposalDialog.new("PROJ", this[_projectId$2], this[_project$].title);
        let idOrBool = (yield dlg.show());
        if (core.int.is(idOrBool)) pane_factory.PaneFactory.createFromString("proposal/" + dart.str(idOrBool));
      }).bind(this));
    }
    static privacyToReadble(privacy) {
      if (privacy === "P") return "Public";
      if (privacy === "A") return "Announcement";
      if (privacy === "I") return "Private - by invitation only";
      if (privacy === "R") return "Private - may join by request";
      return "";
    }
    static leadershipToReadble(leadership) {
      if (leadership === "F") return "Fixed: project creators retain authority";
      if (leadership === "D") return "Democratic: leadership determined by vote";
      return "";
    }
    [init$14](pk) {
      return super.init(pk);
    }
  };
  (pane__project_pane.ProjectPane.new = function() {
    this[_projectId$2] = null;
    this[_project$] = null;
    pane__project_pane.ProjectPane.__proto__.new.call(this);
  }).prototype = pane__project_pane.ProjectPane.prototype;
  dart.addTypeTests(pane__project_pane.ProjectPane);
  dart.setMethodSignature(pane__project_pane.ProjectPane, () => ({
    __proto__: dart.getMethods(pane__project_pane.ProjectPane.__proto__),
    [_editHandler]: dart.fnType(async.Future, []),
    [_myRoleHandler]: dart.fnType(async.Future, []),
    [_membersHandler]: dart.fnType(async.Future, []),
    [_newConvHandler]: dart.fnType(async.Future, []),
    [_newDocHandler]: dart.fnType(async.Future, []),
    [_newProposalHandler]: dart.fnType(async.Future, [])
  }));
  dart.setFieldSignature(pane__project_pane.ProjectPane, () => ({
    __proto__: dart.getFields(pane__project_pane.ProjectPane.__proto__),
    [_projectId$2]: dart.fieldType(core.int),
    [_project$]: dart.fieldType(src__models__wtypes.ProjectGetResponse)
  }));
  const _projectId$3 = Symbol('_projectId');
  const _categoryId = Symbol('_categoryId');
  dialog__project_dialog.ProjectDialog = class ProjectDialog extends lib__dialog_box.DialogBox {
    get project() {
      return this[project];
    }
    set project(value) {
      this[project] = value;
    }
    build() {
      return async.async(dart.dynamic, (function* build() {
        if (this[_projectId$3] === 0)
          this.project = new src__models__wtypes.ProjectGetResponse.new({leadership: "D"});
        else
          this.project = (yield rpc_lib.RpcLib.projectGet(new src__models__wtypes.ProjectGetRequest.new({projectId: this[_projectId$3]})));
        let form = new lib__form_builder.FormBuilder.new(this.frame, "Project");
        let titleInput = form.addInput("Title", this.typicalControlWidth(), root__globals.Globals.maxTitleLength, this.project.title);
        let descrInput = form.addTextArea("Description", this.typicalControlWidth(), 130, root__globals.Globals.maxDescriptionLength, this.project.description);
        let privacyInput = html.SelectElement.new();
        root__globals.Globals.allProjectPrivacy[$forEach](dart.fn((value, text) => {
          privacyInput[$append]((() => {
            let _ = html.OptionElement.new();
            _.value = value;
            _[$text] = text;
            return _;
          })());
        }, StringAndStringToNull()));
        privacyInput.value = this.project.privacy;
        form.addAny("Privacy", privacyInput);
        let leadershipDiv = html.DivElement.new();
        let radioDemocratic = html.RadioButtonInputElement.new();
        radioDemocratic[$name] = "leadermode";
        radioDemocratic[$checked] = this.project.leadership === "D";
        let radioFixed = html.RadioButtonInputElement.new();
        radioFixed[$name] = "leadermode";
        radioFixed[$checked] = this.project.leadership === "F";
        leadershipDiv[$append](radioDemocratic);
        leadershipDiv[$appendText]("Democratic - leadership changes over time by vote");
        leadershipDiv[$appendHtml]("<br/>");
        leadershipDiv[$append](radioFixed);
        leadershipDiv[$appendText]("Fixed - leadership remains with those who create the project");
        leadershipDiv[$appendHtml]("<br/>Note that once a project is democratic, it cannot go back to being fixed.");
        form.addAny("Leadership", leadershipDiv);
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("Save", dart.fn(e => async.async(core.Null, (function*() {
          let leadershipCode = dart.test(radioFixed[$checked]) ? "F" : "D";
          let req = new src__models__wtypes.ProjectSaveRequest.new({projectId: this[_projectId$3], title: this.trimInput(titleInput), description: this.trimTextArea(descrInput), privacy: privacyInput.value, leadership: leadershipCode, categoryId: this[_categoryId]});
          let response = (yield rpc_lib.RpcLib.projectSave(req));
          if (dart.test(response.isOK)) {
            this.hide(true);
            if (this[_projectId$3] === 0) messages.Messages.timed("Project will be reviewed for spam, then posted later.");
          }
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__project_dialog.ProjectDialog.new = function(projectId, categoryId) {
    this[project] = null;
    this[_projectId$3] = projectId;
    this[_categoryId] = categoryId;
    dialog__project_dialog.ProjectDialog.__proto__.new.call(this);
  }).prototype = dialog__project_dialog.ProjectDialog.prototype;
  dart.addTypeTests(dialog__project_dialog.ProjectDialog);
  const project = Symbol("ProjectDialog.project");
  dart.setFieldSignature(dialog__project_dialog.ProjectDialog, () => ({
    __proto__: dart.getFields(dialog__project_dialog.ProjectDialog.__proto__),
    [_projectId$3]: dart.fieldType(core.int),
    [_categoryId]: dart.fieldType(core.int),
    project: dart.fieldType(src__models__wtypes.ProjectGetResponse)
  }));
  const _projectCount = Symbol('_projectCount');
  const _projects = Symbol('_projects');
  const init$15 = Symbol("init");
  pane__project_tree_pane.ProjectTreePane = class ProjectTreePane extends pane__base_tree_pane.BaseTreePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        this.paneClass = "projecttree";
        this.paneTitle = "Project Categories";
        this.paneIconName = "paneproject";
        this.categoryKind = "P";
        yield this[init$15](pk);
      }).bind(this));
    }
    insertDetails(detailBox, catId) {
      return async.async(dart.dynamic, (function* insertDetails() {
        this[_projects] = (yield rpc_lib.RpcLib.projectQuery(new src__models__wtypes.ProjectQueryRequest.new({catId: catId})));
        detailBox[$append]((() => {
          let _ = html.HeadingElement.h3();
          _[$text] = "Projects in this category";
          return _;
        })());
        for (let proj of this[_projects].projects) {
          src__models__wtypes.ProjectQueryItem._check(proj);
          let pdiv = html.DivElement.new();
          pdiv[$appendHtml]("<a href=\"#project/" + dart.str(proj.projectId) + "\">" + dart.str(proj.title) + "</a> ");
          detailBox[$append](pdiv);
          lib__html_lib.HtmlLib.insertCollapsed1(pdiv, proj.description);
        }
        if (this[_projects].projects[$length] === 0) detailBox[$appendText]("(none)");
        this[_projectCount] = this[_projects].projects[$length];
      }).bind(this));
    }
    insertDetailButtons(bar, catId) {
      bar.addButton("Create Project", dart.fn(e => async.async(core.Null, (function*() {
        if (dart.notNull(this[_projectCount]) >= 100) {
          messages.Messages.timed("There are too many projects in this category. Please choose a more detailed sub-category.");
          return;
        }
        let dlg = new dialog__project_dialog.ProjectDialog.new(0, this.selectedCatId);
        let saved = core.bool._check(yield dlg.show());
        if (dart.test(saved)) {
          this.recreatePane();
          messages.Messages.criticalMessage("Your new project will be reviewed by admins then posted later.");
        }
      }).bind(this)), dynamicToFutureOfNull()));
    }
    getContentTitles() {
      return IterableOfString()._check(this[_projects].projects[$map](core.String, dart.fn(i => i.title, _ProjectQueryItemToString())))[$toList]();
    }
    getContentIds(contentTitles) {
      return IterableOfint()._check(contentTitles[$map](core.int, dart.fn(s => {
        let matches = ListOfProjectQueryItem()._check(this[_projects].projects[$where](dart.fn(i => i.title == s, _ProjectQueryItemTobool()))[$toList]());
        if (dart.notNull(matches[$length]) > 0) return matches[$_get](0).projectId;
        return null;
      }, StringToint())))[$where](dart.fn(i => i != null, intTobool()))[$toList]();
    }
    [init$15](pk) {
      return super.init(pk);
    }
  };
  (pane__project_tree_pane.ProjectTreePane.new = function() {
    this[_projectCount] = 0;
    this[_projects] = null;
    pane__project_tree_pane.ProjectTreePane.__proto__.new.call(this);
  }).prototype = pane__project_tree_pane.ProjectTreePane.prototype;
  dart.addTypeTests(pane__project_tree_pane.ProjectTreePane);
  dart.setFieldSignature(pane__project_tree_pane.ProjectTreePane, () => ({
    __proto__: dart.getFields(pane__project_tree_pane.ProjectTreePane.__proto__),
    [_projectCount]: dart.fieldType(core.int),
    [_projects]: dart.fieldType(src__models__wtypes.ProjectQueryResponse)
  }));
  const _item = Symbol('_item');
  const init$16 = Symbol("init");
  pane__notify_pane.NotifyPane = class NotifyPane extends pane__base_pane.BasePane {
    init(pk) {
      return async.async(dart.dynamic, (function* init() {
        yield this[init$16](pk);
        let notifyId = pk.part1;
        this[_item] = root__globals.Globals.pushQueue[$firstWhere](dart.fn(i => i.sid == notifyId && i.kind === "N", PushQueueItemTobool()), {orElse: dart.fn(() => null, VoidToNull())});
        if (this[_item] == null) return;
        this.buildSkeletonHtml2({paneClass: "notify", iconHoverText: "Notification", iconName: "panenotify", title: this[_item].text});
        this.clearLoadingMessage();
        this.bodyElement[$append]((() => {
          let _ = html.DivElement.new();
          _[$text] = this[_item].text;
          return _;
        })());
        this.bodyElement[$append](html.BRElement.new());
        if ((this[_item].linkPaneKey != null ? this[_item].linkPaneKey : "").length > 0) {
          let link = html.AnchorElement.new();
          link.href = "#" + dart.notNull(this[_item].linkPaneKey);
          link[$text] = this[_item].linkText;
          this.bodyElement[$append](link);
        }
        let dismissBtn = null;
        dismissBtn = this.paneMenuBar.addButton("Dismiss", dart.fn(e => {
          dismissBtn[$remove]();
          this.dismiss();
          this.paneMenuBar.addElement((() => {
            let _ = html.SpanElement.new();
            _[$text] = "Dismissed";
            return _;
          })());
        }, dynamicToNull()));
      }).bind(this));
    }
    dismiss() {
      let req = new src__models__wtypes.UserNotifySaveRequest.new({notifyId: this[_item].sid});
      rpc_lib.RpcLib.userNotifySave(req);
    }
    [init$16](pk) {
      return super.init(pk);
    }
  };
  (pane__notify_pane.NotifyPane.new = function() {
    this[_item] = null;
    pane__notify_pane.NotifyPane.__proto__.new.call(this);
  }).prototype = pane__notify_pane.NotifyPane.prototype;
  dart.addTypeTests(pane__notify_pane.NotifyPane);
  dart.setMethodSignature(pane__notify_pane.NotifyPane, () => ({
    __proto__: dart.getMethods(pane__notify_pane.NotifyPane.__proto__),
    dismiss: dart.fnType(dart.void, [])
  }));
  dart.setFieldSignature(pane__notify_pane.NotifyPane, () => ({
    __proto__: dart.getFields(pane__notify_pane.NotifyPane.__proto__),
    [_item]: dart.fieldType(src__models__wtypes.PushQueueItem)
  }));
  messages.Messages = class Messages extends core.Object {
    static init() {
      dart.global.jQuery.jGrowl.defaults.position = "bottom-left";
    }
    static timed(s) {
      dart.global.jQuery.jGrowl(s, {life: 5000});
    }
    static showAPIError(r) {
      if (dart.dtest(dart.dload(r, 'isOK'))) return;
      messages.Messages.timed(core.String._check((() => {
        let l = dart.dload(r, 'errorMessage');
        return l != null ? l : dart.dload(r, 'errorCode');
      })()));
    }
    static checkLoggedIn() {
      if (root__globals.Globals.nick != null) return true;
      messages.Messages.timed("That option is only available if you are logged in.");
      return false;
    }
    static criticalMessage(s) {
      return async.async(dart.dynamic, function* criticalMessage() {
        let dlg = new dialog__confirm_dialog.ConfirmDialog.new(s, JSArrayOfString().of(["OK"]));
        yield dlg.show();
      });
    }
  };
  (messages.Messages.new = function() {
  }).prototype = messages.Messages.prototype;
  dart.addTypeTests(messages.Messages);
  rpc_lib.RpcLib = class RpcLib extends core.Object {
    static init() {
      if (html.window[$location].port === "443" || html.window[$location].port === "80")
        rpc_lib.RpcLib.serverBaseUrl = "https://www.autistic.zone/servant/v2/";
      else
        rpc_lib.RpcLib.serverBaseUrl = "http://localhost:8081/servant/v2/";
    }
    static requestToJson(method, requestMap) {
      requestMap[$_set]("base", new (IdentityMapOfString$String()).from(["nick", root__globals.Globals.nick, "password", root__globals.Globals.password]));
      return convert.json.encode(requestMap);
    }
    static rpcAsMap(method, requestMap) {
      return async.async(MapOfString$dynamic(), function* rpcAsMap() {
        let url = dart.notNull(rpc_lib.RpcLib.serverBaseUrl) + dart.notNull(method);
        let requestJson = rpc_lib.RpcLib.requestToJson(method, requestMap);
        let requestHeaders = new (IdentityMapOfString$String()).from(["Content-Type", "application/json"]);
        let hreq = (yield html.HttpRequest.request(url, {method: "POST", requestHeaders: requestHeaders, sendData: requestJson}));
        let responseMap = core.Map._check(convert.json.decode(hreq.responseText));
        return FutureOrOfMapOfString$dynamic()._check(responseMap);
      });
    }
    static postFormData(url, data) {
      let parts = [];
      data[$forEach](dart.fn((key, value) => {
        parts[$add](dart.str(core.Uri.encodeQueryComponent(key)) + "=" + dart.str(core.Uri.encodeQueryComponent(dart.toString(value))));
      }, StringAnddynamicToNull()));
      let formData = parts[$join]("&");
      let requestHeaders = new (IdentityMapOfString$String()).from(["Content-Type", "application/x-www-form-urlencoded; charset=UTF-8"]);
      return html.HttpRequest.request(url, {method: "POST", withCredentials: false, responseType: "text", requestHeaders: requestHeaders, sendData: formData});
    }
    static authenticate(req) {
      return async.async(src__models__wtypes.AuthenticateResponse, function* authenticate() {
        let requestMap = src__models__wtypes.APIRequestBaseSerializer.toMap(req);
        let url = dart.notNull(rpc_lib.RpcLib.serverBaseUrl) + "Authenticate";
        let requestJson = convert.json.encode(requestMap);
        let requestHeaders = new (IdentityMapOfString$String()).from(["Content-Type", "application/json"]);
        let hreq = (yield html.HttpRequest.request(url, {method: "POST", requestHeaders: requestHeaders, sendData: requestJson}));
        let responseMap = core.Map._check(convert.json.decode(hreq.responseText));
        let response = src__models__wtypes.AuthenticateResponseSerializer.fromMap(responseMap);
        return response;
      });
    }
    static categoryQuery(req) {
      return async.async(src__models__wtypes.CategoryQueryResponse, function* categoryQuery() {
        let requestMap = src__models__wtypes.CategoryQueryRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("CategoryQuery", requestMap));
        let response = src__models__wtypes.CategoryQueryResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static categoryMoveContents(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* categoryMoveContents() {
        let requestMap = src__models__wtypes.CategoryMoveContentsRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("CategoryMoveContents", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static categorySave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* categorySave() {
        let requestMap = src__models__wtypes.CategorySaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("CategorySave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static categoryDelete(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* categoryDelete() {
        let requestMap = src__models__wtypes.CategoryDeleteRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("CategoryDelete", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static convQuery(req) {
      return async.async(src__models__wtypes.ConvQueryResponse, function* convQuery() {
        let requestMap = src__models__wtypes.ConvQueryRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ConvQuery", requestMap));
        let response = src__models__wtypes.ConvQueryResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static convGet(req) {
      return async.async(src__models__wtypes.ConvGetResponse, function* convGet() {
        let requestMap = src__models__wtypes.ConvGetRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ConvGet", requestMap));
        let response = src__models__wtypes.ConvGetResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static convSetReadPosition(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* convSetReadPosition() {
        let requestMap = src__models__wtypes.ConvSetReadPositionRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ConvSetReadPosition", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static convPostGet(req) {
      return async.async(src__models__wtypes.ConvPostGetResponse, function* convPostGet() {
        let requestMap = src__models__wtypes.ConvPostGetRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ConvPostGet", requestMap));
        let response = src__models__wtypes.ConvPostGetResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static convSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* convSave() {
        let requestMap = src__models__wtypes.ConvSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ConvSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static convPostSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* convPostSave() {
        let requestMap = src__models__wtypes.ConvPostSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ConvPostSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static convPostUserSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* convPostUserSave() {
        let requestMap = src__models__wtypes.ConvPostUserSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ConvPostUserSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static convPostImageSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* convPostImageSave() {
        let requestMap = src__models__wtypes.ConvPostImageSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ConvPostImageSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static convGetRules(req) {
      return async.async(src__models__wtypes.ConvGetRulesResponse, function* convGetRules() {
        let requestMap = src__models__wtypes.ConvGetRulesRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ConvGetRules", requestMap));
        let response = src__models__wtypes.ConvGetRulesResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static convUserSave(req) {
      return async.async(src__models__wtypes.ConvUserSaveResponse, function* convUserSave() {
        let requestMap = src__models__wtypes.ConvUserSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ConvUserSave", requestMap));
        let response = src__models__wtypes.ConvUserSaveResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static docQuery(req) {
      return async.async(src__models__wtypes.DocQueryResponse, function* docQuery() {
        let requestMap = src__models__wtypes.DocQueryRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("DocQuery", requestMap));
        let response = src__models__wtypes.DocQueryResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static docGet(req) {
      return async.async(src__models__wtypes.DocGetResponse, function* docGet() {
        let requestMap = src__models__wtypes.DocGetRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("DocGet", requestMap));
        let response = src__models__wtypes.DocGetResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static docSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* docSave() {
        let requestMap = src__models__wtypes.DocSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("DocSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static eventQuery(req) {
      return async.async(src__models__wtypes.EventQueryResponse, function* eventQuery() {
        let requestMap = src__models__wtypes.EventQueryRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("EventQuery", requestMap));
        let response = src__models__wtypes.EventQueryResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static eventGet(req) {
      return async.async(src__models__wtypes.EventGetResponse, function* eventGet() {
        let requestMap = src__models__wtypes.EventRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("EventGet", requestMap));
        let response = src__models__wtypes.EventGetResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static eventSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* eventSave() {
        let requestMap = src__models__wtypes.EventSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("EventSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static eventUserSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* eventUserSave() {
        let requestMap = src__models__wtypes.EventUserSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("EventUserSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static eventDelete(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* eventDelete() {
        let requestMap = src__models__wtypes.EventRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("EventDelete", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static projectQuery(req) {
      return async.async(src__models__wtypes.ProjectQueryResponse, function* projectQuery() {
        let requestMap = src__models__wtypes.ProjectQueryRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ProjectQuery", requestMap));
        let response = src__models__wtypes.ProjectQueryResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static projectUserQuery(req) {
      return async.async(src__models__wtypes.ProjectUserQueryResponse, function* projectUserQuery() {
        let requestMap = src__models__wtypes.ProjectUserQueryRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ProjectUserQuery", requestMap));
        let response = src__models__wtypes.ProjectUserQueryResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static projectGet(req) {
      return async.async(src__models__wtypes.ProjectGetResponse, function* projectGet() {
        let requestMap = src__models__wtypes.ProjectGetRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ProjectGet", requestMap));
        let response = src__models__wtypes.ProjectGetResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static projectSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* projectSave() {
        let requestMap = src__models__wtypes.ProjectSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ProjectSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static projectUserSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* projectUserSave() {
        let requestMap = src__models__wtypes.ProjectUserSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ProjectUserSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static projectUserUserSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* projectUserUserSave() {
        let requestMap = src__models__wtypes.ProjectUserUserSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ProjectUserUserSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static proposalQuery(req) {
      return async.async(src__models__wtypes.ProposalQueryResponse, function* proposalQuery() {
        let requestMap = src__models__wtypes.ProposalQueryRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ProposalQuery", requestMap));
        let response = src__models__wtypes.ProposalQueryResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static proposalGet(req) {
      return async.async(src__models__wtypes.ProposalGetResponse, function* proposalGet() {
        let requestMap = src__models__wtypes.ProposalGetRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ProposalGet", requestMap));
        let response = src__models__wtypes.ProposalGetResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static proposalSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* proposalSave() {
        let requestMap = src__models__wtypes.ProposalSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ProposalSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static proposalDelete(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* proposalDelete() {
        let requestMap = src__models__wtypes.ProposalGetRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ProposalDelete", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static proposalUserSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* proposalUserSave() {
        let requestMap = src__models__wtypes.ProposalUserSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ProposalUserSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static pushQueueGet(req) {
      return async.async(src__models__wtypes.PushQueueGetResponse, function* pushQueueGet() {
        let requestMap = src__models__wtypes.PushQueueGetRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("PushQueueGet", requestMap));
        let response = src__models__wtypes.PushQueueGetResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static resourceQuery(req) {
      return async.async(src__models__wtypes.ResourceQueryResponse, function* resourceQuery() {
        let requestMap = src__models__wtypes.ResourceQueryRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ResourceQuery", requestMap));
        let response = src__models__wtypes.ResourceQueryResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static resourceGet(req) {
      return async.async(src__models__wtypes.ResourceGetResponse, function* resourceGet() {
        let requestMap = src__models__wtypes.ResourceGetRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ResourceGet", requestMap));
        let response = src__models__wtypes.ResourceGetResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static resourceTriage(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* resourceTriage() {
        let requestMap = src__models__wtypes.ResourceTriageRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ResourceTriage", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static resourceSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* resourceSave() {
        let requestMap = src__models__wtypes.ResourceSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ResourceSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static resourceUserSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* resourceUserSave() {
        let requestMap = src__models__wtypes.ResourceUserSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("ResourceUserSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static userGet(req) {
      return async.async(src__models__wtypes.UserGetResponse, function* userGet() {
        let requestMap = src__models__wtypes.UserGetRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("UserGet", requestMap));
        let response = src__models__wtypes.UserGetResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static userQuery(req) {
      return async.async(src__models__wtypes.UserQueryResponse, function* userQuery() {
        let requestMap = src__models__wtypes.UserQueryRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("UserQuery", requestMap));
        let response = src__models__wtypes.UserQueryResponseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response.base);
        return response;
      });
    }
    static userSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* userSave() {
        let requestMap = src__models__wtypes.UserSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("UserSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static userAvatarSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* userAvatarSave() {
        let requestMap = src__models__wtypes.UserAvatarSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("UserAvatarSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static userNotifySave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* userNotifySave() {
        let requestMap = src__models__wtypes.UserNotifySaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("UserNotifySave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static userRecoverPassword(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* userRecoverPassword() {
        let requestMap = src__models__wtypes.UserRecoverPasswordRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("UserRecoverPassword", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
    static userUserSave(req) {
      return async.async(src__models__wtypes.APIResponseBase, function* userUserSave() {
        let requestMap = src__models__wtypes.UserUserSaveRequestSerializer.toMap(req);
        let responseMap = (yield rpc_lib.RpcLib.rpcAsMap("UserUserSave", requestMap));
        let response = src__models__wtypes.APIResponseBaseSerializer.fromMap(responseMap);
        messages.Messages.showAPIError(response);
        return response;
      });
    }
  };
  (rpc_lib.RpcLib.new = function() {
  }).prototype = rpc_lib.RpcLib.prototype;
  dart.addTypeTests(rpc_lib.RpcLib);
  dart.defineLazy(rpc_lib.RpcLib, {
    /*rpc_lib.RpcLib.serverBaseUrl*/get serverBaseUrl() {
      return null;
    },
    set serverBaseUrl(_) {}
  });
  push_queue_handler.PushQueueHandler = class PushQueueHandler extends core.Object {
    static init() {
      root__globals.Globals.lastFullPollUtc = new core.DateTime.new(1970);
      push_queue_handler.PushQueueHandler._rebuildMyStuff();
      if (!dart.test(push_queue_handler.PushQueueHandler._initialized)) {
        client_store.ClientStore.registerReceiveMessage(dart.fn(push_queue_handler.PushQueueHandler._receiveFromOtherWindow, dynamicTovoid()));
        async.Timer.new(new core.Duration.new({seconds: 1}), dart.fn(push_queue_handler.PushQueueHandler._timerTick, VoidToFuture()));
      }
      push_queue_handler.PushQueueHandler._initialized = true;
    }
    static _timerTick() {
      return async.async(dart.dynamic, function* _timerTick() {
        let now = wlib$.WLib.utcNow(), fifteenSecAgo = now.subtract(new core.Duration.new({seconds: 15})), threeMinAgo = now.subtract(new core.Duration.new({minutes: 3})), manyMinAgo = now.subtract(new core.Duration.new({minutes: 25}));
        let pollNow = false;
        if (dart.test(root__globals.Globals.pollExplicitlyRequested) && dart.test(root__globals.Globals.lastPollUtc.isBefore(fifteenSecAgo))) pollNow = true;
        if (root__globals.Globals.pushQueue[$length] === 0 && dart.test(root__globals.Globals.lastPollUtc.isBefore(threeMinAgo)) && dart.test(root__globals.Globals.lastActivityUtc.isAfter(manyMinAgo))) pollNow = true;
        if (pollNow && root__globals.Globals.nick != null) {
          root__globals.Globals.pollExplicitlyRequested = false;
          push_queue_handler.PushQueueHandler._showHideRefreshButton(false);
          let fullMode = now.subtract(new core.Duration.new({minutes: 15})).isAfter(root__globals.Globals.lastFullPollUtc);
          root__globals.Globals.lastPollUtc = now;
          let pushArgs = new src__models__wtypes.PushQueueGetRequest.new({depth: dart.test(fullMode) ? "F" : "L"});
          let pushQueueResponse = (yield rpc_lib.RpcLib.pushQueueGet(pushArgs));
          if (dart.test(fullMode) && pushQueueResponse.fullModeStatus == null) root__globals.Globals.lastFullPollUtc = now;
          let items = push_queue_handler.PushQueueHandler._filterListOfItems(ListOfPushQueueItem()._check(pushQueueResponse.items[$cast](src__models__wtypes.PushQueueItem))[$toList]());
          push_queue_handler.PushQueueHandler.itemsReceived(fullMode, items, "S");
          push_queue_handler.PushQueueHandler._showHideRefreshButton(true);
        }
        async.Timer.new(new core.Duration.new({seconds: 15}), dart.fn(push_queue_handler.PushQueueHandler._timerTick, VoidToFuture()));
      });
    }
    static _showHideRefreshButton(show) {
      if (dart.test(show)) {
        lib__html_lib.HtmlLib.showViaStyle("#refresh-working", false);
        push_queue_handler.PushQueueHandler._suppressQuickRefreshTimer = async.Timer.new(new core.Duration.new({seconds: 30}), dart.fn(() => {
          lib__html_lib.HtmlLib.showViaStyle("#button-refresh", true);
          push_queue_handler.PushQueueHandler._suppressQuickRefreshTimer = null;
        }, VoidToNull()));
      } else {
        if (push_queue_handler.PushQueueHandler._suppressQuickRefreshTimer != null) {
          push_queue_handler.PushQueueHandler._suppressQuickRefreshTimer.cancel();
          push_queue_handler.PushQueueHandler._suppressQuickRefreshTimer = null;
        }
        lib__html_lib.HtmlLib.showViaStyle("#button-refresh", false);
        lib__html_lib.HtmlLib.showViaStyle("#refresh-working", true);
      }
    }
    static _filterListOfItems(items) {
      if (items == null) return JSArrayOfPushQueueItem().of([]);
      let niceitems = ListOfPushQueueItem().from(items);
      niceitems[$removeWhere](dart.fn(n => root__globals.Globals.panes[$any](dart.fn(p => pane__notify_pane.NotifyPane.is(p) && p.paneKey.part1 == n.sid, BasePaneTobool())), PushQueueItemTobool()));
      return niceitems;
    }
    static _receiveFromOtherWindow(obj) {
      let action = core.String._check(dart.dindex(obj, "action"));
      let itemsUnfiltered = dart.dsend(dart.dindex(obj, "items"), 'map', [dart.fn(item => src__models__wtypes.PushQueueItemSerializer.fromMap(core.Map._check(item)), dynamicToPushQueueItem())]);
      let items = push_queue_handler.PushQueueHandler._filterListOfItems(ListOfPushQueueItem()._check(itemsUnfiltered));
      if (action === "A") push_queue_handler.PushQueueHandler.itemsReceived(false, items, "W");
      if (action === "F") push_queue_handler.PushQueueHandler.itemsReceived(true, items, "W");
      if (action === "R") for (let item of items)
        push_queue_handler.PushQueueHandler.removeItem(item, "W");
    }
    static sendToOtherWindows(action, items) {
      if (items == null || items[$length] === 0) return;
      let itemsAsMaps = IterableOfMapOfString$Object()._check(items[$map](MapOfString$Object(), dart.fn(i => new (IdentityMapOfString$Object()).from(["sid", i.sid, "iid", i.iid, "kind", i.kind, "why", i.why, "text", i.text, "linkText", i.linkText, "linkPaneKey", i.linkPaneKey]), PushQueueItemToMapOfString$Object())))[$toList]();
      let m = new (IdentityMapOfString$Object()).from(["action", action, "items", itemsAsMaps]);
      client_store.ClientStore.sendMessage(m);
    }
    static itemsReceived(fullPoll, items, source) {
      if (source !== "B") {
        if (dart.test(fullPoll)) {
          root__globals.Globals.pushQueue[$clear]();
        } else {
          root__globals.Globals.pushQueue[$removeWhere](dart.fn(i => i.kind !== "S", PushQueueItemTobool()));
        }
      }
      root__globals.Globals.pushQueue[$addAll](items);
      push_queue_handler.PushQueueHandler._rebuildMyStuff();
      root__globals.Globals.lastPollUtc = wlib$.WLib.utcNow();
      if (dart.test(fullPoll)) root__globals.Globals.lastFullPollUtc = root__globals.Globals.lastPollUtc;
      if (source !== "W") push_queue_handler.PushQueueHandler.sendToOtherWindows(dart.test(fullPoll) ? "F" : "A", items);
    }
    static removeItem(item, source) {
      root__globals.Globals.pushQueue[$removeWhere](dart.fn(i => i.kind !== "N" && i.linkPaneKey == item.linkPaneKey && (source === "!" || i.kind !== "B"), PushQueueItemTobool()));
      push_queue_handler.PushQueueHandler._finishRemoveItem(item, source !== "W");
    }
    static _removeNotifyItem(item, fromLocal) {
      root__globals.Globals.pushQueue[$removeWhere](dart.fn(i => i.kind === "N" && i.sid == item.sid, PushQueueItemTobool()));
      push_queue_handler.PushQueueHandler._finishRemoveItem(item, fromLocal);
    }
    static _finishRemoveItem(item, fromLocal) {
      if (root__globals.Globals.pushQueue[$length] === 0) root__globals.Globals.pollExplicitlyRequested = true;
      push_queue_handler.PushQueueHandler._rebuildMyStuff();
      if (dart.test(fromLocal)) push_queue_handler.PushQueueHandler.sendToOtherWindows("R", JSArrayOfPushQueueItem().of([item]));
    }
    static _rebuildMyStuff() {
      let section = null;
      function iconHtml(i) {
        let iconName = "";
        if (i.kind === "N")
          iconName = "panenotify";
        else if (i.kind === "U")
          iconName = "paneconv";
        else if (i.kind === "B")
          iconName = "paneconv_star";
        else if (i.why === "V")
          iconName = "paneproposal";
        else if (i.why === "I")
          iconName = "paneconv_invite";
        else if (i.why === "R") iconName = "paneconv_maybe";
        if (iconName.length === 0) return "";
        return "<img src=\"images/" + iconName + ".png\" />";
      }
      dart.fn(iconHtml, PushQueueItemToString());
      function build1(title, isNotification, selector) {
        let s = new core.StringBuffer.new();
        s.write("<h2>" + dart.str(title) + "</h2>");
        let items = root__globals.Globals.pushQueue[$where](PushQueueItemTobool()._check(selector))[$toList]();
        for (let item of items) {
          s.write("<div>" + dart.str(iconHtml(item)) + " ");
          if (dart.test(isNotification)) {
            let text = item.text != null ? item.text : "notification";
            if (text.length > 40) text = text[$substring](0, 38) + "...";
            s.write("<a href=\"#notify/" + dart.str(item.sid) + "\">" + text + "</a>");
          } else
            s.write("<a href=\"#" + dart.str(item.linkPaneKey) + "\">" + dart.str(item.linkText) + "</a>");
          s.write("</div>");
        }
        if (items[$length] === 0) s.write("(none)");
        section[$innerHtml] = s.toString();
      }
      dart.fn(build1, StringAndboolAndFunctionTovoid());
      section = html.querySelector("#queue-notify");
      build1("Notifications", true, dart.fn(i => dart.equals(dart.dload(i, 'kind'), "N"), dynamicTobool()));
      section = html.querySelector("#queue-unread");
      build1("Unread", false, dart.fn(i => dart.equals(dart.dload(i, 'kind'), "U"), dynamicTobool()));
      section = html.querySelector("#queue-suggest");
      build1("Suggestions", false, dart.fn(i => dart.equals(dart.dload(i, 'kind'), "S"), dynamicTobool()));
      section = html.querySelector("#queue-bookmark");
      build1("Bookmarks", false, dart.fn(i => dart.equals(dart.dload(i, 'kind'), "B"), dynamicTobool()));
      push_queue_handler.PushQueueHandler.updateNextButton();
    }
    static updateNextButton() {
      let count = root__globals.Globals.pushQueue[$where](dart.fn(i => i.kind !== "B", PushQueueItemTobool()))[$length];
      let num = dart.notNull(count) > 0 ? dart.toString(count) : "";
      html.querySelector("#button-next-number")[$text] = num;
      let titlePrefix = num.length > 0 ? "(" + num + ") " : "";
      html.document[$title] = titlePrefix + dart.notNull(root__globals.Globals.appTitle);
    }
    static showNext() {
      let q = root__globals.Globals.pushQueue;
      if (q[$length] === 0) return;
      let item = q[$firstWhere](dart.fn(i => i.kind === "N", PushQueueItemTobool()), {orElse: dart.fn(() => q[$firstWhere](dart.fn(j => j.kind === "U", PushQueueItemTobool()), {orElse: dart.fn(() => q[$firstWhere](dart.fn(j => j.kind === "S", PushQueueItemTobool())), VoidToPushQueueItem())}), VoidToPushQueueItem())});
      if (item == null) return;
      if (item.kind === "N")
        pane_factory.PaneFactory.createFromString("notify/" + dart.str(item.sid));
      else
        pane_factory.PaneFactory.createFromString(item.linkPaneKey);
    }
    static notifyPaneOpened(p) {
      if (pane__notify_pane.NotifyPane.is(p)) {
        let item = new src__models__wtypes.PushQueueItem.new({linkPaneKey: p.paneKey.full, sid: p.paneKey.full[$substring](7)});
        push_queue_handler.PushQueueHandler._removeNotifyItem(item, true);
      } else {
        let item = new src__models__wtypes.PushQueueItem.new({linkPaneKey: p.paneKey.full});
        push_queue_handler.PushQueueHandler.removeItem(item, "O");
      }
    }
    static refreshClicked() {
      push_queue_handler.PushQueueHandler._showHideRefreshButton(false);
      root__globals.Globals.pollExplicitlyRequested = true;
    }
  };
  (push_queue_handler.PushQueueHandler.new = function() {
  }).prototype = push_queue_handler.PushQueueHandler.prototype;
  dart.addTypeTests(push_queue_handler.PushQueueHandler);
  dart.defineLazy(push_queue_handler.PushQueueHandler, {
    /*push_queue_handler.PushQueueHandler._initialized*/get _initialized() {
      return false;
    },
    set _initialized(_) {},
    /*push_queue_handler.PushQueueHandler._suppressQuickRefreshTimer*/get _suppressQuickRefreshTimer() {
      return null;
    },
    set _suppressQuickRefreshTimer(_) {}
  });
  pane_factory.PaneFactory = class PaneFactory extends core.Object {
    static createFromString(pkfull) {
      return async.async(pane__base_pane.BasePane, function* createFromString() {
        return yield pane_factory.PaneFactory.create(new root__pane_key.PaneKey.new(pkfull));
      });
    }
    static create(pk, opts) {
      return async.async(pane__base_pane.BasePane, function* create() {
        let doScroll = opts && 'doScroll' in opts ? opts.doScroll : true;
        root__globals.Globals.lastActivityUtc = wlib$.WLib.utcNow();
        main_controller.MainController.doOnUserAction();
        let main1 = html.querySelector("#main1");
        let priorScrollHeight = dart.notNull(main1[$scrollHeight]) - dart.notNull(main1.clientHeight) + 100;
        let isReopeningLastPane = dart.notNull(root__globals.Globals.panes[$length]) > 0 && dart.test(root__globals.Globals.panes[$last].paneKey.isIdenticalTo(pk));
        main_controller.MainController.sizeScrollSpace(true);
        let existingSamePane = root__globals.Globals.panes[$firstWhere](dart.fn(p => p.paneKey.isLike(pk), BasePaneTobool()), {orElse: dart.fn(() => null, VoidToNull())});
        let waitForCloseAnimation = false;
        if (existingSamePane != null) {
          waitForCloseAnimation = !dart.equals(root__globals.Globals.panes[$last], existingSamePane);
          pane_factory.PaneFactory.delete(existingSamePane);
        }
        while (dart.notNull(root__globals.Globals.panes[$length]) > 500)
          pane_factory.PaneFactory.delete(root__globals.Globals.panes[$_get](0));
        let numExpanded = root__globals.Globals.panes[$where](dart.fn(p => !dart.test(p.isCollapsed), BasePaneTobool()))[$length];
        for (let p of root__globals.Globals.panes) {
          if (dart.notNull(numExpanded) <= 10) break;
          if (!dart.test(p.isCollapsed)) {
            p.collapse();
            numExpanded = dart.notNull(numExpanded) - 1;
          }
        }
        if (!dart.test(root__globals.Globals.isLargeScreen)) main_controller.MainController.hideMenuPanels();
        let paneType = pk.paneKind;
        let p = null;
        if (paneType === "notify")
          p = new pane__notify_pane.NotifyPane.new();
        else if (paneType === "projecttree")
          p = new pane__project_tree_pane.ProjectTreePane.new();
        else if (paneType === "projectsearch")
          p = new pane__project_search_pane.ProjectSearchPane.new();
        else if (paneType === "project")
          p = new pane__project_pane.ProjectPane.new();
        else if (paneType === "project-members")
          p = new pane__project_members_pane.ProjectMembersPane.new();
        else if (paneType === "convsearch")
          p = new pane__conv_search_pane.ConvSearchPane.new();
        else if (paneType === "conv")
          p = new pane__conv_pane.ConvPane.new();
        else if (paneType === "rootdocs")
          p = new pane__root_docs_pane.RootDocsPane.new();
        else if (paneType === "doc")
          p = new pane__doc_pane.DocPane.new();
        else if (paneType === "resourcetree")
          p = new pane__resource_tree_pane.ResourceTreePane.new();
        else if (paneType === "resources")
          p = new pane__resource_search_pane.ResourceSearchPane.new();
        else if (paneType === "resource")
          p = new pane__resource_pane.ResourcePane.new();
        else if (paneType === "users")
          p = new pane__user_search_pane.UserSearchPane.new();
        else if (paneType === "user")
          p = new pane__user_pane.UserPane.new();
        else if (paneType === "proposals-active")
          p = new pane__active_proposal_list_pane.ActiveProposalListPane.new();
        else if (paneType === "proposals-sys")
          p = new pane__sys_proposal_list_pane.SysProposalListPane.new();
        else if (paneType === "proposal")
          p = new pane__proposal_pane.ProposalPane.new();
        else if (paneType === "events")
          p = new pane__event_search_pane.EventSearchPane.new();
        else if (paneType === "event") p = new pane__event_pane.EventPane.new();
        if (p == null) return null;
        yield p.init(pk);
        root__globals.Globals.panes[$add](p);
        main_controller.MainController.changeUrlFragment(pk.full);
        p.onCollapse = dart.fn(p2 => {
          if (dart.test(root__globals.Globals.panes[$last].isCollapsed)) {
            main_controller.MainController.changeUrlFragment("");
          }
        }, dynamicToNull());
        p.onChanePaneKey = dart.fn(p2 => {
          if (dart.equals(root__globals.Globals.panes[$last], p2)) {
            main_controller.MainController.changeUrlFragment(core.String._check(dart.dload(dart.dload(p2, 'paneKey'), 'full')));
          }
        }, dynamicToNull());
        push_queue_handler.PushQueueHandler.notifyPaneOpened(p);
        let goSmoothScroll = () => {
          let startAt = main1[$scrollTop], endAt = priorScrollHeight + 30;
          if (endAt > dart.notNull(startAt) + 30) {
            main1[$scrollTop] = dart.notNull(startAt) + 10;
            async.Timer.new(new core.Duration.new({milliseconds: 30}), dart.fn(() => main1[$scrollTop] = dart.notNull(startAt) + 10, VoidToint()));
            async.Timer.new(new core.Duration.new({milliseconds: 60}), dart.fn(() => main1[$scrollTop] = dart.notNull(startAt) + 20, VoidToint()));
            async.Timer.new(new core.Duration.new({milliseconds: 90}), dart.fn(() => main1[$scrollTop] = dart.notNull(startAt) + 30, VoidToint()));
            async.Timer.new(new core.Duration.new({milliseconds: 120}), dart.fn(() => main1[$scrollTop] = endAt, VoidToint()));
          } else {
            main1[$scrollTop] = endAt;
          }
        };
        dart.fn(goSmoothScroll, VoidToNull());
        if (dart.test(doScroll) && !isReopeningLastPane) {
          if (waitForCloseAnimation)
            FutureOfNull().delayed(new core.Duration.new({milliseconds: 250}), dart.fn(() => goSmoothScroll(), VoidToNull()));
          else
            goSmoothScroll();
        }
        main_controller.MainController.sizeScrollSpace(false);
        return p;
      });
    }
    static delete(p) {
      let isLast = dart.notNull(root__globals.Globals.panes[$length]) > 0 && dart.equals(root__globals.Globals.panes[$last], p);
      root__globals.Globals.panes[$remove](p);
      try {
        let actualHeight = p.borderElement.clientHeight;
        let _ = p.borderElement;
        _.style[$height] = lib__html_lib.HtmlLib.asPx(actualHeight);
        _.className = "";
        _[$innerHtml] = "";
        if (isLast)
          p.borderElement[$remove]();
        else {
          let effect = p.borderElement[$animate](JSArrayOfMapOfString$dynamic().of([new (IdentityMapOfString$dynamic()).from(["height", lib__html_lib.HtmlLib.asPx(actualHeight), "margin-top", 0, "margin-bottom", 0]), new (IdentityMapOfString$dynamic()).from(["height", "0", "margin-top", 0, "margin-bottom", 0])]), new (IdentityMapOfString$Object()).from(["duration", 300, "fill", "forwards"]));
          effect[$onFinish].listen(dart.fn(e => p.borderElement[$remove](), EventTovoid()));
        }
      } catch (e) {
        let ex = dart.getThrown(e);
      }
      if (dart.notNull(root__globals.Globals.panes[$length]) > 0) {
        let lastPane = root__globals.Globals.panes[$last];
        if (dart.test(lastPane.isCollapsed))
          main_controller.MainController.changeUrlFragment("");
        else
          main_controller.MainController.changeUrlFragment(lastPane.paneKey.full);
      }
    }
  };
  (pane_factory.PaneFactory.new = function() {
  }).prototype = pane_factory.PaneFactory.prototype;
  dart.addTypeTests(pane_factory.PaneFactory);
  root__globals.Globals = class Globals extends core.Object {};
  (root__globals.Globals.new = function() {
  }).prototype = root__globals.Globals.prototype;
  dart.addTypeTests(root__globals.Globals);
  dart.defineLazy(root__globals.Globals, {
    /*root__globals.Globals.appTitle*/get appTitle() {
      return "autistic.zone";
    },
    /*root__globals.Globals.maxTitleLength*/get maxTitleLength() {
      return 500;
    },
    /*root__globals.Globals.maxDescriptionLength*/get maxDescriptionLength() {
      return 10000;
    },
    /*root__globals.Globals.allResourceKinds*/get allResourceKinds() {
      return JSArrayOfString().of(["On-line reading", "On-line multimedia", "Book", "Product", "Organization", "Service", "Location"]);
    },
    /*root__globals.Globals.allPublicLinkKinds*/get allPublicLinkKinds() {
      return JSArrayOfString().of(["Email", "Blog", "Facebook", "Twitter", "Linked-in", "Google+", "Tumblr", "Instagram", "Other(1)", "Other(2)", "Other(3)"]);
    },
    /*root__globals.Globals.allUserKinds*/get allUserKinds() {
      return new (IdentityMapOfString$String()).from(["V", "Visitor", "M", "Member", "A", "Ally"]);
    },
    /*root__globals.Globals.allProjectUserKinds*/get allProjectUserKinds() {
      return new (IdentityMapOfString$String()).from(["O", "Observer", "V", "Visitor", "A", "Active member", "M", "Project manager"]);
    },
    /*root__globals.Globals.allProjectPrivacy*/get allProjectPrivacy() {
      return new (IdentityMapOfString$String()).from(["P", "Public", "A", "Announcement - private for posting, public for reading", "R", "Private - join by request or invite", "I", "Extra-private - by invite only"]);
    },
    /*root__globals.Globals.isLargeScreen*/get isLargeScreen() {
      return null;
    },
    set isLargeScreen(_) {},
    /*root__globals.Globals.userId*/get userId() {
      return 0;
    },
    set userId(_) {},
    /*root__globals.Globals.nick*/get nick() {
      return null;
    },
    set nick(_) {},
    /*root__globals.Globals.password*/get password() {
      return null;
    },
    set password(_) {},
    /*root__globals.Globals.publicName*/get publicName() {
      return null;
    },
    set publicName(_) {},
    /*root__globals.Globals.isSiteAdmin*/get isSiteAdmin() {
      return null;
    },
    set isSiteAdmin(_) {},
    /*root__globals.Globals.panes*/get panes() {
      return JSArrayOfBasePane().of([]);
    },
    set panes(_) {},
    /*root__globals.Globals.lastActivityUtc*/get lastActivityUtc() {
      return wlib$.WLib.utcNow();
    },
    set lastActivityUtc(_) {},
    /*root__globals.Globals.pushQueue*/get pushQueue() {
      return JSArrayOfPushQueueItem().of([]);
    },
    set pushQueue(_) {},
    /*root__globals.Globals.doOnUserAction*/get doOnUserAction() {
      return new (IdentityMapOfString$VoidToFuture()).new();
    },
    set doOnUserAction(_) {},
    /*root__globals.Globals.pollExplicitlyRequested*/get pollExplicitlyRequested() {
      return false;
    },
    set pollExplicitlyRequested(_) {},
    /*root__globals.Globals.lastPollUtc*/get lastPollUtc() {
      return new core.DateTime.new(1970);
    },
    set lastPollUtc(_) {},
    /*root__globals.Globals.lastFullPollUtc*/get lastFullPollUtc() {
      return new core.DateTime.new(1970);
    },
    set lastFullPollUtc(_) {},
    /*root__globals.Globals.urlChangedInCode*/get urlChangedInCode() {
      return false;
    },
    set urlChangedInCode(_) {},
    /*root__globals.Globals.menuShowing*/get menuShowing() {
      return false;
    },
    set menuShowing(_) {},
    /*root__globals.Globals.myStuffShowing*/get myStuffShowing() {
      return false;
    },
    set myStuffShowing(_) {}
  });
  const _kind$ = Symbol('_kind');
  const _existingCatId = Symbol('_existingCatId');
  const _existingTitle = Symbol('_existingTitle');
  const _existingDescription = Symbol('_existingDescription');
  const _referenceCatId = Symbol('_referenceCatId');
  const _referenceTitle$ = Symbol('_referenceTitle');
  dialog__category_dialog.CategoryDialog = class CategoryDialog extends lib__dialog_box.DialogBox {
    build() {
      return async.async(dart.dynamic, (function* build() {
        let isNewCat = this[_existingCatId] == null;
        let isExistingCat = this[_referenceCatId] == null;
        if (!(isNewCat !== isExistingCat)) dart.assertFailed();
        let form = new lib__form_builder.FormBuilder.new(this.frame, "Category");
        let titleInput = form.addInput("Category title", this.typicalControlWidth(), root__globals.Globals.maxTitleLength, this[_existingTitle]);
        let descrInput = form.addTextArea("Description", this.typicalControlWidth(), 90, root__globals.Globals.maxDescriptionLength, this[_existingDescription]);
        let sameLevelRadio = null, subLevelRadio = null;
        if (isNewCat) {
          let subform = form.addSubformFrame("Position");
          sameLevelRadio = html.RadioButtonInputElement.new();
          sameLevelRadio[$name] = "catmode";
          subLevelRadio = html.RadioButtonInputElement.new();
          subLevelRadio[$name] = "catmode";
          subLevelRadio[$checked] = true;
          let _ = subform.parent;
          _[$append](sameLevelRadio);
          _[$appendText]("New category at same level as " + dart.str(this[_referenceTitle$]));
          _[$appendHtml]("<br/>");
          _[$append](subLevelRadio);
          _[$appendText]("New category as sub-category of " + dart.str(this[_referenceTitle$]));
        }
        let bar = new lib__button_bar_builder.ButtonBarBuilder.new(this.frame);
        bar.addButton("Save", dart.fn(e => async.async(core.Null, (function*() {
          let referenceMode = "";
          if (sameLevelRadio != null && dart.test(sameLevelRadio[$checked])) referenceMode = "S";
          if (subLevelRadio != null && dart.test(subLevelRadio[$checked])) referenceMode = "C";
          let req = new src__models__wtypes.CategorySaveRequest.new({catId: this[_existingCatId], kind: this[_kind$], referenceId: this[_referenceCatId], referenceMode: referenceMode, title: this.trimInput(titleInput), description: this.trimTextArea(descrInput)});
          let response = (yield rpc_lib.RpcLib.categorySave(req));
          if (dart.test(response.isOK)) {
            this.hide(true);
          }
        }).bind(this)), dynamicToFutureOfNull()));
        bar.addButton("Cancel", dart.fn(e => {
          this.hide(false);
        }, dynamicToNull()));
      }).bind(this));
    }
  };
  (dialog__category_dialog.CategoryDialog.new = function(kind, existingCatId, existingTitle, existingDescription, referenceCatId, referenceTitle) {
    this[_kind$] = kind;
    this[_existingCatId] = existingCatId;
    this[_existingTitle] = existingTitle;
    this[_existingDescription] = existingDescription;
    this[_referenceCatId] = referenceCatId;
    this[_referenceTitle$] = referenceTitle;
    dialog__category_dialog.CategoryDialog.__proto__.new.call(this);
  }).prototype = dialog__category_dialog.CategoryDialog.prototype;
  dart.addTypeTests(dialog__category_dialog.CategoryDialog);
  dart.setFieldSignature(dialog__category_dialog.CategoryDialog, () => ({
    __proto__: dart.getFields(dialog__category_dialog.CategoryDialog.__proto__),
    [_referenceCatId]: dart.fieldType(core.int),
    [_existingCatId]: dart.fieldType(core.int),
    [_kind$]: dart.fieldType(core.String),
    [_referenceTitle$]: dart.fieldType(core.String),
    [_existingTitle]: dart.fieldType(core.String),
    [_existingDescription]: dart.fieldType(core.String)
  }));
  dart.trackLibraries("web/main.ddc", {
    "main.dart": main,
    "client_store.dart": client_store,
    "lib/html_lib.dart": lib__html_lib,
    "lib/dialog_box.dart": lib__dialog_box,
    "lib/button_bar_builder.dart": lib__button_bar_builder,
    "lib/form_builder.dart": lib__form_builder,
    "root/pane_key.dart": root__pane_key,
    "lib/js_interop.dart": lib__js_interop,
    "dialog/confirm_dialog.dart": dialog__confirm_dialog,
    "lib/outline_builder.dart": lib__outline_builder,
    "lib/category_node.dart": lib__category_node,
    "dialog/node_select_dialog.dart": dialog__node_select_dialog,
    "dialog/select_multiple_dialog.dart": dialog__select_multiple_dialog,
    "dialog/category_move_mode_dialog.dart": dialog__category_move_mode_dialog,
    "lib/string_dialog.dart": lib__string_dialog,
    "lib/card_builder.dart": lib__card_builder,
    "dialog/edit_markdown_dialog.dart": dialog__edit_markdown_dialog,
    "dialog/view_markdown_dialog.dart": dialog__view_markdown_dialog,
    "lib/string_tuple.dart": lib__string_tuple,
    "lib/primitive_datetime.dart": lib__primitive_datetime,
    "pane/user_pane.dart": pane__user_pane,
    "pane/user_search_pane.dart": pane__user_search_pane,
    "pane/resource_pane.dart": pane__resource_pane,
    "pane/resource_search_pane.dart": pane__resource_search_pane,
    "pane/event_pane.dart": pane__event_pane,
    "dialog/event_dialog.dart": dialog__event_dialog,
    "main_menu_handler.dart": main_menu_handler,
    "dialog/location_dialog.dart": dialog__location_dialog,
    "dialog/user_dialog.dart": dialog__user_dialog,
    "dialog/login_recovery_dialog.dart": dialog__login_recovery_dialog,
    "dialog/login_dialog.dart": dialog__login_dialog,
    "main_controller.dart": main_controller,
    "pane/event_search_pane.dart": pane__event_search_pane,
    "pane/proposal_pane.dart": pane__proposal_pane,
    "pane/sys_proposal_list_pane.dart": pane__sys_proposal_list_pane,
    "pane/proposal_list_pane.dart": pane__proposal_list_pane,
    "pane/active_proposal_list_pane.dart": pane__active_proposal_list_pane,
    "dialog/resource_dialog.dart": dialog__resource_dialog,
    "pane/resource_tree_pane.dart": pane__resource_tree_pane,
    "dialog/title_desc_dialog.dart": dialog__title_desc_dialog,
    "pane/doc_pane.dart": pane__doc_pane,
    "pane/root_docs_pane.dart": pane__root_docs_pane,
    "dialog/image_upload_dialog.dart": dialog__image_upload_dialog,
    "pane/conv_pane.dart": pane__conv_pane,
    "pane/conv_search_pane.dart": pane__conv_search_pane,
    "pane/project_members_pane.dart": pane__project_members_pane,
    "pane/project_search_pane.dart": pane__project_search_pane,
    "dialog/project_membership_dialog.dart": dialog__project_membership_dialog,
    "dialog/proposal_dialog.dart": dialog__proposal_dialog,
    "dialog/conv_dialog.dart": dialog__conv_dialog,
    "pane/project_pane.dart": pane__project_pane,
    "dialog/project_dialog.dart": dialog__project_dialog,
    "pane/base_tree_pane.dart": pane__base_tree_pane,
    "pane/project_tree_pane.dart": pane__project_tree_pane,
    "pane/notify_pane.dart": pane__notify_pane,
    "messages.dart": messages,
    "rpc_lib.dart": rpc_lib,
    "push_queue_handler.dart": push_queue_handler,
    "pane_factory.dart": pane_factory,
    "pane/base_pane.dart": pane__base_pane,
    "root/globals.dart": root__globals,
    "dialog/category_dialog.dart": dialog__category_dialog
  }, '{"version":3,"sourceRoot":"","sources":["main.dart","client_store.dart","lib/html_lib.dart","lib/dialog_box.dart","lib/button_bar_builder.dart","lib/form_builder.dart","root/pane_key.dart","dialog/confirm_dialog.dart","lib/outline_builder.dart","lib/category_node.dart","dialog/node_select_dialog.dart","dialog/select_multiple_dialog.dart","dialog/category_move_mode_dialog.dart","lib/string_dialog.dart","lib/card_builder.dart","dialog/edit_markdown_dialog.dart","dialog/view_markdown_dialog.dart","lib/string_tuple.dart","lib/primitive_datetime.dart","pane/base_pane.dart","pane/user_pane.dart","pane/user_search_pane.dart","pane/resource_pane.dart","pane/resource_search_pane.dart","pane/event_pane.dart","dialog/event_dialog.dart","main_menu_handler.dart","dialog/location_dialog.dart","dialog/user_dialog.dart","dialog/login_recovery_dialog.dart","dialog/login_dialog.dart","main_controller.dart","pane/event_search_pane.dart","pane/proposal_pane.dart","pane/proposal_list_pane.dart","pane/sys_proposal_list_pane.dart","pane/active_proposal_list_pane.dart","dialog/resource_dialog.dart","pane/base_tree_pane.dart","pane/resource_tree_pane.dart","dialog/title_desc_dialog.dart","pane/doc_pane.dart","pane/root_docs_pane.dart","dialog/image_upload_dialog.dart","pane/conv_pane.dart","pane/conv_search_pane.dart","pane/project_members_pane.dart","pane/project_search_pane.dart","dialog/project_membership_dialog.dart","dialog/proposal_dialog.dart","dialog/conv_dialog.dart","pane/project_pane.dart","dialog/project_dialog.dart","pane/project_tree_pane.dart","pane/notify_pane.dart","messages.dart","rpc_lib.dart","push_queue_handler.dart","pane_factory.dart","root/globals.dart","dialog/category_dialog.dart"],"names":[],"mappings":"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","file":"main.ddc.js"}');
  // Exports:
  return {
    main: main,
    client_store: client_store,
    lib__html_lib: lib__html_lib,
    lib__dialog_box: lib__dialog_box,
    lib__button_bar_builder: lib__button_bar_builder,
    lib__form_builder: lib__form_builder,
    root__pane_key: root__pane_key,
    lib__js_interop: lib__js_interop,
    dialog__confirm_dialog: dialog__confirm_dialog,
    lib__outline_builder: lib__outline_builder,
    lib__category_node: lib__category_node,
    dialog__node_select_dialog: dialog__node_select_dialog,
    dialog__select_multiple_dialog: dialog__select_multiple_dialog,
    dialog__category_move_mode_dialog: dialog__category_move_mode_dialog,
    lib__string_dialog: lib__string_dialog,
    lib__card_builder: lib__card_builder,
    dialog__edit_markdown_dialog: dialog__edit_markdown_dialog,
    dialog__view_markdown_dialog: dialog__view_markdown_dialog,
    lib__string_tuple: lib__string_tuple,
    lib__primitive_datetime: lib__primitive_datetime,
    pane__user_pane: pane__user_pane,
    pane__user_search_pane: pane__user_search_pane,
    pane__resource_pane: pane__resource_pane,
    pane__resource_search_pane: pane__resource_search_pane,
    pane__event_pane: pane__event_pane,
    dialog__event_dialog: dialog__event_dialog,
    main_menu_handler: main_menu_handler,
    dialog__location_dialog: dialog__location_dialog,
    dialog__user_dialog: dialog__user_dialog,
    dialog__login_recovery_dialog: dialog__login_recovery_dialog,
    dialog__login_dialog: dialog__login_dialog,
    main_controller: main_controller,
    pane__event_search_pane: pane__event_search_pane,
    pane__proposal_pane: pane__proposal_pane,
    pane__sys_proposal_list_pane: pane__sys_proposal_list_pane,
    pane__proposal_list_pane: pane__proposal_list_pane,
    pane__active_proposal_list_pane: pane__active_proposal_list_pane,
    dialog__resource_dialog: dialog__resource_dialog,
    pane__resource_tree_pane: pane__resource_tree_pane,
    dialog__title_desc_dialog: dialog__title_desc_dialog,
    pane__doc_pane: pane__doc_pane,
    pane__root_docs_pane: pane__root_docs_pane,
    dialog__image_upload_dialog: dialog__image_upload_dialog,
    pane__conv_pane: pane__conv_pane,
    pane__conv_search_pane: pane__conv_search_pane,
    pane__project_members_pane: pane__project_members_pane,
    pane__project_search_pane: pane__project_search_pane,
    dialog__project_membership_dialog: dialog__project_membership_dialog,
    dialog__proposal_dialog: dialog__proposal_dialog,
    dialog__conv_dialog: dialog__conv_dialog,
    pane__project_pane: pane__project_pane,
    dialog__project_dialog: dialog__project_dialog,
    pane__base_tree_pane: pane__base_tree_pane,
    pane__project_tree_pane: pane__project_tree_pane,
    pane__notify_pane: pane__notify_pane,
    messages: messages,
    rpc_lib: rpc_lib,
    push_queue_handler: push_queue_handler,
    pane_factory: pane_factory,
    pane__base_pane: pane__base_pane,
    root__globals: root__globals,
    dialog__category_dialog: dialog__category_dialog
  };
});

//# sourceMappingURL=main.ddc.js.map
