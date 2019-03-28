define(['dart_sdk', 'packages/quiver_hashcode/hashcode', 'packages/collection/src/comparators'], function(dart_sdk, hashcode, comparators) {
  'use strict';
  const core = dart_sdk.core;
  const _js_helper = dart_sdk._js_helper;
  const dart = dart_sdk.dart;
  const dartx = dart_sdk.dartx;
  const hashcode$ = hashcode.hashcode;
  const src__equality = comparators.src__equality;
  const _root = Object.create(null);
  const models = Object.create(_root);
  const src__models__wtypes = Object.create(_root);
  const $_get = dartx._get;
  const $sort = dartx.sort;
  const $map = dartx.map;
  const $cast = dartx.cast;
  const $where = dartx.where;
  const $toList = dartx.toList;
  let _ConvQueryPostItemResponseAnd_ConvQueryPostItemResponseToint = () => (_ConvQueryPostItemResponseAnd_ConvQueryPostItemResponseToint = dart.constFn(dart.fnType(core.int, [src__models__wtypes._ConvQueryPostItemResponse, src__models__wtypes._ConvQueryPostItemResponse])))();
  let DefaultEqualityOf_CategoryItemResponse = () => (DefaultEqualityOf_CategoryItemResponse = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._CategoryItemResponse)))();
  let ListEqualityOf_CategoryItemResponse = () => (ListEqualityOf_CategoryItemResponse = dart.constFn(src__equality.ListEquality$(src__models__wtypes._CategoryItemResponse)))();
  let ListOf_CategoryItemResponse = () => (ListOf_CategoryItemResponse = dart.constFn(core.List$(src__models__wtypes._CategoryItemResponse)))();
  let DefaultEqualityOfint = () => (DefaultEqualityOfint = dart.constFn(src__equality.DefaultEquality$(core.int)))();
  let ListEqualityOfint = () => (ListEqualityOfint = dart.constFn(src__equality.ListEquality$(core.int)))();
  let ListOfint = () => (ListOfint = dart.constFn(core.List$(core.int)))();
  let DefaultEqualityOf_ConvQueryConvItemResponse = () => (DefaultEqualityOf_ConvQueryConvItemResponse = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._ConvQueryConvItemResponse)))();
  let ListEqualityOf_ConvQueryConvItemResponse = () => (ListEqualityOf_ConvQueryConvItemResponse = dart.constFn(src__equality.ListEquality$(src__models__wtypes._ConvQueryConvItemResponse)))();
  let ListOf_ConvQueryConvItemResponse = () => (ListOf_ConvQueryConvItemResponse = dart.constFn(core.List$(src__models__wtypes._ConvQueryConvItemResponse)))();
  let DefaultEqualityOf_ConvQueryPostItemResponse = () => (DefaultEqualityOf_ConvQueryPostItemResponse = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._ConvQueryPostItemResponse)))();
  let ListEqualityOf_ConvQueryPostItemResponse = () => (ListEqualityOf_ConvQueryPostItemResponse = dart.constFn(src__equality.ListEquality$(src__models__wtypes._ConvQueryPostItemResponse)))();
  let ListOf_ConvQueryPostItemResponse = () => (ListOf_ConvQueryPostItemResponse = dart.constFn(core.List$(src__models__wtypes._ConvQueryPostItemResponse)))();
  let DefaultEqualityOf_ConvGetPostItem = () => (DefaultEqualityOf_ConvGetPostItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._ConvGetPostItem)))();
  let ListEqualityOf_ConvGetPostItem = () => (ListEqualityOf_ConvGetPostItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._ConvGetPostItem)))();
  let ListOf_ConvGetPostItem = () => (ListOf_ConvGetPostItem = dart.constFn(core.List$(src__models__wtypes._ConvGetPostItem)))();
  let DefaultEqualityOf_DocQueryItem = () => (DefaultEqualityOf_DocQueryItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._DocQueryItem)))();
  let ListEqualityOf_DocQueryItem = () => (ListEqualityOf_DocQueryItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._DocQueryItem)))();
  let ListOf_DocQueryItem = () => (ListOf_DocQueryItem = dart.constFn(core.List$(src__models__wtypes._DocQueryItem)))();
  let DefaultEqualityOf_DocGetVersionItem = () => (DefaultEqualityOf_DocGetVersionItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._DocGetVersionItem)))();
  let ListEqualityOf_DocGetVersionItem = () => (ListEqualityOf_DocGetVersionItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._DocGetVersionItem)))();
  let ListOf_DocGetVersionItem = () => (ListOf_DocGetVersionItem = dart.constFn(core.List$(src__models__wtypes._DocGetVersionItem)))();
  let DefaultEqualityOf_EventItemResponse = () => (DefaultEqualityOf_EventItemResponse = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._EventItemResponse)))();
  let ListEqualityOf_EventItemResponse = () => (ListEqualityOf_EventItemResponse = dart.constFn(src__equality.ListEquality$(src__models__wtypes._EventItemResponse)))();
  let ListOf_EventItemResponse = () => (ListOf_EventItemResponse = dart.constFn(core.List$(src__models__wtypes._EventItemResponse)))();
  let DefaultEqualityOf_EventGetUserResponse = () => (DefaultEqualityOf_EventGetUserResponse = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._EventGetUserResponse)))();
  let ListEqualityOf_EventGetUserResponse = () => (ListEqualityOf_EventGetUserResponse = dart.constFn(src__equality.ListEquality$(src__models__wtypes._EventGetUserResponse)))();
  let DefaultEqualityOf_EventGetConvResponse = () => (DefaultEqualityOf_EventGetConvResponse = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._EventGetConvResponse)))();
  let ListEqualityOf_EventGetConvResponse = () => (ListEqualityOf_EventGetConvResponse = dart.constFn(src__equality.ListEquality$(src__models__wtypes._EventGetConvResponse)))();
  let ListOf_EventGetUserResponse = () => (ListOf_EventGetUserResponse = dart.constFn(core.List$(src__models__wtypes._EventGetUserResponse)))();
  let ListOf_EventGetConvResponse = () => (ListOf_EventGetConvResponse = dart.constFn(core.List$(src__models__wtypes._EventGetConvResponse)))();
  let DefaultEqualityOf_ProjectQueryItem = () => (DefaultEqualityOf_ProjectQueryItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._ProjectQueryItem)))();
  let ListEqualityOf_ProjectQueryItem = () => (ListEqualityOf_ProjectQueryItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._ProjectQueryItem)))();
  let ListOf_ProjectQueryItem = () => (ListOf_ProjectQueryItem = dart.constFn(core.List$(src__models__wtypes._ProjectQueryItem)))();
  let DefaultEqualityOf_ProjectProposalItem = () => (DefaultEqualityOf_ProjectProposalItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._ProjectProposalItem)))();
  let ListEqualityOf_ProjectProposalItem = () => (ListEqualityOf_ProjectProposalItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._ProjectProposalItem)))();
  let DefaultEqualityOf_ProjectConvItem = () => (DefaultEqualityOf_ProjectConvItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._ProjectConvItem)))();
  let ListEqualityOf_ProjectConvItem = () => (ListEqualityOf_ProjectConvItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._ProjectConvItem)))();
  let DefaultEqualityOf_ProjectDocItem = () => (DefaultEqualityOf_ProjectDocItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._ProjectDocItem)))();
  let ListEqualityOf_ProjectDocItem = () => (ListEqualityOf_ProjectDocItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._ProjectDocItem)))();
  let ListOf_ProjectProposalItem = () => (ListOf_ProjectProposalItem = dart.constFn(core.List$(src__models__wtypes._ProjectProposalItem)))();
  let ListOf_ProjectConvItem = () => (ListOf_ProjectConvItem = dart.constFn(core.List$(src__models__wtypes._ProjectConvItem)))();
  let ListOf_ProjectDocItem = () => (ListOf_ProjectDocItem = dart.constFn(core.List$(src__models__wtypes._ProjectDocItem)))();
  let DefaultEqualityOf_ProjectUserItem = () => (DefaultEqualityOf_ProjectUserItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._ProjectUserItem)))();
  let ListEqualityOf_ProjectUserItem = () => (ListEqualityOf_ProjectUserItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._ProjectUserItem)))();
  let ListOf_ProjectUserItem = () => (ListOf_ProjectUserItem = dart.constFn(core.List$(src__models__wtypes._ProjectUserItem)))();
  let DefaultEqualityOf_ProposalQueryItem = () => (DefaultEqualityOf_ProposalQueryItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._ProposalQueryItem)))();
  let ListEqualityOf_ProposalQueryItem = () => (ListEqualityOf_ProposalQueryItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._ProposalQueryItem)))();
  let ListOf_ProposalQueryItem = () => (ListOf_ProposalQueryItem = dart.constFn(core.List$(src__models__wtypes._ProposalQueryItem)))();
  let DefaultEqualityOf_ProposalOptionItem = () => (DefaultEqualityOf_ProposalOptionItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._ProposalOptionItem)))();
  let ListEqualityOf_ProposalOptionItem = () => (ListEqualityOf_ProposalOptionItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._ProposalOptionItem)))();
  let ListOf_ProposalOptionItem = () => (ListOf_ProposalOptionItem = dart.constFn(core.List$(src__models__wtypes._ProposalOptionItem)))();
  let DefaultEqualityOfString = () => (DefaultEqualityOfString = dart.constFn(src__equality.DefaultEquality$(core.String)))();
  let ListEqualityOfString = () => (ListEqualityOfString = dart.constFn(src__equality.ListEquality$(core.String)))();
  let ListOfString = () => (ListOfString = dart.constFn(core.List$(core.String)))();
  let DefaultEqualityOf_PushQueueItem = () => (DefaultEqualityOf_PushQueueItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._PushQueueItem)))();
  let ListEqualityOf_PushQueueItem = () => (ListEqualityOf_PushQueueItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._PushQueueItem)))();
  let ListOf_PushQueueItem = () => (ListOf_PushQueueItem = dart.constFn(core.List$(src__models__wtypes._PushQueueItem)))();
  let DefaultEqualityOf_ResourceItem = () => (DefaultEqualityOf_ResourceItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._ResourceItem)))();
  let ListEqualityOf_ResourceItem = () => (ListEqualityOf_ResourceItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._ResourceItem)))();
  let ListOf_ResourceItem = () => (ListOf_ResourceItem = dart.constFn(core.List$(src__models__wtypes._ResourceItem)))();
  let DefaultEqualityOf_UserQueryItem = () => (DefaultEqualityOf_UserQueryItem = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._UserQueryItem)))();
  let ListEqualityOf_UserQueryItem = () => (ListEqualityOf_UserQueryItem = dart.constFn(src__equality.ListEquality$(src__models__wtypes._UserQueryItem)))();
  let ListOf_UserQueryItem = () => (ListOf_UserQueryItem = dart.constFn(core.List$(src__models__wtypes._UserQueryItem)))();
  let MapEqualityOfString$String = () => (MapEqualityOfString$String = dart.constFn(src__equality.MapEquality$(core.String, core.String)))();
  let DefaultEqualityOf_APIResponseAssociation = () => (DefaultEqualityOf_APIResponseAssociation = dart.constFn(src__equality.DefaultEquality$(src__models__wtypes._APIResponseAssociation)))();
  let ListEqualityOf_APIResponseAssociation = () => (ListEqualityOf_APIResponseAssociation = dart.constFn(src__equality.ListEquality$(src__models__wtypes._APIResponseAssociation)))();
  let MapOfString$String = () => (MapOfString$String = dart.constFn(core.Map$(core.String, core.String)))();
  let ListOf_APIResponseAssociation = () => (ListOf_APIResponseAssociation = dart.constFn(core.List$(src__models__wtypes._APIResponseAssociation)))();
  let IdentityMapOfString$dynamic = () => (IdentityMapOfString$dynamic = dart.constFn(_js_helper.IdentityMap$(core.String, dart.dynamic)))();
  let MapToCategoryItemResponse = () => (MapToCategoryItemResponse = dart.constFn(dart.fnType(src__models__wtypes.CategoryItemResponse, [core.Map])))();
  let dynamicTobool = () => (dynamicTobool = dart.constFn(dart.fnType(core.bool, [dart.dynamic])))();
  let IterableOfMap = () => (IterableOfMap = dart.constFn(core.Iterable$(core.Map)))();
  let MapOfString$dynamic = () => (MapOfString$dynamic = dart.constFn(core.Map$(core.String, dart.dynamic)))();
  let _CategoryItemResponseToMapOfString$dynamic = () => (_CategoryItemResponseToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._CategoryItemResponse])))();
  let IterableOfMapOfString$dynamic = () => (IterableOfMapOfString$dynamic = dart.constFn(core.Iterable$(MapOfString$dynamic())))();
  let IterableOfint = () => (IterableOfint = dart.constFn(core.Iterable$(core.int)))();
  let MapToConvQueryConvItemResponse = () => (MapToConvQueryConvItemResponse = dart.constFn(dart.fnType(src__models__wtypes.ConvQueryConvItemResponse, [core.Map])))();
  let _ConvQueryConvItemResponseToMapOfString$dynamic = () => (_ConvQueryConvItemResponseToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._ConvQueryConvItemResponse])))();
  let MapToConvQueryPostItemResponse = () => (MapToConvQueryPostItemResponse = dart.constFn(dart.fnType(src__models__wtypes.ConvQueryPostItemResponse, [core.Map])))();
  let _ConvQueryPostItemResponseToMapOfString$dynamic = () => (_ConvQueryPostItemResponseToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._ConvQueryPostItemResponse])))();
  let MapToConvGetPostItem = () => (MapToConvGetPostItem = dart.constFn(dart.fnType(src__models__wtypes.ConvGetPostItem, [core.Map])))();
  let _ConvGetPostItemToMapOfString$dynamic = () => (_ConvGetPostItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._ConvGetPostItem])))();
  let MapToDocQueryItem = () => (MapToDocQueryItem = dart.constFn(dart.fnType(src__models__wtypes.DocQueryItem, [core.Map])))();
  let _DocQueryItemToMapOfString$dynamic = () => (_DocQueryItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._DocQueryItem])))();
  let MapToDocGetVersionItem = () => (MapToDocGetVersionItem = dart.constFn(dart.fnType(src__models__wtypes.DocGetVersionItem, [core.Map])))();
  let _DocGetVersionItemToMapOfString$dynamic = () => (_DocGetVersionItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._DocGetVersionItem])))();
  let MapToEventItemResponse = () => (MapToEventItemResponse = dart.constFn(dart.fnType(src__models__wtypes.EventItemResponse, [core.Map])))();
  let _EventItemResponseToMapOfString$dynamic = () => (_EventItemResponseToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._EventItemResponse])))();
  let MapToEventGetUserResponse = () => (MapToEventGetUserResponse = dart.constFn(dart.fnType(src__models__wtypes.EventGetUserResponse, [core.Map])))();
  let MapToEventGetConvResponse = () => (MapToEventGetConvResponse = dart.constFn(dart.fnType(src__models__wtypes.EventGetConvResponse, [core.Map])))();
  let _EventGetUserResponseToMapOfString$dynamic = () => (_EventGetUserResponseToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._EventGetUserResponse])))();
  let _EventGetConvResponseToMapOfString$dynamic = () => (_EventGetConvResponseToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._EventGetConvResponse])))();
  let MapToProjectQueryItem = () => (MapToProjectQueryItem = dart.constFn(dart.fnType(src__models__wtypes.ProjectQueryItem, [core.Map])))();
  let _ProjectQueryItemToMapOfString$dynamic = () => (_ProjectQueryItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._ProjectQueryItem])))();
  let MapToProjectProposalItem = () => (MapToProjectProposalItem = dart.constFn(dart.fnType(src__models__wtypes.ProjectProposalItem, [core.Map])))();
  let MapToProjectConvItem = () => (MapToProjectConvItem = dart.constFn(dart.fnType(src__models__wtypes.ProjectConvItem, [core.Map])))();
  let MapToProjectDocItem = () => (MapToProjectDocItem = dart.constFn(dart.fnType(src__models__wtypes.ProjectDocItem, [core.Map])))();
  let _ProjectProposalItemToMapOfString$dynamic = () => (_ProjectProposalItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._ProjectProposalItem])))();
  let _ProjectConvItemToMapOfString$dynamic = () => (_ProjectConvItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._ProjectConvItem])))();
  let _ProjectDocItemToMapOfString$dynamic = () => (_ProjectDocItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._ProjectDocItem])))();
  let MapToProjectUserItem = () => (MapToProjectUserItem = dart.constFn(dart.fnType(src__models__wtypes.ProjectUserItem, [core.Map])))();
  let _ProjectUserItemToMapOfString$dynamic = () => (_ProjectUserItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._ProjectUserItem])))();
  let MapToProposalQueryItem = () => (MapToProposalQueryItem = dart.constFn(dart.fnType(src__models__wtypes.ProposalQueryItem, [core.Map])))();
  let _ProposalQueryItemToMapOfString$dynamic = () => (_ProposalQueryItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._ProposalQueryItem])))();
  let MapToProposalOptionItem = () => (MapToProposalOptionItem = dart.constFn(dart.fnType(src__models__wtypes.ProposalOptionItem, [core.Map])))();
  let _ProposalOptionItemToMapOfString$dynamic = () => (_ProposalOptionItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._ProposalOptionItem])))();
  let IterableOfString = () => (IterableOfString = dart.constFn(core.Iterable$(core.String)))();
  let MapToPushQueueItem = () => (MapToPushQueueItem = dart.constFn(dart.fnType(src__models__wtypes.PushQueueItem, [core.Map])))();
  let _PushQueueItemToMapOfString$dynamic = () => (_PushQueueItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._PushQueueItem])))();
  let MapToResourceItem = () => (MapToResourceItem = dart.constFn(dart.fnType(src__models__wtypes.ResourceItem, [core.Map])))();
  let _ResourceItemToMapOfString$dynamic = () => (_ResourceItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._ResourceItem])))();
  let MapToUserQueryItem = () => (MapToUserQueryItem = dart.constFn(dart.fnType(src__models__wtypes.UserQueryItem, [core.Map])))();
  let _UserQueryItemToMapOfString$dynamic = () => (_UserQueryItemToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._UserQueryItem])))();
  let MapToAPIResponseAssociation = () => (MapToAPIResponseAssociation = dart.constFn(dart.fnType(src__models__wtypes.APIResponseAssociation, [core.Map])))();
  let _APIResponseAssociationToMapOfString$dynamic = () => (_APIResponseAssociationToMapOfString$dynamic = dart.constFn(dart.fnType(MapOfString$dynamic(), [src__models__wtypes._APIResponseAssociation])))();
  src__models__wtypes._APIRequestBase = class _APIRequestBase extends core.Object {};
  (src__models__wtypes._APIRequestBase.new = function() {
  }).prototype = src__models__wtypes._APIRequestBase.prototype;
  dart.addTypeTests(src__models__wtypes._APIRequestBase);
  src__models__wtypes._APIResponseBase = class _APIResponseBase extends core.Object {
    get isOK() {
      return this.ok === "Y";
    }
  };
  (src__models__wtypes._APIResponseBase.new = function() {
  }).prototype = src__models__wtypes._APIResponseBase.prototype;
  dart.addTypeTests(src__models__wtypes._APIResponseBase);
  dart.setGetterSignature(src__models__wtypes._APIResponseBase, () => ({
    __proto__: dart.getGetters(src__models__wtypes._APIResponseBase.__proto__),
    isOK: core.bool
  }));
  src__models__wtypes._APIResponseAssociation = class _APIResponseAssociation extends core.Object {};
  (src__models__wtypes._APIResponseAssociation.new = function() {
  }).prototype = src__models__wtypes._APIResponseAssociation.prototype;
  dart.addTypeTests(src__models__wtypes._APIResponseAssociation);
  src__models__wtypes._AuthenticateResponse = class _AuthenticateResponse extends core.Object {};
  (src__models__wtypes._AuthenticateResponse.new = function() {
  }).prototype = src__models__wtypes._AuthenticateResponse.prototype;
  dart.addTypeTests(src__models__wtypes._AuthenticateResponse);
  src__models__wtypes._CategoryQueryRequest = class _CategoryQueryRequest extends core.Object {};
  (src__models__wtypes._CategoryQueryRequest.new = function() {
  }).prototype = src__models__wtypes._CategoryQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes._CategoryQueryRequest);
  src__models__wtypes._CategoryQueryResponse = class _CategoryQueryResponse extends core.Object {};
  (src__models__wtypes._CategoryQueryResponse.new = function() {
  }).prototype = src__models__wtypes._CategoryQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes._CategoryQueryResponse);
  src__models__wtypes._CategoryDeleteRequest = class _CategoryDeleteRequest extends core.Object {};
  (src__models__wtypes._CategoryDeleteRequest.new = function() {
  }).prototype = src__models__wtypes._CategoryDeleteRequest.prototype;
  dart.addTypeTests(src__models__wtypes._CategoryDeleteRequest);
  src__models__wtypes._CategorySaveRequest = class _CategorySaveRequest extends core.Object {};
  (src__models__wtypes._CategorySaveRequest.new = function() {
  }).prototype = src__models__wtypes._CategorySaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._CategorySaveRequest);
  src__models__wtypes._CategoryMoveContentsRequest = class _CategoryMoveContentsRequest extends core.Object {};
  (src__models__wtypes._CategoryMoveContentsRequest.new = function() {
  }).prototype = src__models__wtypes._CategoryMoveContentsRequest.prototype;
  dart.addTypeTests(src__models__wtypes._CategoryMoveContentsRequest);
  src__models__wtypes._CategoryItemResponse = class _CategoryItemResponse extends core.Object {};
  (src__models__wtypes._CategoryItemResponse.new = function() {
  }).prototype = src__models__wtypes._CategoryItemResponse.prototype;
  dart.addTypeTests(src__models__wtypes._CategoryItemResponse);
  src__models__wtypes._ConvQueryRequest = class _ConvQueryRequest extends core.Object {};
  (src__models__wtypes._ConvQueryRequest.new = function() {
  }).prototype = src__models__wtypes._ConvQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ConvQueryRequest);
  src__models__wtypes._ConvQueryResponse = class _ConvQueryResponse extends core.Object {};
  (src__models__wtypes._ConvQueryResponse.new = function() {
  }).prototype = src__models__wtypes._ConvQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ConvQueryResponse);
  src__models__wtypes._ConvQueryConvItemResponse = class _ConvQueryConvItemResponse extends core.Object {};
  (src__models__wtypes._ConvQueryConvItemResponse.new = function() {
  }).prototype = src__models__wtypes._ConvQueryConvItemResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ConvQueryConvItemResponse);
  src__models__wtypes.ConvQueryConvItemResponseUtils = class ConvQueryConvItemResponseUtils extends core.Object {
    static sortByDate(item, postCreatedAt) {
      item.posts[$sort](dart.fn((a, b) => {
        let aDate = postCreatedAt[$_get](a.postId);
        let bDate = postCreatedAt[$_get](b.postId);
        if (aDate == null || bDate == null) return 1;
        return bDate.compareTo(aDate);
      }, _ConvQueryPostItemResponseAnd_ConvQueryPostItemResponseToint()));
    }
  };
  (src__models__wtypes.ConvQueryConvItemResponseUtils.new = function() {
  }).prototype = src__models__wtypes.ConvQueryConvItemResponseUtils.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryConvItemResponseUtils);
  src__models__wtypes._ConvQueryPostItemResponse = class _ConvQueryPostItemResponse extends core.Object {};
  (src__models__wtypes._ConvQueryPostItemResponse.new = function() {
  }).prototype = src__models__wtypes._ConvQueryPostItemResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ConvQueryPostItemResponse);
  src__models__wtypes._ConvGetRequest = class _ConvGetRequest extends core.Object {};
  (src__models__wtypes._ConvGetRequest.new = function() {
  }).prototype = src__models__wtypes._ConvGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ConvGetRequest);
  src__models__wtypes._ConvGetResponse = class _ConvGetResponse extends core.Object {};
  (src__models__wtypes._ConvGetResponse.new = function() {
  }).prototype = src__models__wtypes._ConvGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ConvGetResponse);
  src__models__wtypes._ConvGetPostItem = class _ConvGetPostItem extends core.Object {};
  (src__models__wtypes._ConvGetPostItem.new = function() {
  }).prototype = src__models__wtypes._ConvGetPostItem.prototype;
  dart.addTypeTests(src__models__wtypes._ConvGetPostItem);
  src__models__wtypes._ConvGetRulesRequest = class _ConvGetRulesRequest extends core.Object {};
  (src__models__wtypes._ConvGetRulesRequest.new = function() {
  }).prototype = src__models__wtypes._ConvGetRulesRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ConvGetRulesRequest);
  src__models__wtypes._ConvGetRulesResponse = class _ConvGetRulesResponse extends core.Object {};
  (src__models__wtypes._ConvGetRulesResponse.new = function() {
  }).prototype = src__models__wtypes._ConvGetRulesResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ConvGetRulesResponse);
  src__models__wtypes._ConvSaveRequest = class _ConvSaveRequest extends core.Object {};
  (src__models__wtypes._ConvSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ConvSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ConvSaveRequest);
  src__models__wtypes._ConvPostGetRequest = class _ConvPostGetRequest extends core.Object {};
  (src__models__wtypes._ConvPostGetRequest.new = function() {
  }).prototype = src__models__wtypes._ConvPostGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ConvPostGetRequest);
  src__models__wtypes._ConvPostGetResponse = class _ConvPostGetResponse extends core.Object {};
  (src__models__wtypes._ConvPostGetResponse.new = function() {
  }).prototype = src__models__wtypes._ConvPostGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ConvPostGetResponse);
  src__models__wtypes._ConvPostSaveRequest = class _ConvPostSaveRequest extends core.Object {};
  (src__models__wtypes._ConvPostSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ConvPostSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ConvPostSaveRequest);
  src__models__wtypes._ConvPostImageSaveRequest = class _ConvPostImageSaveRequest extends core.Object {};
  (src__models__wtypes._ConvPostImageSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ConvPostImageSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ConvPostImageSaveRequest);
  src__models__wtypes._ConvPostUserSaveRequest = class _ConvPostUserSaveRequest extends core.Object {};
  (src__models__wtypes._ConvPostUserSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ConvPostUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ConvPostUserSaveRequest);
  src__models__wtypes._ConvSetReadPositionRequest = class _ConvSetReadPositionRequest extends core.Object {};
  (src__models__wtypes._ConvSetReadPositionRequest.new = function() {
  }).prototype = src__models__wtypes._ConvSetReadPositionRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ConvSetReadPositionRequest);
  src__models__wtypes._ConvUserSaveRequest = class _ConvUserSaveRequest extends core.Object {};
  (src__models__wtypes._ConvUserSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ConvUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ConvUserSaveRequest);
  src__models__wtypes._ConvUserSaveResponse = class _ConvUserSaveResponse extends core.Object {};
  (src__models__wtypes._ConvUserSaveResponse.new = function() {
  }).prototype = src__models__wtypes._ConvUserSaveResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ConvUserSaveResponse);
  src__models__wtypes._DocQueryRequest = class _DocQueryRequest extends core.Object {};
  (src__models__wtypes._DocQueryRequest.new = function() {
  }).prototype = src__models__wtypes._DocQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes._DocQueryRequest);
  src__models__wtypes._DocQueryResponse = class _DocQueryResponse extends core.Object {};
  (src__models__wtypes._DocQueryResponse.new = function() {
  }).prototype = src__models__wtypes._DocQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes._DocQueryResponse);
  src__models__wtypes._DocQueryItem = class _DocQueryItem extends core.Object {};
  (src__models__wtypes._DocQueryItem.new = function() {
  }).prototype = src__models__wtypes._DocQueryItem.prototype;
  dart.addTypeTests(src__models__wtypes._DocQueryItem);
  src__models__wtypes._DocGetRequest = class _DocGetRequest extends core.Object {};
  (src__models__wtypes._DocGetRequest.new = function() {
  }).prototype = src__models__wtypes._DocGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes._DocGetRequest);
  src__models__wtypes._DocGetResponse = class _DocGetResponse extends core.Object {};
  (src__models__wtypes._DocGetResponse.new = function() {
  }).prototype = src__models__wtypes._DocGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes._DocGetResponse);
  src__models__wtypes._DocGetVersionItem = class _DocGetVersionItem extends core.Object {};
  (src__models__wtypes._DocGetVersionItem.new = function() {
  }).prototype = src__models__wtypes._DocGetVersionItem.prototype;
  dart.addTypeTests(src__models__wtypes._DocGetVersionItem);
  src__models__wtypes._DocSaveRequest = class _DocSaveRequest extends core.Object {};
  (src__models__wtypes._DocSaveRequest.new = function() {
  }).prototype = src__models__wtypes._DocSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._DocSaveRequest);
  src__models__wtypes._DocRollbackRequest = class _DocRollbackRequest extends core.Object {};
  (src__models__wtypes._DocRollbackRequest.new = function() {
  }).prototype = src__models__wtypes._DocRollbackRequest.prototype;
  dart.addTypeTests(src__models__wtypes._DocRollbackRequest);
  src__models__wtypes._EventQueryRequest = class _EventQueryRequest extends core.Object {};
  (src__models__wtypes._EventQueryRequest.new = function() {
  }).prototype = src__models__wtypes._EventQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes._EventQueryRequest);
  src__models__wtypes._EventQueryResponse = class _EventQueryResponse extends core.Object {};
  (src__models__wtypes._EventQueryResponse.new = function() {
  }).prototype = src__models__wtypes._EventQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes._EventQueryResponse);
  src__models__wtypes._EventItemResponse = class _EventItemResponse extends core.Object {};
  (src__models__wtypes._EventItemResponse.new = function() {
  }).prototype = src__models__wtypes._EventItemResponse.prototype;
  dart.addTypeTests(src__models__wtypes._EventItemResponse);
  src__models__wtypes._EventRequest = class _EventRequest extends core.Object {};
  (src__models__wtypes._EventRequest.new = function() {
  }).prototype = src__models__wtypes._EventRequest.prototype;
  dart.addTypeTests(src__models__wtypes._EventRequest);
  src__models__wtypes._EventGetResponse = class _EventGetResponse extends core.Object {};
  (src__models__wtypes._EventGetResponse.new = function() {
  }).prototype = src__models__wtypes._EventGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes._EventGetResponse);
  src__models__wtypes._EventGetUserResponse = class _EventGetUserResponse extends core.Object {};
  (src__models__wtypes._EventGetUserResponse.new = function() {
  }).prototype = src__models__wtypes._EventGetUserResponse.prototype;
  dart.addTypeTests(src__models__wtypes._EventGetUserResponse);
  src__models__wtypes._EventGetConvResponse = class _EventGetConvResponse extends core.Object {};
  (src__models__wtypes._EventGetConvResponse.new = function() {
  }).prototype = src__models__wtypes._EventGetConvResponse.prototype;
  dart.addTypeTests(src__models__wtypes._EventGetConvResponse);
  src__models__wtypes._EventSaveRequest = class _EventSaveRequest extends core.Object {};
  (src__models__wtypes._EventSaveRequest.new = function() {
  }).prototype = src__models__wtypes._EventSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._EventSaveRequest);
  src__models__wtypes._EventUserSaveRequest = class _EventUserSaveRequest extends core.Object {};
  (src__models__wtypes._EventUserSaveRequest.new = function() {
  }).prototype = src__models__wtypes._EventUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._EventUserSaveRequest);
  src__models__wtypes._ProjectQueryRequest = class _ProjectQueryRequest extends core.Object {};
  (src__models__wtypes._ProjectQueryRequest.new = function() {
  }).prototype = src__models__wtypes._ProjectQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectQueryRequest);
  src__models__wtypes._ProjectQueryResponse = class _ProjectQueryResponse extends core.Object {};
  (src__models__wtypes._ProjectQueryResponse.new = function() {
  }).prototype = src__models__wtypes._ProjectQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectQueryResponse);
  src__models__wtypes._ProjectQueryItem = class _ProjectQueryItem extends core.Object {};
  (src__models__wtypes._ProjectQueryItem.new = function() {
  }).prototype = src__models__wtypes._ProjectQueryItem.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectQueryItem);
  src__models__wtypes._ProjectGetRequest = class _ProjectGetRequest extends core.Object {};
  (src__models__wtypes._ProjectGetRequest.new = function() {
  }).prototype = src__models__wtypes._ProjectGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectGetRequest);
  src__models__wtypes._ProjectGetResponse = class _ProjectGetResponse extends core.Object {};
  (src__models__wtypes._ProjectGetResponse.new = function() {
  }).prototype = src__models__wtypes._ProjectGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectGetResponse);
  src__models__wtypes._ProjectProposalItem = class _ProjectProposalItem extends core.Object {};
  (src__models__wtypes._ProjectProposalItem.new = function() {
  }).prototype = src__models__wtypes._ProjectProposalItem.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectProposalItem);
  src__models__wtypes._ProjectConvItem = class _ProjectConvItem extends core.Object {};
  (src__models__wtypes._ProjectConvItem.new = function() {
  }).prototype = src__models__wtypes._ProjectConvItem.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectConvItem);
  src__models__wtypes._ProjectDocItem = class _ProjectDocItem extends core.Object {};
  (src__models__wtypes._ProjectDocItem.new = function() {
  }).prototype = src__models__wtypes._ProjectDocItem.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectDocItem);
  src__models__wtypes._ProjectSaveRequest = class _ProjectSaveRequest extends core.Object {};
  (src__models__wtypes._ProjectSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ProjectSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectSaveRequest);
  src__models__wtypes._ProjectUserQueryRequest = class _ProjectUserQueryRequest extends core.Object {};
  (src__models__wtypes._ProjectUserQueryRequest.new = function() {
  }).prototype = src__models__wtypes._ProjectUserQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectUserQueryRequest);
  src__models__wtypes._ProjectUserQueryResponse = class _ProjectUserQueryResponse extends core.Object {};
  (src__models__wtypes._ProjectUserQueryResponse.new = function() {
  }).prototype = src__models__wtypes._ProjectUserQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectUserQueryResponse);
  src__models__wtypes._ProjectUserItem = class _ProjectUserItem extends core.Object {};
  (src__models__wtypes._ProjectUserItem.new = function() {
  }).prototype = src__models__wtypes._ProjectUserItem.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectUserItem);
  src__models__wtypes._ProjectUserSaveRequest = class _ProjectUserSaveRequest extends core.Object {};
  (src__models__wtypes._ProjectUserSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ProjectUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectUserSaveRequest);
  src__models__wtypes._ProjectUserUserSaveRequest = class _ProjectUserUserSaveRequest extends core.Object {};
  (src__models__wtypes._ProjectUserUserSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ProjectUserUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ProjectUserUserSaveRequest);
  src__models__wtypes._ProposalQueryRequest = class _ProposalQueryRequest extends core.Object {};
  (src__models__wtypes._ProposalQueryRequest.new = function() {
  }).prototype = src__models__wtypes._ProposalQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ProposalQueryRequest);
  src__models__wtypes._ProposalQueryResponse = class _ProposalQueryResponse extends core.Object {};
  (src__models__wtypes._ProposalQueryResponse.new = function() {
  }).prototype = src__models__wtypes._ProposalQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ProposalQueryResponse);
  src__models__wtypes._ProposalQueryItem = class _ProposalQueryItem extends core.Object {};
  (src__models__wtypes._ProposalQueryItem.new = function() {
  }).prototype = src__models__wtypes._ProposalQueryItem.prototype;
  dart.addTypeTests(src__models__wtypes._ProposalQueryItem);
  src__models__wtypes._ProposalGetRequest = class _ProposalGetRequest extends core.Object {};
  (src__models__wtypes._ProposalGetRequest.new = function() {
  }).prototype = src__models__wtypes._ProposalGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ProposalGetRequest);
  src__models__wtypes._ProposalGetResponse = class _ProposalGetResponse extends core.Object {};
  (src__models__wtypes._ProposalGetResponse.new = function() {
  }).prototype = src__models__wtypes._ProposalGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ProposalGetResponse);
  src__models__wtypes._ProposalOptionItem = class _ProposalOptionItem extends core.Object {};
  (src__models__wtypes._ProposalOptionItem.new = function() {
  }).prototype = src__models__wtypes._ProposalOptionItem.prototype;
  dart.addTypeTests(src__models__wtypes._ProposalOptionItem);
  src__models__wtypes._ProposalSaveRequest = class _ProposalSaveRequest extends core.Object {};
  (src__models__wtypes._ProposalSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ProposalSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ProposalSaveRequest);
  src__models__wtypes._ProposalUserSaveRequest = class _ProposalUserSaveRequest extends core.Object {};
  (src__models__wtypes._ProposalUserSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ProposalUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ProposalUserSaveRequest);
  src__models__wtypes._PushQueueGetRequest = class _PushQueueGetRequest extends core.Object {};
  (src__models__wtypes._PushQueueGetRequest.new = function() {
  }).prototype = src__models__wtypes._PushQueueGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes._PushQueueGetRequest);
  src__models__wtypes._PushQueueGetResponse = class _PushQueueGetResponse extends core.Object {};
  (src__models__wtypes._PushQueueGetResponse.new = function() {
  }).prototype = src__models__wtypes._PushQueueGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes._PushQueueGetResponse);
  src__models__wtypes._PushQueueItem = class _PushQueueItem extends core.Object {};
  (src__models__wtypes._PushQueueItem.new = function() {
  }).prototype = src__models__wtypes._PushQueueItem.prototype;
  dart.addTypeTests(src__models__wtypes._PushQueueItem);
  src__models__wtypes._ResourceQueryRequest = class _ResourceQueryRequest extends core.Object {};
  (src__models__wtypes._ResourceQueryRequest.new = function() {
  }).prototype = src__models__wtypes._ResourceQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ResourceQueryRequest);
  src__models__wtypes._ResourceQueryResponse = class _ResourceQueryResponse extends core.Object {};
  (src__models__wtypes._ResourceQueryResponse.new = function() {
  }).prototype = src__models__wtypes._ResourceQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ResourceQueryResponse);
  src__models__wtypes._ResourceItem = class _ResourceItem extends core.Object {};
  (src__models__wtypes._ResourceItem.new = function() {
  }).prototype = src__models__wtypes._ResourceItem.prototype;
  dart.addTypeTests(src__models__wtypes._ResourceItem);
  src__models__wtypes._ResourceGetRequest = class _ResourceGetRequest extends core.Object {};
  (src__models__wtypes._ResourceGetRequest.new = function() {
  }).prototype = src__models__wtypes._ResourceGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ResourceGetRequest);
  src__models__wtypes._ResourceGetResponse = class _ResourceGetResponse extends core.Object {};
  (src__models__wtypes._ResourceGetResponse.new = function() {
  }).prototype = src__models__wtypes._ResourceGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes._ResourceGetResponse);
  src__models__wtypes._ResourceSaveRequest = class _ResourceSaveRequest extends core.Object {};
  (src__models__wtypes._ResourceSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ResourceSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ResourceSaveRequest);
  src__models__wtypes._ResourceTriageRequest = class _ResourceTriageRequest extends core.Object {};
  (src__models__wtypes._ResourceTriageRequest.new = function() {
  }).prototype = src__models__wtypes._ResourceTriageRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ResourceTriageRequest);
  src__models__wtypes._ResourceUserSaveRequest = class _ResourceUserSaveRequest extends core.Object {};
  (src__models__wtypes._ResourceUserSaveRequest.new = function() {
  }).prototype = src__models__wtypes._ResourceUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._ResourceUserSaveRequest);
  src__models__wtypes._UserQueryRequest = class _UserQueryRequest extends core.Object {};
  (src__models__wtypes._UserQueryRequest.new = function() {
  }).prototype = src__models__wtypes._UserQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes._UserQueryRequest);
  src__models__wtypes._UserQueryResponse = class _UserQueryResponse extends core.Object {};
  (src__models__wtypes._UserQueryResponse.new = function() {
  }).prototype = src__models__wtypes._UserQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes._UserQueryResponse);
  src__models__wtypes._UserQueryItem = class _UserQueryItem extends core.Object {};
  (src__models__wtypes._UserQueryItem.new = function() {
  }).prototype = src__models__wtypes._UserQueryItem.prototype;
  dart.addTypeTests(src__models__wtypes._UserQueryItem);
  src__models__wtypes._UserGetRequest = class _UserGetRequest extends core.Object {};
  (src__models__wtypes._UserGetRequest.new = function() {
  }).prototype = src__models__wtypes._UserGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes._UserGetRequest);
  src__models__wtypes._UserGetResponse = class _UserGetResponse extends core.Object {};
  (src__models__wtypes._UserGetResponse.new = function() {
  }).prototype = src__models__wtypes._UserGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes._UserGetResponse);
  src__models__wtypes._UserSaveRequest = class _UserSaveRequest extends core.Object {};
  (src__models__wtypes._UserSaveRequest.new = function() {
  }).prototype = src__models__wtypes._UserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._UserSaveRequest);
  src__models__wtypes._UserAvatarSaveRequest = class _UserAvatarSaveRequest extends core.Object {};
  (src__models__wtypes._UserAvatarSaveRequest.new = function() {
  }).prototype = src__models__wtypes._UserAvatarSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._UserAvatarSaveRequest);
  src__models__wtypes._UserNotifySaveRequest = class _UserNotifySaveRequest extends core.Object {};
  (src__models__wtypes._UserNotifySaveRequest.new = function() {
  }).prototype = src__models__wtypes._UserNotifySaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._UserNotifySaveRequest);
  src__models__wtypes._UserRecoverPasswordRequest = class _UserRecoverPasswordRequest extends core.Object {};
  (src__models__wtypes._UserRecoverPasswordRequest.new = function() {
  }).prototype = src__models__wtypes._UserRecoverPasswordRequest.prototype;
  dart.addTypeTests(src__models__wtypes._UserRecoverPasswordRequest);
  src__models__wtypes._UserUserSaveRequest = class _UserUserSaveRequest extends core.Object {};
  (src__models__wtypes._UserUserSaveRequest.new = function() {
  }).prototype = src__models__wtypes._UserUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes._UserUserSaveRequest);
  src__models__wtypes.APIRequestBase = class APIRequestBase extends core.Object {
    get nick() {
      return this[nick$];
    }
    set nick(value) {
      super.nick = value;
    }
    get password() {
      return this[password$];
    }
    set password(value) {
      super.password = value;
    }
    copyWith(opts) {
      let nick = opts && 'nick' in opts ? opts.nick : null;
      let password = opts && 'password' in opts ? opts.password : null;
      return new src__models__wtypes.APIRequestBase.new({nick: nick != null ? nick : this.nick, password: password != null ? password : this.password});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._APIRequestBase.is(other) && other.nick == this.nick && other.password == this.password;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.nick, this.password]);
    }
    toJson() {
      return src__models__wtypes.APIRequestBaseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.APIRequestBase.new = function(opts) {
    let nick = opts && 'nick' in opts ? opts.nick : null;
    let password = opts && 'password' in opts ? opts.password : null;
    this[nick$] = nick;
    this[password$] = password;
  }).prototype = src__models__wtypes.APIRequestBase.prototype;
  dart.addTypeTests(src__models__wtypes.APIRequestBase);
  const nick$ = Symbol("APIRequestBase.nick");
  const password$ = Symbol("APIRequestBase.password");
  src__models__wtypes.APIRequestBase[dart.implements] = () => [src__models__wtypes._APIRequestBase];
  dart.setMethodSignature(src__models__wtypes.APIRequestBase, () => ({
    __proto__: dart.getMethods(src__models__wtypes.APIRequestBase.__proto__),
    copyWith: dart.fnType(src__models__wtypes.APIRequestBase, [], {nick: core.String, password: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.APIRequestBase, () => ({
    __proto__: dart.getFields(src__models__wtypes.APIRequestBase.__proto__),
    nick: dart.finalFieldType(core.String),
    password: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.APIRequestBase, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.APIRequestBase, ['hashCode']);
  src__models__wtypes.APIResponseBase = class APIResponseBase extends src__models__wtypes._APIResponseBase {
    get errorMessage() {
      return this[errorMessage$];
    }
    set errorMessage(value) {
      super.errorMessage = value;
    }
    get errorCode() {
      return this[errorCode$];
    }
    set errorCode(value) {
      super.errorCode = value;
    }
    get ok() {
      return this[ok$];
    }
    set ok(value) {
      super.ok = value;
    }
    get newId() {
      return this[newId$];
    }
    set newId(value) {
      super.newId = value;
    }
    copyWith(opts) {
      let errorMessage = opts && 'errorMessage' in opts ? opts.errorMessage : null;
      let errorCode = opts && 'errorCode' in opts ? opts.errorCode : null;
      let ok = opts && 'ok' in opts ? opts.ok : null;
      let newId = opts && 'newId' in opts ? opts.newId : null;
      return new src__models__wtypes.APIResponseBase.new({errorMessage: errorMessage != null ? errorMessage : this.errorMessage, errorCode: errorCode != null ? errorCode : this.errorCode, ok: ok != null ? ok : this.ok, newId: newId != null ? newId : this.newId});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._APIResponseBase.is(other) && other.errorMessage == this.errorMessage && other.errorCode == this.errorCode && other.ok == this.ok && other.newId == this.newId;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.errorMessage, this.errorCode, this.ok, this.newId]);
    }
    toJson() {
      return src__models__wtypes.APIResponseBaseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.APIResponseBase.new = function(opts) {
    let errorMessage = opts && 'errorMessage' in opts ? opts.errorMessage : null;
    let errorCode = opts && 'errorCode' in opts ? opts.errorCode : null;
    let ok = opts && 'ok' in opts ? opts.ok : null;
    let newId = opts && 'newId' in opts ? opts.newId : null;
    this[errorMessage$] = errorMessage;
    this[errorCode$] = errorCode;
    this[ok$] = ok;
    this[newId$] = newId;
  }).prototype = src__models__wtypes.APIResponseBase.prototype;
  dart.addTypeTests(src__models__wtypes.APIResponseBase);
  const errorMessage$ = Symbol("APIResponseBase.errorMessage");
  const errorCode$ = Symbol("APIResponseBase.errorCode");
  const ok$ = Symbol("APIResponseBase.ok");
  const newId$ = Symbol("APIResponseBase.newId");
  dart.setMethodSignature(src__models__wtypes.APIResponseBase, () => ({
    __proto__: dart.getMethods(src__models__wtypes.APIResponseBase.__proto__),
    copyWith: dart.fnType(src__models__wtypes.APIResponseBase, [], {errorMessage: core.String, errorCode: core.String, ok: core.String, newId: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.APIResponseBase, () => ({
    __proto__: dart.getFields(src__models__wtypes.APIResponseBase.__proto__),
    errorMessage: dart.finalFieldType(core.String),
    errorCode: dart.finalFieldType(core.String),
    ok: dart.finalFieldType(core.String),
    newId: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.APIResponseBase, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.APIResponseBase, ['hashCode']);
  src__models__wtypes.APIResponseAssociation = class APIResponseAssociation extends core.Object {
    get linkText() {
      return this[linkText$];
    }
    set linkText(value) {
      super.linkText = value;
    }
    get linkPaneKey() {
      return this[linkPaneKey$];
    }
    set linkPaneKey(value) {
      super.linkPaneKey = value;
    }
    copyWith(opts) {
      let linkText = opts && 'linkText' in opts ? opts.linkText : null;
      let linkPaneKey = opts && 'linkPaneKey' in opts ? opts.linkPaneKey : null;
      return new src__models__wtypes.APIResponseAssociation.new({linkText: linkText != null ? linkText : this.linkText, linkPaneKey: linkPaneKey != null ? linkPaneKey : this.linkPaneKey});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._APIResponseAssociation.is(other) && other.linkText == this.linkText && other.linkPaneKey == this.linkPaneKey;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.linkText, this.linkPaneKey]);
    }
    toJson() {
      return src__models__wtypes.APIResponseAssociationSerializer.toMap(this);
    }
  };
  (src__models__wtypes.APIResponseAssociation.new = function(opts) {
    let linkText = opts && 'linkText' in opts ? opts.linkText : null;
    let linkPaneKey = opts && 'linkPaneKey' in opts ? opts.linkPaneKey : null;
    this[linkText$] = linkText;
    this[linkPaneKey$] = linkPaneKey;
  }).prototype = src__models__wtypes.APIResponseAssociation.prototype;
  dart.addTypeTests(src__models__wtypes.APIResponseAssociation);
  const linkText$ = Symbol("APIResponseAssociation.linkText");
  const linkPaneKey$ = Symbol("APIResponseAssociation.linkPaneKey");
  src__models__wtypes.APIResponseAssociation[dart.implements] = () => [src__models__wtypes._APIResponseAssociation];
  dart.setMethodSignature(src__models__wtypes.APIResponseAssociation, () => ({
    __proto__: dart.getMethods(src__models__wtypes.APIResponseAssociation.__proto__),
    copyWith: dart.fnType(src__models__wtypes.APIResponseAssociation, [], {linkText: core.String, linkPaneKey: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.APIResponseAssociation, () => ({
    __proto__: dart.getFields(src__models__wtypes.APIResponseAssociation.__proto__),
    linkText: dart.finalFieldType(core.String),
    linkPaneKey: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.APIResponseAssociation, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.APIResponseAssociation, ['hashCode']);
  src__models__wtypes.AuthenticateResponse = class AuthenticateResponse extends core.Object {
    get base() {
      return this[base$];
    }
    set base(value) {
      super.base = value;
    }
    get publicName() {
      return this[publicName$];
    }
    set publicName(value) {
      super.publicName = value;
    }
    get nick() {
      return this[nick$0];
    }
    set nick(value) {
      super.nick = value;
    }
    get userId() {
      return this[userId$];
    }
    set userId(value) {
      super.userId = value;
    }
    get isSiteAdmin() {
      return this[isSiteAdmin$];
    }
    set isSiteAdmin(value) {
      super.isSiteAdmin = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let publicName = opts && 'publicName' in opts ? opts.publicName : null;
      let nick = opts && 'nick' in opts ? opts.nick : null;
      let userId = opts && 'userId' in opts ? opts.userId : null;
      let isSiteAdmin = opts && 'isSiteAdmin' in opts ? opts.isSiteAdmin : null;
      return new src__models__wtypes.AuthenticateResponse.new({base: base != null ? base : this.base, publicName: publicName != null ? publicName : this.publicName, nick: nick != null ? nick : this.nick, userId: userId != null ? userId : this.userId, isSiteAdmin: isSiteAdmin != null ? isSiteAdmin : this.isSiteAdmin});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._AuthenticateResponse.is(other) && dart.equals(other.base, this.base) && other.publicName == this.publicName && other.nick == this.nick && other.userId == this.userId && other.isSiteAdmin == this.isSiteAdmin;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.publicName, this.nick, this.userId, this.isSiteAdmin]);
    }
    toJson() {
      return src__models__wtypes.AuthenticateResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.AuthenticateResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let publicName = opts && 'publicName' in opts ? opts.publicName : null;
    let nick = opts && 'nick' in opts ? opts.nick : null;
    let userId = opts && 'userId' in opts ? opts.userId : null;
    let isSiteAdmin = opts && 'isSiteAdmin' in opts ? opts.isSiteAdmin : null;
    this[base$] = base;
    this[publicName$] = publicName;
    this[nick$0] = nick;
    this[userId$] = userId;
    this[isSiteAdmin$] = isSiteAdmin;
  }).prototype = src__models__wtypes.AuthenticateResponse.prototype;
  dart.addTypeTests(src__models__wtypes.AuthenticateResponse);
  const base$ = Symbol("AuthenticateResponse.base");
  const publicName$ = Symbol("AuthenticateResponse.publicName");
  const nick$0 = Symbol("AuthenticateResponse.nick");
  const userId$ = Symbol("AuthenticateResponse.userId");
  const isSiteAdmin$ = Symbol("AuthenticateResponse.isSiteAdmin");
  src__models__wtypes.AuthenticateResponse[dart.implements] = () => [src__models__wtypes._AuthenticateResponse];
  dart.setMethodSignature(src__models__wtypes.AuthenticateResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.AuthenticateResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.AuthenticateResponse, [], {base: src__models__wtypes._APIResponseBase, publicName: core.String, nick: core.String, userId: core.int, isSiteAdmin: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.AuthenticateResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.AuthenticateResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    publicName: dart.finalFieldType(core.String),
    nick: dart.finalFieldType(core.String),
    userId: dart.finalFieldType(core.int),
    isSiteAdmin: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.AuthenticateResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.AuthenticateResponse, ['hashCode']);
  src__models__wtypes.CategoryQueryRequest = class CategoryQueryRequest extends core.Object {
    get base() {
      return this[base$0];
    }
    set base(value) {
      super.base = value;
    }
    get kind() {
      return this[kind$];
    }
    set kind(value) {
      super.kind = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      return new src__models__wtypes.CategoryQueryRequest.new({base: base != null ? base : this.base, kind: kind != null ? kind : this.kind});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._CategoryQueryRequest.is(other) && dart.equals(other.base, this.base) && other.kind == this.kind;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.kind]);
    }
    toJson() {
      return src__models__wtypes.CategoryQueryRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.CategoryQueryRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    this[base$0] = base;
    this[kind$] = kind;
  }).prototype = src__models__wtypes.CategoryQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryQueryRequest);
  const base$0 = Symbol("CategoryQueryRequest.base");
  const kind$ = Symbol("CategoryQueryRequest.kind");
  src__models__wtypes.CategoryQueryRequest[dart.implements] = () => [src__models__wtypes._CategoryQueryRequest];
  dart.setMethodSignature(src__models__wtypes.CategoryQueryRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.CategoryQueryRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.CategoryQueryRequest, [], {base: src__models__wtypes._APIRequestBase, kind: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.CategoryQueryRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.CategoryQueryRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    kind: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.CategoryQueryRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.CategoryQueryRequest, ['hashCode']);
  let const$;
  let const$0;
  src__models__wtypes.CategoryQueryResponse = class CategoryQueryResponse extends core.Object {
    get base() {
      return this[base$1];
    }
    set base(value) {
      super.base = value;
    }
    get categories() {
      return this[categories$];
    }
    set categories(value) {
      super.categories = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let categories = opts && 'categories' in opts ? opts.categories : null;
      return new src__models__wtypes.CategoryQueryResponse.new({base: base != null ? base : this.base, categories: categories != null ? categories : this.categories});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._CategoryQueryResponse.is(other) && dart.equals(other.base, this.base) && dart.test((const$0 || (const$0 = dart.const(new (ListEqualityOf_CategoryItemResponse()).new(const$ || (const$ = dart.const(new (DefaultEqualityOf_CategoryItemResponse()).new())))))).equals(other.categories, this.categories));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.categories]);
    }
    toJson() {
      return src__models__wtypes.CategoryQueryResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.CategoryQueryResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let categories = opts && 'categories' in opts ? opts.categories : null;
    this[base$1] = base;
    this[categories$] = categories;
  }).prototype = src__models__wtypes.CategoryQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryQueryResponse);
  const base$1 = Symbol("CategoryQueryResponse.base");
  const categories$ = Symbol("CategoryQueryResponse.categories");
  src__models__wtypes.CategoryQueryResponse[dart.implements] = () => [src__models__wtypes._CategoryQueryResponse];
  dart.setMethodSignature(src__models__wtypes.CategoryQueryResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.CategoryQueryResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.CategoryQueryResponse, [], {base: src__models__wtypes._APIResponseBase, categories: core.List$(src__models__wtypes._CategoryItemResponse)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.CategoryQueryResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.CategoryQueryResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    categories: dart.finalFieldType(ListOf_CategoryItemResponse())
  }));
  dart.defineExtensionMethods(src__models__wtypes.CategoryQueryResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.CategoryQueryResponse, ['hashCode']);
  src__models__wtypes.CategoryDeleteRequest = class CategoryDeleteRequest extends core.Object {
    get base() {
      return this[base$2];
    }
    set base(value) {
      super.base = value;
    }
    get catId() {
      return this[catId$];
    }
    set catId(value) {
      super.catId = value;
    }
    get kind() {
      return this[kind$0];
    }
    set kind(value) {
      super.kind = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let catId = opts && 'catId' in opts ? opts.catId : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      return new src__models__wtypes.CategoryDeleteRequest.new({base: base != null ? base : this.base, catId: catId != null ? catId : this.catId, kind: kind != null ? kind : this.kind});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._CategoryDeleteRequest.is(other) && dart.equals(other.base, this.base) && other.catId == this.catId && other.kind == this.kind;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.catId, this.kind]);
    }
    toJson() {
      return src__models__wtypes.CategoryDeleteRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.CategoryDeleteRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let catId = opts && 'catId' in opts ? opts.catId : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    this[base$2] = base;
    this[catId$] = catId;
    this[kind$0] = kind;
  }).prototype = src__models__wtypes.CategoryDeleteRequest.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryDeleteRequest);
  const base$2 = Symbol("CategoryDeleteRequest.base");
  const catId$ = Symbol("CategoryDeleteRequest.catId");
  const kind$0 = Symbol("CategoryDeleteRequest.kind");
  src__models__wtypes.CategoryDeleteRequest[dart.implements] = () => [src__models__wtypes._CategoryDeleteRequest];
  dart.setMethodSignature(src__models__wtypes.CategoryDeleteRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.CategoryDeleteRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.CategoryDeleteRequest, [], {base: src__models__wtypes._APIRequestBase, catId: core.int, kind: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.CategoryDeleteRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.CategoryDeleteRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    catId: dart.finalFieldType(core.int),
    kind: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.CategoryDeleteRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.CategoryDeleteRequest, ['hashCode']);
  src__models__wtypes.CategorySaveRequest = class CategorySaveRequest extends core.Object {
    get base() {
      return this[base$3];
    }
    set base(value) {
      super.base = value;
    }
    get catId() {
      return this[catId$0];
    }
    set catId(value) {
      super.catId = value;
    }
    get kind() {
      return this[kind$1];
    }
    set kind(value) {
      super.kind = value;
    }
    get referenceId() {
      return this[referenceId$];
    }
    set referenceId(value) {
      super.referenceId = value;
    }
    get referenceMode() {
      return this[referenceMode$];
    }
    set referenceMode(value) {
      super.referenceMode = value;
    }
    get title() {
      return this[title$];
    }
    set title(value) {
      super.title = value;
    }
    get description() {
      return this[description$];
    }
    set description(value) {
      super.description = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let catId = opts && 'catId' in opts ? opts.catId : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      let referenceId = opts && 'referenceId' in opts ? opts.referenceId : null;
      let referenceMode = opts && 'referenceMode' in opts ? opts.referenceMode : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let description = opts && 'description' in opts ? opts.description : null;
      return new src__models__wtypes.CategorySaveRequest.new({base: base != null ? base : this.base, catId: catId != null ? catId : this.catId, kind: kind != null ? kind : this.kind, referenceId: referenceId != null ? referenceId : this.referenceId, referenceMode: referenceMode != null ? referenceMode : this.referenceMode, title: title != null ? title : this.title, description: description != null ? description : this.description});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._CategorySaveRequest.is(other) && dart.equals(other.base, this.base) && other.catId == this.catId && other.kind == this.kind && other.referenceId == this.referenceId && other.referenceMode == this.referenceMode && other.title == this.title && other.description == this.description;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.catId, this.kind, this.referenceId, this.referenceMode, this.title, this.description]);
    }
    toJson() {
      return src__models__wtypes.CategorySaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.CategorySaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let catId = opts && 'catId' in opts ? opts.catId : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    let referenceId = opts && 'referenceId' in opts ? opts.referenceId : null;
    let referenceMode = opts && 'referenceMode' in opts ? opts.referenceMode : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let description = opts && 'description' in opts ? opts.description : null;
    this[base$3] = base;
    this[catId$0] = catId;
    this[kind$1] = kind;
    this[referenceId$] = referenceId;
    this[referenceMode$] = referenceMode;
    this[title$] = title;
    this[description$] = description;
  }).prototype = src__models__wtypes.CategorySaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.CategorySaveRequest);
  const base$3 = Symbol("CategorySaveRequest.base");
  const catId$0 = Symbol("CategorySaveRequest.catId");
  const kind$1 = Symbol("CategorySaveRequest.kind");
  const referenceId$ = Symbol("CategorySaveRequest.referenceId");
  const referenceMode$ = Symbol("CategorySaveRequest.referenceMode");
  const title$ = Symbol("CategorySaveRequest.title");
  const description$ = Symbol("CategorySaveRequest.description");
  src__models__wtypes.CategorySaveRequest[dart.implements] = () => [src__models__wtypes._CategorySaveRequest];
  dart.setMethodSignature(src__models__wtypes.CategorySaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.CategorySaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.CategorySaveRequest, [], {base: src__models__wtypes._APIRequestBase, catId: core.int, kind: core.String, referenceId: core.int, referenceMode: core.String, title: core.String, description: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.CategorySaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.CategorySaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    catId: dart.finalFieldType(core.int),
    kind: dart.finalFieldType(core.String),
    referenceId: dart.finalFieldType(core.int),
    referenceMode: dart.finalFieldType(core.String),
    title: dart.finalFieldType(core.String),
    description: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.CategorySaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.CategorySaveRequest, ['hashCode']);
  let const$1;
  let const$2;
  src__models__wtypes.CategoryMoveContentsRequest = class CategoryMoveContentsRequest extends core.Object {
    get base() {
      return this[base$4];
    }
    set base(value) {
      super.base = value;
    }
    get catId() {
      return this[catId$1];
    }
    set catId(value) {
      super.catId = value;
    }
    get kind() {
      return this[kind$2];
    }
    set kind(value) {
      super.kind = value;
    }
    get relatedIds() {
      return this[relatedIds$];
    }
    set relatedIds(value) {
      super.relatedIds = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let catId = opts && 'catId' in opts ? opts.catId : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      let relatedIds = opts && 'relatedIds' in opts ? opts.relatedIds : null;
      return new src__models__wtypes.CategoryMoveContentsRequest.new({base: base != null ? base : this.base, catId: catId != null ? catId : this.catId, kind: kind != null ? kind : this.kind, relatedIds: relatedIds != null ? relatedIds : this.relatedIds});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._CategoryMoveContentsRequest.is(other) && dart.equals(other.base, this.base) && other.catId == this.catId && other.kind == this.kind && dart.test((const$2 || (const$2 = dart.const(new (ListEqualityOfint()).new(const$1 || (const$1 = dart.const(new (DefaultEqualityOfint()).new())))))).equals(other.relatedIds, this.relatedIds));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.catId, this.kind, this.relatedIds]);
    }
    toJson() {
      return src__models__wtypes.CategoryMoveContentsRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.CategoryMoveContentsRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let catId = opts && 'catId' in opts ? opts.catId : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    let relatedIds = opts && 'relatedIds' in opts ? opts.relatedIds : null;
    this[base$4] = base;
    this[catId$1] = catId;
    this[kind$2] = kind;
    this[relatedIds$] = relatedIds;
  }).prototype = src__models__wtypes.CategoryMoveContentsRequest.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryMoveContentsRequest);
  const base$4 = Symbol("CategoryMoveContentsRequest.base");
  const catId$1 = Symbol("CategoryMoveContentsRequest.catId");
  const kind$2 = Symbol("CategoryMoveContentsRequest.kind");
  const relatedIds$ = Symbol("CategoryMoveContentsRequest.relatedIds");
  src__models__wtypes.CategoryMoveContentsRequest[dart.implements] = () => [src__models__wtypes._CategoryMoveContentsRequest];
  dart.setMethodSignature(src__models__wtypes.CategoryMoveContentsRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.CategoryMoveContentsRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.CategoryMoveContentsRequest, [], {base: src__models__wtypes._APIRequestBase, catId: core.int, kind: core.String, relatedIds: core.List$(core.int)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.CategoryMoveContentsRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.CategoryMoveContentsRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    catId: dart.finalFieldType(core.int),
    kind: dart.finalFieldType(core.String),
    relatedIds: dart.finalFieldType(ListOfint())
  }));
  dart.defineExtensionMethods(src__models__wtypes.CategoryMoveContentsRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.CategoryMoveContentsRequest, ['hashCode']);
  src__models__wtypes.CategoryItemResponse = class CategoryItemResponse extends core.Object {
    get iid() {
      return this[iid$];
    }
    set iid(value) {
      super.iid = value;
    }
    get parentId() {
      return this[parentId$];
    }
    set parentId(value) {
      super.parentId = value;
    }
    get title() {
      return this[title$0];
    }
    set title(value) {
      super.title = value;
    }
    get description() {
      return this[description$0];
    }
    set description(value) {
      super.description = value;
    }
    copyWith(opts) {
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let parentId = opts && 'parentId' in opts ? opts.parentId : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let description = opts && 'description' in opts ? opts.description : null;
      return new src__models__wtypes.CategoryItemResponse.new({iid: iid != null ? iid : this.iid, parentId: parentId != null ? parentId : this.parentId, title: title != null ? title : this.title, description: description != null ? description : this.description});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._CategoryItemResponse.is(other) && other.iid == this.iid && other.parentId == this.parentId && other.title == this.title && other.description == this.description;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.iid, this.parentId, this.title, this.description]);
    }
    toJson() {
      return src__models__wtypes.CategoryItemResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.CategoryItemResponse.new = function(opts) {
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let parentId = opts && 'parentId' in opts ? opts.parentId : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let description = opts && 'description' in opts ? opts.description : null;
    this[iid$] = iid;
    this[parentId$] = parentId;
    this[title$0] = title;
    this[description$0] = description;
  }).prototype = src__models__wtypes.CategoryItemResponse.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryItemResponse);
  const iid$ = Symbol("CategoryItemResponse.iid");
  const parentId$ = Symbol("CategoryItemResponse.parentId");
  const title$0 = Symbol("CategoryItemResponse.title");
  const description$0 = Symbol("CategoryItemResponse.description");
  src__models__wtypes.CategoryItemResponse[dart.implements] = () => [src__models__wtypes._CategoryItemResponse];
  dart.setMethodSignature(src__models__wtypes.CategoryItemResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.CategoryItemResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.CategoryItemResponse, [], {iid: core.int, parentId: core.int, title: core.String, description: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.CategoryItemResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.CategoryItemResponse.__proto__),
    iid: dart.finalFieldType(core.int),
    parentId: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String),
    description: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.CategoryItemResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.CategoryItemResponse, ['hashCode']);
  src__models__wtypes.ConvQueryRequest = class ConvQueryRequest extends core.Object {
    get base() {
      return this[base$5];
    }
    set base(value) {
      super.base = value;
    }
    get term() {
      return this[term$];
    }
    set term(value) {
      super.term = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let term = opts && 'term' in opts ? opts.term : null;
      return new src__models__wtypes.ConvQueryRequest.new({base: base != null ? base : this.base, term: term != null ? term : this.term});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvQueryRequest.is(other) && dart.equals(other.base, this.base) && other.term == this.term;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.term]);
    }
    toJson() {
      return src__models__wtypes.ConvQueryRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvQueryRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let term = opts && 'term' in opts ? opts.term : null;
    this[base$5] = base;
    this[term$] = term;
  }).prototype = src__models__wtypes.ConvQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryRequest);
  const base$5 = Symbol("ConvQueryRequest.base");
  const term$ = Symbol("ConvQueryRequest.term");
  src__models__wtypes.ConvQueryRequest[dart.implements] = () => [src__models__wtypes._ConvQueryRequest];
  dart.setMethodSignature(src__models__wtypes.ConvQueryRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvQueryRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvQueryRequest, [], {base: src__models__wtypes._APIRequestBase, term: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvQueryRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvQueryRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    term: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvQueryRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvQueryRequest, ['hashCode']);
  let const$3;
  let const$4;
  src__models__wtypes.ConvQueryResponse = class ConvQueryResponse extends core.Object {
    get base() {
      return this[base$6];
    }
    set base(value) {
      super.base = value;
    }
    get convs() {
      return this[convs$];
    }
    set convs(value) {
      super.convs = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let convs = opts && 'convs' in opts ? opts.convs : null;
      return new src__models__wtypes.ConvQueryResponse.new({base: base != null ? base : this.base, convs: convs != null ? convs : this.convs});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvQueryResponse.is(other) && dart.equals(other.base, this.base) && dart.test((const$4 || (const$4 = dart.const(new (ListEqualityOf_ConvQueryConvItemResponse()).new(const$3 || (const$3 = dart.const(new (DefaultEqualityOf_ConvQueryConvItemResponse()).new())))))).equals(other.convs, this.convs));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.convs]);
    }
    toJson() {
      return src__models__wtypes.ConvQueryResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvQueryResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let convs = opts && 'convs' in opts ? opts.convs : null;
    this[base$6] = base;
    this[convs$] = convs;
  }).prototype = src__models__wtypes.ConvQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryResponse);
  const base$6 = Symbol("ConvQueryResponse.base");
  const convs$ = Symbol("ConvQueryResponse.convs");
  src__models__wtypes.ConvQueryResponse[dart.implements] = () => [src__models__wtypes._ConvQueryResponse];
  dart.setMethodSignature(src__models__wtypes.ConvQueryResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvQueryResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvQueryResponse, [], {base: src__models__wtypes._APIResponseBase, convs: core.List$(src__models__wtypes._ConvQueryConvItemResponse)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvQueryResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvQueryResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    convs: dart.finalFieldType(ListOf_ConvQueryConvItemResponse())
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvQueryResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvQueryResponse, ['hashCode']);
  let const$5;
  let const$6;
  src__models__wtypes.ConvQueryConvItemResponse = class ConvQueryConvItemResponse extends core.Object {
    get convId() {
      return this[convId$];
    }
    set convId(value) {
      super.convId = value;
    }
    get hitText() {
      return this[hitText$];
    }
    set hitText(value) {
      super.hitText = value;
    }
    get posts() {
      return this[posts$];
    }
    set posts(value) {
      super.posts = value;
    }
    copyWith(opts) {
      let convId = opts && 'convId' in opts ? opts.convId : null;
      let hitText = opts && 'hitText' in opts ? opts.hitText : null;
      let posts = opts && 'posts' in opts ? opts.posts : null;
      return new src__models__wtypes.ConvQueryConvItemResponse.new({convId: convId != null ? convId : this.convId, hitText: hitText != null ? hitText : this.hitText, posts: posts != null ? posts : this.posts});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvQueryConvItemResponse.is(other) && other.convId == this.convId && other.hitText == this.hitText && dart.test((const$6 || (const$6 = dart.const(new (ListEqualityOf_ConvQueryPostItemResponse()).new(const$5 || (const$5 = dart.const(new (DefaultEqualityOf_ConvQueryPostItemResponse()).new())))))).equals(other.posts, this.posts));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.convId, this.hitText, this.posts]);
    }
    toJson() {
      return src__models__wtypes.ConvQueryConvItemResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvQueryConvItemResponse.new = function(opts) {
    let convId = opts && 'convId' in opts ? opts.convId : null;
    let hitText = opts && 'hitText' in opts ? opts.hitText : null;
    let posts = opts && 'posts' in opts ? opts.posts : null;
    this[convId$] = convId;
    this[hitText$] = hitText;
    this[posts$] = posts;
  }).prototype = src__models__wtypes.ConvQueryConvItemResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryConvItemResponse);
  const convId$ = Symbol("ConvQueryConvItemResponse.convId");
  const hitText$ = Symbol("ConvQueryConvItemResponse.hitText");
  const posts$ = Symbol("ConvQueryConvItemResponse.posts");
  src__models__wtypes.ConvQueryConvItemResponse[dart.implements] = () => [src__models__wtypes._ConvQueryConvItemResponse];
  dart.setMethodSignature(src__models__wtypes.ConvQueryConvItemResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvQueryConvItemResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvQueryConvItemResponse, [], {convId: core.int, hitText: core.String, posts: core.List$(src__models__wtypes._ConvQueryPostItemResponse)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvQueryConvItemResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvQueryConvItemResponse.__proto__),
    convId: dart.finalFieldType(core.int),
    hitText: dart.finalFieldType(core.String),
    posts: dart.finalFieldType(ListOf_ConvQueryPostItemResponse())
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvQueryConvItemResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvQueryConvItemResponse, ['hashCode']);
  src__models__wtypes.ConvQueryPostItemResponse = class ConvQueryPostItemResponse extends core.Object {
    get postId() {
      return this[postId$];
    }
    set postId(value) {
      super.postId = value;
    }
    get hitText() {
      return this[hitText$0];
    }
    set hitText(value) {
      super.hitText = value;
    }
    copyWith(opts) {
      let postId = opts && 'postId' in opts ? opts.postId : null;
      let hitText = opts && 'hitText' in opts ? opts.hitText : null;
      return new src__models__wtypes.ConvQueryPostItemResponse.new({postId: postId != null ? postId : this.postId, hitText: hitText != null ? hitText : this.hitText});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvQueryPostItemResponse.is(other) && other.postId == this.postId && other.hitText == this.hitText;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.postId, this.hitText]);
    }
    toJson() {
      return src__models__wtypes.ConvQueryPostItemResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvQueryPostItemResponse.new = function(opts) {
    let postId = opts && 'postId' in opts ? opts.postId : null;
    let hitText = opts && 'hitText' in opts ? opts.hitText : null;
    this[postId$] = postId;
    this[hitText$0] = hitText;
  }).prototype = src__models__wtypes.ConvQueryPostItemResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryPostItemResponse);
  const postId$ = Symbol("ConvQueryPostItemResponse.postId");
  const hitText$0 = Symbol("ConvQueryPostItemResponse.hitText");
  src__models__wtypes.ConvQueryPostItemResponse[dart.implements] = () => [src__models__wtypes._ConvQueryPostItemResponse];
  dart.setMethodSignature(src__models__wtypes.ConvQueryPostItemResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvQueryPostItemResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvQueryPostItemResponse, [], {postId: core.String, hitText: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvQueryPostItemResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvQueryPostItemResponse.__proto__),
    postId: dart.finalFieldType(core.String),
    hitText: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvQueryPostItemResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvQueryPostItemResponse, ['hashCode']);
  src__models__wtypes.ConvGetRequest = class ConvGetRequest extends core.Object {
    get base() {
      return this[base$7];
    }
    set base(value) {
      super.base = value;
    }
    get convId() {
      return this[convId$0];
    }
    set convId(value) {
      super.convId = value;
    }
    get mode() {
      return this[mode$];
    }
    set mode(value) {
      super.mode = value;
    }
    get rangeFromWDT() {
      return this[rangeFromWDT$];
    }
    set rangeFromWDT(value) {
      super.rangeFromWDT = value;
    }
    get rangeToWDT() {
      return this[rangeToWDT$];
    }
    set rangeToWDT(value) {
      super.rangeToWDT = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let convId = opts && 'convId' in opts ? opts.convId : null;
      let mode = opts && 'mode' in opts ? opts.mode : null;
      let rangeFromWDT = opts && 'rangeFromWDT' in opts ? opts.rangeFromWDT : null;
      let rangeToWDT = opts && 'rangeToWDT' in opts ? opts.rangeToWDT : null;
      return new src__models__wtypes.ConvGetRequest.new({base: base != null ? base : this.base, convId: convId != null ? convId : this.convId, mode: mode != null ? mode : this.mode, rangeFromWDT: rangeFromWDT != null ? rangeFromWDT : this.rangeFromWDT, rangeToWDT: rangeToWDT != null ? rangeToWDT : this.rangeToWDT});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvGetRequest.is(other) && dart.equals(other.base, this.base) && other.convId == this.convId && other.mode == this.mode && other.rangeFromWDT == this.rangeFromWDT && other.rangeToWDT == this.rangeToWDT;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.convId, this.mode, this.rangeFromWDT, this.rangeToWDT]);
    }
    toJson() {
      return src__models__wtypes.ConvGetRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvGetRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let convId = opts && 'convId' in opts ? opts.convId : null;
    let mode = opts && 'mode' in opts ? opts.mode : null;
    let rangeFromWDT = opts && 'rangeFromWDT' in opts ? opts.rangeFromWDT : null;
    let rangeToWDT = opts && 'rangeToWDT' in opts ? opts.rangeToWDT : null;
    this[base$7] = base;
    this[convId$0] = convId;
    this[mode$] = mode;
    this[rangeFromWDT$] = rangeFromWDT;
    this[rangeToWDT$] = rangeToWDT;
  }).prototype = src__models__wtypes.ConvGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetRequest);
  const base$7 = Symbol("ConvGetRequest.base");
  const convId$0 = Symbol("ConvGetRequest.convId");
  const mode$ = Symbol("ConvGetRequest.mode");
  const rangeFromWDT$ = Symbol("ConvGetRequest.rangeFromWDT");
  const rangeToWDT$ = Symbol("ConvGetRequest.rangeToWDT");
  src__models__wtypes.ConvGetRequest[dart.implements] = () => [src__models__wtypes._ConvGetRequest];
  dart.setMethodSignature(src__models__wtypes.ConvGetRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvGetRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvGetRequest, [], {base: src__models__wtypes._APIRequestBase, convId: core.int, mode: core.String, rangeFromWDT: core.String, rangeToWDT: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvGetRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvGetRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    convId: dart.finalFieldType(core.int),
    mode: dart.finalFieldType(core.String),
    rangeFromWDT: dart.finalFieldType(core.String),
    rangeToWDT: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvGetRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvGetRequest, ['hashCode']);
  let const$7;
  let const$8;
  src__models__wtypes.ConvGetResponse = class ConvGetResponse extends core.Object {
    get base() {
      return this[base$8];
    }
    set base(value) {
      super.base = value;
    }
    get isManager() {
      return this[isManager$];
    }
    set isManager(value) {
      super.isManager = value;
    }
    get isJoined() {
      return this[isJoined$];
    }
    set isJoined(value) {
      super.isJoined = value;
    }
    get readPositionWDT() {
      return this[readPositionWDT$];
    }
    set readPositionWDT(value) {
      super.readPositionWDT = value;
    }
    get title() {
      return this[title$1];
    }
    set title(value) {
      super.title = value;
    }
    get anySkipped() {
      return this[anySkipped$];
    }
    set anySkipped(value) {
      super.anySkipped = value;
    }
    get posts() {
      return this[posts$0];
    }
    set posts(value) {
      super.posts = value;
    }
    get replyAllowed() {
      return this[replyAllowed$];
    }
    set replyAllowed(value) {
      super.replyAllowed = value;
    }
    get replyAllowedDesc() {
      return this[replyAllowedDesc$];
    }
    set replyAllowedDesc(value) {
      super.replyAllowedDesc = value;
    }
    get replyMaxLength() {
      return this[replyMaxLength$];
    }
    set replyMaxLength(value) {
      super.replyMaxLength = value;
    }
    get deleteMessage() {
      return this[deleteMessage$];
    }
    set deleteMessage(value) {
      super.deleteMessage = value;
    }
    get like() {
      return this[like$];
    }
    set like(value) {
      super.like = value;
    }
    get bookmarked() {
      return this[bookmarked$];
    }
    set bookmarked(value) {
      super.bookmarked = value;
    }
    get parentTitle() {
      return this[parentTitle$];
    }
    set parentTitle(value) {
      super.parentTitle = value;
    }
    get parentPaneKey() {
      return this[parentPaneKey$];
    }
    set parentPaneKey(value) {
      super.parentPaneKey = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let isManager = opts && 'isManager' in opts ? opts.isManager : null;
      let isJoined = opts && 'isJoined' in opts ? opts.isJoined : null;
      let readPositionWDT = opts && 'readPositionWDT' in opts ? opts.readPositionWDT : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let anySkipped = opts && 'anySkipped' in opts ? opts.anySkipped : null;
      let posts = opts && 'posts' in opts ? opts.posts : null;
      let replyAllowed = opts && 'replyAllowed' in opts ? opts.replyAllowed : null;
      let replyAllowedDesc = opts && 'replyAllowedDesc' in opts ? opts.replyAllowedDesc : null;
      let replyMaxLength = opts && 'replyMaxLength' in opts ? opts.replyMaxLength : null;
      let deleteMessage = opts && 'deleteMessage' in opts ? opts.deleteMessage : null;
      let like = opts && 'like' in opts ? opts.like : null;
      let bookmarked = opts && 'bookmarked' in opts ? opts.bookmarked : null;
      let parentTitle = opts && 'parentTitle' in opts ? opts.parentTitle : null;
      let parentPaneKey = opts && 'parentPaneKey' in opts ? opts.parentPaneKey : null;
      return new src__models__wtypes.ConvGetResponse.new({base: base != null ? base : this.base, isManager: isManager != null ? isManager : this.isManager, isJoined: isJoined != null ? isJoined : this.isJoined, readPositionWDT: readPositionWDT != null ? readPositionWDT : this.readPositionWDT, title: title != null ? title : this.title, anySkipped: anySkipped != null ? anySkipped : this.anySkipped, posts: posts != null ? posts : this.posts, replyAllowed: replyAllowed != null ? replyAllowed : this.replyAllowed, replyAllowedDesc: replyAllowedDesc != null ? replyAllowedDesc : this.replyAllowedDesc, replyMaxLength: replyMaxLength != null ? replyMaxLength : this.replyMaxLength, deleteMessage: deleteMessage != null ? deleteMessage : this.deleteMessage, like: like != null ? like : this.like, bookmarked: bookmarked != null ? bookmarked : this.bookmarked, parentTitle: parentTitle != null ? parentTitle : this.parentTitle, parentPaneKey: parentPaneKey != null ? parentPaneKey : this.parentPaneKey});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvGetResponse.is(other) && dart.equals(other.base, this.base) && other.isManager == this.isManager && other.isJoined == this.isJoined && other.readPositionWDT == this.readPositionWDT && other.title == this.title && other.anySkipped == this.anySkipped && dart.test((const$8 || (const$8 = dart.const(new (ListEqualityOf_ConvGetPostItem()).new(const$7 || (const$7 = dart.const(new (DefaultEqualityOf_ConvGetPostItem()).new())))))).equals(other.posts, this.posts)) && other.replyAllowed == this.replyAllowed && other.replyAllowedDesc == this.replyAllowedDesc && other.replyMaxLength == this.replyMaxLength && other.deleteMessage == this.deleteMessage && other.like == this.like && other.bookmarked == this.bookmarked && other.parentTitle == this.parentTitle && other.parentPaneKey == this.parentPaneKey;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.isManager, this.isJoined, this.readPositionWDT, this.title, this.anySkipped, this.posts, this.replyAllowed, this.replyAllowedDesc, this.replyMaxLength, this.deleteMessage, this.like, this.bookmarked, this.parentTitle, this.parentPaneKey]);
    }
    toJson() {
      return src__models__wtypes.ConvGetResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvGetResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let isManager = opts && 'isManager' in opts ? opts.isManager : null;
    let isJoined = opts && 'isJoined' in opts ? opts.isJoined : null;
    let readPositionWDT = opts && 'readPositionWDT' in opts ? opts.readPositionWDT : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let anySkipped = opts && 'anySkipped' in opts ? opts.anySkipped : null;
    let posts = opts && 'posts' in opts ? opts.posts : null;
    let replyAllowed = opts && 'replyAllowed' in opts ? opts.replyAllowed : null;
    let replyAllowedDesc = opts && 'replyAllowedDesc' in opts ? opts.replyAllowedDesc : null;
    let replyMaxLength = opts && 'replyMaxLength' in opts ? opts.replyMaxLength : null;
    let deleteMessage = opts && 'deleteMessage' in opts ? opts.deleteMessage : null;
    let like = opts && 'like' in opts ? opts.like : null;
    let bookmarked = opts && 'bookmarked' in opts ? opts.bookmarked : null;
    let parentTitle = opts && 'parentTitle' in opts ? opts.parentTitle : null;
    let parentPaneKey = opts && 'parentPaneKey' in opts ? opts.parentPaneKey : null;
    this[base$8] = base;
    this[isManager$] = isManager;
    this[isJoined$] = isJoined;
    this[readPositionWDT$] = readPositionWDT;
    this[title$1] = title;
    this[anySkipped$] = anySkipped;
    this[posts$0] = posts;
    this[replyAllowed$] = replyAllowed;
    this[replyAllowedDesc$] = replyAllowedDesc;
    this[replyMaxLength$] = replyMaxLength;
    this[deleteMessage$] = deleteMessage;
    this[like$] = like;
    this[bookmarked$] = bookmarked;
    this[parentTitle$] = parentTitle;
    this[parentPaneKey$] = parentPaneKey;
  }).prototype = src__models__wtypes.ConvGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetResponse);
  const base$8 = Symbol("ConvGetResponse.base");
  const isManager$ = Symbol("ConvGetResponse.isManager");
  const isJoined$ = Symbol("ConvGetResponse.isJoined");
  const readPositionWDT$ = Symbol("ConvGetResponse.readPositionWDT");
  const title$1 = Symbol("ConvGetResponse.title");
  const anySkipped$ = Symbol("ConvGetResponse.anySkipped");
  const posts$0 = Symbol("ConvGetResponse.posts");
  const replyAllowed$ = Symbol("ConvGetResponse.replyAllowed");
  const replyAllowedDesc$ = Symbol("ConvGetResponse.replyAllowedDesc");
  const replyMaxLength$ = Symbol("ConvGetResponse.replyMaxLength");
  const deleteMessage$ = Symbol("ConvGetResponse.deleteMessage");
  const like$ = Symbol("ConvGetResponse.like");
  const bookmarked$ = Symbol("ConvGetResponse.bookmarked");
  const parentTitle$ = Symbol("ConvGetResponse.parentTitle");
  const parentPaneKey$ = Symbol("ConvGetResponse.parentPaneKey");
  src__models__wtypes.ConvGetResponse[dart.implements] = () => [src__models__wtypes._ConvGetResponse];
  dart.setMethodSignature(src__models__wtypes.ConvGetResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvGetResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvGetResponse, [], {base: src__models__wtypes._APIResponseBase, isManager: core.String, isJoined: core.String, readPositionWDT: core.String, title: core.String, anySkipped: core.String, posts: core.List$(src__models__wtypes._ConvGetPostItem), replyAllowed: core.String, replyAllowedDesc: core.String, replyMaxLength: core.int, deleteMessage: core.String, like: core.String, bookmarked: core.String, parentTitle: core.String, parentPaneKey: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvGetResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvGetResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    isManager: dart.finalFieldType(core.String),
    isJoined: dart.finalFieldType(core.String),
    readPositionWDT: dart.finalFieldType(core.String),
    title: dart.finalFieldType(core.String),
    anySkipped: dart.finalFieldType(core.String),
    posts: dart.finalFieldType(ListOf_ConvGetPostItem()),
    replyAllowed: dart.finalFieldType(core.String),
    replyAllowedDesc: dart.finalFieldType(core.String),
    replyMaxLength: dart.finalFieldType(core.int),
    deleteMessage: dart.finalFieldType(core.String),
    like: dart.finalFieldType(core.String),
    bookmarked: dart.finalFieldType(core.String),
    parentTitle: dart.finalFieldType(core.String),
    parentPaneKey: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvGetResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvGetResponse, ['hashCode']);
  src__models__wtypes.ConvGetPostItem = class ConvGetPostItem extends core.Object {
    get iid() {
      return this[iid$0];
    }
    set iid(value) {
      super.iid = value;
    }
    get authorId() {
      return this[authorId$];
    }
    set authorId(value) {
      super.authorId = value;
    }
    get authorNick() {
      return this[authorNick$];
    }
    set authorNick(value) {
      super.authorNick = value;
    }
    get avatarUrl() {
      return this[avatarUrl$];
    }
    set avatarUrl(value) {
      super.avatarUrl = value;
    }
    get createdAtReadable() {
      return this[createdAtReadable$];
    }
    set createdAtReadable(value) {
      super.createdAtReadable = value;
    }
    get createdAtWDT() {
      return this[createdAtWDT$];
    }
    set createdAtWDT(value) {
      super.createdAtWDT = value;
    }
    get ago() {
      return this[ago$];
    }
    set ago(value) {
      super.ago = value;
    }
    get ptext() {
      return this[ptext$];
    }
    set ptext(value) {
      super.ptext = value;
    }
    get imageUrl() {
      return this[imageUrl$];
    }
    set imageUrl(value) {
      super.imageUrl = value;
    }
    get collapseMode() {
      return this[collapseMode$];
    }
    set collapseMode(value) {
      super.collapseMode = value;
    }
    get collapsePosition() {
      return this[collapsePosition$];
    }
    set collapsePosition(value) {
      super.collapsePosition = value;
    }
    copyWith(opts) {
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let authorId = opts && 'authorId' in opts ? opts.authorId : null;
      let authorNick = opts && 'authorNick' in opts ? opts.authorNick : null;
      let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
      let createdAtReadable = opts && 'createdAtReadable' in opts ? opts.createdAtReadable : null;
      let createdAtWDT = opts && 'createdAtWDT' in opts ? opts.createdAtWDT : null;
      let ago = opts && 'ago' in opts ? opts.ago : null;
      let ptext = opts && 'ptext' in opts ? opts.ptext : null;
      let imageUrl = opts && 'imageUrl' in opts ? opts.imageUrl : null;
      let collapseMode = opts && 'collapseMode' in opts ? opts.collapseMode : null;
      let collapsePosition = opts && 'collapsePosition' in opts ? opts.collapsePosition : null;
      return new src__models__wtypes.ConvGetPostItem.new({iid: iid != null ? iid : this.iid, authorId: authorId != null ? authorId : this.authorId, authorNick: authorNick != null ? authorNick : this.authorNick, avatarUrl: avatarUrl != null ? avatarUrl : this.avatarUrl, createdAtReadable: createdAtReadable != null ? createdAtReadable : this.createdAtReadable, createdAtWDT: createdAtWDT != null ? createdAtWDT : this.createdAtWDT, ago: ago != null ? ago : this.ago, ptext: ptext != null ? ptext : this.ptext, imageUrl: imageUrl != null ? imageUrl : this.imageUrl, collapseMode: collapseMode != null ? collapseMode : this.collapseMode, collapsePosition: collapsePosition != null ? collapsePosition : this.collapsePosition});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvGetPostItem.is(other) && other.iid == this.iid && other.authorId == this.authorId && other.authorNick == this.authorNick && other.avatarUrl == this.avatarUrl && other.createdAtReadable == this.createdAtReadable && other.createdAtWDT == this.createdAtWDT && other.ago == this.ago && other.ptext == this.ptext && other.imageUrl == this.imageUrl && other.collapseMode == this.collapseMode && other.collapsePosition == this.collapsePosition;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.iid, this.authorId, this.authorNick, this.avatarUrl, this.createdAtReadable, this.createdAtWDT, this.ago, this.ptext, this.imageUrl, this.collapseMode, this.collapsePosition]);
    }
    toJson() {
      return src__models__wtypes.ConvGetPostItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvGetPostItem.new = function(opts) {
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let authorId = opts && 'authorId' in opts ? opts.authorId : null;
    let authorNick = opts && 'authorNick' in opts ? opts.authorNick : null;
    let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
    let createdAtReadable = opts && 'createdAtReadable' in opts ? opts.createdAtReadable : null;
    let createdAtWDT = opts && 'createdAtWDT' in opts ? opts.createdAtWDT : null;
    let ago = opts && 'ago' in opts ? opts.ago : null;
    let ptext = opts && 'ptext' in opts ? opts.ptext : null;
    let imageUrl = opts && 'imageUrl' in opts ? opts.imageUrl : null;
    let collapseMode = opts && 'collapseMode' in opts ? opts.collapseMode : null;
    let collapsePosition = opts && 'collapsePosition' in opts ? opts.collapsePosition : null;
    this[iid$0] = iid;
    this[authorId$] = authorId;
    this[authorNick$] = authorNick;
    this[avatarUrl$] = avatarUrl;
    this[createdAtReadable$] = createdAtReadable;
    this[createdAtWDT$] = createdAtWDT;
    this[ago$] = ago;
    this[ptext$] = ptext;
    this[imageUrl$] = imageUrl;
    this[collapseMode$] = collapseMode;
    this[collapsePosition$] = collapsePosition;
  }).prototype = src__models__wtypes.ConvGetPostItem.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetPostItem);
  const iid$0 = Symbol("ConvGetPostItem.iid");
  const authorId$ = Symbol("ConvGetPostItem.authorId");
  const authorNick$ = Symbol("ConvGetPostItem.authorNick");
  const avatarUrl$ = Symbol("ConvGetPostItem.avatarUrl");
  const createdAtReadable$ = Symbol("ConvGetPostItem.createdAtReadable");
  const createdAtWDT$ = Symbol("ConvGetPostItem.createdAtWDT");
  const ago$ = Symbol("ConvGetPostItem.ago");
  const ptext$ = Symbol("ConvGetPostItem.ptext");
  const imageUrl$ = Symbol("ConvGetPostItem.imageUrl");
  const collapseMode$ = Symbol("ConvGetPostItem.collapseMode");
  const collapsePosition$ = Symbol("ConvGetPostItem.collapsePosition");
  src__models__wtypes.ConvGetPostItem[dart.implements] = () => [src__models__wtypes._ConvGetPostItem];
  dart.setMethodSignature(src__models__wtypes.ConvGetPostItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvGetPostItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvGetPostItem, [], {iid: core.String, authorId: core.int, authorNick: core.String, avatarUrl: core.String, createdAtReadable: core.String, createdAtWDT: core.String, ago: core.String, ptext: core.String, imageUrl: core.String, collapseMode: core.String, collapsePosition: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvGetPostItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvGetPostItem.__proto__),
    iid: dart.finalFieldType(core.String),
    authorId: dart.finalFieldType(core.int),
    authorNick: dart.finalFieldType(core.String),
    avatarUrl: dart.finalFieldType(core.String),
    createdAtReadable: dart.finalFieldType(core.String),
    createdAtWDT: dart.finalFieldType(core.String),
    ago: dart.finalFieldType(core.String),
    ptext: dart.finalFieldType(core.String),
    imageUrl: dart.finalFieldType(core.String),
    collapseMode: dart.finalFieldType(core.String),
    collapsePosition: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvGetPostItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvGetPostItem, ['hashCode']);
  src__models__wtypes.ConvGetRulesRequest = class ConvGetRulesRequest extends core.Object {
    get base() {
      return this[base$9];
    }
    set base(value) {
      super.base = value;
    }
    get convId() {
      return this[convId$1];
    }
    set convId(value) {
      super.convId = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let convId = opts && 'convId' in opts ? opts.convId : null;
      return new src__models__wtypes.ConvGetRulesRequest.new({base: base != null ? base : this.base, convId: convId != null ? convId : this.convId});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvGetRulesRequest.is(other) && dart.equals(other.base, this.base) && other.convId == this.convId;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.convId]);
    }
    toJson() {
      return src__models__wtypes.ConvGetRulesRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvGetRulesRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let convId = opts && 'convId' in opts ? opts.convId : null;
    this[base$9] = base;
    this[convId$1] = convId;
  }).prototype = src__models__wtypes.ConvGetRulesRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetRulesRequest);
  const base$9 = Symbol("ConvGetRulesRequest.base");
  const convId$1 = Symbol("ConvGetRulesRequest.convId");
  src__models__wtypes.ConvGetRulesRequest[dart.implements] = () => [src__models__wtypes._ConvGetRulesRequest];
  dart.setMethodSignature(src__models__wtypes.ConvGetRulesRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvGetRulesRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvGetRulesRequest, [], {base: src__models__wtypes._APIRequestBase, convId: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvGetRulesRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvGetRulesRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    convId: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvGetRulesRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvGetRulesRequest, ['hashCode']);
  src__models__wtypes.ConvGetRulesResponse = class ConvGetRulesResponse extends core.Object {
    get base() {
      return this[base$10];
    }
    set base(value) {
      super.base = value;
    }
    get postMaxSize() {
      return this[postMaxSize$];
    }
    set postMaxSize(value) {
      super.postMaxSize = value;
    }
    get userDailyMax() {
      return this[userDailyMax$];
    }
    set userDailyMax(value) {
      super.userDailyMax = value;
    }
    get title() {
      return this[title$2];
    }
    set title(value) {
      super.title = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let postMaxSize = opts && 'postMaxSize' in opts ? opts.postMaxSize : null;
      let userDailyMax = opts && 'userDailyMax' in opts ? opts.userDailyMax : null;
      let title = opts && 'title' in opts ? opts.title : null;
      return new src__models__wtypes.ConvGetRulesResponse.new({base: base != null ? base : this.base, postMaxSize: postMaxSize != null ? postMaxSize : this.postMaxSize, userDailyMax: userDailyMax != null ? userDailyMax : this.userDailyMax, title: title != null ? title : this.title});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvGetRulesResponse.is(other) && dart.equals(other.base, this.base) && other.postMaxSize == this.postMaxSize && other.userDailyMax == this.userDailyMax && other.title == this.title;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.postMaxSize, this.userDailyMax, this.title]);
    }
    toJson() {
      return src__models__wtypes.ConvGetRulesResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvGetRulesResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let postMaxSize = opts && 'postMaxSize' in opts ? opts.postMaxSize : null;
    let userDailyMax = opts && 'userDailyMax' in opts ? opts.userDailyMax : null;
    let title = opts && 'title' in opts ? opts.title : null;
    this[base$10] = base;
    this[postMaxSize$] = postMaxSize;
    this[userDailyMax$] = userDailyMax;
    this[title$2] = title;
  }).prototype = src__models__wtypes.ConvGetRulesResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetRulesResponse);
  const base$10 = Symbol("ConvGetRulesResponse.base");
  const postMaxSize$ = Symbol("ConvGetRulesResponse.postMaxSize");
  const userDailyMax$ = Symbol("ConvGetRulesResponse.userDailyMax");
  const title$2 = Symbol("ConvGetRulesResponse.title");
  src__models__wtypes.ConvGetRulesResponse[dart.implements] = () => [src__models__wtypes._ConvGetRulesResponse];
  dart.setMethodSignature(src__models__wtypes.ConvGetRulesResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvGetRulesResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvGetRulesResponse, [], {base: src__models__wtypes._APIResponseBase, postMaxSize: core.int, userDailyMax: core.int, title: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvGetRulesResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvGetRulesResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    postMaxSize: dart.finalFieldType(core.int),
    userDailyMax: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvGetRulesResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvGetRulesResponse, ['hashCode']);
  src__models__wtypes.ConvSaveRequest = class ConvSaveRequest extends core.Object {
    get base() {
      return this[base$11];
    }
    set base(value) {
      super.base = value;
    }
    get convId() {
      return this[convId$2];
    }
    set convId(value) {
      super.convId = value;
    }
    get projectId() {
      return this[projectId$];
    }
    set projectId(value) {
      super.projectId = value;
    }
    get eventId() {
      return this[eventId$];
    }
    set eventId(value) {
      super.eventId = value;
    }
    get fromConvId() {
      return this[fromConvId$];
    }
    set fromConvId(value) {
      super.fromConvId = value;
    }
    get openingPostId() {
      return this[openingPostId$];
    }
    set openingPostId(value) {
      super.openingPostId = value;
    }
    get title() {
      return this[title$3];
    }
    set title(value) {
      super.title = value;
    }
    get postMaxSize() {
      return this[postMaxSize$0];
    }
    set postMaxSize(value) {
      super.postMaxSize = value;
    }
    get userDailyMax() {
      return this[userDailyMax$0];
    }
    set userDailyMax(value) {
      super.userDailyMax = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let convId = opts && 'convId' in opts ? opts.convId : null;
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      let eventId = opts && 'eventId' in opts ? opts.eventId : null;
      let fromConvId = opts && 'fromConvId' in opts ? opts.fromConvId : null;
      let openingPostId = opts && 'openingPostId' in opts ? opts.openingPostId : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let postMaxSize = opts && 'postMaxSize' in opts ? opts.postMaxSize : null;
      let userDailyMax = opts && 'userDailyMax' in opts ? opts.userDailyMax : null;
      return new src__models__wtypes.ConvSaveRequest.new({base: base != null ? base : this.base, convId: convId != null ? convId : this.convId, projectId: projectId != null ? projectId : this.projectId, eventId: eventId != null ? eventId : this.eventId, fromConvId: fromConvId != null ? fromConvId : this.fromConvId, openingPostId: openingPostId != null ? openingPostId : this.openingPostId, title: title != null ? title : this.title, postMaxSize: postMaxSize != null ? postMaxSize : this.postMaxSize, userDailyMax: userDailyMax != null ? userDailyMax : this.userDailyMax});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvSaveRequest.is(other) && dart.equals(other.base, this.base) && other.convId == this.convId && other.projectId == this.projectId && other.eventId == this.eventId && other.fromConvId == this.fromConvId && other.openingPostId == this.openingPostId && other.title == this.title && other.postMaxSize == this.postMaxSize && other.userDailyMax == this.userDailyMax;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.convId, this.projectId, this.eventId, this.fromConvId, this.openingPostId, this.title, this.postMaxSize, this.userDailyMax]);
    }
    toJson() {
      return src__models__wtypes.ConvSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let convId = opts && 'convId' in opts ? opts.convId : null;
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    let eventId = opts && 'eventId' in opts ? opts.eventId : null;
    let fromConvId = opts && 'fromConvId' in opts ? opts.fromConvId : null;
    let openingPostId = opts && 'openingPostId' in opts ? opts.openingPostId : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let postMaxSize = opts && 'postMaxSize' in opts ? opts.postMaxSize : null;
    let userDailyMax = opts && 'userDailyMax' in opts ? opts.userDailyMax : null;
    this[base$11] = base;
    this[convId$2] = convId;
    this[projectId$] = projectId;
    this[eventId$] = eventId;
    this[fromConvId$] = fromConvId;
    this[openingPostId$] = openingPostId;
    this[title$3] = title;
    this[postMaxSize$0] = postMaxSize;
    this[userDailyMax$0] = userDailyMax;
  }).prototype = src__models__wtypes.ConvSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ConvSaveRequest);
  const base$11 = Symbol("ConvSaveRequest.base");
  const convId$2 = Symbol("ConvSaveRequest.convId");
  const projectId$ = Symbol("ConvSaveRequest.projectId");
  const eventId$ = Symbol("ConvSaveRequest.eventId");
  const fromConvId$ = Symbol("ConvSaveRequest.fromConvId");
  const openingPostId$ = Symbol("ConvSaveRequest.openingPostId");
  const title$3 = Symbol("ConvSaveRequest.title");
  const postMaxSize$0 = Symbol("ConvSaveRequest.postMaxSize");
  const userDailyMax$0 = Symbol("ConvSaveRequest.userDailyMax");
  src__models__wtypes.ConvSaveRequest[dart.implements] = () => [src__models__wtypes._ConvSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ConvSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvSaveRequest, [], {base: src__models__wtypes._APIRequestBase, convId: core.int, projectId: core.int, eventId: core.int, fromConvId: core.int, openingPostId: core.String, title: core.String, postMaxSize: core.int, userDailyMax: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    convId: dart.finalFieldType(core.int),
    projectId: dart.finalFieldType(core.int),
    eventId: dart.finalFieldType(core.int),
    fromConvId: dart.finalFieldType(core.int),
    openingPostId: dart.finalFieldType(core.String),
    title: dart.finalFieldType(core.String),
    postMaxSize: dart.finalFieldType(core.int),
    userDailyMax: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvSaveRequest, ['hashCode']);
  src__models__wtypes.ConvPostGetRequest = class ConvPostGetRequest extends core.Object {
    get base() {
      return this[base$12];
    }
    set base(value) {
      super.base = value;
    }
    get postId() {
      return this[postId$0];
    }
    set postId(value) {
      super.postId = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let postId = opts && 'postId' in opts ? opts.postId : null;
      return new src__models__wtypes.ConvPostGetRequest.new({base: base != null ? base : this.base, postId: postId != null ? postId : this.postId});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvPostGetRequest.is(other) && dart.equals(other.base, this.base) && other.postId == this.postId;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.postId]);
    }
    toJson() {
      return src__models__wtypes.ConvPostGetRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvPostGetRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let postId = opts && 'postId' in opts ? opts.postId : null;
    this[base$12] = base;
    this[postId$0] = postId;
  }).prototype = src__models__wtypes.ConvPostGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostGetRequest);
  const base$12 = Symbol("ConvPostGetRequest.base");
  const postId$0 = Symbol("ConvPostGetRequest.postId");
  src__models__wtypes.ConvPostGetRequest[dart.implements] = () => [src__models__wtypes._ConvPostGetRequest];
  dart.setMethodSignature(src__models__wtypes.ConvPostGetRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvPostGetRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvPostGetRequest, [], {base: src__models__wtypes._APIRequestBase, postId: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvPostGetRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvPostGetRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    postId: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvPostGetRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvPostGetRequest, ['hashCode']);
  src__models__wtypes.ConvPostGetResponse = class ConvPostGetResponse extends core.Object {
    get base() {
      return this[base$13];
    }
    set base(value) {
      super.base = value;
    }
    get avatarUrl() {
      return this[avatarUrl$0];
    }
    set avatarUrl(value) {
      super.avatarUrl = value;
    }
    get createdAtReadable() {
      return this[createdAtReadable$0];
    }
    set createdAtReadable(value) {
      super.createdAtReadable = value;
    }
    get reaction() {
      return this[reaction$];
    }
    set reaction(value) {
      super.reaction = value;
    }
    get throttleDescription() {
      return this[throttleDescription$];
    }
    set throttleDescription(value) {
      super.throttleDescription = value;
    }
    get canCensor() {
      return this[canCensor$];
    }
    set canCensor(value) {
      super.canCensor = value;
    }
    get allReasons() {
      return this[allReasons$];
    }
    set allReasons(value) {
      super.allReasons = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
      let createdAtReadable = opts && 'createdAtReadable' in opts ? opts.createdAtReadable : null;
      let reaction = opts && 'reaction' in opts ? opts.reaction : null;
      let throttleDescription = opts && 'throttleDescription' in opts ? opts.throttleDescription : null;
      let canCensor = opts && 'canCensor' in opts ? opts.canCensor : null;
      let allReasons = opts && 'allReasons' in opts ? opts.allReasons : null;
      return new src__models__wtypes.ConvPostGetResponse.new({base: base != null ? base : this.base, avatarUrl: avatarUrl != null ? avatarUrl : this.avatarUrl, createdAtReadable: createdAtReadable != null ? createdAtReadable : this.createdAtReadable, reaction: reaction != null ? reaction : this.reaction, throttleDescription: throttleDescription != null ? throttleDescription : this.throttleDescription, canCensor: canCensor != null ? canCensor : this.canCensor, allReasons: allReasons != null ? allReasons : this.allReasons});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvPostGetResponse.is(other) && dart.equals(other.base, this.base) && other.avatarUrl == this.avatarUrl && other.createdAtReadable == this.createdAtReadable && other.reaction == this.reaction && other.throttleDescription == this.throttleDescription && other.canCensor == this.canCensor && other.allReasons == this.allReasons;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.avatarUrl, this.createdAtReadable, this.reaction, this.throttleDescription, this.canCensor, this.allReasons]);
    }
    toJson() {
      return src__models__wtypes.ConvPostGetResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvPostGetResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
    let createdAtReadable = opts && 'createdAtReadable' in opts ? opts.createdAtReadable : null;
    let reaction = opts && 'reaction' in opts ? opts.reaction : null;
    let throttleDescription = opts && 'throttleDescription' in opts ? opts.throttleDescription : null;
    let canCensor = opts && 'canCensor' in opts ? opts.canCensor : null;
    let allReasons = opts && 'allReasons' in opts ? opts.allReasons : null;
    this[base$13] = base;
    this[avatarUrl$0] = avatarUrl;
    this[createdAtReadable$0] = createdAtReadable;
    this[reaction$] = reaction;
    this[throttleDescription$] = throttleDescription;
    this[canCensor$] = canCensor;
    this[allReasons$] = allReasons;
  }).prototype = src__models__wtypes.ConvPostGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostGetResponse);
  const base$13 = Symbol("ConvPostGetResponse.base");
  const avatarUrl$0 = Symbol("ConvPostGetResponse.avatarUrl");
  const createdAtReadable$0 = Symbol("ConvPostGetResponse.createdAtReadable");
  const reaction$ = Symbol("ConvPostGetResponse.reaction");
  const throttleDescription$ = Symbol("ConvPostGetResponse.throttleDescription");
  const canCensor$ = Symbol("ConvPostGetResponse.canCensor");
  const allReasons$ = Symbol("ConvPostGetResponse.allReasons");
  src__models__wtypes.ConvPostGetResponse[dart.implements] = () => [src__models__wtypes._ConvPostGetResponse];
  dart.setMethodSignature(src__models__wtypes.ConvPostGetResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvPostGetResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvPostGetResponse, [], {base: src__models__wtypes._APIResponseBase, avatarUrl: core.String, createdAtReadable: core.String, reaction: core.String, throttleDescription: core.String, canCensor: core.String, allReasons: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvPostGetResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvPostGetResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    avatarUrl: dart.finalFieldType(core.String),
    createdAtReadable: dart.finalFieldType(core.String),
    reaction: dart.finalFieldType(core.String),
    throttleDescription: dart.finalFieldType(core.String),
    canCensor: dart.finalFieldType(core.String),
    allReasons: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvPostGetResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvPostGetResponse, ['hashCode']);
  src__models__wtypes.ConvPostSaveRequest = class ConvPostSaveRequest extends core.Object {
    get base() {
      return this[base$14];
    }
    set base(value) {
      super.base = value;
    }
    get convId() {
      return this[convId$3];
    }
    set convId(value) {
      super.convId = value;
    }
    get postId() {
      return this[postId$1];
    }
    set postId(value) {
      super.postId = value;
    }
    get triggerWarning() {
      return this[triggerWarning$];
    }
    set triggerWarning(value) {
      super.triggerWarning = value;
    }
    get ptext() {
      return this[ptext$0];
    }
    set ptext(value) {
      super.ptext = value;
    }
    get censored() {
      return this[censored$];
    }
    set censored(value) {
      super.censored = value;
    }
    get delete() {
      return this[delete$];
    }
    set delete(value) {
      super.delete = value;
    }
    get lastKnownWDT() {
      return this[lastKnownWDT$];
    }
    set lastKnownWDT(value) {
      super.lastKnownWDT = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let convId = opts && 'convId' in opts ? opts.convId : null;
      let postId = opts && 'postId' in opts ? opts.postId : null;
      let triggerWarning = opts && 'triggerWarning' in opts ? opts.triggerWarning : null;
      let ptext = opts && 'ptext' in opts ? opts.ptext : null;
      let censored = opts && 'censored' in opts ? opts.censored : null;
      let delete$0 = opts && 'delete' in opts ? opts.delete : null;
      let lastKnownWDT = opts && 'lastKnownWDT' in opts ? opts.lastKnownWDT : null;
      return new src__models__wtypes.ConvPostSaveRequest.new({base: base != null ? base : this.base, convId: convId != null ? convId : this.convId, postId: postId != null ? postId : this.postId, triggerWarning: triggerWarning != null ? triggerWarning : this.triggerWarning, ptext: ptext != null ? ptext : this.ptext, censored: censored != null ? censored : this.censored, delete: delete$0 != null ? delete$0 : this.delete, lastKnownWDT: lastKnownWDT != null ? lastKnownWDT : this.lastKnownWDT});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvPostSaveRequest.is(other) && dart.equals(other.base, this.base) && other.convId == this.convId && other.postId == this.postId && other.triggerWarning == this.triggerWarning && other.ptext == this.ptext && other.censored == this.censored && other.delete == this.delete && other.lastKnownWDT == this.lastKnownWDT;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.convId, this.postId, this.triggerWarning, this.ptext, this.censored, this.delete, this.lastKnownWDT]);
    }
    toJson() {
      return src__models__wtypes.ConvPostSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvPostSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let convId = opts && 'convId' in opts ? opts.convId : null;
    let postId = opts && 'postId' in opts ? opts.postId : null;
    let triggerWarning = opts && 'triggerWarning' in opts ? opts.triggerWarning : null;
    let ptext = opts && 'ptext' in opts ? opts.ptext : null;
    let censored = opts && 'censored' in opts ? opts.censored : null;
    let delete$0 = opts && 'delete' in opts ? opts.delete : null;
    let lastKnownWDT = opts && 'lastKnownWDT' in opts ? opts.lastKnownWDT : null;
    this[base$14] = base;
    this[convId$3] = convId;
    this[postId$1] = postId;
    this[triggerWarning$] = triggerWarning;
    this[ptext$0] = ptext;
    this[censored$] = censored;
    this[delete$] = delete$0;
    this[lastKnownWDT$] = lastKnownWDT;
  }).prototype = src__models__wtypes.ConvPostSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostSaveRequest);
  const base$14 = Symbol("ConvPostSaveRequest.base");
  const convId$3 = Symbol("ConvPostSaveRequest.convId");
  const postId$1 = Symbol("ConvPostSaveRequest.postId");
  const triggerWarning$ = Symbol("ConvPostSaveRequest.triggerWarning");
  const ptext$0 = Symbol("ConvPostSaveRequest.ptext");
  const censored$ = Symbol("ConvPostSaveRequest.censored");
  const delete$ = Symbol("ConvPostSaveRequest.delete");
  const lastKnownWDT$ = Symbol("ConvPostSaveRequest.lastKnownWDT");
  src__models__wtypes.ConvPostSaveRequest[dart.implements] = () => [src__models__wtypes._ConvPostSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ConvPostSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvPostSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvPostSaveRequest, [], {base: src__models__wtypes._APIRequestBase, convId: core.int, postId: core.String, triggerWarning: core.String, ptext: core.String, censored: core.String, delete: core.String, lastKnownWDT: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvPostSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvPostSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    convId: dart.finalFieldType(core.int),
    postId: dart.finalFieldType(core.String),
    triggerWarning: dart.finalFieldType(core.String),
    ptext: dart.finalFieldType(core.String),
    censored: dart.finalFieldType(core.String),
    delete: dart.finalFieldType(core.String),
    lastKnownWDT: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvPostSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvPostSaveRequest, ['hashCode']);
  let const$9;
  let const$10;
  src__models__wtypes.ConvPostImageSaveRequest = class ConvPostImageSaveRequest extends core.Object {
    get base() {
      return this[base$15];
    }
    set base(value) {
      super.base = value;
    }
    get convId() {
      return this[convId$4];
    }
    set convId(value) {
      super.convId = value;
    }
    get ptext() {
      return this[ptext$1];
    }
    set ptext(value) {
      super.ptext = value;
    }
    get imageBytes() {
      return this[imageBytes$];
    }
    set imageBytes(value) {
      super.imageBytes = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let convId = opts && 'convId' in opts ? opts.convId : null;
      let ptext = opts && 'ptext' in opts ? opts.ptext : null;
      let imageBytes = opts && 'imageBytes' in opts ? opts.imageBytes : null;
      return new src__models__wtypes.ConvPostImageSaveRequest.new({base: base != null ? base : this.base, convId: convId != null ? convId : this.convId, ptext: ptext != null ? ptext : this.ptext, imageBytes: imageBytes != null ? imageBytes : this.imageBytes});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvPostImageSaveRequest.is(other) && dart.equals(other.base, this.base) && other.convId == this.convId && other.ptext == this.ptext && dart.test((const$10 || (const$10 = dart.const(new (ListEqualityOfint()).new(const$9 || (const$9 = dart.const(new (DefaultEqualityOfint()).new())))))).equals(other.imageBytes, this.imageBytes));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.convId, this.ptext, this.imageBytes]);
    }
    toJson() {
      return src__models__wtypes.ConvPostImageSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvPostImageSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let convId = opts && 'convId' in opts ? opts.convId : null;
    let ptext = opts && 'ptext' in opts ? opts.ptext : null;
    let imageBytes = opts && 'imageBytes' in opts ? opts.imageBytes : null;
    this[base$15] = base;
    this[convId$4] = convId;
    this[ptext$1] = ptext;
    this[imageBytes$] = imageBytes;
  }).prototype = src__models__wtypes.ConvPostImageSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostImageSaveRequest);
  const base$15 = Symbol("ConvPostImageSaveRequest.base");
  const convId$4 = Symbol("ConvPostImageSaveRequest.convId");
  const ptext$1 = Symbol("ConvPostImageSaveRequest.ptext");
  const imageBytes$ = Symbol("ConvPostImageSaveRequest.imageBytes");
  src__models__wtypes.ConvPostImageSaveRequest[dart.implements] = () => [src__models__wtypes._ConvPostImageSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ConvPostImageSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvPostImageSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvPostImageSaveRequest, [], {base: src__models__wtypes._APIRequestBase, convId: core.int, ptext: core.String, imageBytes: core.List$(core.int)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvPostImageSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvPostImageSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    convId: dart.finalFieldType(core.int),
    ptext: dart.finalFieldType(core.String),
    imageBytes: dart.finalFieldType(ListOfint())
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvPostImageSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvPostImageSaveRequest, ['hashCode']);
  src__models__wtypes.ConvPostUserSaveRequest = class ConvPostUserSaveRequest extends core.Object {
    get base() {
      return this[base$16];
    }
    set base(value) {
      super.base = value;
    }
    get postId() {
      return this[postId$2];
    }
    set postId(value) {
      super.postId = value;
    }
    get reaction() {
      return this[reaction$0];
    }
    set reaction(value) {
      super.reaction = value;
    }
    get reason() {
      return this[reason$];
    }
    set reason(value) {
      super.reason = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let postId = opts && 'postId' in opts ? opts.postId : null;
      let reaction = opts && 'reaction' in opts ? opts.reaction : null;
      let reason = opts && 'reason' in opts ? opts.reason : null;
      return new src__models__wtypes.ConvPostUserSaveRequest.new({base: base != null ? base : this.base, postId: postId != null ? postId : this.postId, reaction: reaction != null ? reaction : this.reaction, reason: reason != null ? reason : this.reason});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvPostUserSaveRequest.is(other) && dart.equals(other.base, this.base) && other.postId == this.postId && other.reaction == this.reaction && other.reason == this.reason;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.postId, this.reaction, this.reason]);
    }
    toJson() {
      return src__models__wtypes.ConvPostUserSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvPostUserSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let postId = opts && 'postId' in opts ? opts.postId : null;
    let reaction = opts && 'reaction' in opts ? opts.reaction : null;
    let reason = opts && 'reason' in opts ? opts.reason : null;
    this[base$16] = base;
    this[postId$2] = postId;
    this[reaction$0] = reaction;
    this[reason$] = reason;
  }).prototype = src__models__wtypes.ConvPostUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostUserSaveRequest);
  const base$16 = Symbol("ConvPostUserSaveRequest.base");
  const postId$2 = Symbol("ConvPostUserSaveRequest.postId");
  const reaction$0 = Symbol("ConvPostUserSaveRequest.reaction");
  const reason$ = Symbol("ConvPostUserSaveRequest.reason");
  src__models__wtypes.ConvPostUserSaveRequest[dart.implements] = () => [src__models__wtypes._ConvPostUserSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ConvPostUserSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvPostUserSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvPostUserSaveRequest, [], {base: src__models__wtypes._APIRequestBase, postId: core.String, reaction: core.String, reason: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvPostUserSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvPostUserSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    postId: dart.finalFieldType(core.String),
    reaction: dart.finalFieldType(core.String),
    reason: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvPostUserSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvPostUserSaveRequest, ['hashCode']);
  src__models__wtypes.ConvSetReadPositionRequest = class ConvSetReadPositionRequest extends core.Object {
    get base() {
      return this[base$17];
    }
    set base(value) {
      super.base = value;
    }
    get convId() {
      return this[convId$5];
    }
    set convId(value) {
      super.convId = value;
    }
    get positionWDT() {
      return this[positionWDT$];
    }
    set positionWDT(value) {
      super.positionWDT = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let convId = opts && 'convId' in opts ? opts.convId : null;
      let positionWDT = opts && 'positionWDT' in opts ? opts.positionWDT : null;
      return new src__models__wtypes.ConvSetReadPositionRequest.new({base: base != null ? base : this.base, convId: convId != null ? convId : this.convId, positionWDT: positionWDT != null ? positionWDT : this.positionWDT});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvSetReadPositionRequest.is(other) && dart.equals(other.base, this.base) && other.convId == this.convId && other.positionWDT == this.positionWDT;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.convId, this.positionWDT]);
    }
    toJson() {
      return src__models__wtypes.ConvSetReadPositionRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvSetReadPositionRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let convId = opts && 'convId' in opts ? opts.convId : null;
    let positionWDT = opts && 'positionWDT' in opts ? opts.positionWDT : null;
    this[base$17] = base;
    this[convId$5] = convId;
    this[positionWDT$] = positionWDT;
  }).prototype = src__models__wtypes.ConvSetReadPositionRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ConvSetReadPositionRequest);
  const base$17 = Symbol("ConvSetReadPositionRequest.base");
  const convId$5 = Symbol("ConvSetReadPositionRequest.convId");
  const positionWDT$ = Symbol("ConvSetReadPositionRequest.positionWDT");
  src__models__wtypes.ConvSetReadPositionRequest[dart.implements] = () => [src__models__wtypes._ConvSetReadPositionRequest];
  dart.setMethodSignature(src__models__wtypes.ConvSetReadPositionRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvSetReadPositionRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvSetReadPositionRequest, [], {base: src__models__wtypes._APIRequestBase, convId: core.int, positionWDT: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvSetReadPositionRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvSetReadPositionRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    convId: dart.finalFieldType(core.int),
    positionWDT: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvSetReadPositionRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvSetReadPositionRequest, ['hashCode']);
  src__models__wtypes.ConvUserSaveRequest = class ConvUserSaveRequest extends core.Object {
    get base() {
      return this[base$18];
    }
    set base(value) {
      super.base = value;
    }
    get convId() {
      return this[convId$6];
    }
    set convId(value) {
      super.convId = value;
    }
    get status() {
      return this[status$];
    }
    set status(value) {
      super.status = value;
    }
    get like() {
      return this[like$0];
    }
    set like(value) {
      super.like = value;
    }
    get bookmarked() {
      return this[bookmarked$0];
    }
    set bookmarked(value) {
      super.bookmarked = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let convId = opts && 'convId' in opts ? opts.convId : null;
      let status = opts && 'status' in opts ? opts.status : null;
      let like = opts && 'like' in opts ? opts.like : null;
      let bookmarked = opts && 'bookmarked' in opts ? opts.bookmarked : null;
      return new src__models__wtypes.ConvUserSaveRequest.new({base: base != null ? base : this.base, convId: convId != null ? convId : this.convId, status: status != null ? status : this.status, like: like != null ? like : this.like, bookmarked: bookmarked != null ? bookmarked : this.bookmarked});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvUserSaveRequest.is(other) && dart.equals(other.base, this.base) && other.convId == this.convId && other.status == this.status && other.like == this.like && other.bookmarked == this.bookmarked;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.convId, this.status, this.like, this.bookmarked]);
    }
    toJson() {
      return src__models__wtypes.ConvUserSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvUserSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let convId = opts && 'convId' in opts ? opts.convId : null;
    let status = opts && 'status' in opts ? opts.status : null;
    let like = opts && 'like' in opts ? opts.like : null;
    let bookmarked = opts && 'bookmarked' in opts ? opts.bookmarked : null;
    this[base$18] = base;
    this[convId$6] = convId;
    this[status$] = status;
    this[like$0] = like;
    this[bookmarked$0] = bookmarked;
  }).prototype = src__models__wtypes.ConvUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ConvUserSaveRequest);
  const base$18 = Symbol("ConvUserSaveRequest.base");
  const convId$6 = Symbol("ConvUserSaveRequest.convId");
  const status$ = Symbol("ConvUserSaveRequest.status");
  const like$0 = Symbol("ConvUserSaveRequest.like");
  const bookmarked$0 = Symbol("ConvUserSaveRequest.bookmarked");
  src__models__wtypes.ConvUserSaveRequest[dart.implements] = () => [src__models__wtypes._ConvUserSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ConvUserSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvUserSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvUserSaveRequest, [], {base: src__models__wtypes._APIRequestBase, convId: core.int, status: core.String, like: core.String, bookmarked: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvUserSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvUserSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    convId: dart.finalFieldType(core.int),
    status: dart.finalFieldType(core.String),
    like: dart.finalFieldType(core.String),
    bookmarked: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvUserSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvUserSaveRequest, ['hashCode']);
  src__models__wtypes.ConvUserSaveResponse = class ConvUserSaveResponse extends core.Object {
    get base() {
      return this[base$19];
    }
    set base(value) {
      super.base = value;
    }
    get action() {
      return this[action$];
    }
    set action(value) {
      super.action = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let action = opts && 'action' in opts ? opts.action : null;
      return new src__models__wtypes.ConvUserSaveResponse.new({base: base != null ? base : this.base, action: action != null ? action : this.action});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ConvUserSaveResponse.is(other) && dart.equals(other.base, this.base) && other.action == this.action;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.action]);
    }
    toJson() {
      return src__models__wtypes.ConvUserSaveResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ConvUserSaveResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let action = opts && 'action' in opts ? opts.action : null;
    this[base$19] = base;
    this[action$] = action;
  }).prototype = src__models__wtypes.ConvUserSaveResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ConvUserSaveResponse);
  const base$19 = Symbol("ConvUserSaveResponse.base");
  const action$ = Symbol("ConvUserSaveResponse.action");
  src__models__wtypes.ConvUserSaveResponse[dart.implements] = () => [src__models__wtypes._ConvUserSaveResponse];
  dart.setMethodSignature(src__models__wtypes.ConvUserSaveResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ConvUserSaveResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ConvUserSaveResponse, [], {base: src__models__wtypes._APIResponseBase, action: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ConvUserSaveResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ConvUserSaveResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    action: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ConvUserSaveResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ConvUserSaveResponse, ['hashCode']);
  src__models__wtypes.DocQueryRequest = class DocQueryRequest extends core.Object {
    get base() {
      return this[base$20];
    }
    set base(value) {
      super.base = value;
    }
    get mode() {
      return this[mode$0];
    }
    set mode(value) {
      super.mode = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let mode = opts && 'mode' in opts ? opts.mode : null;
      return new src__models__wtypes.DocQueryRequest.new({base: base != null ? base : this.base, mode: mode != null ? mode : this.mode});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._DocQueryRequest.is(other) && dart.equals(other.base, this.base) && other.mode == this.mode;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.mode]);
    }
    toJson() {
      return src__models__wtypes.DocQueryRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.DocQueryRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let mode = opts && 'mode' in opts ? opts.mode : null;
    this[base$20] = base;
    this[mode$0] = mode;
  }).prototype = src__models__wtypes.DocQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes.DocQueryRequest);
  const base$20 = Symbol("DocQueryRequest.base");
  const mode$0 = Symbol("DocQueryRequest.mode");
  src__models__wtypes.DocQueryRequest[dart.implements] = () => [src__models__wtypes._DocQueryRequest];
  dart.setMethodSignature(src__models__wtypes.DocQueryRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.DocQueryRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.DocQueryRequest, [], {base: src__models__wtypes._APIRequestBase, mode: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.DocQueryRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.DocQueryRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    mode: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.DocQueryRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.DocQueryRequest, ['hashCode']);
  let const$11;
  let const$12;
  src__models__wtypes.DocQueryResponse = class DocQueryResponse extends core.Object {
    get base() {
      return this[base$21];
    }
    set base(value) {
      super.base = value;
    }
    get docs() {
      return this[docs$];
    }
    set docs(value) {
      super.docs = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let docs = opts && 'docs' in opts ? opts.docs : null;
      return new src__models__wtypes.DocQueryResponse.new({base: base != null ? base : this.base, docs: docs != null ? docs : this.docs});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._DocQueryResponse.is(other) && dart.equals(other.base, this.base) && dart.test((const$12 || (const$12 = dart.const(new (ListEqualityOf_DocQueryItem()).new(const$11 || (const$11 = dart.const(new (DefaultEqualityOf_DocQueryItem()).new())))))).equals(other.docs, this.docs));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.docs]);
    }
    toJson() {
      return src__models__wtypes.DocQueryResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.DocQueryResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let docs = opts && 'docs' in opts ? opts.docs : null;
    this[base$21] = base;
    this[docs$] = docs;
  }).prototype = src__models__wtypes.DocQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes.DocQueryResponse);
  const base$21 = Symbol("DocQueryResponse.base");
  const docs$ = Symbol("DocQueryResponse.docs");
  src__models__wtypes.DocQueryResponse[dart.implements] = () => [src__models__wtypes._DocQueryResponse];
  dart.setMethodSignature(src__models__wtypes.DocQueryResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.DocQueryResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.DocQueryResponse, [], {base: src__models__wtypes._APIResponseBase, docs: core.List$(src__models__wtypes._DocQueryItem)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.DocQueryResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.DocQueryResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    docs: dart.finalFieldType(ListOf_DocQueryItem())
  }));
  dart.defineExtensionMethods(src__models__wtypes.DocQueryResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.DocQueryResponse, ['hashCode']);
  src__models__wtypes.DocQueryItem = class DocQueryItem extends core.Object {
    get iid() {
      return this[iid$1];
    }
    set iid(value) {
      super.iid = value;
    }
    get title() {
      return this[title$4];
    }
    set title(value) {
      super.title = value;
    }
    copyWith(opts) {
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let title = opts && 'title' in opts ? opts.title : null;
      return new src__models__wtypes.DocQueryItem.new({iid: iid != null ? iid : this.iid, title: title != null ? title : this.title});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._DocQueryItem.is(other) && other.iid == this.iid && other.title == this.title;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.iid, this.title]);
    }
    toJson() {
      return src__models__wtypes.DocQueryItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.DocQueryItem.new = function(opts) {
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let title = opts && 'title' in opts ? opts.title : null;
    this[iid$1] = iid;
    this[title$4] = title;
  }).prototype = src__models__wtypes.DocQueryItem.prototype;
  dart.addTypeTests(src__models__wtypes.DocQueryItem);
  const iid$1 = Symbol("DocQueryItem.iid");
  const title$4 = Symbol("DocQueryItem.title");
  src__models__wtypes.DocQueryItem[dart.implements] = () => [src__models__wtypes._DocQueryItem];
  dart.setMethodSignature(src__models__wtypes.DocQueryItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.DocQueryItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.DocQueryItem, [], {iid: core.int, title: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.DocQueryItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.DocQueryItem.__proto__),
    iid: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.DocQueryItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.DocQueryItem, ['hashCode']);
  src__models__wtypes.DocGetRequest = class DocGetRequest extends core.Object {
    get base() {
      return this[base$22];
    }
    set base(value) {
      super.base = value;
    }
    get docId() {
      return this[docId$];
    }
    set docId(value) {
      super.docId = value;
    }
    get specialCode() {
      return this[specialCode$];
    }
    set specialCode(value) {
      super.specialCode = value;
    }
    get revisionNo() {
      return this[revisionNo$];
    }
    set revisionNo(value) {
      super.revisionNo = value;
    }
    get getVerList() {
      return this[getVerList$];
    }
    set getVerList(value) {
      super.getVerList = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let docId = opts && 'docId' in opts ? opts.docId : null;
      let specialCode = opts && 'specialCode' in opts ? opts.specialCode : null;
      let revisionNo = opts && 'revisionNo' in opts ? opts.revisionNo : null;
      let getVerList = opts && 'getVerList' in opts ? opts.getVerList : null;
      return new src__models__wtypes.DocGetRequest.new({base: base != null ? base : this.base, docId: docId != null ? docId : this.docId, specialCode: specialCode != null ? specialCode : this.specialCode, revisionNo: revisionNo != null ? revisionNo : this.revisionNo, getVerList: getVerList != null ? getVerList : this.getVerList});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._DocGetRequest.is(other) && dart.equals(other.base, this.base) && other.docId == this.docId && other.specialCode == this.specialCode && other.revisionNo == this.revisionNo && other.getVerList == this.getVerList;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.docId, this.specialCode, this.revisionNo, this.getVerList]);
    }
    toJson() {
      return src__models__wtypes.DocGetRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.DocGetRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let docId = opts && 'docId' in opts ? opts.docId : null;
    let specialCode = opts && 'specialCode' in opts ? opts.specialCode : null;
    let revisionNo = opts && 'revisionNo' in opts ? opts.revisionNo : null;
    let getVerList = opts && 'getVerList' in opts ? opts.getVerList : null;
    this[base$22] = base;
    this[docId$] = docId;
    this[specialCode$] = specialCode;
    this[revisionNo$] = revisionNo;
    this[getVerList$] = getVerList;
  }).prototype = src__models__wtypes.DocGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes.DocGetRequest);
  const base$22 = Symbol("DocGetRequest.base");
  const docId$ = Symbol("DocGetRequest.docId");
  const specialCode$ = Symbol("DocGetRequest.specialCode");
  const revisionNo$ = Symbol("DocGetRequest.revisionNo");
  const getVerList$ = Symbol("DocGetRequest.getVerList");
  src__models__wtypes.DocGetRequest[dart.implements] = () => [src__models__wtypes._DocGetRequest];
  dart.setMethodSignature(src__models__wtypes.DocGetRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.DocGetRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.DocGetRequest, [], {base: src__models__wtypes._APIRequestBase, docId: core.int, specialCode: core.String, revisionNo: core.int, getVerList: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.DocGetRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.DocGetRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    docId: dart.finalFieldType(core.int),
    specialCode: dart.finalFieldType(core.String),
    revisionNo: dart.finalFieldType(core.int),
    getVerList: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.DocGetRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.DocGetRequest, ['hashCode']);
  let const$13;
  let const$14;
  src__models__wtypes.DocGetResponse = class DocGetResponse extends core.Object {
    get base() {
      return this[base$23];
    }
    set base(value) {
      super.base = value;
    }
    get docId() {
      return this[docId$0];
    }
    set docId(value) {
      super.docId = value;
    }
    get title() {
      return this[title$5];
    }
    set title(value) {
      super.title = value;
    }
    get body() {
      return this[body$];
    }
    set body(value) {
      super.body = value;
    }
    get htmlDiff() {
      return this[htmlDiff$];
    }
    set htmlDiff(value) {
      super.htmlDiff = value;
    }
    get projectId() {
      return this[projectId$0];
    }
    set projectId(value) {
      super.projectId = value;
    }
    get projectTitle() {
      return this[projectTitle$];
    }
    set projectTitle(value) {
      super.projectTitle = value;
    }
    get isProjectManager() {
      return this[isProjectManager$];
    }
    set isProjectManager(value) {
      super.isProjectManager = value;
    }
    get allowSave() {
      return this[allowSave$];
    }
    set allowSave(value) {
      super.allowSave = value;
    }
    get reasonNotEditable() {
      return this[reasonNotEditable$];
    }
    set reasonNotEditable(value) {
      super.reasonNotEditable = value;
    }
    get createdAtR() {
      return this[createdAtR$];
    }
    set createdAtR(value) {
      super.createdAtR = value;
    }
    get proposalId() {
      return this[proposalId$];
    }
    set proposalId(value) {
      super.proposalId = value;
    }
    get verList() {
      return this[verList$];
    }
    set verList(value) {
      super.verList = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let docId = opts && 'docId' in opts ? opts.docId : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let body = opts && 'body' in opts ? opts.body : null;
      let htmlDiff = opts && 'htmlDiff' in opts ? opts.htmlDiff : null;
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      let projectTitle = opts && 'projectTitle' in opts ? opts.projectTitle : null;
      let isProjectManager = opts && 'isProjectManager' in opts ? opts.isProjectManager : null;
      let allowSave = opts && 'allowSave' in opts ? opts.allowSave : null;
      let reasonNotEditable = opts && 'reasonNotEditable' in opts ? opts.reasonNotEditable : null;
      let createdAtR = opts && 'createdAtR' in opts ? opts.createdAtR : null;
      let proposalId = opts && 'proposalId' in opts ? opts.proposalId : null;
      let verList = opts && 'verList' in opts ? opts.verList : null;
      return new src__models__wtypes.DocGetResponse.new({base: base != null ? base : this.base, docId: docId != null ? docId : this.docId, title: title != null ? title : this.title, body: body != null ? body : this.body, htmlDiff: htmlDiff != null ? htmlDiff : this.htmlDiff, projectId: projectId != null ? projectId : this.projectId, projectTitle: projectTitle != null ? projectTitle : this.projectTitle, isProjectManager: isProjectManager != null ? isProjectManager : this.isProjectManager, allowSave: allowSave != null ? allowSave : this.allowSave, reasonNotEditable: reasonNotEditable != null ? reasonNotEditable : this.reasonNotEditable, createdAtR: createdAtR != null ? createdAtR : this.createdAtR, proposalId: proposalId != null ? proposalId : this.proposalId, verList: verList != null ? verList : this.verList});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._DocGetResponse.is(other) && dart.equals(other.base, this.base) && other.docId == this.docId && other.title == this.title && other.body == this.body && other.htmlDiff == this.htmlDiff && other.projectId == this.projectId && other.projectTitle == this.projectTitle && other.isProjectManager == this.isProjectManager && other.allowSave == this.allowSave && other.reasonNotEditable == this.reasonNotEditable && other.createdAtR == this.createdAtR && other.proposalId == this.proposalId && dart.test((const$14 || (const$14 = dart.const(new (ListEqualityOf_DocGetVersionItem()).new(const$13 || (const$13 = dart.const(new (DefaultEqualityOf_DocGetVersionItem()).new())))))).equals(other.verList, this.verList));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.docId, this.title, this.body, this.htmlDiff, this.projectId, this.projectTitle, this.isProjectManager, this.allowSave, this.reasonNotEditable, this.createdAtR, this.proposalId, this.verList]);
    }
    toJson() {
      return src__models__wtypes.DocGetResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.DocGetResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let docId = opts && 'docId' in opts ? opts.docId : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let body = opts && 'body' in opts ? opts.body : null;
    let htmlDiff = opts && 'htmlDiff' in opts ? opts.htmlDiff : null;
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    let projectTitle = opts && 'projectTitle' in opts ? opts.projectTitle : null;
    let isProjectManager = opts && 'isProjectManager' in opts ? opts.isProjectManager : null;
    let allowSave = opts && 'allowSave' in opts ? opts.allowSave : null;
    let reasonNotEditable = opts && 'reasonNotEditable' in opts ? opts.reasonNotEditable : null;
    let createdAtR = opts && 'createdAtR' in opts ? opts.createdAtR : null;
    let proposalId = opts && 'proposalId' in opts ? opts.proposalId : null;
    let verList = opts && 'verList' in opts ? opts.verList : null;
    this[base$23] = base;
    this[docId$0] = docId;
    this[title$5] = title;
    this[body$] = body;
    this[htmlDiff$] = htmlDiff;
    this[projectId$0] = projectId;
    this[projectTitle$] = projectTitle;
    this[isProjectManager$] = isProjectManager;
    this[allowSave$] = allowSave;
    this[reasonNotEditable$] = reasonNotEditable;
    this[createdAtR$] = createdAtR;
    this[proposalId$] = proposalId;
    this[verList$] = verList;
  }).prototype = src__models__wtypes.DocGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes.DocGetResponse);
  const base$23 = Symbol("DocGetResponse.base");
  const docId$0 = Symbol("DocGetResponse.docId");
  const title$5 = Symbol("DocGetResponse.title");
  const body$ = Symbol("DocGetResponse.body");
  const htmlDiff$ = Symbol("DocGetResponse.htmlDiff");
  const projectId$0 = Symbol("DocGetResponse.projectId");
  const projectTitle$ = Symbol("DocGetResponse.projectTitle");
  const isProjectManager$ = Symbol("DocGetResponse.isProjectManager");
  const allowSave$ = Symbol("DocGetResponse.allowSave");
  const reasonNotEditable$ = Symbol("DocGetResponse.reasonNotEditable");
  const createdAtR$ = Symbol("DocGetResponse.createdAtR");
  const proposalId$ = Symbol("DocGetResponse.proposalId");
  const verList$ = Symbol("DocGetResponse.verList");
  src__models__wtypes.DocGetResponse[dart.implements] = () => [src__models__wtypes._DocGetResponse];
  dart.setMethodSignature(src__models__wtypes.DocGetResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.DocGetResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.DocGetResponse, [], {base: src__models__wtypes._APIResponseBase, docId: core.int, title: core.String, body: core.String, htmlDiff: core.String, projectId: core.int, projectTitle: core.String, isProjectManager: core.String, allowSave: core.String, reasonNotEditable: core.String, createdAtR: core.String, proposalId: core.int, verList: core.List$(src__models__wtypes._DocGetVersionItem)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.DocGetResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.DocGetResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    docId: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String),
    body: dart.finalFieldType(core.String),
    htmlDiff: dart.finalFieldType(core.String),
    projectId: dart.finalFieldType(core.int),
    projectTitle: dart.finalFieldType(core.String),
    isProjectManager: dart.finalFieldType(core.String),
    allowSave: dart.finalFieldType(core.String),
    reasonNotEditable: dart.finalFieldType(core.String),
    createdAtR: dart.finalFieldType(core.String),
    proposalId: dart.finalFieldType(core.int),
    verList: dart.finalFieldType(ListOf_DocGetVersionItem())
  }));
  dart.defineExtensionMethods(src__models__wtypes.DocGetResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.DocGetResponse, ['hashCode']);
  src__models__wtypes.DocGetVersionItem = class DocGetVersionItem extends core.Object {
    get revisionNo() {
      return this[revisionNo$0];
    }
    set revisionNo(value) {
      super.revisionNo = value;
    }
    get createdAtR() {
      return this[createdAtR$0];
    }
    set createdAtR(value) {
      super.createdAtR = value;
    }
    copyWith(opts) {
      let revisionNo = opts && 'revisionNo' in opts ? opts.revisionNo : null;
      let createdAtR = opts && 'createdAtR' in opts ? opts.createdAtR : null;
      return new src__models__wtypes.DocGetVersionItem.new({revisionNo: revisionNo != null ? revisionNo : this.revisionNo, createdAtR: createdAtR != null ? createdAtR : this.createdAtR});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._DocGetVersionItem.is(other) && other.revisionNo == this.revisionNo && other.createdAtR == this.createdAtR;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.revisionNo, this.createdAtR]);
    }
    toJson() {
      return src__models__wtypes.DocGetVersionItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.DocGetVersionItem.new = function(opts) {
    let revisionNo = opts && 'revisionNo' in opts ? opts.revisionNo : null;
    let createdAtR = opts && 'createdAtR' in opts ? opts.createdAtR : null;
    this[revisionNo$0] = revisionNo;
    this[createdAtR$0] = createdAtR;
  }).prototype = src__models__wtypes.DocGetVersionItem.prototype;
  dart.addTypeTests(src__models__wtypes.DocGetVersionItem);
  const revisionNo$0 = Symbol("DocGetVersionItem.revisionNo");
  const createdAtR$0 = Symbol("DocGetVersionItem.createdAtR");
  src__models__wtypes.DocGetVersionItem[dart.implements] = () => [src__models__wtypes._DocGetVersionItem];
  dart.setMethodSignature(src__models__wtypes.DocGetVersionItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.DocGetVersionItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.DocGetVersionItem, [], {revisionNo: core.int, createdAtR: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.DocGetVersionItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.DocGetVersionItem.__proto__),
    revisionNo: dart.finalFieldType(core.int),
    createdAtR: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.DocGetVersionItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.DocGetVersionItem, ['hashCode']);
  src__models__wtypes.DocSaveRequest = class DocSaveRequest extends core.Object {
    get base() {
      return this[base$24];
    }
    set base(value) {
      super.base = value;
    }
    get docId() {
      return this[docId$1];
    }
    set docId(value) {
      super.docId = value;
    }
    get projectId() {
      return this[projectId$1];
    }
    set projectId(value) {
      super.projectId = value;
    }
    get title() {
      return this[title$6];
    }
    set title(value) {
      super.title = value;
    }
    get retitleMode() {
      return this[retitleMode$];
    }
    set retitleMode(value) {
      super.retitleMode = value;
    }
    get body() {
      return this[body$0];
    }
    set body(value) {
      super.body = value;
    }
    get summary() {
      return this[summary$];
    }
    set summary(value) {
      super.summary = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let docId = opts && 'docId' in opts ? opts.docId : null;
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let retitleMode = opts && 'retitleMode' in opts ? opts.retitleMode : null;
      let body = opts && 'body' in opts ? opts.body : null;
      let summary = opts && 'summary' in opts ? opts.summary : null;
      return new src__models__wtypes.DocSaveRequest.new({base: base != null ? base : this.base, docId: docId != null ? docId : this.docId, projectId: projectId != null ? projectId : this.projectId, title: title != null ? title : this.title, retitleMode: retitleMode != null ? retitleMode : this.retitleMode, body: body != null ? body : this.body, summary: summary != null ? summary : this.summary});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._DocSaveRequest.is(other) && dart.equals(other.base, this.base) && other.docId == this.docId && other.projectId == this.projectId && other.title == this.title && other.retitleMode == this.retitleMode && other.body == this.body && other.summary == this.summary;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.docId, this.projectId, this.title, this.retitleMode, this.body, this.summary]);
    }
    toJson() {
      return src__models__wtypes.DocSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.DocSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let docId = opts && 'docId' in opts ? opts.docId : null;
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let retitleMode = opts && 'retitleMode' in opts ? opts.retitleMode : null;
    let body = opts && 'body' in opts ? opts.body : null;
    let summary = opts && 'summary' in opts ? opts.summary : null;
    this[base$24] = base;
    this[docId$1] = docId;
    this[projectId$1] = projectId;
    this[title$6] = title;
    this[retitleMode$] = retitleMode;
    this[body$0] = body;
    this[summary$] = summary;
  }).prototype = src__models__wtypes.DocSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.DocSaveRequest);
  const base$24 = Symbol("DocSaveRequest.base");
  const docId$1 = Symbol("DocSaveRequest.docId");
  const projectId$1 = Symbol("DocSaveRequest.projectId");
  const title$6 = Symbol("DocSaveRequest.title");
  const retitleMode$ = Symbol("DocSaveRequest.retitleMode");
  const body$0 = Symbol("DocSaveRequest.body");
  const summary$ = Symbol("DocSaveRequest.summary");
  src__models__wtypes.DocSaveRequest[dart.implements] = () => [src__models__wtypes._DocSaveRequest];
  dart.setMethodSignature(src__models__wtypes.DocSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.DocSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.DocSaveRequest, [], {base: src__models__wtypes._APIRequestBase, docId: core.int, projectId: core.int, title: core.String, retitleMode: core.String, body: core.String, summary: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.DocSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.DocSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    docId: dart.finalFieldType(core.int),
    projectId: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String),
    retitleMode: dart.finalFieldType(core.String),
    body: dart.finalFieldType(core.String),
    summary: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.DocSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.DocSaveRequest, ['hashCode']);
  src__models__wtypes.DocRollbackRequest = class DocRollbackRequest extends core.Object {
    get base() {
      return this[base$25];
    }
    set base(value) {
      super.base = value;
    }
    get docId() {
      return this[docId$2];
    }
    set docId(value) {
      super.docId = value;
    }
    get revisionNo() {
      return this[revisionNo$1];
    }
    set revisionNo(value) {
      super.revisionNo = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let docId = opts && 'docId' in opts ? opts.docId : null;
      let revisionNo = opts && 'revisionNo' in opts ? opts.revisionNo : null;
      return new src__models__wtypes.DocRollbackRequest.new({base: base != null ? base : this.base, docId: docId != null ? docId : this.docId, revisionNo: revisionNo != null ? revisionNo : this.revisionNo});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._DocRollbackRequest.is(other) && dart.equals(other.base, this.base) && other.docId == this.docId && other.revisionNo == this.revisionNo;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.docId, this.revisionNo]);
    }
    toJson() {
      return src__models__wtypes.DocRollbackRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.DocRollbackRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let docId = opts && 'docId' in opts ? opts.docId : null;
    let revisionNo = opts && 'revisionNo' in opts ? opts.revisionNo : null;
    this[base$25] = base;
    this[docId$2] = docId;
    this[revisionNo$1] = revisionNo;
  }).prototype = src__models__wtypes.DocRollbackRequest.prototype;
  dart.addTypeTests(src__models__wtypes.DocRollbackRequest);
  const base$25 = Symbol("DocRollbackRequest.base");
  const docId$2 = Symbol("DocRollbackRequest.docId");
  const revisionNo$1 = Symbol("DocRollbackRequest.revisionNo");
  src__models__wtypes.DocRollbackRequest[dart.implements] = () => [src__models__wtypes._DocRollbackRequest];
  dart.setMethodSignature(src__models__wtypes.DocRollbackRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.DocRollbackRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.DocRollbackRequest, [], {base: src__models__wtypes._APIRequestBase, docId: core.int, revisionNo: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.DocRollbackRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.DocRollbackRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    docId: dart.finalFieldType(core.int),
    revisionNo: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.DocRollbackRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.DocRollbackRequest, ['hashCode']);
  src__models__wtypes.EventQueryRequest = class EventQueryRequest extends core.Object {
    get base() {
      return this[base$26];
    }
    set base(value) {
      super.base = value;
    }
    get title() {
      return this[title$7];
    }
    set title(value) {
      super.title = value;
    }
    get dateFrom() {
      return this[dateFrom$];
    }
    set dateFrom(value) {
      super.dateFrom = value;
    }
    get dateTo() {
      return this[dateTo$];
    }
    set dateTo(value) {
      super.dateTo = value;
    }
    get miles() {
      return this[miles$];
    }
    set miles(value) {
      super.miles = value;
    }
    get lat() {
      return this[lat$];
    }
    set lat(value) {
      super.lat = value;
    }
    get lon() {
      return this[lon$];
    }
    set lon(value) {
      super.lon = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let dateFrom = opts && 'dateFrom' in opts ? opts.dateFrom : null;
      let dateTo = opts && 'dateTo' in opts ? opts.dateTo : null;
      let miles = opts && 'miles' in opts ? opts.miles : null;
      let lat = opts && 'lat' in opts ? opts.lat : null;
      let lon = opts && 'lon' in opts ? opts.lon : null;
      return new src__models__wtypes.EventQueryRequest.new({base: base != null ? base : this.base, title: title != null ? title : this.title, dateFrom: dateFrom != null ? dateFrom : this.dateFrom, dateTo: dateTo != null ? dateTo : this.dateTo, miles: miles != null ? miles : this.miles, lat: lat != null ? lat : this.lat, lon: lon != null ? lon : this.lon});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._EventQueryRequest.is(other) && dart.equals(other.base, this.base) && other.title == this.title && other.dateFrom == this.dateFrom && other.dateTo == this.dateTo && other.miles == this.miles && other.lat == this.lat && other.lon == this.lon;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.title, this.dateFrom, this.dateTo, this.miles, this.lat, this.lon]);
    }
    toJson() {
      return src__models__wtypes.EventQueryRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.EventQueryRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let dateFrom = opts && 'dateFrom' in opts ? opts.dateFrom : null;
    let dateTo = opts && 'dateTo' in opts ? opts.dateTo : null;
    let miles = opts && 'miles' in opts ? opts.miles : null;
    let lat = opts && 'lat' in opts ? opts.lat : null;
    let lon = opts && 'lon' in opts ? opts.lon : null;
    this[base$26] = base;
    this[title$7] = title;
    this[dateFrom$] = dateFrom;
    this[dateTo$] = dateTo;
    this[miles$] = miles;
    this[lat$] = lat;
    this[lon$] = lon;
  }).prototype = src__models__wtypes.EventQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes.EventQueryRequest);
  const base$26 = Symbol("EventQueryRequest.base");
  const title$7 = Symbol("EventQueryRequest.title");
  const dateFrom$ = Symbol("EventQueryRequest.dateFrom");
  const dateTo$ = Symbol("EventQueryRequest.dateTo");
  const miles$ = Symbol("EventQueryRequest.miles");
  const lat$ = Symbol("EventQueryRequest.lat");
  const lon$ = Symbol("EventQueryRequest.lon");
  src__models__wtypes.EventQueryRequest[dart.implements] = () => [src__models__wtypes._EventQueryRequest];
  dart.setMethodSignature(src__models__wtypes.EventQueryRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.EventQueryRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.EventQueryRequest, [], {base: src__models__wtypes._APIRequestBase, title: core.String, dateFrom: core.String, dateTo: core.String, miles: core.int, lat: core.String, lon: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.EventQueryRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.EventQueryRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    title: dart.finalFieldType(core.String),
    dateFrom: dart.finalFieldType(core.String),
    dateTo: dart.finalFieldType(core.String),
    miles: dart.finalFieldType(core.int),
    lat: dart.finalFieldType(core.String),
    lon: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.EventQueryRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.EventQueryRequest, ['hashCode']);
  let const$15;
  let const$16;
  src__models__wtypes.EventQueryResponse = class EventQueryResponse extends core.Object {
    get base() {
      return this[base$27];
    }
    set base(value) {
      super.base = value;
    }
    get events() {
      return this[events$];
    }
    set events(value) {
      super.events = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let events = opts && 'events' in opts ? opts.events : null;
      return new src__models__wtypes.EventQueryResponse.new({base: base != null ? base : this.base, events: events != null ? events : this.events});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._EventQueryResponse.is(other) && dart.equals(other.base, this.base) && dart.test((const$16 || (const$16 = dart.const(new (ListEqualityOf_EventItemResponse()).new(const$15 || (const$15 = dart.const(new (DefaultEqualityOf_EventItemResponse()).new())))))).equals(other.events, this.events));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.events]);
    }
    toJson() {
      return src__models__wtypes.EventQueryResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.EventQueryResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let events = opts && 'events' in opts ? opts.events : null;
    this[base$27] = base;
    this[events$] = events;
  }).prototype = src__models__wtypes.EventQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes.EventQueryResponse);
  const base$27 = Symbol("EventQueryResponse.base");
  const events$ = Symbol("EventQueryResponse.events");
  src__models__wtypes.EventQueryResponse[dart.implements] = () => [src__models__wtypes._EventQueryResponse];
  dart.setMethodSignature(src__models__wtypes.EventQueryResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.EventQueryResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.EventQueryResponse, [], {base: src__models__wtypes._APIResponseBase, events: core.List$(src__models__wtypes._EventItemResponse)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.EventQueryResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.EventQueryResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    events: dart.finalFieldType(ListOf_EventItemResponse())
  }));
  dart.defineExtensionMethods(src__models__wtypes.EventQueryResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.EventQueryResponse, ['hashCode']);
  src__models__wtypes.EventItemResponse = class EventItemResponse extends core.Object {
    get iid() {
      return this[iid$2];
    }
    set iid(value) {
      super.iid = value;
    }
    get title() {
      return this[title$8];
    }
    set title(value) {
      super.title = value;
    }
    get startTime() {
      return this[startTime$];
    }
    set startTime(value) {
      super.startTime = value;
    }
    get creatorNick() {
      return this[creatorNick$];
    }
    set creatorNick(value) {
      super.creatorNick = value;
    }
    get creatorId() {
      return this[creatorId$];
    }
    set creatorId(value) {
      super.creatorId = value;
    }
    copyWith(opts) {
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let startTime = opts && 'startTime' in opts ? opts.startTime : null;
      let creatorNick = opts && 'creatorNick' in opts ? opts.creatorNick : null;
      let creatorId = opts && 'creatorId' in opts ? opts.creatorId : null;
      return new src__models__wtypes.EventItemResponse.new({iid: iid != null ? iid : this.iid, title: title != null ? title : this.title, startTime: startTime != null ? startTime : this.startTime, creatorNick: creatorNick != null ? creatorNick : this.creatorNick, creatorId: creatorId != null ? creatorId : this.creatorId});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._EventItemResponse.is(other) && other.iid == this.iid && other.title == this.title && other.startTime == this.startTime && other.creatorNick == this.creatorNick && other.creatorId == this.creatorId;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.iid, this.title, this.startTime, this.creatorNick, this.creatorId]);
    }
    toJson() {
      return src__models__wtypes.EventItemResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.EventItemResponse.new = function(opts) {
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let startTime = opts && 'startTime' in opts ? opts.startTime : null;
    let creatorNick = opts && 'creatorNick' in opts ? opts.creatorNick : null;
    let creatorId = opts && 'creatorId' in opts ? opts.creatorId : null;
    this[iid$2] = iid;
    this[title$8] = title;
    this[startTime$] = startTime;
    this[creatorNick$] = creatorNick;
    this[creatorId$] = creatorId;
  }).prototype = src__models__wtypes.EventItemResponse.prototype;
  dart.addTypeTests(src__models__wtypes.EventItemResponse);
  const iid$2 = Symbol("EventItemResponse.iid");
  const title$8 = Symbol("EventItemResponse.title");
  const startTime$ = Symbol("EventItemResponse.startTime");
  const creatorNick$ = Symbol("EventItemResponse.creatorNick");
  const creatorId$ = Symbol("EventItemResponse.creatorId");
  src__models__wtypes.EventItemResponse[dart.implements] = () => [src__models__wtypes._EventItemResponse];
  dart.setMethodSignature(src__models__wtypes.EventItemResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.EventItemResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.EventItemResponse, [], {iid: core.int, title: core.String, startTime: core.String, creatorNick: core.String, creatorId: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.EventItemResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.EventItemResponse.__proto__),
    iid: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String),
    startTime: dart.finalFieldType(core.String),
    creatorNick: dart.finalFieldType(core.String),
    creatorId: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.EventItemResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.EventItemResponse, ['hashCode']);
  src__models__wtypes.EventRequest = class EventRequest extends core.Object {
    get base() {
      return this[base$28];
    }
    set base(value) {
      super.base = value;
    }
    get eventId() {
      return this[eventId$0];
    }
    set eventId(value) {
      super.eventId = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let eventId = opts && 'eventId' in opts ? opts.eventId : null;
      return new src__models__wtypes.EventRequest.new({base: base != null ? base : this.base, eventId: eventId != null ? eventId : this.eventId});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._EventRequest.is(other) && dart.equals(other.base, this.base) && other.eventId == this.eventId;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.eventId]);
    }
    toJson() {
      return src__models__wtypes.EventRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.EventRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let eventId = opts && 'eventId' in opts ? opts.eventId : null;
    this[base$28] = base;
    this[eventId$0] = eventId;
  }).prototype = src__models__wtypes.EventRequest.prototype;
  dart.addTypeTests(src__models__wtypes.EventRequest);
  const base$28 = Symbol("EventRequest.base");
  const eventId$0 = Symbol("EventRequest.eventId");
  src__models__wtypes.EventRequest[dart.implements] = () => [src__models__wtypes._EventRequest];
  dart.setMethodSignature(src__models__wtypes.EventRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.EventRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.EventRequest, [], {base: src__models__wtypes._APIRequestBase, eventId: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.EventRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.EventRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    eventId: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.EventRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.EventRequest, ['hashCode']);
  let const$17;
  let const$18;
  let const$19;
  let const$20;
  src__models__wtypes.EventGetResponse = class EventGetResponse extends core.Object {
    get base() {
      return this[base$29];
    }
    set base(value) {
      super.base = value;
    }
    get title() {
      return this[title$9];
    }
    set title(value) {
      super.title = value;
    }
    get description() {
      return this[description$1];
    }
    set description(value) {
      super.description = value;
    }
    get duration() {
      return this[duration$];
    }
    set duration(value) {
      super.duration = value;
    }
    get location() {
      return this[location$];
    }
    set location(value) {
      super.location = value;
    }
    get startTimeU() {
      return this[startTimeU$];
    }
    set startTimeU(value) {
      super.startTimeU = value;
    }
    get startTimeR() {
      return this[startTimeR$];
    }
    set startTimeR(value) {
      super.startTimeR = value;
    }
    get creatorNick() {
      return this[creatorNick$0];
    }
    set creatorNick(value) {
      super.creatorNick = value;
    }
    get creatorId() {
      return this[creatorId$0];
    }
    set creatorId(value) {
      super.creatorId = value;
    }
    get creatorAvatarUrl() {
      return this[creatorAvatarUrl$];
    }
    set creatorAvatarUrl(value) {
      super.creatorAvatarUrl = value;
    }
    get createdAtR() {
      return this[createdAtR$1];
    }
    set createdAtR(value) {
      super.createdAtR = value;
    }
    get lat() {
      return this[lat$0];
    }
    set lat(value) {
      super.lat = value;
    }
    get lon() {
      return this[lon$0];
    }
    set lon(value) {
      super.lon = value;
    }
    get users() {
      return this[users$];
    }
    set users(value) {
      super.users = value;
    }
    get convs() {
      return this[convs$0];
    }
    set convs(value) {
      super.convs = value;
    }
    get isCreator() {
      return this[isCreator$];
    }
    set isCreator(value) {
      super.isCreator = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let description = opts && 'description' in opts ? opts.description : null;
      let duration = opts && 'duration' in opts ? opts.duration : null;
      let location = opts && 'location' in opts ? opts.location : null;
      let startTimeU = opts && 'startTimeU' in opts ? opts.startTimeU : null;
      let startTimeR = opts && 'startTimeR' in opts ? opts.startTimeR : null;
      let creatorNick = opts && 'creatorNick' in opts ? opts.creatorNick : null;
      let creatorId = opts && 'creatorId' in opts ? opts.creatorId : null;
      let creatorAvatarUrl = opts && 'creatorAvatarUrl' in opts ? opts.creatorAvatarUrl : null;
      let createdAtR = opts && 'createdAtR' in opts ? opts.createdAtR : null;
      let lat = opts && 'lat' in opts ? opts.lat : null;
      let lon = opts && 'lon' in opts ? opts.lon : null;
      let users = opts && 'users' in opts ? opts.users : null;
      let convs = opts && 'convs' in opts ? opts.convs : null;
      let isCreator = opts && 'isCreator' in opts ? opts.isCreator : null;
      return new src__models__wtypes.EventGetResponse.new({base: base != null ? base : this.base, title: title != null ? title : this.title, description: description != null ? description : this.description, duration: duration != null ? duration : this.duration, location: location != null ? location : this.location, startTimeU: startTimeU != null ? startTimeU : this.startTimeU, startTimeR: startTimeR != null ? startTimeR : this.startTimeR, creatorNick: creatorNick != null ? creatorNick : this.creatorNick, creatorId: creatorId != null ? creatorId : this.creatorId, creatorAvatarUrl: creatorAvatarUrl != null ? creatorAvatarUrl : this.creatorAvatarUrl, createdAtR: createdAtR != null ? createdAtR : this.createdAtR, lat: lat != null ? lat : this.lat, lon: lon != null ? lon : this.lon, users: users != null ? users : this.users, convs: convs != null ? convs : this.convs, isCreator: isCreator != null ? isCreator : this.isCreator});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._EventGetResponse.is(other) && dart.equals(other.base, this.base) && other.title == this.title && other.description == this.description && other.duration == this.duration && other.location == this.location && other.startTimeU == this.startTimeU && other.startTimeR == this.startTimeR && other.creatorNick == this.creatorNick && other.creatorId == this.creatorId && other.creatorAvatarUrl == this.creatorAvatarUrl && other.createdAtR == this.createdAtR && other.lat == this.lat && other.lon == this.lon && dart.test((const$18 || (const$18 = dart.const(new (ListEqualityOf_EventGetUserResponse()).new(const$17 || (const$17 = dart.const(new (DefaultEqualityOf_EventGetUserResponse()).new())))))).equals(other.users, this.users)) && dart.test((const$20 || (const$20 = dart.const(new (ListEqualityOf_EventGetConvResponse()).new(const$19 || (const$19 = dart.const(new (DefaultEqualityOf_EventGetConvResponse()).new())))))).equals(other.convs, this.convs)) && other.isCreator == this.isCreator;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.title, this.description, this.duration, this.location, this.startTimeU, this.startTimeR, this.creatorNick, this.creatorId, this.creatorAvatarUrl, this.createdAtR, this.lat, this.lon, this.users, this.convs, this.isCreator]);
    }
    toJson() {
      return src__models__wtypes.EventGetResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.EventGetResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let description = opts && 'description' in opts ? opts.description : null;
    let duration = opts && 'duration' in opts ? opts.duration : null;
    let location = opts && 'location' in opts ? opts.location : null;
    let startTimeU = opts && 'startTimeU' in opts ? opts.startTimeU : null;
    let startTimeR = opts && 'startTimeR' in opts ? opts.startTimeR : null;
    let creatorNick = opts && 'creatorNick' in opts ? opts.creatorNick : null;
    let creatorId = opts && 'creatorId' in opts ? opts.creatorId : null;
    let creatorAvatarUrl = opts && 'creatorAvatarUrl' in opts ? opts.creatorAvatarUrl : null;
    let createdAtR = opts && 'createdAtR' in opts ? opts.createdAtR : null;
    let lat = opts && 'lat' in opts ? opts.lat : null;
    let lon = opts && 'lon' in opts ? opts.lon : null;
    let users = opts && 'users' in opts ? opts.users : null;
    let convs = opts && 'convs' in opts ? opts.convs : null;
    let isCreator = opts && 'isCreator' in opts ? opts.isCreator : null;
    this[base$29] = base;
    this[title$9] = title;
    this[description$1] = description;
    this[duration$] = duration;
    this[location$] = location;
    this[startTimeU$] = startTimeU;
    this[startTimeR$] = startTimeR;
    this[creatorNick$0] = creatorNick;
    this[creatorId$0] = creatorId;
    this[creatorAvatarUrl$] = creatorAvatarUrl;
    this[createdAtR$1] = createdAtR;
    this[lat$0] = lat;
    this[lon$0] = lon;
    this[users$] = users;
    this[convs$0] = convs;
    this[isCreator$] = isCreator;
  }).prototype = src__models__wtypes.EventGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes.EventGetResponse);
  const base$29 = Symbol("EventGetResponse.base");
  const title$9 = Symbol("EventGetResponse.title");
  const description$1 = Symbol("EventGetResponse.description");
  const duration$ = Symbol("EventGetResponse.duration");
  const location$ = Symbol("EventGetResponse.location");
  const startTimeU$ = Symbol("EventGetResponse.startTimeU");
  const startTimeR$ = Symbol("EventGetResponse.startTimeR");
  const creatorNick$0 = Symbol("EventGetResponse.creatorNick");
  const creatorId$0 = Symbol("EventGetResponse.creatorId");
  const creatorAvatarUrl$ = Symbol("EventGetResponse.creatorAvatarUrl");
  const createdAtR$1 = Symbol("EventGetResponse.createdAtR");
  const lat$0 = Symbol("EventGetResponse.lat");
  const lon$0 = Symbol("EventGetResponse.lon");
  const users$ = Symbol("EventGetResponse.users");
  const convs$0 = Symbol("EventGetResponse.convs");
  const isCreator$ = Symbol("EventGetResponse.isCreator");
  src__models__wtypes.EventGetResponse[dart.implements] = () => [src__models__wtypes._EventGetResponse];
  dart.setMethodSignature(src__models__wtypes.EventGetResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.EventGetResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.EventGetResponse, [], {base: src__models__wtypes._APIResponseBase, title: core.String, description: core.String, duration: core.String, location: core.String, startTimeU: core.String, startTimeR: core.String, creatorNick: core.String, creatorId: core.int, creatorAvatarUrl: core.String, createdAtR: core.String, lat: core.String, lon: core.String, users: core.List$(src__models__wtypes._EventGetUserResponse), convs: core.List$(src__models__wtypes._EventGetConvResponse), isCreator: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.EventGetResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.EventGetResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    title: dart.finalFieldType(core.String),
    description: dart.finalFieldType(core.String),
    duration: dart.finalFieldType(core.String),
    location: dart.finalFieldType(core.String),
    startTimeU: dart.finalFieldType(core.String),
    startTimeR: dart.finalFieldType(core.String),
    creatorNick: dart.finalFieldType(core.String),
    creatorId: dart.finalFieldType(core.int),
    creatorAvatarUrl: dart.finalFieldType(core.String),
    createdAtR: dart.finalFieldType(core.String),
    lat: dart.finalFieldType(core.String),
    lon: dart.finalFieldType(core.String),
    users: dart.finalFieldType(ListOf_EventGetUserResponse()),
    convs: dart.finalFieldType(ListOf_EventGetConvResponse()),
    isCreator: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.EventGetResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.EventGetResponse, ['hashCode']);
  src__models__wtypes.EventGetUserResponse = class EventGetUserResponse extends core.Object {
    get userId() {
      return this[userId$0];
    }
    set userId(value) {
      super.userId = value;
    }
    get nick() {
      return this[nick$1];
    }
    set nick(value) {
      super.nick = value;
    }
    get publicName() {
      return this[publicName$0];
    }
    set publicName(value) {
      super.publicName = value;
    }
    get avatarUrl() {
      return this[avatarUrl$1];
    }
    set avatarUrl(value) {
      super.avatarUrl = value;
    }
    get status() {
      return this[status$0];
    }
    set status(value) {
      super.status = value;
    }
    get statusDesc() {
      return this[statusDesc$];
    }
    set statusDesc(value) {
      super.statusDesc = value;
    }
    copyWith(opts) {
      let userId = opts && 'userId' in opts ? opts.userId : null;
      let nick = opts && 'nick' in opts ? opts.nick : null;
      let publicName = opts && 'publicName' in opts ? opts.publicName : null;
      let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
      let status = opts && 'status' in opts ? opts.status : null;
      let statusDesc = opts && 'statusDesc' in opts ? opts.statusDesc : null;
      return new src__models__wtypes.EventGetUserResponse.new({userId: userId != null ? userId : this.userId, nick: nick != null ? nick : this.nick, publicName: publicName != null ? publicName : this.publicName, avatarUrl: avatarUrl != null ? avatarUrl : this.avatarUrl, status: status != null ? status : this.status, statusDesc: statusDesc != null ? statusDesc : this.statusDesc});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._EventGetUserResponse.is(other) && other.userId == this.userId && other.nick == this.nick && other.publicName == this.publicName && other.avatarUrl == this.avatarUrl && other.status == this.status && other.statusDesc == this.statusDesc;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.userId, this.nick, this.publicName, this.avatarUrl, this.status, this.statusDesc]);
    }
    toJson() {
      return src__models__wtypes.EventGetUserResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.EventGetUserResponse.new = function(opts) {
    let userId = opts && 'userId' in opts ? opts.userId : null;
    let nick = opts && 'nick' in opts ? opts.nick : null;
    let publicName = opts && 'publicName' in opts ? opts.publicName : null;
    let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
    let status = opts && 'status' in opts ? opts.status : null;
    let statusDesc = opts && 'statusDesc' in opts ? opts.statusDesc : null;
    this[userId$0] = userId;
    this[nick$1] = nick;
    this[publicName$0] = publicName;
    this[avatarUrl$1] = avatarUrl;
    this[status$0] = status;
    this[statusDesc$] = statusDesc;
  }).prototype = src__models__wtypes.EventGetUserResponse.prototype;
  dart.addTypeTests(src__models__wtypes.EventGetUserResponse);
  const userId$0 = Symbol("EventGetUserResponse.userId");
  const nick$1 = Symbol("EventGetUserResponse.nick");
  const publicName$0 = Symbol("EventGetUserResponse.publicName");
  const avatarUrl$1 = Symbol("EventGetUserResponse.avatarUrl");
  const status$0 = Symbol("EventGetUserResponse.status");
  const statusDesc$ = Symbol("EventGetUserResponse.statusDesc");
  src__models__wtypes.EventGetUserResponse[dart.implements] = () => [src__models__wtypes._EventGetUserResponse];
  dart.setMethodSignature(src__models__wtypes.EventGetUserResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.EventGetUserResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.EventGetUserResponse, [], {userId: core.int, nick: core.String, publicName: core.String, avatarUrl: core.String, status: core.String, statusDesc: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.EventGetUserResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.EventGetUserResponse.__proto__),
    userId: dart.finalFieldType(core.int),
    nick: dart.finalFieldType(core.String),
    publicName: dart.finalFieldType(core.String),
    avatarUrl: dart.finalFieldType(core.String),
    status: dart.finalFieldType(core.String),
    statusDesc: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.EventGetUserResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.EventGetUserResponse, ['hashCode']);
  src__models__wtypes.EventGetConvResponse = class EventGetConvResponse extends core.Object {
    get iid() {
      return this[iid$3];
    }
    set iid(value) {
      super.iid = value;
    }
    get open() {
      return this[open$];
    }
    set open(value) {
      super.open = value;
    }
    get title() {
      return this[title$10];
    }
    set title(value) {
      super.title = value;
    }
    get lastActivity() {
      return this[lastActivity$];
    }
    set lastActivity(value) {
      super.lastActivity = value;
    }
    copyWith(opts) {
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let open = opts && 'open' in opts ? opts.open : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let lastActivity = opts && 'lastActivity' in opts ? opts.lastActivity : null;
      return new src__models__wtypes.EventGetConvResponse.new({iid: iid != null ? iid : this.iid, open: open != null ? open : this.open, title: title != null ? title : this.title, lastActivity: lastActivity != null ? lastActivity : this.lastActivity});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._EventGetConvResponse.is(other) && other.iid == this.iid && other.open == this.open && other.title == this.title && other.lastActivity == this.lastActivity;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.iid, this.open, this.title, this.lastActivity]);
    }
    toJson() {
      return src__models__wtypes.EventGetConvResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.EventGetConvResponse.new = function(opts) {
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let open = opts && 'open' in opts ? opts.open : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let lastActivity = opts && 'lastActivity' in opts ? opts.lastActivity : null;
    this[iid$3] = iid;
    this[open$] = open;
    this[title$10] = title;
    this[lastActivity$] = lastActivity;
  }).prototype = src__models__wtypes.EventGetConvResponse.prototype;
  dart.addTypeTests(src__models__wtypes.EventGetConvResponse);
  const iid$3 = Symbol("EventGetConvResponse.iid");
  const open$ = Symbol("EventGetConvResponse.open");
  const title$10 = Symbol("EventGetConvResponse.title");
  const lastActivity$ = Symbol("EventGetConvResponse.lastActivity");
  src__models__wtypes.EventGetConvResponse[dart.implements] = () => [src__models__wtypes._EventGetConvResponse];
  dart.setMethodSignature(src__models__wtypes.EventGetConvResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.EventGetConvResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.EventGetConvResponse, [], {iid: core.int, open: core.String, title: core.String, lastActivity: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.EventGetConvResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.EventGetConvResponse.__proto__),
    iid: dart.finalFieldType(core.int),
    open: dart.finalFieldType(core.String),
    title: dart.finalFieldType(core.String),
    lastActivity: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.EventGetConvResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.EventGetConvResponse, ['hashCode']);
  src__models__wtypes.EventSaveRequest = class EventSaveRequest extends core.Object {
    get base() {
      return this[base$30];
    }
    set base(value) {
      super.base = value;
    }
    get eventId() {
      return this[eventId$1];
    }
    set eventId(value) {
      super.eventId = value;
    }
    get title() {
      return this[title$11];
    }
    set title(value) {
      super.title = value;
    }
    get description() {
      return this[description$2];
    }
    set description(value) {
      super.description = value;
    }
    get duration() {
      return this[duration$0];
    }
    set duration(value) {
      super.duration = value;
    }
    get location() {
      return this[location$0];
    }
    set location(value) {
      super.location = value;
    }
    get startTime() {
      return this[startTime$0];
    }
    set startTime(value) {
      super.startTime = value;
    }
    get lat() {
      return this[lat$1];
    }
    set lat(value) {
      super.lat = value;
    }
    get lon() {
      return this[lon$1];
    }
    set lon(value) {
      super.lon = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let eventId = opts && 'eventId' in opts ? opts.eventId : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let description = opts && 'description' in opts ? opts.description : null;
      let duration = opts && 'duration' in opts ? opts.duration : null;
      let location = opts && 'location' in opts ? opts.location : null;
      let startTime = opts && 'startTime' in opts ? opts.startTime : null;
      let lat = opts && 'lat' in opts ? opts.lat : null;
      let lon = opts && 'lon' in opts ? opts.lon : null;
      return new src__models__wtypes.EventSaveRequest.new({base: base != null ? base : this.base, eventId: eventId != null ? eventId : this.eventId, title: title != null ? title : this.title, description: description != null ? description : this.description, duration: duration != null ? duration : this.duration, location: location != null ? location : this.location, startTime: startTime != null ? startTime : this.startTime, lat: lat != null ? lat : this.lat, lon: lon != null ? lon : this.lon});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._EventSaveRequest.is(other) && dart.equals(other.base, this.base) && other.eventId == this.eventId && other.title == this.title && other.description == this.description && other.duration == this.duration && other.location == this.location && other.startTime == this.startTime && other.lat == this.lat && other.lon == this.lon;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.eventId, this.title, this.description, this.duration, this.location, this.startTime, this.lat, this.lon]);
    }
    toJson() {
      return src__models__wtypes.EventSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.EventSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let eventId = opts && 'eventId' in opts ? opts.eventId : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let description = opts && 'description' in opts ? opts.description : null;
    let duration = opts && 'duration' in opts ? opts.duration : null;
    let location = opts && 'location' in opts ? opts.location : null;
    let startTime = opts && 'startTime' in opts ? opts.startTime : null;
    let lat = opts && 'lat' in opts ? opts.lat : null;
    let lon = opts && 'lon' in opts ? opts.lon : null;
    this[base$30] = base;
    this[eventId$1] = eventId;
    this[title$11] = title;
    this[description$2] = description;
    this[duration$0] = duration;
    this[location$0] = location;
    this[startTime$0] = startTime;
    this[lat$1] = lat;
    this[lon$1] = lon;
  }).prototype = src__models__wtypes.EventSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.EventSaveRequest);
  const base$30 = Symbol("EventSaveRequest.base");
  const eventId$1 = Symbol("EventSaveRequest.eventId");
  const title$11 = Symbol("EventSaveRequest.title");
  const description$2 = Symbol("EventSaveRequest.description");
  const duration$0 = Symbol("EventSaveRequest.duration");
  const location$0 = Symbol("EventSaveRequest.location");
  const startTime$0 = Symbol("EventSaveRequest.startTime");
  const lat$1 = Symbol("EventSaveRequest.lat");
  const lon$1 = Symbol("EventSaveRequest.lon");
  src__models__wtypes.EventSaveRequest[dart.implements] = () => [src__models__wtypes._EventSaveRequest];
  dart.setMethodSignature(src__models__wtypes.EventSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.EventSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.EventSaveRequest, [], {base: src__models__wtypes._APIRequestBase, eventId: core.int, title: core.String, description: core.String, duration: core.String, location: core.String, startTime: core.String, lat: core.String, lon: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.EventSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.EventSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    eventId: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String),
    description: dart.finalFieldType(core.String),
    duration: dart.finalFieldType(core.String),
    location: dart.finalFieldType(core.String),
    startTime: dart.finalFieldType(core.String),
    lat: dart.finalFieldType(core.String),
    lon: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.EventSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.EventSaveRequest, ['hashCode']);
  src__models__wtypes.EventUserSaveRequest = class EventUserSaveRequest extends core.Object {
    get base() {
      return this[base$31];
    }
    set base(value) {
      super.base = value;
    }
    get eventId() {
      return this[eventId$2];
    }
    set eventId(value) {
      super.eventId = value;
    }
    get status() {
      return this[status$1];
    }
    set status(value) {
      super.status = value;
    }
    get statusDesc() {
      return this[statusDesc$0];
    }
    set statusDesc(value) {
      super.statusDesc = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let eventId = opts && 'eventId' in opts ? opts.eventId : null;
      let status = opts && 'status' in opts ? opts.status : null;
      let statusDesc = opts && 'statusDesc' in opts ? opts.statusDesc : null;
      return new src__models__wtypes.EventUserSaveRequest.new({base: base != null ? base : this.base, eventId: eventId != null ? eventId : this.eventId, status: status != null ? status : this.status, statusDesc: statusDesc != null ? statusDesc : this.statusDesc});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._EventUserSaveRequest.is(other) && dart.equals(other.base, this.base) && other.eventId == this.eventId && other.status == this.status && other.statusDesc == this.statusDesc;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.eventId, this.status, this.statusDesc]);
    }
    toJson() {
      return src__models__wtypes.EventUserSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.EventUserSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let eventId = opts && 'eventId' in opts ? opts.eventId : null;
    let status = opts && 'status' in opts ? opts.status : null;
    let statusDesc = opts && 'statusDesc' in opts ? opts.statusDesc : null;
    this[base$31] = base;
    this[eventId$2] = eventId;
    this[status$1] = status;
    this[statusDesc$0] = statusDesc;
  }).prototype = src__models__wtypes.EventUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.EventUserSaveRequest);
  const base$31 = Symbol("EventUserSaveRequest.base");
  const eventId$2 = Symbol("EventUserSaveRequest.eventId");
  const status$1 = Symbol("EventUserSaveRequest.status");
  const statusDesc$0 = Symbol("EventUserSaveRequest.statusDesc");
  src__models__wtypes.EventUserSaveRequest[dart.implements] = () => [src__models__wtypes._EventUserSaveRequest];
  dart.setMethodSignature(src__models__wtypes.EventUserSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.EventUserSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.EventUserSaveRequest, [], {base: src__models__wtypes._APIRequestBase, eventId: core.int, status: core.String, statusDesc: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.EventUserSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.EventUserSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    eventId: dart.finalFieldType(core.int),
    status: dart.finalFieldType(core.String),
    statusDesc: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.EventUserSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.EventUserSaveRequest, ['hashCode']);
  src__models__wtypes.ProjectQueryRequest = class ProjectQueryRequest extends core.Object {
    get base() {
      return this[base$32];
    }
    set base(value) {
      super.base = value;
    }
    get catId() {
      return this[catId$2];
    }
    set catId(value) {
      super.catId = value;
    }
    get title() {
      return this[title$12];
    }
    set title(value) {
      super.title = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let catId = opts && 'catId' in opts ? opts.catId : null;
      let title = opts && 'title' in opts ? opts.title : null;
      return new src__models__wtypes.ProjectQueryRequest.new({base: base != null ? base : this.base, catId: catId != null ? catId : this.catId, title: title != null ? title : this.title});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectQueryRequest.is(other) && dart.equals(other.base, this.base) && other.catId == this.catId && other.title == this.title;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.catId, this.title]);
    }
    toJson() {
      return src__models__wtypes.ProjectQueryRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectQueryRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let catId = opts && 'catId' in opts ? opts.catId : null;
    let title = opts && 'title' in opts ? opts.title : null;
    this[base$32] = base;
    this[catId$2] = catId;
    this[title$12] = title;
  }).prototype = src__models__wtypes.ProjectQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectQueryRequest);
  const base$32 = Symbol("ProjectQueryRequest.base");
  const catId$2 = Symbol("ProjectQueryRequest.catId");
  const title$12 = Symbol("ProjectQueryRequest.title");
  src__models__wtypes.ProjectQueryRequest[dart.implements] = () => [src__models__wtypes._ProjectQueryRequest];
  dart.setMethodSignature(src__models__wtypes.ProjectQueryRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectQueryRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectQueryRequest, [], {base: src__models__wtypes._APIRequestBase, catId: core.int, title: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectQueryRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectQueryRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    catId: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectQueryRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectQueryRequest, ['hashCode']);
  let const$21;
  let const$22;
  src__models__wtypes.ProjectQueryResponse = class ProjectQueryResponse extends core.Object {
    get base() {
      return this[base$33];
    }
    set base(value) {
      super.base = value;
    }
    get projects() {
      return this[projects$];
    }
    set projects(value) {
      super.projects = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let projects = opts && 'projects' in opts ? opts.projects : null;
      return new src__models__wtypes.ProjectQueryResponse.new({base: base != null ? base : this.base, projects: projects != null ? projects : this.projects});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectQueryResponse.is(other) && dart.equals(other.base, this.base) && dart.test((const$22 || (const$22 = dart.const(new (ListEqualityOf_ProjectQueryItem()).new(const$21 || (const$21 = dart.const(new (DefaultEqualityOf_ProjectQueryItem()).new())))))).equals(other.projects, this.projects));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.projects]);
    }
    toJson() {
      return src__models__wtypes.ProjectQueryResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectQueryResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let projects = opts && 'projects' in opts ? opts.projects : null;
    this[base$33] = base;
    this[projects$] = projects;
  }).prototype = src__models__wtypes.ProjectQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectQueryResponse);
  const base$33 = Symbol("ProjectQueryResponse.base");
  const projects$ = Symbol("ProjectQueryResponse.projects");
  src__models__wtypes.ProjectQueryResponse[dart.implements] = () => [src__models__wtypes._ProjectQueryResponse];
  dart.setMethodSignature(src__models__wtypes.ProjectQueryResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectQueryResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectQueryResponse, [], {base: src__models__wtypes._APIResponseBase, projects: core.List$(src__models__wtypes._ProjectQueryItem)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectQueryResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectQueryResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    projects: dart.finalFieldType(ListOf_ProjectQueryItem())
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectQueryResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectQueryResponse, ['hashCode']);
  src__models__wtypes.ProjectQueryItem = class ProjectQueryItem extends core.Object {
    get projectId() {
      return this[projectId$2];
    }
    set projectId(value) {
      super.projectId = value;
    }
    get title() {
      return this[title$13];
    }
    set title(value) {
      super.title = value;
    }
    get description() {
      return this[description$3];
    }
    set description(value) {
      super.description = value;
    }
    get leadership() {
      return this[leadership$];
    }
    set leadership(value) {
      super.leadership = value;
    }
    get privacy() {
      return this[privacy$];
    }
    set privacy(value) {
      super.privacy = value;
    }
    copyWith(opts) {
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let description = opts && 'description' in opts ? opts.description : null;
      let leadership = opts && 'leadership' in opts ? opts.leadership : null;
      let privacy = opts && 'privacy' in opts ? opts.privacy : null;
      return new src__models__wtypes.ProjectQueryItem.new({projectId: projectId != null ? projectId : this.projectId, title: title != null ? title : this.title, description: description != null ? description : this.description, leadership: leadership != null ? leadership : this.leadership, privacy: privacy != null ? privacy : this.privacy});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectQueryItem.is(other) && other.projectId == this.projectId && other.title == this.title && other.description == this.description && other.leadership == this.leadership && other.privacy == this.privacy;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.projectId, this.title, this.description, this.leadership, this.privacy]);
    }
    toJson() {
      return src__models__wtypes.ProjectQueryItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectQueryItem.new = function(opts) {
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let description = opts && 'description' in opts ? opts.description : null;
    let leadership = opts && 'leadership' in opts ? opts.leadership : null;
    let privacy = opts && 'privacy' in opts ? opts.privacy : null;
    this[projectId$2] = projectId;
    this[title$13] = title;
    this[description$3] = description;
    this[leadership$] = leadership;
    this[privacy$] = privacy;
  }).prototype = src__models__wtypes.ProjectQueryItem.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectQueryItem);
  const projectId$2 = Symbol("ProjectQueryItem.projectId");
  const title$13 = Symbol("ProjectQueryItem.title");
  const description$3 = Symbol("ProjectQueryItem.description");
  const leadership$ = Symbol("ProjectQueryItem.leadership");
  const privacy$ = Symbol("ProjectQueryItem.privacy");
  src__models__wtypes.ProjectQueryItem[dart.implements] = () => [src__models__wtypes._ProjectQueryItem];
  dart.setMethodSignature(src__models__wtypes.ProjectQueryItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectQueryItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectQueryItem, [], {projectId: core.int, title: core.String, description: core.String, leadership: core.String, privacy: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectQueryItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectQueryItem.__proto__),
    projectId: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String),
    description: dart.finalFieldType(core.String),
    leadership: dart.finalFieldType(core.String),
    privacy: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectQueryItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectQueryItem, ['hashCode']);
  src__models__wtypes.ProjectGetRequest = class ProjectGetRequest extends core.Object {
    get base() {
      return this[base$34];
    }
    set base(value) {
      super.base = value;
    }
    get projectId() {
      return this[projectId$3];
    }
    set projectId(value) {
      super.projectId = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      return new src__models__wtypes.ProjectGetRequest.new({base: base != null ? base : this.base, projectId: projectId != null ? projectId : this.projectId});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectGetRequest.is(other) && dart.equals(other.base, this.base) && other.projectId == this.projectId;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.projectId]);
    }
    toJson() {
      return src__models__wtypes.ProjectGetRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectGetRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    this[base$34] = base;
    this[projectId$3] = projectId;
  }).prototype = src__models__wtypes.ProjectGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectGetRequest);
  const base$34 = Symbol("ProjectGetRequest.base");
  const projectId$3 = Symbol("ProjectGetRequest.projectId");
  src__models__wtypes.ProjectGetRequest[dart.implements] = () => [src__models__wtypes._ProjectGetRequest];
  dart.setMethodSignature(src__models__wtypes.ProjectGetRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectGetRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectGetRequest, [], {base: src__models__wtypes._APIRequestBase, projectId: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectGetRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectGetRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    projectId: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectGetRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectGetRequest, ['hashCode']);
  let const$23;
  let const$24;
  let const$25;
  let const$26;
  let const$27;
  let const$28;
  src__models__wtypes.ProjectGetResponse = class ProjectGetResponse extends core.Object {
    get base() {
      return this[base$35];
    }
    set base(value) {
      super.base = value;
    }
    get active() {
      return this[active$];
    }
    set active(value) {
      super.active = value;
    }
    get leadership() {
      return this[leadership$0];
    }
    set leadership(value) {
      super.leadership = value;
    }
    get privacy() {
      return this[privacy$0];
    }
    set privacy(value) {
      super.privacy = value;
    }
    get title() {
      return this[title$14];
    }
    set title(value) {
      super.title = value;
    }
    get description() {
      return this[description$4];
    }
    set description(value) {
      super.description = value;
    }
    get categoryId() {
      return this[categoryId$];
    }
    set categoryId(value) {
      super.categoryId = value;
    }
    get userKind() {
      return this[userKind$];
    }
    set userKind(value) {
      super.userKind = value;
    }
    get proposals() {
      return this[proposals$];
    }
    set proposals(value) {
      super.proposals = value;
    }
    get convs() {
      return this[convs$1];
    }
    set convs(value) {
      super.convs = value;
    }
    get docs() {
      return this[docs$0];
    }
    set docs(value) {
      super.docs = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let active = opts && 'active' in opts ? opts.active : null;
      let leadership = opts && 'leadership' in opts ? opts.leadership : null;
      let privacy = opts && 'privacy' in opts ? opts.privacy : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let description = opts && 'description' in opts ? opts.description : null;
      let categoryId = opts && 'categoryId' in opts ? opts.categoryId : null;
      let userKind = opts && 'userKind' in opts ? opts.userKind : null;
      let proposals = opts && 'proposals' in opts ? opts.proposals : null;
      let convs = opts && 'convs' in opts ? opts.convs : null;
      let docs = opts && 'docs' in opts ? opts.docs : null;
      return new src__models__wtypes.ProjectGetResponse.new({base: base != null ? base : this.base, active: active != null ? active : this.active, leadership: leadership != null ? leadership : this.leadership, privacy: privacy != null ? privacy : this.privacy, title: title != null ? title : this.title, description: description != null ? description : this.description, categoryId: categoryId != null ? categoryId : this.categoryId, userKind: userKind != null ? userKind : this.userKind, proposals: proposals != null ? proposals : this.proposals, convs: convs != null ? convs : this.convs, docs: docs != null ? docs : this.docs});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectGetResponse.is(other) && dart.equals(other.base, this.base) && other.active == this.active && other.leadership == this.leadership && other.privacy == this.privacy && other.title == this.title && other.description == this.description && other.categoryId == this.categoryId && other.userKind == this.userKind && dart.test((const$24 || (const$24 = dart.const(new (ListEqualityOf_ProjectProposalItem()).new(const$23 || (const$23 = dart.const(new (DefaultEqualityOf_ProjectProposalItem()).new())))))).equals(other.proposals, this.proposals)) && dart.test((const$26 || (const$26 = dart.const(new (ListEqualityOf_ProjectConvItem()).new(const$25 || (const$25 = dart.const(new (DefaultEqualityOf_ProjectConvItem()).new())))))).equals(other.convs, this.convs)) && dart.test((const$28 || (const$28 = dart.const(new (ListEqualityOf_ProjectDocItem()).new(const$27 || (const$27 = dart.const(new (DefaultEqualityOf_ProjectDocItem()).new())))))).equals(other.docs, this.docs));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.active, this.leadership, this.privacy, this.title, this.description, this.categoryId, this.userKind, this.proposals, this.convs, this.docs]);
    }
    toJson() {
      return src__models__wtypes.ProjectGetResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectGetResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let active = opts && 'active' in opts ? opts.active : null;
    let leadership = opts && 'leadership' in opts ? opts.leadership : null;
    let privacy = opts && 'privacy' in opts ? opts.privacy : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let description = opts && 'description' in opts ? opts.description : null;
    let categoryId = opts && 'categoryId' in opts ? opts.categoryId : null;
    let userKind = opts && 'userKind' in opts ? opts.userKind : null;
    let proposals = opts && 'proposals' in opts ? opts.proposals : null;
    let convs = opts && 'convs' in opts ? opts.convs : null;
    let docs = opts && 'docs' in opts ? opts.docs : null;
    this[base$35] = base;
    this[active$] = active;
    this[leadership$0] = leadership;
    this[privacy$0] = privacy;
    this[title$14] = title;
    this[description$4] = description;
    this[categoryId$] = categoryId;
    this[userKind$] = userKind;
    this[proposals$] = proposals;
    this[convs$1] = convs;
    this[docs$0] = docs;
  }).prototype = src__models__wtypes.ProjectGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectGetResponse);
  const base$35 = Symbol("ProjectGetResponse.base");
  const active$ = Symbol("ProjectGetResponse.active");
  const leadership$0 = Symbol("ProjectGetResponse.leadership");
  const privacy$0 = Symbol("ProjectGetResponse.privacy");
  const title$14 = Symbol("ProjectGetResponse.title");
  const description$4 = Symbol("ProjectGetResponse.description");
  const categoryId$ = Symbol("ProjectGetResponse.categoryId");
  const userKind$ = Symbol("ProjectGetResponse.userKind");
  const proposals$ = Symbol("ProjectGetResponse.proposals");
  const convs$1 = Symbol("ProjectGetResponse.convs");
  const docs$0 = Symbol("ProjectGetResponse.docs");
  src__models__wtypes.ProjectGetResponse[dart.implements] = () => [src__models__wtypes._ProjectGetResponse];
  dart.setMethodSignature(src__models__wtypes.ProjectGetResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectGetResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectGetResponse, [], {base: src__models__wtypes._APIResponseBase, active: core.String, leadership: core.String, privacy: core.String, title: core.String, description: core.String, categoryId: core.int, userKind: core.String, proposals: core.List$(src__models__wtypes._ProjectProposalItem), convs: core.List$(src__models__wtypes._ProjectConvItem), docs: core.List$(src__models__wtypes._ProjectDocItem)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectGetResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectGetResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    active: dart.finalFieldType(core.String),
    leadership: dart.finalFieldType(core.String),
    privacy: dart.finalFieldType(core.String),
    title: dart.finalFieldType(core.String),
    description: dart.finalFieldType(core.String),
    categoryId: dart.finalFieldType(core.int),
    userKind: dart.finalFieldType(core.String),
    proposals: dart.finalFieldType(ListOf_ProjectProposalItem()),
    convs: dart.finalFieldType(ListOf_ProjectConvItem()),
    docs: dart.finalFieldType(ListOf_ProjectDocItem())
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectGetResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectGetResponse, ['hashCode']);
  src__models__wtypes.ProjectProposalItem = class ProjectProposalItem extends core.Object {
    get iid() {
      return this[iid$4];
    }
    set iid(value) {
      super.iid = value;
    }
    get active() {
      return this[active$0];
    }
    set active(value) {
      super.active = value;
    }
    get title() {
      return this[title$15];
    }
    set title(value) {
      super.title = value;
    }
    get createdAtR() {
      return this[createdAtR$2];
    }
    set createdAtR(value) {
      super.createdAtR = value;
    }
    copyWith(opts) {
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let active = opts && 'active' in opts ? opts.active : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let createdAtR = opts && 'createdAtR' in opts ? opts.createdAtR : null;
      return new src__models__wtypes.ProjectProposalItem.new({iid: iid != null ? iid : this.iid, active: active != null ? active : this.active, title: title != null ? title : this.title, createdAtR: createdAtR != null ? createdAtR : this.createdAtR});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectProposalItem.is(other) && other.iid == this.iid && other.active == this.active && other.title == this.title && other.createdAtR == this.createdAtR;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.iid, this.active, this.title, this.createdAtR]);
    }
    toJson() {
      return src__models__wtypes.ProjectProposalItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectProposalItem.new = function(opts) {
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let active = opts && 'active' in opts ? opts.active : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let createdAtR = opts && 'createdAtR' in opts ? opts.createdAtR : null;
    this[iid$4] = iid;
    this[active$0] = active;
    this[title$15] = title;
    this[createdAtR$2] = createdAtR;
  }).prototype = src__models__wtypes.ProjectProposalItem.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectProposalItem);
  const iid$4 = Symbol("ProjectProposalItem.iid");
  const active$0 = Symbol("ProjectProposalItem.active");
  const title$15 = Symbol("ProjectProposalItem.title");
  const createdAtR$2 = Symbol("ProjectProposalItem.createdAtR");
  src__models__wtypes.ProjectProposalItem[dart.implements] = () => [src__models__wtypes._ProjectProposalItem];
  dart.setMethodSignature(src__models__wtypes.ProjectProposalItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectProposalItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectProposalItem, [], {iid: core.int, active: core.String, title: core.String, createdAtR: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectProposalItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectProposalItem.__proto__),
    iid: dart.finalFieldType(core.int),
    active: dart.finalFieldType(core.String),
    title: dart.finalFieldType(core.String),
    createdAtR: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectProposalItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectProposalItem, ['hashCode']);
  src__models__wtypes.ProjectConvItem = class ProjectConvItem extends core.Object {
    get iid() {
      return this[iid$5];
    }
    set iid(value) {
      super.iid = value;
    }
    get open() {
      return this[open$0];
    }
    set open(value) {
      super.open = value;
    }
    get title() {
      return this[title$16];
    }
    set title(value) {
      super.title = value;
    }
    get lastActivity() {
      return this[lastActivity$0];
    }
    set lastActivity(value) {
      super.lastActivity = value;
    }
    copyWith(opts) {
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let open = opts && 'open' in opts ? opts.open : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let lastActivity = opts && 'lastActivity' in opts ? opts.lastActivity : null;
      return new src__models__wtypes.ProjectConvItem.new({iid: iid != null ? iid : this.iid, open: open != null ? open : this.open, title: title != null ? title : this.title, lastActivity: lastActivity != null ? lastActivity : this.lastActivity});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectConvItem.is(other) && other.iid == this.iid && other.open == this.open && other.title == this.title && other.lastActivity == this.lastActivity;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.iid, this.open, this.title, this.lastActivity]);
    }
    toJson() {
      return src__models__wtypes.ProjectConvItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectConvItem.new = function(opts) {
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let open = opts && 'open' in opts ? opts.open : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let lastActivity = opts && 'lastActivity' in opts ? opts.lastActivity : null;
    this[iid$5] = iid;
    this[open$0] = open;
    this[title$16] = title;
    this[lastActivity$0] = lastActivity;
  }).prototype = src__models__wtypes.ProjectConvItem.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectConvItem);
  const iid$5 = Symbol("ProjectConvItem.iid");
  const open$0 = Symbol("ProjectConvItem.open");
  const title$16 = Symbol("ProjectConvItem.title");
  const lastActivity$0 = Symbol("ProjectConvItem.lastActivity");
  src__models__wtypes.ProjectConvItem[dart.implements] = () => [src__models__wtypes._ProjectConvItem];
  dart.setMethodSignature(src__models__wtypes.ProjectConvItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectConvItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectConvItem, [], {iid: core.int, open: core.String, title: core.String, lastActivity: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectConvItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectConvItem.__proto__),
    iid: dart.finalFieldType(core.int),
    open: dart.finalFieldType(core.String),
    title: dart.finalFieldType(core.String),
    lastActivity: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectConvItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectConvItem, ['hashCode']);
  src__models__wtypes.ProjectDocItem = class ProjectDocItem extends core.Object {
    get iid() {
      return this[iid$6];
    }
    set iid(value) {
      super.iid = value;
    }
    get title() {
      return this[title$17];
    }
    set title(value) {
      super.title = value;
    }
    copyWith(opts) {
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let title = opts && 'title' in opts ? opts.title : null;
      return new src__models__wtypes.ProjectDocItem.new({iid: iid != null ? iid : this.iid, title: title != null ? title : this.title});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectDocItem.is(other) && other.iid == this.iid && other.title == this.title;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.iid, this.title]);
    }
    toJson() {
      return src__models__wtypes.ProjectDocItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectDocItem.new = function(opts) {
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let title = opts && 'title' in opts ? opts.title : null;
    this[iid$6] = iid;
    this[title$17] = title;
  }).prototype = src__models__wtypes.ProjectDocItem.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectDocItem);
  const iid$6 = Symbol("ProjectDocItem.iid");
  const title$17 = Symbol("ProjectDocItem.title");
  src__models__wtypes.ProjectDocItem[dart.implements] = () => [src__models__wtypes._ProjectDocItem];
  dart.setMethodSignature(src__models__wtypes.ProjectDocItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectDocItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectDocItem, [], {iid: core.int, title: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectDocItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectDocItem.__proto__),
    iid: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectDocItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectDocItem, ['hashCode']);
  src__models__wtypes.ProjectSaveRequest = class ProjectSaveRequest extends core.Object {
    get base() {
      return this[base$36];
    }
    set base(value) {
      super.base = value;
    }
    get projectId() {
      return this[projectId$4];
    }
    set projectId(value) {
      super.projectId = value;
    }
    get leadership() {
      return this[leadership$1];
    }
    set leadership(value) {
      super.leadership = value;
    }
    get privacy() {
      return this[privacy$1];
    }
    set privacy(value) {
      super.privacy = value;
    }
    get title() {
      return this[title$18];
    }
    set title(value) {
      super.title = value;
    }
    get description() {
      return this[description$5];
    }
    set description(value) {
      super.description = value;
    }
    get categoryId() {
      return this[categoryId$0];
    }
    set categoryId(value) {
      super.categoryId = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      let leadership = opts && 'leadership' in opts ? opts.leadership : null;
      let privacy = opts && 'privacy' in opts ? opts.privacy : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let description = opts && 'description' in opts ? opts.description : null;
      let categoryId = opts && 'categoryId' in opts ? opts.categoryId : null;
      return new src__models__wtypes.ProjectSaveRequest.new({base: base != null ? base : this.base, projectId: projectId != null ? projectId : this.projectId, leadership: leadership != null ? leadership : this.leadership, privacy: privacy != null ? privacy : this.privacy, title: title != null ? title : this.title, description: description != null ? description : this.description, categoryId: categoryId != null ? categoryId : this.categoryId});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectSaveRequest.is(other) && dart.equals(other.base, this.base) && other.projectId == this.projectId && other.leadership == this.leadership && other.privacy == this.privacy && other.title == this.title && other.description == this.description && other.categoryId == this.categoryId;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.projectId, this.leadership, this.privacy, this.title, this.description, this.categoryId]);
    }
    toJson() {
      return src__models__wtypes.ProjectSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    let leadership = opts && 'leadership' in opts ? opts.leadership : null;
    let privacy = opts && 'privacy' in opts ? opts.privacy : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let description = opts && 'description' in opts ? opts.description : null;
    let categoryId = opts && 'categoryId' in opts ? opts.categoryId : null;
    this[base$36] = base;
    this[projectId$4] = projectId;
    this[leadership$1] = leadership;
    this[privacy$1] = privacy;
    this[title$18] = title;
    this[description$5] = description;
    this[categoryId$0] = categoryId;
  }).prototype = src__models__wtypes.ProjectSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectSaveRequest);
  const base$36 = Symbol("ProjectSaveRequest.base");
  const projectId$4 = Symbol("ProjectSaveRequest.projectId");
  const leadership$1 = Symbol("ProjectSaveRequest.leadership");
  const privacy$1 = Symbol("ProjectSaveRequest.privacy");
  const title$18 = Symbol("ProjectSaveRequest.title");
  const description$5 = Symbol("ProjectSaveRequest.description");
  const categoryId$0 = Symbol("ProjectSaveRequest.categoryId");
  src__models__wtypes.ProjectSaveRequest[dart.implements] = () => [src__models__wtypes._ProjectSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ProjectSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectSaveRequest, [], {base: src__models__wtypes._APIRequestBase, projectId: core.int, leadership: core.String, privacy: core.String, title: core.String, description: core.String, categoryId: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    projectId: dart.finalFieldType(core.int),
    leadership: dart.finalFieldType(core.String),
    privacy: dart.finalFieldType(core.String),
    title: dart.finalFieldType(core.String),
    description: dart.finalFieldType(core.String),
    categoryId: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectSaveRequest, ['hashCode']);
  src__models__wtypes.ProjectUserQueryRequest = class ProjectUserQueryRequest extends core.Object {
    get base() {
      return this[base$37];
    }
    set base(value) {
      super.base = value;
    }
    get projectId() {
      return this[projectId$5];
    }
    set projectId(value) {
      super.projectId = value;
    }
    get name() {
      return this[name$];
    }
    set name(value) {
      super.name = value;
    }
    get resultPage() {
      return this[resultPage$];
    }
    set resultPage(value) {
      super.resultPage = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      let name = opts && 'name' in opts ? opts.name : null;
      let resultPage = opts && 'resultPage' in opts ? opts.resultPage : null;
      return new src__models__wtypes.ProjectUserQueryRequest.new({base: base != null ? base : this.base, projectId: projectId != null ? projectId : this.projectId, name: name != null ? name : this.name, resultPage: resultPage != null ? resultPage : this.resultPage});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectUserQueryRequest.is(other) && dart.equals(other.base, this.base) && other.projectId == this.projectId && other.name == this.name && other.resultPage == this.resultPage;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.projectId, this.name, this.resultPage]);
    }
    toJson() {
      return src__models__wtypes.ProjectUserQueryRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectUserQueryRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    let name = opts && 'name' in opts ? opts.name : null;
    let resultPage = opts && 'resultPage' in opts ? opts.resultPage : null;
    this[base$37] = base;
    this[projectId$5] = projectId;
    this[name$] = name;
    this[resultPage$] = resultPage;
  }).prototype = src__models__wtypes.ProjectUserQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserQueryRequest);
  const base$37 = Symbol("ProjectUserQueryRequest.base");
  const projectId$5 = Symbol("ProjectUserQueryRequest.projectId");
  const name$ = Symbol("ProjectUserQueryRequest.name");
  const resultPage$ = Symbol("ProjectUserQueryRequest.resultPage");
  src__models__wtypes.ProjectUserQueryRequest[dart.implements] = () => [src__models__wtypes._ProjectUserQueryRequest];
  dart.setMethodSignature(src__models__wtypes.ProjectUserQueryRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectUserQueryRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectUserQueryRequest, [], {base: src__models__wtypes._APIRequestBase, projectId: core.int, name: core.String, resultPage: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectUserQueryRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectUserQueryRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    projectId: dart.finalFieldType(core.int),
    name: dart.finalFieldType(core.String),
    resultPage: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectUserQueryRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectUserQueryRequest, ['hashCode']);
  let const$29;
  let const$30;
  src__models__wtypes.ProjectUserQueryResponse = class ProjectUserQueryResponse extends core.Object {
    get base() {
      return this[base$38];
    }
    set base(value) {
      super.base = value;
    }
    get projectTitle() {
      return this[projectTitle$0];
    }
    set projectTitle(value) {
      super.projectTitle = value;
    }
    get completeLoad() {
      return this[completeLoad$];
    }
    set completeLoad(value) {
      super.completeLoad = value;
    }
    get editable() {
      return this[editable$];
    }
    set editable(value) {
      super.editable = value;
    }
    get users() {
      return this[users$0];
    }
    set users(value) {
      super.users = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let projectTitle = opts && 'projectTitle' in opts ? opts.projectTitle : null;
      let completeLoad = opts && 'completeLoad' in opts ? opts.completeLoad : null;
      let editable = opts && 'editable' in opts ? opts.editable : null;
      let users = opts && 'users' in opts ? opts.users : null;
      return new src__models__wtypes.ProjectUserQueryResponse.new({base: base != null ? base : this.base, projectTitle: projectTitle != null ? projectTitle : this.projectTitle, completeLoad: completeLoad != null ? completeLoad : this.completeLoad, editable: editable != null ? editable : this.editable, users: users != null ? users : this.users});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectUserQueryResponse.is(other) && dart.equals(other.base, this.base) && other.projectTitle == this.projectTitle && other.completeLoad == this.completeLoad && other.editable == this.editable && dart.test((const$30 || (const$30 = dart.const(new (ListEqualityOf_ProjectUserItem()).new(const$29 || (const$29 = dart.const(new (DefaultEqualityOf_ProjectUserItem()).new())))))).equals(other.users, this.users));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.projectTitle, this.completeLoad, this.editable, this.users]);
    }
    toJson() {
      return src__models__wtypes.ProjectUserQueryResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectUserQueryResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let projectTitle = opts && 'projectTitle' in opts ? opts.projectTitle : null;
    let completeLoad = opts && 'completeLoad' in opts ? opts.completeLoad : null;
    let editable = opts && 'editable' in opts ? opts.editable : null;
    let users = opts && 'users' in opts ? opts.users : null;
    this[base$38] = base;
    this[projectTitle$0] = projectTitle;
    this[completeLoad$] = completeLoad;
    this[editable$] = editable;
    this[users$0] = users;
  }).prototype = src__models__wtypes.ProjectUserQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserQueryResponse);
  const base$38 = Symbol("ProjectUserQueryResponse.base");
  const projectTitle$0 = Symbol("ProjectUserQueryResponse.projectTitle");
  const completeLoad$ = Symbol("ProjectUserQueryResponse.completeLoad");
  const editable$ = Symbol("ProjectUserQueryResponse.editable");
  const users$0 = Symbol("ProjectUserQueryResponse.users");
  src__models__wtypes.ProjectUserQueryResponse[dart.implements] = () => [src__models__wtypes._ProjectUserQueryResponse];
  dart.setMethodSignature(src__models__wtypes.ProjectUserQueryResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectUserQueryResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectUserQueryResponse, [], {base: src__models__wtypes._APIResponseBase, projectTitle: core.String, completeLoad: core.String, editable: core.String, users: core.List$(src__models__wtypes._ProjectUserItem)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectUserQueryResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectUserQueryResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    projectTitle: dart.finalFieldType(core.String),
    completeLoad: dart.finalFieldType(core.String),
    editable: dart.finalFieldType(core.String),
    users: dart.finalFieldType(ListOf_ProjectUserItem())
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectUserQueryResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectUserQueryResponse, ['hashCode']);
  src__models__wtypes.ProjectUserItem = class ProjectUserItem extends core.Object {
    get userId() {
      return this[userId$1];
    }
    set userId(value) {
      super.userId = value;
    }
    get kind() {
      return this[kind$3];
    }
    set kind(value) {
      super.kind = value;
    }
    get throttle() {
      return this[throttle$];
    }
    set throttle(value) {
      super.throttle = value;
    }
    get nick() {
      return this[nick$2];
    }
    set nick(value) {
      super.nick = value;
    }
    get publicName() {
      return this[publicName$1];
    }
    set publicName(value) {
      super.publicName = value;
    }
    get avatarUrl() {
      return this[avatarUrl$2];
    }
    set avatarUrl(value) {
      super.avatarUrl = value;
    }
    get voteKind() {
      return this[voteKind$];
    }
    set voteKind(value) {
      super.voteKind = value;
    }
    copyWith(opts) {
      let userId = opts && 'userId' in opts ? opts.userId : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      let throttle = opts && 'throttle' in opts ? opts.throttle : null;
      let nick = opts && 'nick' in opts ? opts.nick : null;
      let publicName = opts && 'publicName' in opts ? opts.publicName : null;
      let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
      let voteKind = opts && 'voteKind' in opts ? opts.voteKind : null;
      return new src__models__wtypes.ProjectUserItem.new({userId: userId != null ? userId : this.userId, kind: kind != null ? kind : this.kind, throttle: throttle != null ? throttle : this.throttle, nick: nick != null ? nick : this.nick, publicName: publicName != null ? publicName : this.publicName, avatarUrl: avatarUrl != null ? avatarUrl : this.avatarUrl, voteKind: voteKind != null ? voteKind : this.voteKind});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectUserItem.is(other) && other.userId == this.userId && other.kind == this.kind && other.throttle == this.throttle && other.nick == this.nick && other.publicName == this.publicName && other.avatarUrl == this.avatarUrl && other.voteKind == this.voteKind;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.userId, this.kind, this.throttle, this.nick, this.publicName, this.avatarUrl, this.voteKind]);
    }
    toJson() {
      return src__models__wtypes.ProjectUserItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectUserItem.new = function(opts) {
    let userId = opts && 'userId' in opts ? opts.userId : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    let throttle = opts && 'throttle' in opts ? opts.throttle : null;
    let nick = opts && 'nick' in opts ? opts.nick : null;
    let publicName = opts && 'publicName' in opts ? opts.publicName : null;
    let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
    let voteKind = opts && 'voteKind' in opts ? opts.voteKind : null;
    this[userId$1] = userId;
    this[kind$3] = kind;
    this[throttle$] = throttle;
    this[nick$2] = nick;
    this[publicName$1] = publicName;
    this[avatarUrl$2] = avatarUrl;
    this[voteKind$] = voteKind;
  }).prototype = src__models__wtypes.ProjectUserItem.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserItem);
  const userId$1 = Symbol("ProjectUserItem.userId");
  const kind$3 = Symbol("ProjectUserItem.kind");
  const throttle$ = Symbol("ProjectUserItem.throttle");
  const nick$2 = Symbol("ProjectUserItem.nick");
  const publicName$1 = Symbol("ProjectUserItem.publicName");
  const avatarUrl$2 = Symbol("ProjectUserItem.avatarUrl");
  const voteKind$ = Symbol("ProjectUserItem.voteKind");
  src__models__wtypes.ProjectUserItem[dart.implements] = () => [src__models__wtypes._ProjectUserItem];
  dart.setMethodSignature(src__models__wtypes.ProjectUserItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectUserItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectUserItem, [], {userId: core.int, kind: core.String, throttle: core.String, nick: core.String, publicName: core.String, avatarUrl: core.String, voteKind: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectUserItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectUserItem.__proto__),
    userId: dart.finalFieldType(core.int),
    kind: dart.finalFieldType(core.String),
    throttle: dart.finalFieldType(core.String),
    nick: dart.finalFieldType(core.String),
    publicName: dart.finalFieldType(core.String),
    avatarUrl: dart.finalFieldType(core.String),
    voteKind: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectUserItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectUserItem, ['hashCode']);
  src__models__wtypes.ProjectUserSaveRequest = class ProjectUserSaveRequest extends core.Object {
    get base() {
      return this[base$39];
    }
    set base(value) {
      super.base = value;
    }
    get projectId() {
      return this[projectId$6];
    }
    set projectId(value) {
      super.projectId = value;
    }
    get userId() {
      return this[userId$2];
    }
    set userId(value) {
      super.userId = value;
    }
    get kind() {
      return this[kind$4];
    }
    set kind(value) {
      super.kind = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      let userId = opts && 'userId' in opts ? opts.userId : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      return new src__models__wtypes.ProjectUserSaveRequest.new({base: base != null ? base : this.base, projectId: projectId != null ? projectId : this.projectId, userId: userId != null ? userId : this.userId, kind: kind != null ? kind : this.kind});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectUserSaveRequest.is(other) && dart.equals(other.base, this.base) && other.projectId == this.projectId && other.userId == this.userId && other.kind == this.kind;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.projectId, this.userId, this.kind]);
    }
    toJson() {
      return src__models__wtypes.ProjectUserSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectUserSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    let userId = opts && 'userId' in opts ? opts.userId : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    this[base$39] = base;
    this[projectId$6] = projectId;
    this[userId$2] = userId;
    this[kind$4] = kind;
  }).prototype = src__models__wtypes.ProjectUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserSaveRequest);
  const base$39 = Symbol("ProjectUserSaveRequest.base");
  const projectId$6 = Symbol("ProjectUserSaveRequest.projectId");
  const userId$2 = Symbol("ProjectUserSaveRequest.userId");
  const kind$4 = Symbol("ProjectUserSaveRequest.kind");
  src__models__wtypes.ProjectUserSaveRequest[dart.implements] = () => [src__models__wtypes._ProjectUserSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ProjectUserSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectUserSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectUserSaveRequest, [], {base: src__models__wtypes._APIRequestBase, projectId: core.int, userId: core.int, kind: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectUserSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectUserSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    projectId: dart.finalFieldType(core.int),
    userId: dart.finalFieldType(core.int),
    kind: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectUserSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectUserSaveRequest, ['hashCode']);
  src__models__wtypes.ProjectUserUserSaveRequest = class ProjectUserUserSaveRequest extends core.Object {
    get base() {
      return this[base$40];
    }
    set base(value) {
      super.base = value;
    }
    get projectId() {
      return this[projectId$7];
    }
    set projectId(value) {
      super.projectId = value;
    }
    get aboutId() {
      return this[aboutId$];
    }
    set aboutId(value) {
      super.aboutId = value;
    }
    get kind() {
      return this[kind$5];
    }
    set kind(value) {
      super.kind = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      let aboutId = opts && 'aboutId' in opts ? opts.aboutId : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      return new src__models__wtypes.ProjectUserUserSaveRequest.new({base: base != null ? base : this.base, projectId: projectId != null ? projectId : this.projectId, aboutId: aboutId != null ? aboutId : this.aboutId, kind: kind != null ? kind : this.kind});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProjectUserUserSaveRequest.is(other) && dart.equals(other.base, this.base) && other.projectId == this.projectId && other.aboutId == this.aboutId && other.kind == this.kind;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.projectId, this.aboutId, this.kind]);
    }
    toJson() {
      return src__models__wtypes.ProjectUserUserSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProjectUserUserSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    let aboutId = opts && 'aboutId' in opts ? opts.aboutId : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    this[base$40] = base;
    this[projectId$7] = projectId;
    this[aboutId$] = aboutId;
    this[kind$5] = kind;
  }).prototype = src__models__wtypes.ProjectUserUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserUserSaveRequest);
  const base$40 = Symbol("ProjectUserUserSaveRequest.base");
  const projectId$7 = Symbol("ProjectUserUserSaveRequest.projectId");
  const aboutId$ = Symbol("ProjectUserUserSaveRequest.aboutId");
  const kind$5 = Symbol("ProjectUserUserSaveRequest.kind");
  src__models__wtypes.ProjectUserUserSaveRequest[dart.implements] = () => [src__models__wtypes._ProjectUserUserSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ProjectUserUserSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProjectUserUserSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProjectUserUserSaveRequest, [], {base: src__models__wtypes._APIRequestBase, projectId: core.int, aboutId: core.int, kind: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProjectUserUserSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProjectUserUserSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    projectId: dart.finalFieldType(core.int),
    aboutId: dart.finalFieldType(core.int),
    kind: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProjectUserUserSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProjectUserUserSaveRequest, ['hashCode']);
  src__models__wtypes.ProposalQueryRequest = class ProposalQueryRequest extends core.Object {
    get base() {
      return this[base$41];
    }
    set base(value) {
      super.base = value;
    }
    get mode() {
      return this[mode$1];
    }
    set mode(value) {
      super.mode = value;
    }
    get year() {
      return this[year$];
    }
    set year(value) {
      super.year = value;
    }
    get projectId() {
      return this[projectId$8];
    }
    set projectId(value) {
      super.projectId = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let mode = opts && 'mode' in opts ? opts.mode : null;
      let year = opts && 'year' in opts ? opts.year : null;
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      return new src__models__wtypes.ProposalQueryRequest.new({base: base != null ? base : this.base, mode: mode != null ? mode : this.mode, year: year != null ? year : this.year, projectId: projectId != null ? projectId : this.projectId});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProposalQueryRequest.is(other) && dart.equals(other.base, this.base) && other.mode == this.mode && other.year == this.year && other.projectId == this.projectId;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.mode, this.year, this.projectId]);
    }
    toJson() {
      return src__models__wtypes.ProposalQueryRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProposalQueryRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let mode = opts && 'mode' in opts ? opts.mode : null;
    let year = opts && 'year' in opts ? opts.year : null;
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    this[base$41] = base;
    this[mode$1] = mode;
    this[year$] = year;
    this[projectId$8] = projectId;
  }).prototype = src__models__wtypes.ProposalQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalQueryRequest);
  const base$41 = Symbol("ProposalQueryRequest.base");
  const mode$1 = Symbol("ProposalQueryRequest.mode");
  const year$ = Symbol("ProposalQueryRequest.year");
  const projectId$8 = Symbol("ProposalQueryRequest.projectId");
  src__models__wtypes.ProposalQueryRequest[dart.implements] = () => [src__models__wtypes._ProposalQueryRequest];
  dart.setMethodSignature(src__models__wtypes.ProposalQueryRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProposalQueryRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProposalQueryRequest, [], {base: src__models__wtypes._APIRequestBase, mode: core.String, year: core.int, projectId: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProposalQueryRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProposalQueryRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    mode: dart.finalFieldType(core.String),
    year: dart.finalFieldType(core.int),
    projectId: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProposalQueryRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProposalQueryRequest, ['hashCode']);
  let const$31;
  let const$32;
  src__models__wtypes.ProposalQueryResponse = class ProposalQueryResponse extends core.Object {
    get base() {
      return this[base$42];
    }
    set base(value) {
      super.base = value;
    }
    get items() {
      return this[items$];
    }
    set items(value) {
      super.items = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let items = opts && 'items' in opts ? opts.items : null;
      return new src__models__wtypes.ProposalQueryResponse.new({base: base != null ? base : this.base, items: items != null ? items : this.items});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProposalQueryResponse.is(other) && dart.equals(other.base, this.base) && dart.test((const$32 || (const$32 = dart.const(new (ListEqualityOf_ProposalQueryItem()).new(const$31 || (const$31 = dart.const(new (DefaultEqualityOf_ProposalQueryItem()).new())))))).equals(other.items, this.items));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.items]);
    }
    toJson() {
      return src__models__wtypes.ProposalQueryResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProposalQueryResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let items = opts && 'items' in opts ? opts.items : null;
    this[base$42] = base;
    this[items$] = items;
  }).prototype = src__models__wtypes.ProposalQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalQueryResponse);
  const base$42 = Symbol("ProposalQueryResponse.base");
  const items$ = Symbol("ProposalQueryResponse.items");
  src__models__wtypes.ProposalQueryResponse[dart.implements] = () => [src__models__wtypes._ProposalQueryResponse];
  dart.setMethodSignature(src__models__wtypes.ProposalQueryResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProposalQueryResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProposalQueryResponse, [], {base: src__models__wtypes._APIResponseBase, items: core.List$(src__models__wtypes._ProposalQueryItem)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProposalQueryResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProposalQueryResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    items: dart.finalFieldType(ListOf_ProposalQueryItem())
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProposalQueryResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProposalQueryResponse, ['hashCode']);
  src__models__wtypes.ProposalQueryItem = class ProposalQueryItem extends core.Object {
    get iid() {
      return this[iid$7];
    }
    set iid(value) {
      super.iid = value;
    }
    get title() {
      return this[title$19];
    }
    set title(value) {
      super.title = value;
    }
    get kind() {
      return this[kind$6];
    }
    set kind(value) {
      super.kind = value;
    }
    copyWith(opts) {
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      return new src__models__wtypes.ProposalQueryItem.new({iid: iid != null ? iid : this.iid, title: title != null ? title : this.title, kind: kind != null ? kind : this.kind});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProposalQueryItem.is(other) && other.iid == this.iid && other.title == this.title && other.kind == this.kind;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.iid, this.title, this.kind]);
    }
    toJson() {
      return src__models__wtypes.ProposalQueryItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProposalQueryItem.new = function(opts) {
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    this[iid$7] = iid;
    this[title$19] = title;
    this[kind$6] = kind;
  }).prototype = src__models__wtypes.ProposalQueryItem.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalQueryItem);
  const iid$7 = Symbol("ProposalQueryItem.iid");
  const title$19 = Symbol("ProposalQueryItem.title");
  const kind$6 = Symbol("ProposalQueryItem.kind");
  src__models__wtypes.ProposalQueryItem[dart.implements] = () => [src__models__wtypes._ProposalQueryItem];
  dart.setMethodSignature(src__models__wtypes.ProposalQueryItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProposalQueryItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProposalQueryItem, [], {iid: core.int, title: core.String, kind: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProposalQueryItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProposalQueryItem.__proto__),
    iid: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String),
    kind: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProposalQueryItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProposalQueryItem, ['hashCode']);
  src__models__wtypes.ProposalGetRequest = class ProposalGetRequest extends core.Object {
    get base() {
      return this[base$43];
    }
    set base(value) {
      super.base = value;
    }
    get proposalId() {
      return this[proposalId$0];
    }
    set proposalId(value) {
      super.proposalId = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let proposalId = opts && 'proposalId' in opts ? opts.proposalId : null;
      return new src__models__wtypes.ProposalGetRequest.new({base: base != null ? base : this.base, proposalId: proposalId != null ? proposalId : this.proposalId});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProposalGetRequest.is(other) && dart.equals(other.base, this.base) && other.proposalId == this.proposalId;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.proposalId]);
    }
    toJson() {
      return src__models__wtypes.ProposalGetRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProposalGetRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let proposalId = opts && 'proposalId' in opts ? opts.proposalId : null;
    this[base$43] = base;
    this[proposalId$0] = proposalId;
  }).prototype = src__models__wtypes.ProposalGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalGetRequest);
  const base$43 = Symbol("ProposalGetRequest.base");
  const proposalId$0 = Symbol("ProposalGetRequest.proposalId");
  src__models__wtypes.ProposalGetRequest[dart.implements] = () => [src__models__wtypes._ProposalGetRequest];
  dart.setMethodSignature(src__models__wtypes.ProposalGetRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProposalGetRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProposalGetRequest, [], {base: src__models__wtypes._APIRequestBase, proposalId: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProposalGetRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProposalGetRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    proposalId: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProposalGetRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProposalGetRequest, ['hashCode']);
  let const$33;
  let const$34;
  src__models__wtypes.ProposalGetResponse = class ProposalGetResponse extends core.Object {
    get base() {
      return this[base$44];
    }
    set base(value) {
      super.base = value;
    }
    get active() {
      return this[active$1];
    }
    set active(value) {
      super.active = value;
    }
    get kind() {
      return this[kind$7];
    }
    set kind(value) {
      super.kind = value;
    }
    get eligible() {
      return this[eligible$];
    }
    set eligible(value) {
      super.eligible = value;
    }
    get title() {
      return this[title$20];
    }
    set title(value) {
      super.title = value;
    }
    get summary() {
      return this[summary$0];
    }
    set summary(value) {
      super.summary = value;
    }
    get summaryHtml() {
      return this[summaryHtml$];
    }
    set summaryHtml(value) {
      super.summaryHtml = value;
    }
    get dtext() {
      return this[dtext$];
    }
    set dtext(value) {
      super.dtext = value;
    }
    get timeout() {
      return this[timeout$];
    }
    set timeout(value) {
      super.timeout = value;
    }
    get deleteTime() {
      return this[deleteTime$];
    }
    set deleteTime(value) {
      super.deleteTime = value;
    }
    get winningOption() {
      return this[winningOption$];
    }
    set winningOption(value) {
      super.winningOption = value;
    }
    get createdBy() {
      return this[createdBy$];
    }
    set createdBy(value) {
      super.createdBy = value;
    }
    get projectId() {
      return this[projectId$9];
    }
    set projectId(value) {
      super.projectId = value;
    }
    get docId() {
      return this[docId$3];
    }
    set docId(value) {
      super.docId = value;
    }
    get createdByNick() {
      return this[createdByNick$];
    }
    set createdByNick(value) {
      super.createdByNick = value;
    }
    get createdByAvatarUrl() {
      return this[createdByAvatarUrl$];
    }
    set createdByAvatarUrl(value) {
      super.createdByAvatarUrl = value;
    }
    get options() {
      return this[options$];
    }
    set options(value) {
      super.options = value;
    }
    get myVote() {
      return this[myVote$];
    }
    set myVote(value) {
      super.myVote = value;
    }
    get statusDescription() {
      return this[statusDescription$];
    }
    set statusDescription(value) {
      super.statusDescription = value;
    }
    get myEligible() {
      return this[myEligible$];
    }
    set myEligible(value) {
      super.myEligible = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let active = opts && 'active' in opts ? opts.active : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      let eligible = opts && 'eligible' in opts ? opts.eligible : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let summary = opts && 'summary' in opts ? opts.summary : null;
      let summaryHtml = opts && 'summaryHtml' in opts ? opts.summaryHtml : null;
      let dtext = opts && 'dtext' in opts ? opts.dtext : null;
      let timeout = opts && 'timeout' in opts ? opts.timeout : null;
      let deleteTime = opts && 'deleteTime' in opts ? opts.deleteTime : null;
      let winningOption = opts && 'winningOption' in opts ? opts.winningOption : null;
      let createdBy = opts && 'createdBy' in opts ? opts.createdBy : null;
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      let docId = opts && 'docId' in opts ? opts.docId : null;
      let createdByNick = opts && 'createdByNick' in opts ? opts.createdByNick : null;
      let createdByAvatarUrl = opts && 'createdByAvatarUrl' in opts ? opts.createdByAvatarUrl : null;
      let options = opts && 'options' in opts ? opts.options : null;
      let myVote = opts && 'myVote' in opts ? opts.myVote : null;
      let statusDescription = opts && 'statusDescription' in opts ? opts.statusDescription : null;
      let myEligible = opts && 'myEligible' in opts ? opts.myEligible : null;
      return new src__models__wtypes.ProposalGetResponse.new({base: base != null ? base : this.base, active: active != null ? active : this.active, kind: kind != null ? kind : this.kind, eligible: eligible != null ? eligible : this.eligible, title: title != null ? title : this.title, summary: summary != null ? summary : this.summary, summaryHtml: summaryHtml != null ? summaryHtml : this.summaryHtml, dtext: dtext != null ? dtext : this.dtext, timeout: timeout != null ? timeout : this.timeout, deleteTime: deleteTime != null ? deleteTime : this.deleteTime, winningOption: winningOption != null ? winningOption : this.winningOption, createdBy: createdBy != null ? createdBy : this.createdBy, projectId: projectId != null ? projectId : this.projectId, docId: docId != null ? docId : this.docId, createdByNick: createdByNick != null ? createdByNick : this.createdByNick, createdByAvatarUrl: createdByAvatarUrl != null ? createdByAvatarUrl : this.createdByAvatarUrl, options: options != null ? options : this.options, myVote: myVote != null ? myVote : this.myVote, statusDescription: statusDescription != null ? statusDescription : this.statusDescription, myEligible: myEligible != null ? myEligible : this.myEligible});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProposalGetResponse.is(other) && dart.equals(other.base, this.base) && other.active == this.active && other.kind == this.kind && other.eligible == this.eligible && other.title == this.title && other.summary == this.summary && other.summaryHtml == this.summaryHtml && other.dtext == this.dtext && other.timeout == this.timeout && other.deleteTime == this.deleteTime && other.winningOption == this.winningOption && other.createdBy == this.createdBy && other.projectId == this.projectId && other.docId == this.docId && other.createdByNick == this.createdByNick && other.createdByAvatarUrl == this.createdByAvatarUrl && dart.test((const$34 || (const$34 = dart.const(new (ListEqualityOf_ProposalOptionItem()).new(const$33 || (const$33 = dart.const(new (DefaultEqualityOf_ProposalOptionItem()).new())))))).equals(other.options, this.options)) && other.myVote == this.myVote && other.statusDescription == this.statusDescription && other.myEligible == this.myEligible;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.active, this.kind, this.eligible, this.title, this.summary, this.summaryHtml, this.dtext, this.timeout, this.deleteTime, this.winningOption, this.createdBy, this.projectId, this.docId, this.createdByNick, this.createdByAvatarUrl, this.options, this.myVote, this.statusDescription, this.myEligible]);
    }
    toJson() {
      return src__models__wtypes.ProposalGetResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProposalGetResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let active = opts && 'active' in opts ? opts.active : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    let eligible = opts && 'eligible' in opts ? opts.eligible : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let summary = opts && 'summary' in opts ? opts.summary : null;
    let summaryHtml = opts && 'summaryHtml' in opts ? opts.summaryHtml : null;
    let dtext = opts && 'dtext' in opts ? opts.dtext : null;
    let timeout = opts && 'timeout' in opts ? opts.timeout : null;
    let deleteTime = opts && 'deleteTime' in opts ? opts.deleteTime : null;
    let winningOption = opts && 'winningOption' in opts ? opts.winningOption : null;
    let createdBy = opts && 'createdBy' in opts ? opts.createdBy : null;
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    let docId = opts && 'docId' in opts ? opts.docId : null;
    let createdByNick = opts && 'createdByNick' in opts ? opts.createdByNick : null;
    let createdByAvatarUrl = opts && 'createdByAvatarUrl' in opts ? opts.createdByAvatarUrl : null;
    let options = opts && 'options' in opts ? opts.options : null;
    let myVote = opts && 'myVote' in opts ? opts.myVote : null;
    let statusDescription = opts && 'statusDescription' in opts ? opts.statusDescription : null;
    let myEligible = opts && 'myEligible' in opts ? opts.myEligible : null;
    this[base$44] = base;
    this[active$1] = active;
    this[kind$7] = kind;
    this[eligible$] = eligible;
    this[title$20] = title;
    this[summary$0] = summary;
    this[summaryHtml$] = summaryHtml;
    this[dtext$] = dtext;
    this[timeout$] = timeout;
    this[deleteTime$] = deleteTime;
    this[winningOption$] = winningOption;
    this[createdBy$] = createdBy;
    this[projectId$9] = projectId;
    this[docId$3] = docId;
    this[createdByNick$] = createdByNick;
    this[createdByAvatarUrl$] = createdByAvatarUrl;
    this[options$] = options;
    this[myVote$] = myVote;
    this[statusDescription$] = statusDescription;
    this[myEligible$] = myEligible;
  }).prototype = src__models__wtypes.ProposalGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalGetResponse);
  const base$44 = Symbol("ProposalGetResponse.base");
  const active$1 = Symbol("ProposalGetResponse.active");
  const kind$7 = Symbol("ProposalGetResponse.kind");
  const eligible$ = Symbol("ProposalGetResponse.eligible");
  const title$20 = Symbol("ProposalGetResponse.title");
  const summary$0 = Symbol("ProposalGetResponse.summary");
  const summaryHtml$ = Symbol("ProposalGetResponse.summaryHtml");
  const dtext$ = Symbol("ProposalGetResponse.dtext");
  const timeout$ = Symbol("ProposalGetResponse.timeout");
  const deleteTime$ = Symbol("ProposalGetResponse.deleteTime");
  const winningOption$ = Symbol("ProposalGetResponse.winningOption");
  const createdBy$ = Symbol("ProposalGetResponse.createdBy");
  const projectId$9 = Symbol("ProposalGetResponse.projectId");
  const docId$3 = Symbol("ProposalGetResponse.docId");
  const createdByNick$ = Symbol("ProposalGetResponse.createdByNick");
  const createdByAvatarUrl$ = Symbol("ProposalGetResponse.createdByAvatarUrl");
  const options$ = Symbol("ProposalGetResponse.options");
  const myVote$ = Symbol("ProposalGetResponse.myVote");
  const statusDescription$ = Symbol("ProposalGetResponse.statusDescription");
  const myEligible$ = Symbol("ProposalGetResponse.myEligible");
  src__models__wtypes.ProposalGetResponse[dart.implements] = () => [src__models__wtypes._ProposalGetResponse];
  dart.setMethodSignature(src__models__wtypes.ProposalGetResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProposalGetResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProposalGetResponse, [], {base: src__models__wtypes._APIResponseBase, active: core.String, kind: core.String, eligible: core.String, title: core.String, summary: core.String, summaryHtml: core.String, dtext: core.String, timeout: core.String, deleteTime: core.String, winningOption: core.int, createdBy: core.int, projectId: core.int, docId: core.int, createdByNick: core.String, createdByAvatarUrl: core.String, options: core.List$(src__models__wtypes._ProposalOptionItem), myVote: core.int, statusDescription: core.String, myEligible: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProposalGetResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProposalGetResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    active: dart.finalFieldType(core.String),
    kind: dart.finalFieldType(core.String),
    eligible: dart.finalFieldType(core.String),
    title: dart.finalFieldType(core.String),
    summary: dart.finalFieldType(core.String),
    summaryHtml: dart.finalFieldType(core.String),
    dtext: dart.finalFieldType(core.String),
    timeout: dart.finalFieldType(core.String),
    deleteTime: dart.finalFieldType(core.String),
    winningOption: dart.finalFieldType(core.int),
    createdBy: dart.finalFieldType(core.int),
    projectId: dart.finalFieldType(core.int),
    docId: dart.finalFieldType(core.int),
    createdByNick: dart.finalFieldType(core.String),
    createdByAvatarUrl: dart.finalFieldType(core.String),
    options: dart.finalFieldType(ListOf_ProposalOptionItem()),
    myVote: dart.finalFieldType(core.int),
    statusDescription: dart.finalFieldType(core.String),
    myEligible: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProposalGetResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProposalGetResponse, ['hashCode']);
  src__models__wtypes.ProposalOptionItem = class ProposalOptionItem extends core.Object {
    get optionNo() {
      return this[optionNo$];
    }
    set optionNo(value) {
      super.optionNo = value;
    }
    get voteCount() {
      return this[voteCount$];
    }
    set voteCount(value) {
      super.voteCount = value;
    }
    get optionDesc() {
      return this[optionDesc$];
    }
    set optionDesc(value) {
      super.optionDesc = value;
    }
    copyWith(opts) {
      let optionNo = opts && 'optionNo' in opts ? opts.optionNo : null;
      let voteCount = opts && 'voteCount' in opts ? opts.voteCount : null;
      let optionDesc = opts && 'optionDesc' in opts ? opts.optionDesc : null;
      return new src__models__wtypes.ProposalOptionItem.new({optionNo: optionNo != null ? optionNo : this.optionNo, voteCount: voteCount != null ? voteCount : this.voteCount, optionDesc: optionDesc != null ? optionDesc : this.optionDesc});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProposalOptionItem.is(other) && other.optionNo == this.optionNo && other.voteCount == this.voteCount && other.optionDesc == this.optionDesc;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.optionNo, this.voteCount, this.optionDesc]);
    }
    toJson() {
      return src__models__wtypes.ProposalOptionItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProposalOptionItem.new = function(opts) {
    let optionNo = opts && 'optionNo' in opts ? opts.optionNo : null;
    let voteCount = opts && 'voteCount' in opts ? opts.voteCount : null;
    let optionDesc = opts && 'optionDesc' in opts ? opts.optionDesc : null;
    this[optionNo$] = optionNo;
    this[voteCount$] = voteCount;
    this[optionDesc$] = optionDesc;
  }).prototype = src__models__wtypes.ProposalOptionItem.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalOptionItem);
  const optionNo$ = Symbol("ProposalOptionItem.optionNo");
  const voteCount$ = Symbol("ProposalOptionItem.voteCount");
  const optionDesc$ = Symbol("ProposalOptionItem.optionDesc");
  src__models__wtypes.ProposalOptionItem[dart.implements] = () => [src__models__wtypes._ProposalOptionItem];
  dart.setMethodSignature(src__models__wtypes.ProposalOptionItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProposalOptionItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProposalOptionItem, [], {optionNo: core.int, voteCount: core.int, optionDesc: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProposalOptionItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProposalOptionItem.__proto__),
    optionNo: dart.finalFieldType(core.int),
    voteCount: dart.finalFieldType(core.int),
    optionDesc: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProposalOptionItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProposalOptionItem, ['hashCode']);
  let const$35;
  let const$36;
  src__models__wtypes.ProposalSaveRequest = class ProposalSaveRequest extends core.Object {
    get base() {
      return this[base$45];
    }
    set base(value) {
      super.base = value;
    }
    get kind() {
      return this[kind$8];
    }
    set kind(value) {
      super.kind = value;
    }
    get projectId() {
      return this[projectId$10];
    }
    set projectId(value) {
      super.projectId = value;
    }
    get eligible() {
      return this[eligible$0];
    }
    set eligible(value) {
      super.eligible = value;
    }
    get title() {
      return this[title$21];
    }
    set title(value) {
      super.title = value;
    }
    get summary() {
      return this[summary$1];
    }
    set summary(value) {
      super.summary = value;
    }
    get days() {
      return this[days$];
    }
    set days(value) {
      super.days = value;
    }
    get options() {
      return this[options$0];
    }
    set options(value) {
      super.options = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      let projectId = opts && 'projectId' in opts ? opts.projectId : null;
      let eligible = opts && 'eligible' in opts ? opts.eligible : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let summary = opts && 'summary' in opts ? opts.summary : null;
      let days = opts && 'days' in opts ? opts.days : null;
      let options = opts && 'options' in opts ? opts.options : null;
      return new src__models__wtypes.ProposalSaveRequest.new({base: base != null ? base : this.base, kind: kind != null ? kind : this.kind, projectId: projectId != null ? projectId : this.projectId, eligible: eligible != null ? eligible : this.eligible, title: title != null ? title : this.title, summary: summary != null ? summary : this.summary, days: days != null ? days : this.days, options: options != null ? options : this.options});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProposalSaveRequest.is(other) && dart.equals(other.base, this.base) && other.kind == this.kind && other.projectId == this.projectId && other.eligible == this.eligible && other.title == this.title && other.summary == this.summary && other.days == this.days && dart.test((const$36 || (const$36 = dart.const(new (ListEqualityOfString()).new(const$35 || (const$35 = dart.const(new (DefaultEqualityOfString()).new())))))).equals(other.options, this.options));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.kind, this.projectId, this.eligible, this.title, this.summary, this.days, this.options]);
    }
    toJson() {
      return src__models__wtypes.ProposalSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProposalSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    let projectId = opts && 'projectId' in opts ? opts.projectId : null;
    let eligible = opts && 'eligible' in opts ? opts.eligible : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let summary = opts && 'summary' in opts ? opts.summary : null;
    let days = opts && 'days' in opts ? opts.days : null;
    let options = opts && 'options' in opts ? opts.options : null;
    this[base$45] = base;
    this[kind$8] = kind;
    this[projectId$10] = projectId;
    this[eligible$0] = eligible;
    this[title$21] = title;
    this[summary$1] = summary;
    this[days$] = days;
    this[options$0] = options;
  }).prototype = src__models__wtypes.ProposalSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalSaveRequest);
  const base$45 = Symbol("ProposalSaveRequest.base");
  const kind$8 = Symbol("ProposalSaveRequest.kind");
  const projectId$10 = Symbol("ProposalSaveRequest.projectId");
  const eligible$0 = Symbol("ProposalSaveRequest.eligible");
  const title$21 = Symbol("ProposalSaveRequest.title");
  const summary$1 = Symbol("ProposalSaveRequest.summary");
  const days$ = Symbol("ProposalSaveRequest.days");
  const options$0 = Symbol("ProposalSaveRequest.options");
  src__models__wtypes.ProposalSaveRequest[dart.implements] = () => [src__models__wtypes._ProposalSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ProposalSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProposalSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProposalSaveRequest, [], {base: src__models__wtypes._APIRequestBase, kind: core.String, projectId: core.int, eligible: core.String, title: core.String, summary: core.String, days: core.int, options: core.List$(core.String)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProposalSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProposalSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    kind: dart.finalFieldType(core.String),
    projectId: dart.finalFieldType(core.int),
    eligible: dart.finalFieldType(core.String),
    title: dart.finalFieldType(core.String),
    summary: dart.finalFieldType(core.String),
    days: dart.finalFieldType(core.int),
    options: dart.finalFieldType(ListOfString())
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProposalSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProposalSaveRequest, ['hashCode']);
  src__models__wtypes.ProposalUserSaveRequest = class ProposalUserSaveRequest extends core.Object {
    get base() {
      return this[base$46];
    }
    set base(value) {
      super.base = value;
    }
    get proposalId() {
      return this[proposalId$1];
    }
    set proposalId(value) {
      super.proposalId = value;
    }
    get vote() {
      return this[vote$];
    }
    set vote(value) {
      super.vote = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let proposalId = opts && 'proposalId' in opts ? opts.proposalId : null;
      let vote = opts && 'vote' in opts ? opts.vote : null;
      return new src__models__wtypes.ProposalUserSaveRequest.new({base: base != null ? base : this.base, proposalId: proposalId != null ? proposalId : this.proposalId, vote: vote != null ? vote : this.vote});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ProposalUserSaveRequest.is(other) && dart.equals(other.base, this.base) && other.proposalId == this.proposalId && other.vote == this.vote;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.proposalId, this.vote]);
    }
    toJson() {
      return src__models__wtypes.ProposalUserSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ProposalUserSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let proposalId = opts && 'proposalId' in opts ? opts.proposalId : null;
    let vote = opts && 'vote' in opts ? opts.vote : null;
    this[base$46] = base;
    this[proposalId$1] = proposalId;
    this[vote$] = vote;
  }).prototype = src__models__wtypes.ProposalUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalUserSaveRequest);
  const base$46 = Symbol("ProposalUserSaveRequest.base");
  const proposalId$1 = Symbol("ProposalUserSaveRequest.proposalId");
  const vote$ = Symbol("ProposalUserSaveRequest.vote");
  src__models__wtypes.ProposalUserSaveRequest[dart.implements] = () => [src__models__wtypes._ProposalUserSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ProposalUserSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ProposalUserSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ProposalUserSaveRequest, [], {base: src__models__wtypes._APIRequestBase, proposalId: core.int, vote: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ProposalUserSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ProposalUserSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    proposalId: dart.finalFieldType(core.int),
    vote: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ProposalUserSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ProposalUserSaveRequest, ['hashCode']);
  src__models__wtypes.PushQueueGetRequest = class PushQueueGetRequest extends core.Object {
    get base() {
      return this[base$47];
    }
    set base(value) {
      super.base = value;
    }
    get depth() {
      return this[depth$];
    }
    set depth(value) {
      super.depth = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let depth = opts && 'depth' in opts ? opts.depth : null;
      return new src__models__wtypes.PushQueueGetRequest.new({base: base != null ? base : this.base, depth: depth != null ? depth : this.depth});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._PushQueueGetRequest.is(other) && dart.equals(other.base, this.base) && other.depth == this.depth;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.depth]);
    }
    toJson() {
      return src__models__wtypes.PushQueueGetRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.PushQueueGetRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let depth = opts && 'depth' in opts ? opts.depth : null;
    this[base$47] = base;
    this[depth$] = depth;
  }).prototype = src__models__wtypes.PushQueueGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes.PushQueueGetRequest);
  const base$47 = Symbol("PushQueueGetRequest.base");
  const depth$ = Symbol("PushQueueGetRequest.depth");
  src__models__wtypes.PushQueueGetRequest[dart.implements] = () => [src__models__wtypes._PushQueueGetRequest];
  dart.setMethodSignature(src__models__wtypes.PushQueueGetRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.PushQueueGetRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.PushQueueGetRequest, [], {base: src__models__wtypes._APIRequestBase, depth: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.PushQueueGetRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.PushQueueGetRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    depth: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.PushQueueGetRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.PushQueueGetRequest, ['hashCode']);
  let const$37;
  let const$38;
  src__models__wtypes.PushQueueGetResponse = class PushQueueGetResponse extends core.Object {
    get base() {
      return this[base$48];
    }
    set base(value) {
      super.base = value;
    }
    get items() {
      return this[items$0];
    }
    set items(value) {
      super.items = value;
    }
    get fullModeStatus() {
      return this[fullModeStatus$];
    }
    set fullModeStatus(value) {
      super.fullModeStatus = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let items = opts && 'items' in opts ? opts.items : null;
      let fullModeStatus = opts && 'fullModeStatus' in opts ? opts.fullModeStatus : null;
      return new src__models__wtypes.PushQueueGetResponse.new({base: base != null ? base : this.base, items: items != null ? items : this.items, fullModeStatus: fullModeStatus != null ? fullModeStatus : this.fullModeStatus});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._PushQueueGetResponse.is(other) && dart.equals(other.base, this.base) && dart.test((const$38 || (const$38 = dart.const(new (ListEqualityOf_PushQueueItem()).new(const$37 || (const$37 = dart.const(new (DefaultEqualityOf_PushQueueItem()).new())))))).equals(other.items, this.items)) && other.fullModeStatus == this.fullModeStatus;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.items, this.fullModeStatus]);
    }
    toJson() {
      return src__models__wtypes.PushQueueGetResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.PushQueueGetResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let items = opts && 'items' in opts ? opts.items : null;
    let fullModeStatus = opts && 'fullModeStatus' in opts ? opts.fullModeStatus : null;
    this[base$48] = base;
    this[items$0] = items;
    this[fullModeStatus$] = fullModeStatus;
  }).prototype = src__models__wtypes.PushQueueGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes.PushQueueGetResponse);
  const base$48 = Symbol("PushQueueGetResponse.base");
  const items$0 = Symbol("PushQueueGetResponse.items");
  const fullModeStatus$ = Symbol("PushQueueGetResponse.fullModeStatus");
  src__models__wtypes.PushQueueGetResponse[dart.implements] = () => [src__models__wtypes._PushQueueGetResponse];
  dart.setMethodSignature(src__models__wtypes.PushQueueGetResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.PushQueueGetResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.PushQueueGetResponse, [], {base: src__models__wtypes._APIResponseBase, items: core.List$(src__models__wtypes._PushQueueItem), fullModeStatus: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.PushQueueGetResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.PushQueueGetResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    items: dart.finalFieldType(ListOf_PushQueueItem()),
    fullModeStatus: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.PushQueueGetResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.PushQueueGetResponse, ['hashCode']);
  src__models__wtypes.PushQueueItem = class PushQueueItem extends core.Object {
    get kind() {
      return this[kind$9];
    }
    set kind(value) {
      super.kind = value;
    }
    get why() {
      return this[why$];
    }
    set why(value) {
      super.why = value;
    }
    get iid() {
      return this[iid$8];
    }
    set iid(value) {
      super.iid = value;
    }
    get sid() {
      return this[sid$];
    }
    set sid(value) {
      super.sid = value;
    }
    get text() {
      return this[text$];
    }
    set text(value) {
      super.text = value;
    }
    get linkText() {
      return this[linkText$0];
    }
    set linkText(value) {
      super.linkText = value;
    }
    get linkPaneKey() {
      return this[linkPaneKey$0];
    }
    set linkPaneKey(value) {
      super.linkPaneKey = value;
    }
    copyWith(opts) {
      let kind = opts && 'kind' in opts ? opts.kind : null;
      let why = opts && 'why' in opts ? opts.why : null;
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let sid = opts && 'sid' in opts ? opts.sid : null;
      let text = opts && 'text' in opts ? opts.text : null;
      let linkText = opts && 'linkText' in opts ? opts.linkText : null;
      let linkPaneKey = opts && 'linkPaneKey' in opts ? opts.linkPaneKey : null;
      return new src__models__wtypes.PushQueueItem.new({kind: kind != null ? kind : this.kind, why: why != null ? why : this.why, iid: iid != null ? iid : this.iid, sid: sid != null ? sid : this.sid, text: text != null ? text : this.text, linkText: linkText != null ? linkText : this.linkText, linkPaneKey: linkPaneKey != null ? linkPaneKey : this.linkPaneKey});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._PushQueueItem.is(other) && other.kind == this.kind && other.why == this.why && other.iid == this.iid && other.sid == this.sid && other.text == this.text && other.linkText == this.linkText && other.linkPaneKey == this.linkPaneKey;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.kind, this.why, this.iid, this.sid, this.text, this.linkText, this.linkPaneKey]);
    }
    toJson() {
      return src__models__wtypes.PushQueueItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.PushQueueItem.new = function(opts) {
    let kind = opts && 'kind' in opts ? opts.kind : null;
    let why = opts && 'why' in opts ? opts.why : null;
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let sid = opts && 'sid' in opts ? opts.sid : null;
    let text = opts && 'text' in opts ? opts.text : null;
    let linkText = opts && 'linkText' in opts ? opts.linkText : null;
    let linkPaneKey = opts && 'linkPaneKey' in opts ? opts.linkPaneKey : null;
    this[kind$9] = kind;
    this[why$] = why;
    this[iid$8] = iid;
    this[sid$] = sid;
    this[text$] = text;
    this[linkText$0] = linkText;
    this[linkPaneKey$0] = linkPaneKey;
  }).prototype = src__models__wtypes.PushQueueItem.prototype;
  dart.addTypeTests(src__models__wtypes.PushQueueItem);
  const kind$9 = Symbol("PushQueueItem.kind");
  const why$ = Symbol("PushQueueItem.why");
  const iid$8 = Symbol("PushQueueItem.iid");
  const sid$ = Symbol("PushQueueItem.sid");
  const text$ = Symbol("PushQueueItem.text");
  const linkText$0 = Symbol("PushQueueItem.linkText");
  const linkPaneKey$0 = Symbol("PushQueueItem.linkPaneKey");
  src__models__wtypes.PushQueueItem[dart.implements] = () => [src__models__wtypes._PushQueueItem];
  dart.setMethodSignature(src__models__wtypes.PushQueueItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.PushQueueItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.PushQueueItem, [], {kind: core.String, why: core.String, iid: core.int, sid: core.String, text: core.String, linkText: core.String, linkPaneKey: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.PushQueueItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.PushQueueItem.__proto__),
    kind: dart.finalFieldType(core.String),
    why: dart.finalFieldType(core.String),
    iid: dart.finalFieldType(core.int),
    sid: dart.finalFieldType(core.String),
    text: dart.finalFieldType(core.String),
    linkText: dart.finalFieldType(core.String),
    linkPaneKey: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.PushQueueItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.PushQueueItem, ['hashCode']);
  src__models__wtypes.ResourceQueryRequest = class ResourceQueryRequest extends core.Object {
    get base() {
      return this[base$49];
    }
    set base(value) {
      super.base = value;
    }
    get categoryId() {
      return this[categoryId$1];
    }
    set categoryId(value) {
      super.categoryId = value;
    }
    get title() {
      return this[title$22];
    }
    set title(value) {
      super.title = value;
    }
    get kind() {
      return this[kind$10];
    }
    set kind(value) {
      super.kind = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let categoryId = opts && 'categoryId' in opts ? opts.categoryId : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      return new src__models__wtypes.ResourceQueryRequest.new({base: base != null ? base : this.base, categoryId: categoryId != null ? categoryId : this.categoryId, title: title != null ? title : this.title, kind: kind != null ? kind : this.kind});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ResourceQueryRequest.is(other) && dart.equals(other.base, this.base) && other.categoryId == this.categoryId && other.title == this.title && other.kind == this.kind;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.categoryId, this.title, this.kind]);
    }
    toJson() {
      return src__models__wtypes.ResourceQueryRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ResourceQueryRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let categoryId = opts && 'categoryId' in opts ? opts.categoryId : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    this[base$49] = base;
    this[categoryId$1] = categoryId;
    this[title$22] = title;
    this[kind$10] = kind;
  }).prototype = src__models__wtypes.ResourceQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceQueryRequest);
  const base$49 = Symbol("ResourceQueryRequest.base");
  const categoryId$1 = Symbol("ResourceQueryRequest.categoryId");
  const title$22 = Symbol("ResourceQueryRequest.title");
  const kind$10 = Symbol("ResourceQueryRequest.kind");
  src__models__wtypes.ResourceQueryRequest[dart.implements] = () => [src__models__wtypes._ResourceQueryRequest];
  dart.setMethodSignature(src__models__wtypes.ResourceQueryRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ResourceQueryRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ResourceQueryRequest, [], {base: src__models__wtypes._APIRequestBase, categoryId: core.int, title: core.String, kind: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ResourceQueryRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ResourceQueryRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    categoryId: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String),
    kind: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ResourceQueryRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ResourceQueryRequest, ['hashCode']);
  let const$39;
  let const$40;
  src__models__wtypes.ResourceQueryResponse = class ResourceQueryResponse extends core.Object {
    get base() {
      return this[base$50];
    }
    set base(value) {
      super.base = value;
    }
    get items() {
      return this[items$1];
    }
    set items(value) {
      super.items = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let items = opts && 'items' in opts ? opts.items : null;
      return new src__models__wtypes.ResourceQueryResponse.new({base: base != null ? base : this.base, items: items != null ? items : this.items});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ResourceQueryResponse.is(other) && dart.equals(other.base, this.base) && dart.test((const$40 || (const$40 = dart.const(new (ListEqualityOf_ResourceItem()).new(const$39 || (const$39 = dart.const(new (DefaultEqualityOf_ResourceItem()).new())))))).equals(other.items, this.items));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.items]);
    }
    toJson() {
      return src__models__wtypes.ResourceQueryResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ResourceQueryResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let items = opts && 'items' in opts ? opts.items : null;
    this[base$50] = base;
    this[items$1] = items;
  }).prototype = src__models__wtypes.ResourceQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceQueryResponse);
  const base$50 = Symbol("ResourceQueryResponse.base");
  const items$1 = Symbol("ResourceQueryResponse.items");
  src__models__wtypes.ResourceQueryResponse[dart.implements] = () => [src__models__wtypes._ResourceQueryResponse];
  dart.setMethodSignature(src__models__wtypes.ResourceQueryResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ResourceQueryResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ResourceQueryResponse, [], {base: src__models__wtypes._APIResponseBase, items: core.List$(src__models__wtypes._ResourceItem)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ResourceQueryResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ResourceQueryResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    items: dart.finalFieldType(ListOf_ResourceItem())
  }));
  dart.defineExtensionMethods(src__models__wtypes.ResourceQueryResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ResourceQueryResponse, ['hashCode']);
  src__models__wtypes.ResourceItem = class ResourceItem extends core.Object {
    get iid() {
      return this[iid$9];
    }
    set iid(value) {
      super.iid = value;
    }
    get title() {
      return this[title$23];
    }
    set title(value) {
      super.title = value;
    }
    get url() {
      return this[url$];
    }
    set url(value) {
      super.url = value;
    }
    get description() {
      return this[description$6];
    }
    set description(value) {
      super.description = value;
    }
    copyWith(opts) {
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let url = opts && 'url' in opts ? opts.url : null;
      let description = opts && 'description' in opts ? opts.description : null;
      return new src__models__wtypes.ResourceItem.new({iid: iid != null ? iid : this.iid, title: title != null ? title : this.title, url: url != null ? url : this.url, description: description != null ? description : this.description});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ResourceItem.is(other) && other.iid == this.iid && other.title == this.title && other.url == this.url && other.description == this.description;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.iid, this.title, this.url, this.description]);
    }
    toJson() {
      return src__models__wtypes.ResourceItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ResourceItem.new = function(opts) {
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let url = opts && 'url' in opts ? opts.url : null;
    let description = opts && 'description' in opts ? opts.description : null;
    this[iid$9] = iid;
    this[title$23] = title;
    this[url$] = url;
    this[description$6] = description;
  }).prototype = src__models__wtypes.ResourceItem.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceItem);
  const iid$9 = Symbol("ResourceItem.iid");
  const title$23 = Symbol("ResourceItem.title");
  const url$ = Symbol("ResourceItem.url");
  const description$6 = Symbol("ResourceItem.description");
  src__models__wtypes.ResourceItem[dart.implements] = () => [src__models__wtypes._ResourceItem];
  dart.setMethodSignature(src__models__wtypes.ResourceItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ResourceItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ResourceItem, [], {iid: core.int, title: core.String, url: core.String, description: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ResourceItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.ResourceItem.__proto__),
    iid: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String),
    url: dart.finalFieldType(core.String),
    description: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ResourceItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ResourceItem, ['hashCode']);
  src__models__wtypes.ResourceGetRequest = class ResourceGetRequest extends core.Object {
    get base() {
      return this[base$51];
    }
    set base(value) {
      super.base = value;
    }
    get iid() {
      return this[iid$10];
    }
    set iid(value) {
      super.iid = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let iid = opts && 'iid' in opts ? opts.iid : null;
      return new src__models__wtypes.ResourceGetRequest.new({base: base != null ? base : this.base, iid: iid != null ? iid : this.iid});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ResourceGetRequest.is(other) && dart.equals(other.base, this.base) && other.iid == this.iid;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.iid]);
    }
    toJson() {
      return src__models__wtypes.ResourceGetRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ResourceGetRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let iid = opts && 'iid' in opts ? opts.iid : null;
    this[base$51] = base;
    this[iid$10] = iid;
  }).prototype = src__models__wtypes.ResourceGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceGetRequest);
  const base$51 = Symbol("ResourceGetRequest.base");
  const iid$10 = Symbol("ResourceGetRequest.iid");
  src__models__wtypes.ResourceGetRequest[dart.implements] = () => [src__models__wtypes._ResourceGetRequest];
  dart.setMethodSignature(src__models__wtypes.ResourceGetRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ResourceGetRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ResourceGetRequest, [], {base: src__models__wtypes._APIRequestBase, iid: core.int}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ResourceGetRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ResourceGetRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    iid: dart.finalFieldType(core.int)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ResourceGetRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ResourceGetRequest, ['hashCode']);
  src__models__wtypes.ResourceGetResponse = class ResourceGetResponse extends core.Object {
    get base() {
      return this[base$52];
    }
    set base(value) {
      super.base = value;
    }
    get categoryId() {
      return this[categoryId$2];
    }
    set categoryId(value) {
      super.categoryId = value;
    }
    get userId() {
      return this[userId$3];
    }
    set userId(value) {
      super.userId = value;
    }
    get importantCount() {
      return this[importantCount$];
    }
    set importantCount(value) {
      super.importantCount = value;
    }
    get title() {
      return this[title$24];
    }
    set title(value) {
      super.title = value;
    }
    get description() {
      return this[description$7];
    }
    set description(value) {
      super.description = value;
    }
    get createdAtR() {
      return this[createdAtR$3];
    }
    set createdAtR(value) {
      super.createdAtR = value;
    }
    get visible() {
      return this[visible$];
    }
    set visible(value) {
      super.visible = value;
    }
    get kind() {
      return this[kind$11];
    }
    set kind(value) {
      super.kind = value;
    }
    get url() {
      return this[url$0];
    }
    set url(value) {
      super.url = value;
    }
    get userKind() {
      return this[userKind$0];
    }
    set userKind(value) {
      super.userKind = value;
    }
    get isSiteAdmin() {
      return this[isSiteAdmin$0];
    }
    set isSiteAdmin(value) {
      super.isSiteAdmin = value;
    }
    get isCreator() {
      return this[isCreator$0];
    }
    set isCreator(value) {
      super.isCreator = value;
    }
    get nick() {
      return this[nick$3];
    }
    set nick(value) {
      super.nick = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let categoryId = opts && 'categoryId' in opts ? opts.categoryId : null;
      let userId = opts && 'userId' in opts ? opts.userId : null;
      let importantCount = opts && 'importantCount' in opts ? opts.importantCount : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let description = opts && 'description' in opts ? opts.description : null;
      let createdAtR = opts && 'createdAtR' in opts ? opts.createdAtR : null;
      let visible = opts && 'visible' in opts ? opts.visible : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      let url = opts && 'url' in opts ? opts.url : null;
      let userKind = opts && 'userKind' in opts ? opts.userKind : null;
      let isSiteAdmin = opts && 'isSiteAdmin' in opts ? opts.isSiteAdmin : null;
      let isCreator = opts && 'isCreator' in opts ? opts.isCreator : null;
      let nick = opts && 'nick' in opts ? opts.nick : null;
      return new src__models__wtypes.ResourceGetResponse.new({base: base != null ? base : this.base, categoryId: categoryId != null ? categoryId : this.categoryId, userId: userId != null ? userId : this.userId, importantCount: importantCount != null ? importantCount : this.importantCount, title: title != null ? title : this.title, description: description != null ? description : this.description, createdAtR: createdAtR != null ? createdAtR : this.createdAtR, visible: visible != null ? visible : this.visible, kind: kind != null ? kind : this.kind, url: url != null ? url : this.url, userKind: userKind != null ? userKind : this.userKind, isSiteAdmin: isSiteAdmin != null ? isSiteAdmin : this.isSiteAdmin, isCreator: isCreator != null ? isCreator : this.isCreator, nick: nick != null ? nick : this.nick});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ResourceGetResponse.is(other) && dart.equals(other.base, this.base) && other.categoryId == this.categoryId && other.userId == this.userId && other.importantCount == this.importantCount && other.title == this.title && other.description == this.description && other.createdAtR == this.createdAtR && other.visible == this.visible && other.kind == this.kind && other.url == this.url && other.userKind == this.userKind && other.isSiteAdmin == this.isSiteAdmin && other.isCreator == this.isCreator && other.nick == this.nick;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.categoryId, this.userId, this.importantCount, this.title, this.description, this.createdAtR, this.visible, this.kind, this.url, this.userKind, this.isSiteAdmin, this.isCreator, this.nick]);
    }
    toJson() {
      return src__models__wtypes.ResourceGetResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ResourceGetResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let categoryId = opts && 'categoryId' in opts ? opts.categoryId : null;
    let userId = opts && 'userId' in opts ? opts.userId : null;
    let importantCount = opts && 'importantCount' in opts ? opts.importantCount : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let description = opts && 'description' in opts ? opts.description : null;
    let createdAtR = opts && 'createdAtR' in opts ? opts.createdAtR : null;
    let visible = opts && 'visible' in opts ? opts.visible : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    let url = opts && 'url' in opts ? opts.url : null;
    let userKind = opts && 'userKind' in opts ? opts.userKind : null;
    let isSiteAdmin = opts && 'isSiteAdmin' in opts ? opts.isSiteAdmin : null;
    let isCreator = opts && 'isCreator' in opts ? opts.isCreator : null;
    let nick = opts && 'nick' in opts ? opts.nick : null;
    this[base$52] = base;
    this[categoryId$2] = categoryId;
    this[userId$3] = userId;
    this[importantCount$] = importantCount;
    this[title$24] = title;
    this[description$7] = description;
    this[createdAtR$3] = createdAtR;
    this[visible$] = visible;
    this[kind$11] = kind;
    this[url$0] = url;
    this[userKind$0] = userKind;
    this[isSiteAdmin$0] = isSiteAdmin;
    this[isCreator$0] = isCreator;
    this[nick$3] = nick;
  }).prototype = src__models__wtypes.ResourceGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceGetResponse);
  const base$52 = Symbol("ResourceGetResponse.base");
  const categoryId$2 = Symbol("ResourceGetResponse.categoryId");
  const userId$3 = Symbol("ResourceGetResponse.userId");
  const importantCount$ = Symbol("ResourceGetResponse.importantCount");
  const title$24 = Symbol("ResourceGetResponse.title");
  const description$7 = Symbol("ResourceGetResponse.description");
  const createdAtR$3 = Symbol("ResourceGetResponse.createdAtR");
  const visible$ = Symbol("ResourceGetResponse.visible");
  const kind$11 = Symbol("ResourceGetResponse.kind");
  const url$0 = Symbol("ResourceGetResponse.url");
  const userKind$0 = Symbol("ResourceGetResponse.userKind");
  const isSiteAdmin$0 = Symbol("ResourceGetResponse.isSiteAdmin");
  const isCreator$0 = Symbol("ResourceGetResponse.isCreator");
  const nick$3 = Symbol("ResourceGetResponse.nick");
  src__models__wtypes.ResourceGetResponse[dart.implements] = () => [src__models__wtypes._ResourceGetResponse];
  dart.setMethodSignature(src__models__wtypes.ResourceGetResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ResourceGetResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ResourceGetResponse, [], {base: src__models__wtypes._APIResponseBase, categoryId: core.int, userId: core.int, importantCount: core.int, title: core.String, description: core.String, createdAtR: core.String, visible: core.String, kind: core.String, url: core.String, userKind: core.String, isSiteAdmin: core.String, isCreator: core.String, nick: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ResourceGetResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.ResourceGetResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    categoryId: dart.finalFieldType(core.int),
    userId: dart.finalFieldType(core.int),
    importantCount: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String),
    description: dart.finalFieldType(core.String),
    createdAtR: dart.finalFieldType(core.String),
    visible: dart.finalFieldType(core.String),
    kind: dart.finalFieldType(core.String),
    url: dart.finalFieldType(core.String),
    userKind: dart.finalFieldType(core.String),
    isSiteAdmin: dart.finalFieldType(core.String),
    isCreator: dart.finalFieldType(core.String),
    nick: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ResourceGetResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ResourceGetResponse, ['hashCode']);
  src__models__wtypes.ResourceSaveRequest = class ResourceSaveRequest extends core.Object {
    get base() {
      return this[base$53];
    }
    set base(value) {
      super.base = value;
    }
    get iid() {
      return this[iid$11];
    }
    set iid(value) {
      super.iid = value;
    }
    get categoryId() {
      return this[categoryId$3];
    }
    set categoryId(value) {
      super.categoryId = value;
    }
    get title() {
      return this[title$25];
    }
    set title(value) {
      super.title = value;
    }
    get description() {
      return this[description$8];
    }
    set description(value) {
      super.description = value;
    }
    get kind() {
      return this[kind$12];
    }
    set kind(value) {
      super.kind = value;
    }
    get url() {
      return this[url$1];
    }
    set url(value) {
      super.url = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let categoryId = opts && 'categoryId' in opts ? opts.categoryId : null;
      let title = opts && 'title' in opts ? opts.title : null;
      let description = opts && 'description' in opts ? opts.description : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      let url = opts && 'url' in opts ? opts.url : null;
      return new src__models__wtypes.ResourceSaveRequest.new({base: base != null ? base : this.base, iid: iid != null ? iid : this.iid, categoryId: categoryId != null ? categoryId : this.categoryId, title: title != null ? title : this.title, description: description != null ? description : this.description, kind: kind != null ? kind : this.kind, url: url != null ? url : this.url});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ResourceSaveRequest.is(other) && dart.equals(other.base, this.base) && other.iid == this.iid && other.categoryId == this.categoryId && other.title == this.title && other.description == this.description && other.kind == this.kind && other.url == this.url;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.iid, this.categoryId, this.title, this.description, this.kind, this.url]);
    }
    toJson() {
      return src__models__wtypes.ResourceSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ResourceSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let categoryId = opts && 'categoryId' in opts ? opts.categoryId : null;
    let title = opts && 'title' in opts ? opts.title : null;
    let description = opts && 'description' in opts ? opts.description : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    let url = opts && 'url' in opts ? opts.url : null;
    this[base$53] = base;
    this[iid$11] = iid;
    this[categoryId$3] = categoryId;
    this[title$25] = title;
    this[description$8] = description;
    this[kind$12] = kind;
    this[url$1] = url;
  }).prototype = src__models__wtypes.ResourceSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceSaveRequest);
  const base$53 = Symbol("ResourceSaveRequest.base");
  const iid$11 = Symbol("ResourceSaveRequest.iid");
  const categoryId$3 = Symbol("ResourceSaveRequest.categoryId");
  const title$25 = Symbol("ResourceSaveRequest.title");
  const description$8 = Symbol("ResourceSaveRequest.description");
  const kind$12 = Symbol("ResourceSaveRequest.kind");
  const url$1 = Symbol("ResourceSaveRequest.url");
  src__models__wtypes.ResourceSaveRequest[dart.implements] = () => [src__models__wtypes._ResourceSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ResourceSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ResourceSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ResourceSaveRequest, [], {base: src__models__wtypes._APIRequestBase, iid: core.int, categoryId: core.int, title: core.String, description: core.String, kind: core.String, url: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ResourceSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ResourceSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    iid: dart.finalFieldType(core.int),
    categoryId: dart.finalFieldType(core.int),
    title: dart.finalFieldType(core.String),
    description: dart.finalFieldType(core.String),
    kind: dart.finalFieldType(core.String),
    url: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ResourceSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ResourceSaveRequest, ['hashCode']);
  src__models__wtypes.ResourceTriageRequest = class ResourceTriageRequest extends core.Object {
    get base() {
      return this[base$54];
    }
    set base(value) {
      super.base = value;
    }
    get iid() {
      return this[iid$12];
    }
    set iid(value) {
      super.iid = value;
    }
    get mode() {
      return this[mode$2];
    }
    set mode(value) {
      super.mode = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let mode = opts && 'mode' in opts ? opts.mode : null;
      return new src__models__wtypes.ResourceTriageRequest.new({base: base != null ? base : this.base, iid: iid != null ? iid : this.iid, mode: mode != null ? mode : this.mode});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ResourceTriageRequest.is(other) && dart.equals(other.base, this.base) && other.iid == this.iid && other.mode == this.mode;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.iid, this.mode]);
    }
    toJson() {
      return src__models__wtypes.ResourceTriageRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ResourceTriageRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let mode = opts && 'mode' in opts ? opts.mode : null;
    this[base$54] = base;
    this[iid$12] = iid;
    this[mode$2] = mode;
  }).prototype = src__models__wtypes.ResourceTriageRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceTriageRequest);
  const base$54 = Symbol("ResourceTriageRequest.base");
  const iid$12 = Symbol("ResourceTriageRequest.iid");
  const mode$2 = Symbol("ResourceTriageRequest.mode");
  src__models__wtypes.ResourceTriageRequest[dart.implements] = () => [src__models__wtypes._ResourceTriageRequest];
  dart.setMethodSignature(src__models__wtypes.ResourceTriageRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ResourceTriageRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ResourceTriageRequest, [], {base: src__models__wtypes._APIRequestBase, iid: core.int, mode: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ResourceTriageRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ResourceTriageRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    iid: dart.finalFieldType(core.int),
    mode: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ResourceTriageRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ResourceTriageRequest, ['hashCode']);
  src__models__wtypes.ResourceUserSaveRequest = class ResourceUserSaveRequest extends core.Object {
    get base() {
      return this[base$55];
    }
    set base(value) {
      super.base = value;
    }
    get iid() {
      return this[iid$13];
    }
    set iid(value) {
      super.iid = value;
    }
    get kind() {
      return this[kind$13];
    }
    set kind(value) {
      super.kind = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      return new src__models__wtypes.ResourceUserSaveRequest.new({base: base != null ? base : this.base, iid: iid != null ? iid : this.iid, kind: kind != null ? kind : this.kind});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._ResourceUserSaveRequest.is(other) && dart.equals(other.base, this.base) && other.iid == this.iid && other.kind == this.kind;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.iid, this.kind]);
    }
    toJson() {
      return src__models__wtypes.ResourceUserSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.ResourceUserSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    this[base$55] = base;
    this[iid$13] = iid;
    this[kind$13] = kind;
  }).prototype = src__models__wtypes.ResourceUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceUserSaveRequest);
  const base$55 = Symbol("ResourceUserSaveRequest.base");
  const iid$13 = Symbol("ResourceUserSaveRequest.iid");
  const kind$13 = Symbol("ResourceUserSaveRequest.kind");
  src__models__wtypes.ResourceUserSaveRequest[dart.implements] = () => [src__models__wtypes._ResourceUserSaveRequest];
  dart.setMethodSignature(src__models__wtypes.ResourceUserSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.ResourceUserSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.ResourceUserSaveRequest, [], {base: src__models__wtypes._APIRequestBase, iid: core.int, kind: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.ResourceUserSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.ResourceUserSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    iid: dart.finalFieldType(core.int),
    kind: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.ResourceUserSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.ResourceUserSaveRequest, ['hashCode']);
  src__models__wtypes.UserQueryRequest = class UserQueryRequest extends core.Object {
    get base() {
      return this[base$56];
    }
    set base(value) {
      super.base = value;
    }
    get name() {
      return this[name$0];
    }
    set name(value) {
      super.name = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let name = opts && 'name' in opts ? opts.name : null;
      return new src__models__wtypes.UserQueryRequest.new({base: base != null ? base : this.base, name: name != null ? name : this.name});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._UserQueryRequest.is(other) && dart.equals(other.base, this.base) && other.name == this.name;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.name]);
    }
    toJson() {
      return src__models__wtypes.UserQueryRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.UserQueryRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let name = opts && 'name' in opts ? opts.name : null;
    this[base$56] = base;
    this[name$0] = name;
  }).prototype = src__models__wtypes.UserQueryRequest.prototype;
  dart.addTypeTests(src__models__wtypes.UserQueryRequest);
  const base$56 = Symbol("UserQueryRequest.base");
  const name$0 = Symbol("UserQueryRequest.name");
  src__models__wtypes.UserQueryRequest[dart.implements] = () => [src__models__wtypes._UserQueryRequest];
  dart.setMethodSignature(src__models__wtypes.UserQueryRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.UserQueryRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.UserQueryRequest, [], {base: src__models__wtypes._APIRequestBase, name: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.UserQueryRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.UserQueryRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    name: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.UserQueryRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.UserQueryRequest, ['hashCode']);
  let const$41;
  let const$42;
  src__models__wtypes.UserQueryResponse = class UserQueryResponse extends core.Object {
    get base() {
      return this[base$57];
    }
    set base(value) {
      super.base = value;
    }
    get users() {
      return this[users$1];
    }
    set users(value) {
      super.users = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let users = opts && 'users' in opts ? opts.users : null;
      return new src__models__wtypes.UserQueryResponse.new({base: base != null ? base : this.base, users: users != null ? users : this.users});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._UserQueryResponse.is(other) && dart.equals(other.base, this.base) && dart.test((const$42 || (const$42 = dart.const(new (ListEqualityOf_UserQueryItem()).new(const$41 || (const$41 = dart.const(new (DefaultEqualityOf_UserQueryItem()).new())))))).equals(other.users, this.users));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.users]);
    }
    toJson() {
      return src__models__wtypes.UserQueryResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.UserQueryResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let users = opts && 'users' in opts ? opts.users : null;
    this[base$57] = base;
    this[users$1] = users;
  }).prototype = src__models__wtypes.UserQueryResponse.prototype;
  dart.addTypeTests(src__models__wtypes.UserQueryResponse);
  const base$57 = Symbol("UserQueryResponse.base");
  const users$1 = Symbol("UserQueryResponse.users");
  src__models__wtypes.UserQueryResponse[dart.implements] = () => [src__models__wtypes._UserQueryResponse];
  dart.setMethodSignature(src__models__wtypes.UserQueryResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.UserQueryResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.UserQueryResponse, [], {base: src__models__wtypes._APIResponseBase, users: core.List$(src__models__wtypes._UserQueryItem)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.UserQueryResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.UserQueryResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    users: dart.finalFieldType(ListOf_UserQueryItem())
  }));
  dart.defineExtensionMethods(src__models__wtypes.UserQueryResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.UserQueryResponse, ['hashCode']);
  src__models__wtypes.UserQueryItem = class UserQueryItem extends core.Object {
    get iid() {
      return this[iid$14];
    }
    set iid(value) {
      super.iid = value;
    }
    get nick() {
      return this[nick$4];
    }
    set nick(value) {
      super.nick = value;
    }
    get kind() {
      return this[kind$14];
    }
    set kind(value) {
      super.kind = value;
    }
    get publicName() {
      return this[publicName$2];
    }
    set publicName(value) {
      super.publicName = value;
    }
    get avatarUrl() {
      return this[avatarUrl$3];
    }
    set avatarUrl(value) {
      super.avatarUrl = value;
    }
    copyWith(opts) {
      let iid = opts && 'iid' in opts ? opts.iid : null;
      let nick = opts && 'nick' in opts ? opts.nick : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      let publicName = opts && 'publicName' in opts ? opts.publicName : null;
      let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
      return new src__models__wtypes.UserQueryItem.new({iid: iid != null ? iid : this.iid, nick: nick != null ? nick : this.nick, kind: kind != null ? kind : this.kind, publicName: publicName != null ? publicName : this.publicName, avatarUrl: avatarUrl != null ? avatarUrl : this.avatarUrl});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._UserQueryItem.is(other) && other.iid == this.iid && other.nick == this.nick && other.kind == this.kind && other.publicName == this.publicName && other.avatarUrl == this.avatarUrl;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.iid, this.nick, this.kind, this.publicName, this.avatarUrl]);
    }
    toJson() {
      return src__models__wtypes.UserQueryItemSerializer.toMap(this);
    }
  };
  (src__models__wtypes.UserQueryItem.new = function(opts) {
    let iid = opts && 'iid' in opts ? opts.iid : null;
    let nick = opts && 'nick' in opts ? opts.nick : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    let publicName = opts && 'publicName' in opts ? opts.publicName : null;
    let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
    this[iid$14] = iid;
    this[nick$4] = nick;
    this[kind$14] = kind;
    this[publicName$2] = publicName;
    this[avatarUrl$3] = avatarUrl;
  }).prototype = src__models__wtypes.UserQueryItem.prototype;
  dart.addTypeTests(src__models__wtypes.UserQueryItem);
  const iid$14 = Symbol("UserQueryItem.iid");
  const nick$4 = Symbol("UserQueryItem.nick");
  const kind$14 = Symbol("UserQueryItem.kind");
  const publicName$2 = Symbol("UserQueryItem.publicName");
  const avatarUrl$3 = Symbol("UserQueryItem.avatarUrl");
  src__models__wtypes.UserQueryItem[dart.implements] = () => [src__models__wtypes._UserQueryItem];
  dart.setMethodSignature(src__models__wtypes.UserQueryItem, () => ({
    __proto__: dart.getMethods(src__models__wtypes.UserQueryItem.__proto__),
    copyWith: dart.fnType(src__models__wtypes.UserQueryItem, [], {iid: core.int, nick: core.String, kind: core.String, publicName: core.String, avatarUrl: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.UserQueryItem, () => ({
    __proto__: dart.getFields(src__models__wtypes.UserQueryItem.__proto__),
    iid: dart.finalFieldType(core.int),
    nick: dart.finalFieldType(core.String),
    kind: dart.finalFieldType(core.String),
    publicName: dart.finalFieldType(core.String),
    avatarUrl: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.UserQueryItem, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.UserQueryItem, ['hashCode']);
  src__models__wtypes.UserGetRequest = class UserGetRequest extends core.Object {
    get base() {
      return this[base$58];
    }
    set base(value) {
      super.base = value;
    }
    get userId() {
      return this[userId$4];
    }
    set userId(value) {
      super.userId = value;
    }
    get includeDetail() {
      return this[includeDetail$];
    }
    set includeDetail(value) {
      super.includeDetail = value;
    }
    get includeEditing() {
      return this[includeEditing$];
    }
    set includeEditing(value) {
      super.includeEditing = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let userId = opts && 'userId' in opts ? opts.userId : null;
      let includeDetail = opts && 'includeDetail' in opts ? opts.includeDetail : null;
      let includeEditing = opts && 'includeEditing' in opts ? opts.includeEditing : null;
      return new src__models__wtypes.UserGetRequest.new({base: base != null ? base : this.base, userId: userId != null ? userId : this.userId, includeDetail: includeDetail != null ? includeDetail : this.includeDetail, includeEditing: includeEditing != null ? includeEditing : this.includeEditing});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._UserGetRequest.is(other) && dart.equals(other.base, this.base) && other.userId == this.userId && other.includeDetail == this.includeDetail && other.includeEditing == this.includeEditing;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.userId, this.includeDetail, this.includeEditing]);
    }
    toJson() {
      return src__models__wtypes.UserGetRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.UserGetRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let userId = opts && 'userId' in opts ? opts.userId : null;
    let includeDetail = opts && 'includeDetail' in opts ? opts.includeDetail : null;
    let includeEditing = opts && 'includeEditing' in opts ? opts.includeEditing : null;
    this[base$58] = base;
    this[userId$4] = userId;
    this[includeDetail$] = includeDetail;
    this[includeEditing$] = includeEditing;
  }).prototype = src__models__wtypes.UserGetRequest.prototype;
  dart.addTypeTests(src__models__wtypes.UserGetRequest);
  const base$58 = Symbol("UserGetRequest.base");
  const userId$4 = Symbol("UserGetRequest.userId");
  const includeDetail$ = Symbol("UserGetRequest.includeDetail");
  const includeEditing$ = Symbol("UserGetRequest.includeEditing");
  src__models__wtypes.UserGetRequest[dart.implements] = () => [src__models__wtypes._UserGetRequest];
  dart.setMethodSignature(src__models__wtypes.UserGetRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.UserGetRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.UserGetRequest, [], {base: src__models__wtypes._APIRequestBase, userId: core.int, includeDetail: core.String, includeEditing: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.UserGetRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.UserGetRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    userId: dart.finalFieldType(core.int),
    includeDetail: dart.finalFieldType(core.String),
    includeEditing: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.UserGetRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.UserGetRequest, ['hashCode']);
  let const$43;
  let const$44;
  let const$45;
  let const$46;
  let const$47;
  let const$48;
  let const$49;
  let const$50;
  let const$51;
  let const$52;
  let const$53;
  src__models__wtypes.UserGetResponse = class UserGetResponse extends core.Object {
    get base() {
      return this[base$59];
    }
    set base(value) {
      super.base = value;
    }
    get status() {
      return this[status$2];
    }
    set status(value) {
      super.status = value;
    }
    get nick() {
      return this[nick$5];
    }
    set nick(value) {
      super.nick = value;
    }
    get email() {
      return this[email$];
    }
    set email(value) {
      super.email = value;
    }
    get kind() {
      return this[kind$15];
    }
    set kind(value) {
      super.kind = value;
    }
    get isSiteAdmin() {
      return this[isSiteAdmin$1];
    }
    set isSiteAdmin(value) {
      super.isSiteAdmin = value;
    }
    get publicName() {
      return this[publicName$3];
    }
    set publicName(value) {
      super.publicName = value;
    }
    get prefEmailNotify() {
      return this[prefEmailNotify$];
    }
    set prefEmailNotify(value) {
      super.prefEmailNotify = value;
    }
    get publicLinks() {
      return this[publicLinks$];
    }
    set publicLinks(value) {
      super.publicLinks = value;
    }
    get timeZone() {
      return this[timeZone$];
    }
    set timeZone(value) {
      super.timeZone = value;
    }
    get allTimeZones() {
      return this[allTimeZones$];
    }
    set allTimeZones(value) {
      super.allTimeZones = value;
    }
    get avatarUrl() {
      return this[avatarUrl$4];
    }
    set avatarUrl(value) {
      super.avatarUrl = value;
    }
    get userUserKind() {
      return this[userUserKind$];
    }
    set userUserKind(value) {
      super.userUserKind = value;
    }
    get events() {
      return this[events$0];
    }
    set events(value) {
      super.events = value;
    }
    get projects() {
      return this[projects$0];
    }
    set projects(value) {
      super.projects = value;
    }
    get resources() {
      return this[resources$];
    }
    set resources(value) {
      super.resources = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let status = opts && 'status' in opts ? opts.status : null;
      let nick = opts && 'nick' in opts ? opts.nick : null;
      let email = opts && 'email' in opts ? opts.email : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      let isSiteAdmin = opts && 'isSiteAdmin' in opts ? opts.isSiteAdmin : null;
      let publicName = opts && 'publicName' in opts ? opts.publicName : null;
      let prefEmailNotify = opts && 'prefEmailNotify' in opts ? opts.prefEmailNotify : null;
      let publicLinks = opts && 'publicLinks' in opts ? opts.publicLinks : null;
      let timeZone = opts && 'timeZone' in opts ? opts.timeZone : null;
      let allTimeZones = opts && 'allTimeZones' in opts ? opts.allTimeZones : null;
      let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
      let userUserKind = opts && 'userUserKind' in opts ? opts.userUserKind : null;
      let events = opts && 'events' in opts ? opts.events : null;
      let projects = opts && 'projects' in opts ? opts.projects : null;
      let resources = opts && 'resources' in opts ? opts.resources : null;
      return new src__models__wtypes.UserGetResponse.new({base: base != null ? base : this.base, status: status != null ? status : this.status, nick: nick != null ? nick : this.nick, email: email != null ? email : this.email, kind: kind != null ? kind : this.kind, isSiteAdmin: isSiteAdmin != null ? isSiteAdmin : this.isSiteAdmin, publicName: publicName != null ? publicName : this.publicName, prefEmailNotify: prefEmailNotify != null ? prefEmailNotify : this.prefEmailNotify, publicLinks: publicLinks != null ? publicLinks : this.publicLinks, timeZone: timeZone != null ? timeZone : this.timeZone, allTimeZones: allTimeZones != null ? allTimeZones : this.allTimeZones, avatarUrl: avatarUrl != null ? avatarUrl : this.avatarUrl, userUserKind: userUserKind != null ? userUserKind : this.userUserKind, events: events != null ? events : this.events, projects: projects != null ? projects : this.projects, resources: resources != null ? resources : this.resources});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._UserGetResponse.is(other) && dart.equals(other.base, this.base) && other.status == this.status && other.nick == this.nick && other.email == this.email && other.kind == this.kind && other.isSiteAdmin == this.isSiteAdmin && other.publicName == this.publicName && other.prefEmailNotify == this.prefEmailNotify && dart.test((const$45 || (const$45 = dart.const(new (MapEqualityOfString$String()).new({keys: const$43 || (const$43 = dart.const(new (DefaultEqualityOfString()).new())), values: const$44 || (const$44 = dart.const(new (DefaultEqualityOfString()).new()))})))).equals(other.publicLinks, this.publicLinks)) && other.timeZone == this.timeZone && dart.test((const$47 || (const$47 = dart.const(new (ListEqualityOfString()).new(const$46 || (const$46 = dart.const(new (DefaultEqualityOfString()).new())))))).equals(other.allTimeZones, this.allTimeZones)) && other.avatarUrl == this.avatarUrl && other.userUserKind == this.userUserKind && dart.test((const$49 || (const$49 = dart.const(new (ListEqualityOf_APIResponseAssociation()).new(const$48 || (const$48 = dart.const(new (DefaultEqualityOf_APIResponseAssociation()).new())))))).equals(other.events, this.events)) && dart.test((const$51 || (const$51 = dart.const(new (ListEqualityOf_APIResponseAssociation()).new(const$50 || (const$50 = dart.const(new (DefaultEqualityOf_APIResponseAssociation()).new())))))).equals(other.projects, this.projects)) && dart.test((const$53 || (const$53 = dart.const(new (ListEqualityOf_APIResponseAssociation()).new(const$52 || (const$52 = dart.const(new (DefaultEqualityOf_APIResponseAssociation()).new())))))).equals(other.resources, this.resources));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.status, this.nick, this.email, this.kind, this.isSiteAdmin, this.publicName, this.prefEmailNotify, this.publicLinks, this.timeZone, this.allTimeZones, this.avatarUrl, this.userUserKind, this.events, this.projects, this.resources]);
    }
    toJson() {
      return src__models__wtypes.UserGetResponseSerializer.toMap(this);
    }
  };
  (src__models__wtypes.UserGetResponse.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let status = opts && 'status' in opts ? opts.status : null;
    let nick = opts && 'nick' in opts ? opts.nick : null;
    let email = opts && 'email' in opts ? opts.email : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    let isSiteAdmin = opts && 'isSiteAdmin' in opts ? opts.isSiteAdmin : null;
    let publicName = opts && 'publicName' in opts ? opts.publicName : null;
    let prefEmailNotify = opts && 'prefEmailNotify' in opts ? opts.prefEmailNotify : null;
    let publicLinks = opts && 'publicLinks' in opts ? opts.publicLinks : null;
    let timeZone = opts && 'timeZone' in opts ? opts.timeZone : null;
    let allTimeZones = opts && 'allTimeZones' in opts ? opts.allTimeZones : null;
    let avatarUrl = opts && 'avatarUrl' in opts ? opts.avatarUrl : null;
    let userUserKind = opts && 'userUserKind' in opts ? opts.userUserKind : null;
    let events = opts && 'events' in opts ? opts.events : null;
    let projects = opts && 'projects' in opts ? opts.projects : null;
    let resources = opts && 'resources' in opts ? opts.resources : null;
    this[base$59] = base;
    this[status$2] = status;
    this[nick$5] = nick;
    this[email$] = email;
    this[kind$15] = kind;
    this[isSiteAdmin$1] = isSiteAdmin;
    this[publicName$3] = publicName;
    this[prefEmailNotify$] = prefEmailNotify;
    this[publicLinks$] = publicLinks;
    this[timeZone$] = timeZone;
    this[allTimeZones$] = allTimeZones;
    this[avatarUrl$4] = avatarUrl;
    this[userUserKind$] = userUserKind;
    this[events$0] = events;
    this[projects$0] = projects;
    this[resources$] = resources;
  }).prototype = src__models__wtypes.UserGetResponse.prototype;
  dart.addTypeTests(src__models__wtypes.UserGetResponse);
  const base$59 = Symbol("UserGetResponse.base");
  const status$2 = Symbol("UserGetResponse.status");
  const nick$5 = Symbol("UserGetResponse.nick");
  const email$ = Symbol("UserGetResponse.email");
  const kind$15 = Symbol("UserGetResponse.kind");
  const isSiteAdmin$1 = Symbol("UserGetResponse.isSiteAdmin");
  const publicName$3 = Symbol("UserGetResponse.publicName");
  const prefEmailNotify$ = Symbol("UserGetResponse.prefEmailNotify");
  const publicLinks$ = Symbol("UserGetResponse.publicLinks");
  const timeZone$ = Symbol("UserGetResponse.timeZone");
  const allTimeZones$ = Symbol("UserGetResponse.allTimeZones");
  const avatarUrl$4 = Symbol("UserGetResponse.avatarUrl");
  const userUserKind$ = Symbol("UserGetResponse.userUserKind");
  const events$0 = Symbol("UserGetResponse.events");
  const projects$0 = Symbol("UserGetResponse.projects");
  const resources$ = Symbol("UserGetResponse.resources");
  src__models__wtypes.UserGetResponse[dart.implements] = () => [src__models__wtypes._UserGetResponse];
  dart.setMethodSignature(src__models__wtypes.UserGetResponse, () => ({
    __proto__: dart.getMethods(src__models__wtypes.UserGetResponse.__proto__),
    copyWith: dart.fnType(src__models__wtypes.UserGetResponse, [], {base: src__models__wtypes._APIResponseBase, status: core.String, nick: core.String, email: core.String, kind: core.String, isSiteAdmin: core.String, publicName: core.String, prefEmailNotify: core.String, publicLinks: core.Map$(core.String, core.String), timeZone: core.String, allTimeZones: core.List$(core.String), avatarUrl: core.String, userUserKind: core.String, events: core.List$(src__models__wtypes._APIResponseAssociation), projects: core.List$(src__models__wtypes._APIResponseAssociation), resources: core.List$(src__models__wtypes._APIResponseAssociation)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.UserGetResponse, () => ({
    __proto__: dart.getFields(src__models__wtypes.UserGetResponse.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIResponseBase),
    status: dart.finalFieldType(core.String),
    nick: dart.finalFieldType(core.String),
    email: dart.finalFieldType(core.String),
    kind: dart.finalFieldType(core.String),
    isSiteAdmin: dart.finalFieldType(core.String),
    publicName: dart.finalFieldType(core.String),
    prefEmailNotify: dart.finalFieldType(core.String),
    publicLinks: dart.finalFieldType(MapOfString$String()),
    timeZone: dart.finalFieldType(core.String),
    allTimeZones: dart.finalFieldType(ListOfString()),
    avatarUrl: dart.finalFieldType(core.String),
    userUserKind: dart.finalFieldType(core.String),
    events: dart.finalFieldType(ListOf_APIResponseAssociation()),
    projects: dart.finalFieldType(ListOf_APIResponseAssociation()),
    resources: dart.finalFieldType(ListOf_APIResponseAssociation())
  }));
  dart.defineExtensionMethods(src__models__wtypes.UserGetResponse, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.UserGetResponse, ['hashCode']);
  let const$54;
  let const$55;
  let const$56;
  src__models__wtypes.UserSaveRequest = class UserSaveRequest extends core.Object {
    get base() {
      return this[base$60];
    }
    set base(value) {
      super.base = value;
    }
    get isNew() {
      return this[isNew$];
    }
    set isNew(value) {
      super.isNew = value;
    }
    get isDelete() {
      return this[isDelete$];
    }
    set isDelete(value) {
      super.isDelete = value;
    }
    get saveNick() {
      return this[saveNick$];
    }
    set saveNick(value) {
      super.saveNick = value;
    }
    get savePW() {
      return this[savePW$];
    }
    set savePW(value) {
      super.savePW = value;
    }
    get kind() {
      return this[kind$16];
    }
    set kind(value) {
      super.kind = value;
    }
    get email() {
      return this[email$0];
    }
    set email(value) {
      super.email = value;
    }
    get isSiteAdmin() {
      return this[isSiteAdmin$2];
    }
    set isSiteAdmin(value) {
      super.isSiteAdmin = value;
    }
    get publicName() {
      return this[publicName$4];
    }
    set publicName(value) {
      super.publicName = value;
    }
    get prefEmailNotify() {
      return this[prefEmailNotify$0];
    }
    set prefEmailNotify(value) {
      super.prefEmailNotify = value;
    }
    get publicLinks() {
      return this[publicLinks$0];
    }
    set publicLinks(value) {
      super.publicLinks = value;
    }
    get timeZone() {
      return this[timeZone$0];
    }
    set timeZone(value) {
      super.timeZone = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let isNew = opts && 'isNew' in opts ? opts.isNew : null;
      let isDelete = opts && 'isDelete' in opts ? opts.isDelete : null;
      let saveNick = opts && 'saveNick' in opts ? opts.saveNick : null;
      let savePW = opts && 'savePW' in opts ? opts.savePW : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      let email = opts && 'email' in opts ? opts.email : null;
      let isSiteAdmin = opts && 'isSiteAdmin' in opts ? opts.isSiteAdmin : null;
      let publicName = opts && 'publicName' in opts ? opts.publicName : null;
      let prefEmailNotify = opts && 'prefEmailNotify' in opts ? opts.prefEmailNotify : null;
      let publicLinks = opts && 'publicLinks' in opts ? opts.publicLinks : null;
      let timeZone = opts && 'timeZone' in opts ? opts.timeZone : null;
      return new src__models__wtypes.UserSaveRequest.new({base: base != null ? base : this.base, isNew: isNew != null ? isNew : this.isNew, isDelete: isDelete != null ? isDelete : this.isDelete, saveNick: saveNick != null ? saveNick : this.saveNick, savePW: savePW != null ? savePW : this.savePW, kind: kind != null ? kind : this.kind, email: email != null ? email : this.email, isSiteAdmin: isSiteAdmin != null ? isSiteAdmin : this.isSiteAdmin, publicName: publicName != null ? publicName : this.publicName, prefEmailNotify: prefEmailNotify != null ? prefEmailNotify : this.prefEmailNotify, publicLinks: publicLinks != null ? publicLinks : this.publicLinks, timeZone: timeZone != null ? timeZone : this.timeZone});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._UserSaveRequest.is(other) && dart.equals(other.base, this.base) && other.isNew == this.isNew && other.isDelete == this.isDelete && other.saveNick == this.saveNick && other.savePW == this.savePW && other.kind == this.kind && other.email == this.email && other.isSiteAdmin == this.isSiteAdmin && other.publicName == this.publicName && other.prefEmailNotify == this.prefEmailNotify && dart.test((const$56 || (const$56 = dart.const(new (MapEqualityOfString$String()).new({keys: const$54 || (const$54 = dart.const(new (DefaultEqualityOfString()).new())), values: const$55 || (const$55 = dart.const(new (DefaultEqualityOfString()).new()))})))).equals(other.publicLinks, this.publicLinks)) && other.timeZone == this.timeZone;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.isNew, this.isDelete, this.saveNick, this.savePW, this.kind, this.email, this.isSiteAdmin, this.publicName, this.prefEmailNotify, this.publicLinks, this.timeZone]);
    }
    toJson() {
      return src__models__wtypes.UserSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.UserSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let isNew = opts && 'isNew' in opts ? opts.isNew : null;
    let isDelete = opts && 'isDelete' in opts ? opts.isDelete : null;
    let saveNick = opts && 'saveNick' in opts ? opts.saveNick : null;
    let savePW = opts && 'savePW' in opts ? opts.savePW : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    let email = opts && 'email' in opts ? opts.email : null;
    let isSiteAdmin = opts && 'isSiteAdmin' in opts ? opts.isSiteAdmin : null;
    let publicName = opts && 'publicName' in opts ? opts.publicName : null;
    let prefEmailNotify = opts && 'prefEmailNotify' in opts ? opts.prefEmailNotify : null;
    let publicLinks = opts && 'publicLinks' in opts ? opts.publicLinks : null;
    let timeZone = opts && 'timeZone' in opts ? opts.timeZone : null;
    this[base$60] = base;
    this[isNew$] = isNew;
    this[isDelete$] = isDelete;
    this[saveNick$] = saveNick;
    this[savePW$] = savePW;
    this[kind$16] = kind;
    this[email$0] = email;
    this[isSiteAdmin$2] = isSiteAdmin;
    this[publicName$4] = publicName;
    this[prefEmailNotify$0] = prefEmailNotify;
    this[publicLinks$0] = publicLinks;
    this[timeZone$0] = timeZone;
  }).prototype = src__models__wtypes.UserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.UserSaveRequest);
  const base$60 = Symbol("UserSaveRequest.base");
  const isNew$ = Symbol("UserSaveRequest.isNew");
  const isDelete$ = Symbol("UserSaveRequest.isDelete");
  const saveNick$ = Symbol("UserSaveRequest.saveNick");
  const savePW$ = Symbol("UserSaveRequest.savePW");
  const kind$16 = Symbol("UserSaveRequest.kind");
  const email$0 = Symbol("UserSaveRequest.email");
  const isSiteAdmin$2 = Symbol("UserSaveRequest.isSiteAdmin");
  const publicName$4 = Symbol("UserSaveRequest.publicName");
  const prefEmailNotify$0 = Symbol("UserSaveRequest.prefEmailNotify");
  const publicLinks$0 = Symbol("UserSaveRequest.publicLinks");
  const timeZone$0 = Symbol("UserSaveRequest.timeZone");
  src__models__wtypes.UserSaveRequest[dart.implements] = () => [src__models__wtypes._UserSaveRequest];
  dart.setMethodSignature(src__models__wtypes.UserSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.UserSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.UserSaveRequest, [], {base: src__models__wtypes._APIRequestBase, isNew: core.String, isDelete: core.String, saveNick: core.String, savePW: core.String, kind: core.String, email: core.String, isSiteAdmin: core.String, publicName: core.String, prefEmailNotify: core.String, publicLinks: core.Map$(core.String, core.String), timeZone: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.UserSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.UserSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    isNew: dart.finalFieldType(core.String),
    isDelete: dart.finalFieldType(core.String),
    saveNick: dart.finalFieldType(core.String),
    savePW: dart.finalFieldType(core.String),
    kind: dart.finalFieldType(core.String),
    email: dart.finalFieldType(core.String),
    isSiteAdmin: dart.finalFieldType(core.String),
    publicName: dart.finalFieldType(core.String),
    prefEmailNotify: dart.finalFieldType(core.String),
    publicLinks: dart.finalFieldType(MapOfString$String()),
    timeZone: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.UserSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.UserSaveRequest, ['hashCode']);
  let const$57;
  let const$58;
  src__models__wtypes.UserAvatarSaveRequest = class UserAvatarSaveRequest extends core.Object {
    get base() {
      return this[base$61];
    }
    set base(value) {
      super.base = value;
    }
    get imageBytes() {
      return this[imageBytes$0];
    }
    set imageBytes(value) {
      super.imageBytes = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let imageBytes = opts && 'imageBytes' in opts ? opts.imageBytes : null;
      return new src__models__wtypes.UserAvatarSaveRequest.new({base: base != null ? base : this.base, imageBytes: imageBytes != null ? imageBytes : this.imageBytes});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._UserAvatarSaveRequest.is(other) && dart.equals(other.base, this.base) && dart.test((const$58 || (const$58 = dart.const(new (ListEqualityOfint()).new(const$57 || (const$57 = dart.const(new (DefaultEqualityOfint()).new())))))).equals(other.imageBytes, this.imageBytes));
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.imageBytes]);
    }
    toJson() {
      return src__models__wtypes.UserAvatarSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.UserAvatarSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let imageBytes = opts && 'imageBytes' in opts ? opts.imageBytes : null;
    this[base$61] = base;
    this[imageBytes$0] = imageBytes;
  }).prototype = src__models__wtypes.UserAvatarSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.UserAvatarSaveRequest);
  const base$61 = Symbol("UserAvatarSaveRequest.base");
  const imageBytes$0 = Symbol("UserAvatarSaveRequest.imageBytes");
  src__models__wtypes.UserAvatarSaveRequest[dart.implements] = () => [src__models__wtypes._UserAvatarSaveRequest];
  dart.setMethodSignature(src__models__wtypes.UserAvatarSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.UserAvatarSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.UserAvatarSaveRequest, [], {base: src__models__wtypes._APIRequestBase, imageBytes: core.List$(core.int)}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.UserAvatarSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.UserAvatarSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    imageBytes: dart.finalFieldType(ListOfint())
  }));
  dart.defineExtensionMethods(src__models__wtypes.UserAvatarSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.UserAvatarSaveRequest, ['hashCode']);
  src__models__wtypes.UserNotifySaveRequest = class UserNotifySaveRequest extends core.Object {
    get base() {
      return this[base$62];
    }
    set base(value) {
      super.base = value;
    }
    get notifyId() {
      return this[notifyId$];
    }
    set notifyId(value) {
      super.notifyId = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let notifyId = opts && 'notifyId' in opts ? opts.notifyId : null;
      return new src__models__wtypes.UserNotifySaveRequest.new({base: base != null ? base : this.base, notifyId: notifyId != null ? notifyId : this.notifyId});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._UserNotifySaveRequest.is(other) && dart.equals(other.base, this.base) && other.notifyId == this.notifyId;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.notifyId]);
    }
    toJson() {
      return src__models__wtypes.UserNotifySaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.UserNotifySaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let notifyId = opts && 'notifyId' in opts ? opts.notifyId : null;
    this[base$62] = base;
    this[notifyId$] = notifyId;
  }).prototype = src__models__wtypes.UserNotifySaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.UserNotifySaveRequest);
  const base$62 = Symbol("UserNotifySaveRequest.base");
  const notifyId$ = Symbol("UserNotifySaveRequest.notifyId");
  src__models__wtypes.UserNotifySaveRequest[dart.implements] = () => [src__models__wtypes._UserNotifySaveRequest];
  dart.setMethodSignature(src__models__wtypes.UserNotifySaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.UserNotifySaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.UserNotifySaveRequest, [], {base: src__models__wtypes._APIRequestBase, notifyId: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.UserNotifySaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.UserNotifySaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    notifyId: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.UserNotifySaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.UserNotifySaveRequest, ['hashCode']);
  src__models__wtypes.UserRecoverPasswordRequest = class UserRecoverPasswordRequest extends core.Object {
    get base() {
      return this[base$63];
    }
    set base(value) {
      super.base = value;
    }
    get recoveryNick() {
      return this[recoveryNick$];
    }
    set recoveryNick(value) {
      super.recoveryNick = value;
    }
    get mode() {
      return this[mode$3];
    }
    set mode(value) {
      super.mode = value;
    }
    get recoveryPassword() {
      return this[recoveryPassword$];
    }
    set recoveryPassword(value) {
      super.recoveryPassword = value;
    }
    get code() {
      return this[code$];
    }
    set code(value) {
      super.code = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let recoveryNick = opts && 'recoveryNick' in opts ? opts.recoveryNick : null;
      let mode = opts && 'mode' in opts ? opts.mode : null;
      let recoveryPassword = opts && 'recoveryPassword' in opts ? opts.recoveryPassword : null;
      let code = opts && 'code' in opts ? opts.code : null;
      return new src__models__wtypes.UserRecoverPasswordRequest.new({base: base != null ? base : this.base, recoveryNick: recoveryNick != null ? recoveryNick : this.recoveryNick, mode: mode != null ? mode : this.mode, recoveryPassword: recoveryPassword != null ? recoveryPassword : this.recoveryPassword, code: code != null ? code : this.code});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._UserRecoverPasswordRequest.is(other) && dart.equals(other.base, this.base) && other.recoveryNick == this.recoveryNick && other.mode == this.mode && other.recoveryPassword == this.recoveryPassword && other.code == this.code;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.recoveryNick, this.mode, this.recoveryPassword, this.code]);
    }
    toJson() {
      return src__models__wtypes.UserRecoverPasswordRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.UserRecoverPasswordRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let recoveryNick = opts && 'recoveryNick' in opts ? opts.recoveryNick : null;
    let mode = opts && 'mode' in opts ? opts.mode : null;
    let recoveryPassword = opts && 'recoveryPassword' in opts ? opts.recoveryPassword : null;
    let code = opts && 'code' in opts ? opts.code : null;
    this[base$63] = base;
    this[recoveryNick$] = recoveryNick;
    this[mode$3] = mode;
    this[recoveryPassword$] = recoveryPassword;
    this[code$] = code;
  }).prototype = src__models__wtypes.UserRecoverPasswordRequest.prototype;
  dart.addTypeTests(src__models__wtypes.UserRecoverPasswordRequest);
  const base$63 = Symbol("UserRecoverPasswordRequest.base");
  const recoveryNick$ = Symbol("UserRecoverPasswordRequest.recoveryNick");
  const mode$3 = Symbol("UserRecoverPasswordRequest.mode");
  const recoveryPassword$ = Symbol("UserRecoverPasswordRequest.recoveryPassword");
  const code$ = Symbol("UserRecoverPasswordRequest.code");
  src__models__wtypes.UserRecoverPasswordRequest[dart.implements] = () => [src__models__wtypes._UserRecoverPasswordRequest];
  dart.setMethodSignature(src__models__wtypes.UserRecoverPasswordRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.UserRecoverPasswordRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.UserRecoverPasswordRequest, [], {base: src__models__wtypes._APIRequestBase, recoveryNick: core.String, mode: core.String, recoveryPassword: core.String, code: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.UserRecoverPasswordRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.UserRecoverPasswordRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    recoveryNick: dart.finalFieldType(core.String),
    mode: dart.finalFieldType(core.String),
    recoveryPassword: dart.finalFieldType(core.String),
    code: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.UserRecoverPasswordRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.UserRecoverPasswordRequest, ['hashCode']);
  src__models__wtypes.UserUserSaveRequest = class UserUserSaveRequest extends core.Object {
    get base() {
      return this[base$64];
    }
    set base(value) {
      super.base = value;
    }
    get aboutId() {
      return this[aboutId$0];
    }
    set aboutId(value) {
      super.aboutId = value;
    }
    get kind() {
      return this[kind$17];
    }
    set kind(value) {
      super.kind = value;
    }
    copyWith(opts) {
      let base = opts && 'base' in opts ? opts.base : null;
      let aboutId = opts && 'aboutId' in opts ? opts.aboutId : null;
      let kind = opts && 'kind' in opts ? opts.kind : null;
      return new src__models__wtypes.UserUserSaveRequest.new({base: base != null ? base : this.base, aboutId: aboutId != null ? aboutId : this.aboutId, kind: kind != null ? kind : this.kind});
    }
    _equals(other) {
      if (other == null) return false;
      return src__models__wtypes._UserUserSaveRequest.is(other) && dart.equals(other.base, this.base) && other.aboutId == this.aboutId && other.kind == this.kind;
    }
    get hashCode() {
      return hashcode$.hashObjects([this.base, this.aboutId, this.kind]);
    }
    toJson() {
      return src__models__wtypes.UserUserSaveRequestSerializer.toMap(this);
    }
  };
  (src__models__wtypes.UserUserSaveRequest.new = function(opts) {
    let base = opts && 'base' in opts ? opts.base : null;
    let aboutId = opts && 'aboutId' in opts ? opts.aboutId : null;
    let kind = opts && 'kind' in opts ? opts.kind : null;
    this[base$64] = base;
    this[aboutId$0] = aboutId;
    this[kind$17] = kind;
  }).prototype = src__models__wtypes.UserUserSaveRequest.prototype;
  dart.addTypeTests(src__models__wtypes.UserUserSaveRequest);
  const base$64 = Symbol("UserUserSaveRequest.base");
  const aboutId$0 = Symbol("UserUserSaveRequest.aboutId");
  const kind$17 = Symbol("UserUserSaveRequest.kind");
  src__models__wtypes.UserUserSaveRequest[dart.implements] = () => [src__models__wtypes._UserUserSaveRequest];
  dart.setMethodSignature(src__models__wtypes.UserUserSaveRequest, () => ({
    __proto__: dart.getMethods(src__models__wtypes.UserUserSaveRequest.__proto__),
    copyWith: dart.fnType(src__models__wtypes.UserUserSaveRequest, [], {base: src__models__wtypes._APIRequestBase, aboutId: core.int, kind: core.String}),
    toJson: dart.fnType(core.Map$(core.String, dart.dynamic), [])
  }));
  dart.setFieldSignature(src__models__wtypes.UserUserSaveRequest, () => ({
    __proto__: dart.getFields(src__models__wtypes.UserUserSaveRequest.__proto__),
    base: dart.finalFieldType(src__models__wtypes._APIRequestBase),
    aboutId: dart.finalFieldType(core.int),
    kind: dart.finalFieldType(core.String)
  }));
  dart.defineExtensionMethods(src__models__wtypes.UserUserSaveRequest, ['_equals']);
  dart.defineExtensionAccessors(src__models__wtypes.UserUserSaveRequest, ['hashCode']);
  src__models__wtypes.APIRequestBaseSerializer = class APIRequestBaseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.APIRequestBase.new({nick: core.String.as(map[$_get]("nick")), password: core.String.as(map[$_get]("password"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["nick", model.nick, "password", model.password]);
    }
  };
  (src__models__wtypes.APIRequestBaseSerializer.new = function() {
  }).prototype = src__models__wtypes.APIRequestBaseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.APIRequestBaseSerializer);
  src__models__wtypes.APIRequestBaseFields = class APIRequestBaseFields extends core.Object {};
  (src__models__wtypes.APIRequestBaseFields.new = function() {
  }).prototype = src__models__wtypes.APIRequestBaseFields.prototype;
  dart.addTypeTests(src__models__wtypes.APIRequestBaseFields);
  dart.defineLazy(src__models__wtypes.APIRequestBaseFields, {
    /*src__models__wtypes.APIRequestBaseFields.allFields*/get allFields() {
      return dart.constList(["nick", "password"], core.String);
    },
    /*src__models__wtypes.APIRequestBaseFields.nick*/get nick() {
      return "nick";
    },
    /*src__models__wtypes.APIRequestBaseFields.password*/get password() {
      return "password";
    }
  });
  src__models__wtypes.APIResponseBaseSerializer = class APIResponseBaseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.APIResponseBase.new({errorMessage: core.String.as(map[$_get]("error_message")), errorCode: core.String.as(map[$_get]("error_code")), ok: core.String.as(map[$_get]("ok")), newId: core.int.as(map[$_get]("new_id"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["error_message", model.errorMessage, "error_code", model.errorCode, "ok", model.ok, "new_id", model.newId]);
    }
  };
  (src__models__wtypes.APIResponseBaseSerializer.new = function() {
  }).prototype = src__models__wtypes.APIResponseBaseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.APIResponseBaseSerializer);
  src__models__wtypes.APIResponseBaseFields = class APIResponseBaseFields extends core.Object {};
  (src__models__wtypes.APIResponseBaseFields.new = function() {
  }).prototype = src__models__wtypes.APIResponseBaseFields.prototype;
  dart.addTypeTests(src__models__wtypes.APIResponseBaseFields);
  dart.defineLazy(src__models__wtypes.APIResponseBaseFields, {
    /*src__models__wtypes.APIResponseBaseFields.allFields*/get allFields() {
      return dart.constList(["error_message", "error_code", "ok", "new_id"], core.String);
    },
    /*src__models__wtypes.APIResponseBaseFields.errorMessage*/get errorMessage() {
      return "error_message";
    },
    /*src__models__wtypes.APIResponseBaseFields.errorCode*/get errorCode() {
      return "error_code";
    },
    /*src__models__wtypes.APIResponseBaseFields.ok*/get ok() {
      return "ok";
    },
    /*src__models__wtypes.APIResponseBaseFields.newId*/get newId() {
      return "new_id";
    }
  });
  src__models__wtypes.APIResponseAssociationSerializer = class APIResponseAssociationSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.APIResponseAssociation.new({linkText: core.String.as(map[$_get]("link_text")), linkPaneKey: core.String.as(map[$_get]("link_pane_key"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["link_text", model.linkText, "link_pane_key", model.linkPaneKey]);
    }
  };
  (src__models__wtypes.APIResponseAssociationSerializer.new = function() {
  }).prototype = src__models__wtypes.APIResponseAssociationSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.APIResponseAssociationSerializer);
  src__models__wtypes.APIResponseAssociationFields = class APIResponseAssociationFields extends core.Object {};
  (src__models__wtypes.APIResponseAssociationFields.new = function() {
  }).prototype = src__models__wtypes.APIResponseAssociationFields.prototype;
  dart.addTypeTests(src__models__wtypes.APIResponseAssociationFields);
  dart.defineLazy(src__models__wtypes.APIResponseAssociationFields, {
    /*src__models__wtypes.APIResponseAssociationFields.allFields*/get allFields() {
      return dart.constList(["link_text", "link_pane_key"], core.String);
    },
    /*src__models__wtypes.APIResponseAssociationFields.linkText*/get linkText() {
      return "link_text";
    },
    /*src__models__wtypes.APIResponseAssociationFields.linkPaneKey*/get linkPaneKey() {
      return "link_pane_key";
    }
  });
  src__models__wtypes.AuthenticateResponseSerializer = class AuthenticateResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.AuthenticateResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, publicName: core.String.as(map[$_get]("public_name")), nick: core.String.as(map[$_get]("nick")), userId: core.int.as(map[$_get]("user_id")), isSiteAdmin: core.String.as(map[$_get]("is_site_admin"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "public_name", model.publicName, "nick", model.nick, "user_id", model.userId, "is_site_admin", model.isSiteAdmin]);
    }
  };
  (src__models__wtypes.AuthenticateResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.AuthenticateResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.AuthenticateResponseSerializer);
  src__models__wtypes.AuthenticateResponseFields = class AuthenticateResponseFields extends core.Object {};
  (src__models__wtypes.AuthenticateResponseFields.new = function() {
  }).prototype = src__models__wtypes.AuthenticateResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.AuthenticateResponseFields);
  dart.defineLazy(src__models__wtypes.AuthenticateResponseFields, {
    /*src__models__wtypes.AuthenticateResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "public_name", "nick", "user_id", "is_site_admin"], core.String);
    },
    /*src__models__wtypes.AuthenticateResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.AuthenticateResponseFields.publicName*/get publicName() {
      return "public_name";
    },
    /*src__models__wtypes.AuthenticateResponseFields.nick*/get nick() {
      return "nick";
    },
    /*src__models__wtypes.AuthenticateResponseFields.userId*/get userId() {
      return "user_id";
    },
    /*src__models__wtypes.AuthenticateResponseFields.isSiteAdmin*/get isSiteAdmin() {
      return "is_site_admin";
    }
  });
  src__models__wtypes.CategoryQueryRequestSerializer = class CategoryQueryRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.CategoryQueryRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, kind: core.String.as(map[$_get]("kind"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "kind", model.kind]);
    }
  };
  (src__models__wtypes.CategoryQueryRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.CategoryQueryRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryQueryRequestSerializer);
  src__models__wtypes.CategoryQueryRequestFields = class CategoryQueryRequestFields extends core.Object {};
  (src__models__wtypes.CategoryQueryRequestFields.new = function() {
  }).prototype = src__models__wtypes.CategoryQueryRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryQueryRequestFields);
  dart.defineLazy(src__models__wtypes.CategoryQueryRequestFields, {
    /*src__models__wtypes.CategoryQueryRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "kind"], core.String);
    },
    /*src__models__wtypes.CategoryQueryRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.CategoryQueryRequestFields.kind*/get kind() {
      return "kind";
    }
  });
  src__models__wtypes.CategoryQueryResponseSerializer = class CategoryQueryResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.CategoryQueryResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, categories: core.Iterable.is(map[$_get]("categories")) ? ListOf_CategoryItemResponse().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("categories"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.CategoryItemResponseSerializer.fromMap, MapToCategoryItemResponse()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "categories", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.categories;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.CategoryItemResponseSerializer.toMap(m), _CategoryItemResponseToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.CategoryQueryResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.CategoryQueryResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryQueryResponseSerializer);
  src__models__wtypes.CategoryQueryResponseFields = class CategoryQueryResponseFields extends core.Object {};
  (src__models__wtypes.CategoryQueryResponseFields.new = function() {
  }).prototype = src__models__wtypes.CategoryQueryResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryQueryResponseFields);
  dart.defineLazy(src__models__wtypes.CategoryQueryResponseFields, {
    /*src__models__wtypes.CategoryQueryResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "categories"], core.String);
    },
    /*src__models__wtypes.CategoryQueryResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.CategoryQueryResponseFields.categories*/get categories() {
      return "categories";
    }
  });
  src__models__wtypes.CategoryDeleteRequestSerializer = class CategoryDeleteRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.CategoryDeleteRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, catId: core.int.as(map[$_get]("cat_id")), kind: core.String.as(map[$_get]("kind"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "cat_id", model.catId, "kind", model.kind]);
    }
  };
  (src__models__wtypes.CategoryDeleteRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.CategoryDeleteRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryDeleteRequestSerializer);
  src__models__wtypes.CategoryDeleteRequestFields = class CategoryDeleteRequestFields extends core.Object {};
  (src__models__wtypes.CategoryDeleteRequestFields.new = function() {
  }).prototype = src__models__wtypes.CategoryDeleteRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryDeleteRequestFields);
  dart.defineLazy(src__models__wtypes.CategoryDeleteRequestFields, {
    /*src__models__wtypes.CategoryDeleteRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "cat_id", "kind"], core.String);
    },
    /*src__models__wtypes.CategoryDeleteRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.CategoryDeleteRequestFields.catId*/get catId() {
      return "cat_id";
    },
    /*src__models__wtypes.CategoryDeleteRequestFields.kind*/get kind() {
      return "kind";
    }
  });
  src__models__wtypes.CategorySaveRequestSerializer = class CategorySaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.CategorySaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, catId: core.int.as(map[$_get]("cat_id")), kind: core.String.as(map[$_get]("kind")), referenceId: core.int.as(map[$_get]("reference_id")), referenceMode: core.String.as(map[$_get]("reference_mode")), title: core.String.as(map[$_get]("title")), description: core.String.as(map[$_get]("description"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "cat_id", model.catId, "kind", model.kind, "reference_id", model.referenceId, "reference_mode", model.referenceMode, "title", model.title, "description", model.description]);
    }
  };
  (src__models__wtypes.CategorySaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.CategorySaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.CategorySaveRequestSerializer);
  src__models__wtypes.CategorySaveRequestFields = class CategorySaveRequestFields extends core.Object {};
  (src__models__wtypes.CategorySaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.CategorySaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.CategorySaveRequestFields);
  dart.defineLazy(src__models__wtypes.CategorySaveRequestFields, {
    /*src__models__wtypes.CategorySaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "cat_id", "kind", "reference_id", "reference_mode", "title", "description"], core.String);
    },
    /*src__models__wtypes.CategorySaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.CategorySaveRequestFields.catId*/get catId() {
      return "cat_id";
    },
    /*src__models__wtypes.CategorySaveRequestFields.kind*/get kind() {
      return "kind";
    },
    /*src__models__wtypes.CategorySaveRequestFields.referenceId*/get referenceId() {
      return "reference_id";
    },
    /*src__models__wtypes.CategorySaveRequestFields.referenceMode*/get referenceMode() {
      return "reference_mode";
    },
    /*src__models__wtypes.CategorySaveRequestFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.CategorySaveRequestFields.description*/get description() {
      return "description";
    }
  });
  src__models__wtypes.CategoryMoveContentsRequestSerializer = class CategoryMoveContentsRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.CategoryMoveContentsRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, catId: core.int.as(map[$_get]("cat_id")), kind: core.String.as(map[$_get]("kind")), relatedIds: core.Iterable.is(map[$_get]("related_ids")) ? IterableOfint()._check(core.Iterable.as(map[$_get]("related_ids"))[$cast](core.int))[$toList]() : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "cat_id", model.catId, "kind", model.kind, "related_ids", model.relatedIds]);
    }
  };
  (src__models__wtypes.CategoryMoveContentsRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.CategoryMoveContentsRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryMoveContentsRequestSerializer);
  src__models__wtypes.CategoryMoveContentsRequestFields = class CategoryMoveContentsRequestFields extends core.Object {};
  (src__models__wtypes.CategoryMoveContentsRequestFields.new = function() {
  }).prototype = src__models__wtypes.CategoryMoveContentsRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryMoveContentsRequestFields);
  dart.defineLazy(src__models__wtypes.CategoryMoveContentsRequestFields, {
    /*src__models__wtypes.CategoryMoveContentsRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "cat_id", "kind", "related_ids"], core.String);
    },
    /*src__models__wtypes.CategoryMoveContentsRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.CategoryMoveContentsRequestFields.catId*/get catId() {
      return "cat_id";
    },
    /*src__models__wtypes.CategoryMoveContentsRequestFields.kind*/get kind() {
      return "kind";
    },
    /*src__models__wtypes.CategoryMoveContentsRequestFields.relatedIds*/get relatedIds() {
      return "related_ids";
    }
  });
  src__models__wtypes.CategoryItemResponseSerializer = class CategoryItemResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.CategoryItemResponse.new({iid: core.int.as(map[$_get]("iid")), parentId: core.int.as(map[$_get]("parent_id")), title: core.String.as(map[$_get]("title")), description: core.String.as(map[$_get]("description"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["iid", model.iid, "parent_id", model.parentId, "title", model.title, "description", model.description]);
    }
  };
  (src__models__wtypes.CategoryItemResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.CategoryItemResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryItemResponseSerializer);
  src__models__wtypes.CategoryItemResponseFields = class CategoryItemResponseFields extends core.Object {};
  (src__models__wtypes.CategoryItemResponseFields.new = function() {
  }).prototype = src__models__wtypes.CategoryItemResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.CategoryItemResponseFields);
  dart.defineLazy(src__models__wtypes.CategoryItemResponseFields, {
    /*src__models__wtypes.CategoryItemResponseFields.allFields*/get allFields() {
      return dart.constList(["iid", "parent_id", "title", "description"], core.String);
    },
    /*src__models__wtypes.CategoryItemResponseFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.CategoryItemResponseFields.parentId*/get parentId() {
      return "parent_id";
    },
    /*src__models__wtypes.CategoryItemResponseFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.CategoryItemResponseFields.description*/get description() {
      return "description";
    }
  });
  src__models__wtypes.ConvQueryRequestSerializer = class ConvQueryRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvQueryRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, term: core.String.as(map[$_get]("term"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "term", model.term]);
    }
  };
  (src__models__wtypes.ConvQueryRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvQueryRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryRequestSerializer);
  src__models__wtypes.ConvQueryRequestFields = class ConvQueryRequestFields extends core.Object {};
  (src__models__wtypes.ConvQueryRequestFields.new = function() {
  }).prototype = src__models__wtypes.ConvQueryRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryRequestFields);
  dart.defineLazy(src__models__wtypes.ConvQueryRequestFields, {
    /*src__models__wtypes.ConvQueryRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "term"], core.String);
    },
    /*src__models__wtypes.ConvQueryRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvQueryRequestFields.term*/get term() {
      return "term";
    }
  });
  src__models__wtypes.ConvQueryResponseSerializer = class ConvQueryResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvQueryResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, convs: core.Iterable.is(map[$_get]("convs")) ? ListOf_ConvQueryConvItemResponse().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("convs"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.ConvQueryConvItemResponseSerializer.fromMap, MapToConvQueryConvItemResponse()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "convs", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.convs;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.ConvQueryConvItemResponseSerializer.toMap(m), _ConvQueryConvItemResponseToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.ConvQueryResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvQueryResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryResponseSerializer);
  src__models__wtypes.ConvQueryResponseFields = class ConvQueryResponseFields extends core.Object {};
  (src__models__wtypes.ConvQueryResponseFields.new = function() {
  }).prototype = src__models__wtypes.ConvQueryResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryResponseFields);
  dart.defineLazy(src__models__wtypes.ConvQueryResponseFields, {
    /*src__models__wtypes.ConvQueryResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "convs"], core.String);
    },
    /*src__models__wtypes.ConvQueryResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvQueryResponseFields.convs*/get convs() {
      return "convs";
    }
  });
  src__models__wtypes.ConvQueryConvItemResponseSerializer = class ConvQueryConvItemResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvQueryConvItemResponse.new({convId: core.int.as(map[$_get]("conv_id")), hitText: core.String.as(map[$_get]("hit_text")), posts: core.Iterable.is(map[$_get]("posts")) ? ListOf_ConvQueryPostItemResponse().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("posts"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.ConvQueryPostItemResponseSerializer.fromMap, MapToConvQueryPostItemResponse()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["conv_id", model.convId, "hit_text", model.hitText, "posts", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.posts;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.ConvQueryPostItemResponseSerializer.toMap(m), _ConvQueryPostItemResponseToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.ConvQueryConvItemResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvQueryConvItemResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryConvItemResponseSerializer);
  src__models__wtypes.ConvQueryConvItemResponseFields = class ConvQueryConvItemResponseFields extends core.Object {};
  (src__models__wtypes.ConvQueryConvItemResponseFields.new = function() {
  }).prototype = src__models__wtypes.ConvQueryConvItemResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryConvItemResponseFields);
  dart.defineLazy(src__models__wtypes.ConvQueryConvItemResponseFields, {
    /*src__models__wtypes.ConvQueryConvItemResponseFields.allFields*/get allFields() {
      return dart.constList(["conv_id", "hit_text", "posts"], core.String);
    },
    /*src__models__wtypes.ConvQueryConvItemResponseFields.convId*/get convId() {
      return "conv_id";
    },
    /*src__models__wtypes.ConvQueryConvItemResponseFields.hitText*/get hitText() {
      return "hit_text";
    },
    /*src__models__wtypes.ConvQueryConvItemResponseFields.posts*/get posts() {
      return "posts";
    }
  });
  src__models__wtypes.ConvQueryPostItemResponseSerializer = class ConvQueryPostItemResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvQueryPostItemResponse.new({postId: core.String.as(map[$_get]("post_id")), hitText: core.String.as(map[$_get]("hit_text"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["post_id", model.postId, "hit_text", model.hitText]);
    }
  };
  (src__models__wtypes.ConvQueryPostItemResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvQueryPostItemResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryPostItemResponseSerializer);
  src__models__wtypes.ConvQueryPostItemResponseFields = class ConvQueryPostItemResponseFields extends core.Object {};
  (src__models__wtypes.ConvQueryPostItemResponseFields.new = function() {
  }).prototype = src__models__wtypes.ConvQueryPostItemResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvQueryPostItemResponseFields);
  dart.defineLazy(src__models__wtypes.ConvQueryPostItemResponseFields, {
    /*src__models__wtypes.ConvQueryPostItemResponseFields.allFields*/get allFields() {
      return dart.constList(["post_id", "hit_text"], core.String);
    },
    /*src__models__wtypes.ConvQueryPostItemResponseFields.postId*/get postId() {
      return "post_id";
    },
    /*src__models__wtypes.ConvQueryPostItemResponseFields.hitText*/get hitText() {
      return "hit_text";
    }
  });
  src__models__wtypes.ConvGetRequestSerializer = class ConvGetRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvGetRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, convId: core.int.as(map[$_get]("conv_id")), mode: core.String.as(map[$_get]("mode")), rangeFromWDT: core.String.as(map[$_get]("range_from_w_d_t")), rangeToWDT: core.String.as(map[$_get]("range_to_w_d_t"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "conv_id", model.convId, "mode", model.mode, "range_from_w_d_t", model.rangeFromWDT, "range_to_w_d_t", model.rangeToWDT]);
    }
  };
  (src__models__wtypes.ConvGetRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvGetRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetRequestSerializer);
  src__models__wtypes.ConvGetRequestFields = class ConvGetRequestFields extends core.Object {};
  (src__models__wtypes.ConvGetRequestFields.new = function() {
  }).prototype = src__models__wtypes.ConvGetRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetRequestFields);
  dart.defineLazy(src__models__wtypes.ConvGetRequestFields, {
    /*src__models__wtypes.ConvGetRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "conv_id", "mode", "range_from_w_d_t", "range_to_w_d_t"], core.String);
    },
    /*src__models__wtypes.ConvGetRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvGetRequestFields.convId*/get convId() {
      return "conv_id";
    },
    /*src__models__wtypes.ConvGetRequestFields.mode*/get mode() {
      return "mode";
    },
    /*src__models__wtypes.ConvGetRequestFields.rangeFromWDT*/get rangeFromWDT() {
      return "range_from_w_d_t";
    },
    /*src__models__wtypes.ConvGetRequestFields.rangeToWDT*/get rangeToWDT() {
      return "range_to_w_d_t";
    }
  });
  src__models__wtypes.ConvGetResponseSerializer = class ConvGetResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvGetResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, isManager: core.String.as(map[$_get]("is_manager")), isJoined: core.String.as(map[$_get]("is_joined")), readPositionWDT: core.String.as(map[$_get]("read_position_w_d_t")), title: core.String.as(map[$_get]("title")), anySkipped: core.String.as(map[$_get]("any_skipped")), posts: core.Iterable.is(map[$_get]("posts")) ? ListOf_ConvGetPostItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("posts"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.ConvGetPostItemSerializer.fromMap, MapToConvGetPostItem()))) : null, replyAllowed: core.String.as(map[$_get]("reply_allowed")), replyAllowedDesc: core.String.as(map[$_get]("reply_allowed_desc")), replyMaxLength: core.int.as(map[$_get]("reply_max_length")), deleteMessage: core.String.as(map[$_get]("delete_message")), like: core.String.as(map[$_get]("like")), bookmarked: core.String.as(map[$_get]("bookmarked")), parentTitle: core.String.as(map[$_get]("parent_title")), parentPaneKey: core.String.as(map[$_get]("parent_pane_key"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "is_manager", model.isManager, "is_joined", model.isJoined, "read_position_w_d_t", model.readPositionWDT, "title", model.title, "any_skipped", model.anySkipped, "posts", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.posts;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.ConvGetPostItemSerializer.toMap(m), _ConvGetPostItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })(), "reply_allowed", model.replyAllowed, "reply_allowed_desc", model.replyAllowedDesc, "reply_max_length", model.replyMaxLength, "delete_message", model.deleteMessage, "like", model.like, "bookmarked", model.bookmarked, "parent_title", model.parentTitle, "parent_pane_key", model.parentPaneKey]);
    }
  };
  (src__models__wtypes.ConvGetResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvGetResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetResponseSerializer);
  src__models__wtypes.ConvGetResponseFields = class ConvGetResponseFields extends core.Object {};
  (src__models__wtypes.ConvGetResponseFields.new = function() {
  }).prototype = src__models__wtypes.ConvGetResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetResponseFields);
  dart.defineLazy(src__models__wtypes.ConvGetResponseFields, {
    /*src__models__wtypes.ConvGetResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "is_manager", "is_joined", "read_position_w_d_t", "title", "any_skipped", "posts", "reply_allowed", "reply_allowed_desc", "reply_max_length", "delete_message", "like", "bookmarked", "parent_title", "parent_pane_key"], core.String);
    },
    /*src__models__wtypes.ConvGetResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvGetResponseFields.isManager*/get isManager() {
      return "is_manager";
    },
    /*src__models__wtypes.ConvGetResponseFields.isJoined*/get isJoined() {
      return "is_joined";
    },
    /*src__models__wtypes.ConvGetResponseFields.readPositionWDT*/get readPositionWDT() {
      return "read_position_w_d_t";
    },
    /*src__models__wtypes.ConvGetResponseFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ConvGetResponseFields.anySkipped*/get anySkipped() {
      return "any_skipped";
    },
    /*src__models__wtypes.ConvGetResponseFields.posts*/get posts() {
      return "posts";
    },
    /*src__models__wtypes.ConvGetResponseFields.replyAllowed*/get replyAllowed() {
      return "reply_allowed";
    },
    /*src__models__wtypes.ConvGetResponseFields.replyAllowedDesc*/get replyAllowedDesc() {
      return "reply_allowed_desc";
    },
    /*src__models__wtypes.ConvGetResponseFields.replyMaxLength*/get replyMaxLength() {
      return "reply_max_length";
    },
    /*src__models__wtypes.ConvGetResponseFields.deleteMessage*/get deleteMessage() {
      return "delete_message";
    },
    /*src__models__wtypes.ConvGetResponseFields.like*/get like() {
      return "like";
    },
    /*src__models__wtypes.ConvGetResponseFields.bookmarked*/get bookmarked() {
      return "bookmarked";
    },
    /*src__models__wtypes.ConvGetResponseFields.parentTitle*/get parentTitle() {
      return "parent_title";
    },
    /*src__models__wtypes.ConvGetResponseFields.parentPaneKey*/get parentPaneKey() {
      return "parent_pane_key";
    }
  });
  src__models__wtypes.ConvGetPostItemSerializer = class ConvGetPostItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvGetPostItem.new({iid: core.String.as(map[$_get]("iid")), authorId: core.int.as(map[$_get]("author_id")), authorNick: core.String.as(map[$_get]("author_nick")), avatarUrl: core.String.as(map[$_get]("avatar_url")), createdAtReadable: core.String.as(map[$_get]("created_at_readable")), createdAtWDT: core.String.as(map[$_get]("created_at_w_d_t")), ago: core.String.as(map[$_get]("ago")), ptext: core.String.as(map[$_get]("ptext")), imageUrl: core.String.as(map[$_get]("image_url")), collapseMode: core.String.as(map[$_get]("collapse_mode")), collapsePosition: core.int.as(map[$_get]("collapse_position"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["iid", model.iid, "author_id", model.authorId, "author_nick", model.authorNick, "avatar_url", model.avatarUrl, "created_at_readable", model.createdAtReadable, "created_at_w_d_t", model.createdAtWDT, "ago", model.ago, "ptext", model.ptext, "image_url", model.imageUrl, "collapse_mode", model.collapseMode, "collapse_position", model.collapsePosition]);
    }
  };
  (src__models__wtypes.ConvGetPostItemSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvGetPostItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetPostItemSerializer);
  src__models__wtypes.ConvGetPostItemFields = class ConvGetPostItemFields extends core.Object {};
  (src__models__wtypes.ConvGetPostItemFields.new = function() {
  }).prototype = src__models__wtypes.ConvGetPostItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetPostItemFields);
  dart.defineLazy(src__models__wtypes.ConvGetPostItemFields, {
    /*src__models__wtypes.ConvGetPostItemFields.allFields*/get allFields() {
      return dart.constList(["iid", "author_id", "author_nick", "avatar_url", "created_at_readable", "created_at_w_d_t", "ago", "ptext", "image_url", "collapse_mode", "collapse_position"], core.String);
    },
    /*src__models__wtypes.ConvGetPostItemFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.ConvGetPostItemFields.authorId*/get authorId() {
      return "author_id";
    },
    /*src__models__wtypes.ConvGetPostItemFields.authorNick*/get authorNick() {
      return "author_nick";
    },
    /*src__models__wtypes.ConvGetPostItemFields.avatarUrl*/get avatarUrl() {
      return "avatar_url";
    },
    /*src__models__wtypes.ConvGetPostItemFields.createdAtReadable*/get createdAtReadable() {
      return "created_at_readable";
    },
    /*src__models__wtypes.ConvGetPostItemFields.createdAtWDT*/get createdAtWDT() {
      return "created_at_w_d_t";
    },
    /*src__models__wtypes.ConvGetPostItemFields.ago*/get ago() {
      return "ago";
    },
    /*src__models__wtypes.ConvGetPostItemFields.ptext*/get ptext() {
      return "ptext";
    },
    /*src__models__wtypes.ConvGetPostItemFields.imageUrl*/get imageUrl() {
      return "image_url";
    },
    /*src__models__wtypes.ConvGetPostItemFields.collapseMode*/get collapseMode() {
      return "collapse_mode";
    },
    /*src__models__wtypes.ConvGetPostItemFields.collapsePosition*/get collapsePosition() {
      return "collapse_position";
    }
  });
  src__models__wtypes.ConvGetRulesRequestSerializer = class ConvGetRulesRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvGetRulesRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, convId: core.int.as(map[$_get]("conv_id"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "conv_id", model.convId]);
    }
  };
  (src__models__wtypes.ConvGetRulesRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvGetRulesRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetRulesRequestSerializer);
  src__models__wtypes.ConvGetRulesRequestFields = class ConvGetRulesRequestFields extends core.Object {};
  (src__models__wtypes.ConvGetRulesRequestFields.new = function() {
  }).prototype = src__models__wtypes.ConvGetRulesRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetRulesRequestFields);
  dart.defineLazy(src__models__wtypes.ConvGetRulesRequestFields, {
    /*src__models__wtypes.ConvGetRulesRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "conv_id"], core.String);
    },
    /*src__models__wtypes.ConvGetRulesRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvGetRulesRequestFields.convId*/get convId() {
      return "conv_id";
    }
  });
  src__models__wtypes.ConvGetRulesResponseSerializer = class ConvGetRulesResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvGetRulesResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, postMaxSize: core.int.as(map[$_get]("post_max_size")), userDailyMax: core.int.as(map[$_get]("user_daily_max")), title: core.String.as(map[$_get]("title"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "post_max_size", model.postMaxSize, "user_daily_max", model.userDailyMax, "title", model.title]);
    }
  };
  (src__models__wtypes.ConvGetRulesResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvGetRulesResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetRulesResponseSerializer);
  src__models__wtypes.ConvGetRulesResponseFields = class ConvGetRulesResponseFields extends core.Object {};
  (src__models__wtypes.ConvGetRulesResponseFields.new = function() {
  }).prototype = src__models__wtypes.ConvGetRulesResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvGetRulesResponseFields);
  dart.defineLazy(src__models__wtypes.ConvGetRulesResponseFields, {
    /*src__models__wtypes.ConvGetRulesResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "post_max_size", "user_daily_max", "title"], core.String);
    },
    /*src__models__wtypes.ConvGetRulesResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvGetRulesResponseFields.postMaxSize*/get postMaxSize() {
      return "post_max_size";
    },
    /*src__models__wtypes.ConvGetRulesResponseFields.userDailyMax*/get userDailyMax() {
      return "user_daily_max";
    },
    /*src__models__wtypes.ConvGetRulesResponseFields.title*/get title() {
      return "title";
    }
  });
  src__models__wtypes.ConvSaveRequestSerializer = class ConvSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, convId: core.int.as(map[$_get]("conv_id")), projectId: core.int.as(map[$_get]("project_id")), eventId: core.int.as(map[$_get]("event_id")), fromConvId: core.int.as(map[$_get]("from_conv_id")), openingPostId: core.String.as(map[$_get]("opening_post_id")), title: core.String.as(map[$_get]("title")), postMaxSize: core.int.as(map[$_get]("post_max_size")), userDailyMax: core.int.as(map[$_get]("user_daily_max"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "conv_id", model.convId, "project_id", model.projectId, "event_id", model.eventId, "from_conv_id", model.fromConvId, "opening_post_id", model.openingPostId, "title", model.title, "post_max_size", model.postMaxSize, "user_daily_max", model.userDailyMax]);
    }
  };
  (src__models__wtypes.ConvSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvSaveRequestSerializer);
  src__models__wtypes.ConvSaveRequestFields = class ConvSaveRequestFields extends core.Object {};
  (src__models__wtypes.ConvSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ConvSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ConvSaveRequestFields, {
    /*src__models__wtypes.ConvSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "conv_id", "project_id", "event_id", "from_conv_id", "opening_post_id", "title", "post_max_size", "user_daily_max"], core.String);
    },
    /*src__models__wtypes.ConvSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvSaveRequestFields.convId*/get convId() {
      return "conv_id";
    },
    /*src__models__wtypes.ConvSaveRequestFields.projectId*/get projectId() {
      return "project_id";
    },
    /*src__models__wtypes.ConvSaveRequestFields.eventId*/get eventId() {
      return "event_id";
    },
    /*src__models__wtypes.ConvSaveRequestFields.fromConvId*/get fromConvId() {
      return "from_conv_id";
    },
    /*src__models__wtypes.ConvSaveRequestFields.openingPostId*/get openingPostId() {
      return "opening_post_id";
    },
    /*src__models__wtypes.ConvSaveRequestFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ConvSaveRequestFields.postMaxSize*/get postMaxSize() {
      return "post_max_size";
    },
    /*src__models__wtypes.ConvSaveRequestFields.userDailyMax*/get userDailyMax() {
      return "user_daily_max";
    }
  });
  src__models__wtypes.ConvPostGetRequestSerializer = class ConvPostGetRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvPostGetRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, postId: core.String.as(map[$_get]("post_id"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "post_id", model.postId]);
    }
  };
  (src__models__wtypes.ConvPostGetRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvPostGetRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostGetRequestSerializer);
  src__models__wtypes.ConvPostGetRequestFields = class ConvPostGetRequestFields extends core.Object {};
  (src__models__wtypes.ConvPostGetRequestFields.new = function() {
  }).prototype = src__models__wtypes.ConvPostGetRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostGetRequestFields);
  dart.defineLazy(src__models__wtypes.ConvPostGetRequestFields, {
    /*src__models__wtypes.ConvPostGetRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "post_id"], core.String);
    },
    /*src__models__wtypes.ConvPostGetRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvPostGetRequestFields.postId*/get postId() {
      return "post_id";
    }
  });
  src__models__wtypes.ConvPostGetResponseSerializer = class ConvPostGetResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvPostGetResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, avatarUrl: core.String.as(map[$_get]("avatar_url")), createdAtReadable: core.String.as(map[$_get]("created_at_readable")), reaction: core.String.as(map[$_get]("reaction")), throttleDescription: core.String.as(map[$_get]("throttle_description")), canCensor: core.String.as(map[$_get]("can_censor")), allReasons: core.String.as(map[$_get]("all_reasons"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "avatar_url", model.avatarUrl, "created_at_readable", model.createdAtReadable, "reaction", model.reaction, "throttle_description", model.throttleDescription, "can_censor", model.canCensor, "all_reasons", model.allReasons]);
    }
  };
  (src__models__wtypes.ConvPostGetResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvPostGetResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostGetResponseSerializer);
  src__models__wtypes.ConvPostGetResponseFields = class ConvPostGetResponseFields extends core.Object {};
  (src__models__wtypes.ConvPostGetResponseFields.new = function() {
  }).prototype = src__models__wtypes.ConvPostGetResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostGetResponseFields);
  dart.defineLazy(src__models__wtypes.ConvPostGetResponseFields, {
    /*src__models__wtypes.ConvPostGetResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "avatar_url", "created_at_readable", "reaction", "throttle_description", "can_censor", "all_reasons"], core.String);
    },
    /*src__models__wtypes.ConvPostGetResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvPostGetResponseFields.avatarUrl*/get avatarUrl() {
      return "avatar_url";
    },
    /*src__models__wtypes.ConvPostGetResponseFields.createdAtReadable*/get createdAtReadable() {
      return "created_at_readable";
    },
    /*src__models__wtypes.ConvPostGetResponseFields.reaction*/get reaction() {
      return "reaction";
    },
    /*src__models__wtypes.ConvPostGetResponseFields.throttleDescription*/get throttleDescription() {
      return "throttle_description";
    },
    /*src__models__wtypes.ConvPostGetResponseFields.canCensor*/get canCensor() {
      return "can_censor";
    },
    /*src__models__wtypes.ConvPostGetResponseFields.allReasons*/get allReasons() {
      return "all_reasons";
    }
  });
  src__models__wtypes.ConvPostSaveRequestSerializer = class ConvPostSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvPostSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, convId: core.int.as(map[$_get]("conv_id")), postId: core.String.as(map[$_get]("post_id")), triggerWarning: core.String.as(map[$_get]("trigger_warning")), ptext: core.String.as(map[$_get]("ptext")), censored: core.String.as(map[$_get]("censored")), delete: core.String.as(map[$_get]("delete")), lastKnownWDT: core.String.as(map[$_get]("last_known_w_d_t"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "conv_id", model.convId, "post_id", model.postId, "trigger_warning", model.triggerWarning, "ptext", model.ptext, "censored", model.censored, "delete", model.delete, "last_known_w_d_t", model.lastKnownWDT]);
    }
  };
  (src__models__wtypes.ConvPostSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvPostSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostSaveRequestSerializer);
  src__models__wtypes.ConvPostSaveRequestFields = class ConvPostSaveRequestFields extends core.Object {};
  (src__models__wtypes.ConvPostSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ConvPostSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ConvPostSaveRequestFields, {
    /*src__models__wtypes.ConvPostSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "conv_id", "post_id", "trigger_warning", "ptext", "censored", "delete", "last_known_w_d_t"], core.String);
    },
    /*src__models__wtypes.ConvPostSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvPostSaveRequestFields.convId*/get convId() {
      return "conv_id";
    },
    /*src__models__wtypes.ConvPostSaveRequestFields.postId*/get postId() {
      return "post_id";
    },
    /*src__models__wtypes.ConvPostSaveRequestFields.triggerWarning*/get triggerWarning() {
      return "trigger_warning";
    },
    /*src__models__wtypes.ConvPostSaveRequestFields.ptext*/get ptext() {
      return "ptext";
    },
    /*src__models__wtypes.ConvPostSaveRequestFields.censored*/get censored() {
      return "censored";
    },
    /*src__models__wtypes.ConvPostSaveRequestFields.delete*/get delete() {
      return "delete";
    },
    /*src__models__wtypes.ConvPostSaveRequestFields.lastKnownWDT*/get lastKnownWDT() {
      return "last_known_w_d_t";
    }
  });
  src__models__wtypes.ConvPostImageSaveRequestSerializer = class ConvPostImageSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvPostImageSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, convId: core.int.as(map[$_get]("conv_id")), ptext: core.String.as(map[$_get]("ptext")), imageBytes: core.Iterable.is(map[$_get]("image_bytes")) ? IterableOfint()._check(core.Iterable.as(map[$_get]("image_bytes"))[$cast](core.int))[$toList]() : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "conv_id", model.convId, "ptext", model.ptext, "image_bytes", model.imageBytes]);
    }
  };
  (src__models__wtypes.ConvPostImageSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvPostImageSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostImageSaveRequestSerializer);
  src__models__wtypes.ConvPostImageSaveRequestFields = class ConvPostImageSaveRequestFields extends core.Object {};
  (src__models__wtypes.ConvPostImageSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ConvPostImageSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostImageSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ConvPostImageSaveRequestFields, {
    /*src__models__wtypes.ConvPostImageSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "conv_id", "ptext", "image_bytes"], core.String);
    },
    /*src__models__wtypes.ConvPostImageSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvPostImageSaveRequestFields.convId*/get convId() {
      return "conv_id";
    },
    /*src__models__wtypes.ConvPostImageSaveRequestFields.ptext*/get ptext() {
      return "ptext";
    },
    /*src__models__wtypes.ConvPostImageSaveRequestFields.imageBytes*/get imageBytes() {
      return "image_bytes";
    }
  });
  src__models__wtypes.ConvPostUserSaveRequestSerializer = class ConvPostUserSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvPostUserSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, postId: core.String.as(map[$_get]("post_id")), reaction: core.String.as(map[$_get]("reaction")), reason: core.String.as(map[$_get]("reason"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "post_id", model.postId, "reaction", model.reaction, "reason", model.reason]);
    }
  };
  (src__models__wtypes.ConvPostUserSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvPostUserSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostUserSaveRequestSerializer);
  src__models__wtypes.ConvPostUserSaveRequestFields = class ConvPostUserSaveRequestFields extends core.Object {};
  (src__models__wtypes.ConvPostUserSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ConvPostUserSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvPostUserSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ConvPostUserSaveRequestFields, {
    /*src__models__wtypes.ConvPostUserSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "post_id", "reaction", "reason"], core.String);
    },
    /*src__models__wtypes.ConvPostUserSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvPostUserSaveRequestFields.postId*/get postId() {
      return "post_id";
    },
    /*src__models__wtypes.ConvPostUserSaveRequestFields.reaction*/get reaction() {
      return "reaction";
    },
    /*src__models__wtypes.ConvPostUserSaveRequestFields.reason*/get reason() {
      return "reason";
    }
  });
  src__models__wtypes.ConvSetReadPositionRequestSerializer = class ConvSetReadPositionRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvSetReadPositionRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, convId: core.int.as(map[$_get]("conv_id")), positionWDT: core.String.as(map[$_get]("position_w_d_t"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "conv_id", model.convId, "position_w_d_t", model.positionWDT]);
    }
  };
  (src__models__wtypes.ConvSetReadPositionRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvSetReadPositionRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvSetReadPositionRequestSerializer);
  src__models__wtypes.ConvSetReadPositionRequestFields = class ConvSetReadPositionRequestFields extends core.Object {};
  (src__models__wtypes.ConvSetReadPositionRequestFields.new = function() {
  }).prototype = src__models__wtypes.ConvSetReadPositionRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvSetReadPositionRequestFields);
  dart.defineLazy(src__models__wtypes.ConvSetReadPositionRequestFields, {
    /*src__models__wtypes.ConvSetReadPositionRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "conv_id", "position_w_d_t"], core.String);
    },
    /*src__models__wtypes.ConvSetReadPositionRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvSetReadPositionRequestFields.convId*/get convId() {
      return "conv_id";
    },
    /*src__models__wtypes.ConvSetReadPositionRequestFields.positionWDT*/get positionWDT() {
      return "position_w_d_t";
    }
  });
  src__models__wtypes.ConvUserSaveRequestSerializer = class ConvUserSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvUserSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, convId: core.int.as(map[$_get]("conv_id")), status: core.String.as(map[$_get]("status")), like: core.String.as(map[$_get]("like")), bookmarked: core.String.as(map[$_get]("bookmarked"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "conv_id", model.convId, "status", model.status, "like", model.like, "bookmarked", model.bookmarked]);
    }
  };
  (src__models__wtypes.ConvUserSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvUserSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvUserSaveRequestSerializer);
  src__models__wtypes.ConvUserSaveRequestFields = class ConvUserSaveRequestFields extends core.Object {};
  (src__models__wtypes.ConvUserSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ConvUserSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvUserSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ConvUserSaveRequestFields, {
    /*src__models__wtypes.ConvUserSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "conv_id", "status", "like", "bookmarked"], core.String);
    },
    /*src__models__wtypes.ConvUserSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvUserSaveRequestFields.convId*/get convId() {
      return "conv_id";
    },
    /*src__models__wtypes.ConvUserSaveRequestFields.status*/get status() {
      return "status";
    },
    /*src__models__wtypes.ConvUserSaveRequestFields.like*/get like() {
      return "like";
    },
    /*src__models__wtypes.ConvUserSaveRequestFields.bookmarked*/get bookmarked() {
      return "bookmarked";
    }
  });
  src__models__wtypes.ConvUserSaveResponseSerializer = class ConvUserSaveResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ConvUserSaveResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, action: core.String.as(map[$_get]("action"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "action", model.action]);
    }
  };
  (src__models__wtypes.ConvUserSaveResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ConvUserSaveResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ConvUserSaveResponseSerializer);
  src__models__wtypes.ConvUserSaveResponseFields = class ConvUserSaveResponseFields extends core.Object {};
  (src__models__wtypes.ConvUserSaveResponseFields.new = function() {
  }).prototype = src__models__wtypes.ConvUserSaveResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ConvUserSaveResponseFields);
  dart.defineLazy(src__models__wtypes.ConvUserSaveResponseFields, {
    /*src__models__wtypes.ConvUserSaveResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "action"], core.String);
    },
    /*src__models__wtypes.ConvUserSaveResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ConvUserSaveResponseFields.action*/get action() {
      return "action";
    }
  });
  src__models__wtypes.DocQueryRequestSerializer = class DocQueryRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.DocQueryRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, mode: core.String.as(map[$_get]("mode"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "mode", model.mode]);
    }
  };
  (src__models__wtypes.DocQueryRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.DocQueryRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.DocQueryRequestSerializer);
  src__models__wtypes.DocQueryRequestFields = class DocQueryRequestFields extends core.Object {};
  (src__models__wtypes.DocQueryRequestFields.new = function() {
  }).prototype = src__models__wtypes.DocQueryRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.DocQueryRequestFields);
  dart.defineLazy(src__models__wtypes.DocQueryRequestFields, {
    /*src__models__wtypes.DocQueryRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "mode"], core.String);
    },
    /*src__models__wtypes.DocQueryRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.DocQueryRequestFields.mode*/get mode() {
      return "mode";
    }
  });
  src__models__wtypes.DocQueryResponseSerializer = class DocQueryResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.DocQueryResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, docs: core.Iterable.is(map[$_get]("docs")) ? ListOf_DocQueryItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("docs"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.DocQueryItemSerializer.fromMap, MapToDocQueryItem()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "docs", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.docs;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.DocQueryItemSerializer.toMap(m), _DocQueryItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.DocQueryResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.DocQueryResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.DocQueryResponseSerializer);
  src__models__wtypes.DocQueryResponseFields = class DocQueryResponseFields extends core.Object {};
  (src__models__wtypes.DocQueryResponseFields.new = function() {
  }).prototype = src__models__wtypes.DocQueryResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.DocQueryResponseFields);
  dart.defineLazy(src__models__wtypes.DocQueryResponseFields, {
    /*src__models__wtypes.DocQueryResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "docs"], core.String);
    },
    /*src__models__wtypes.DocQueryResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.DocQueryResponseFields.docs*/get docs() {
      return "docs";
    }
  });
  src__models__wtypes.DocQueryItemSerializer = class DocQueryItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.DocQueryItem.new({iid: core.int.as(map[$_get]("iid")), title: core.String.as(map[$_get]("title"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["iid", model.iid, "title", model.title]);
    }
  };
  (src__models__wtypes.DocQueryItemSerializer.new = function() {
  }).prototype = src__models__wtypes.DocQueryItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.DocQueryItemSerializer);
  src__models__wtypes.DocQueryItemFields = class DocQueryItemFields extends core.Object {};
  (src__models__wtypes.DocQueryItemFields.new = function() {
  }).prototype = src__models__wtypes.DocQueryItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.DocQueryItemFields);
  dart.defineLazy(src__models__wtypes.DocQueryItemFields, {
    /*src__models__wtypes.DocQueryItemFields.allFields*/get allFields() {
      return dart.constList(["iid", "title"], core.String);
    },
    /*src__models__wtypes.DocQueryItemFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.DocQueryItemFields.title*/get title() {
      return "title";
    }
  });
  src__models__wtypes.DocGetRequestSerializer = class DocGetRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.DocGetRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, docId: core.int.as(map[$_get]("doc_id")), specialCode: core.String.as(map[$_get]("special_code")), revisionNo: core.int.as(map[$_get]("revision_no")), getVerList: core.String.as(map[$_get]("get_ver_list"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "doc_id", model.docId, "special_code", model.specialCode, "revision_no", model.revisionNo, "get_ver_list", model.getVerList]);
    }
  };
  (src__models__wtypes.DocGetRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.DocGetRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.DocGetRequestSerializer);
  src__models__wtypes.DocGetRequestFields = class DocGetRequestFields extends core.Object {};
  (src__models__wtypes.DocGetRequestFields.new = function() {
  }).prototype = src__models__wtypes.DocGetRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.DocGetRequestFields);
  dart.defineLazy(src__models__wtypes.DocGetRequestFields, {
    /*src__models__wtypes.DocGetRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "doc_id", "special_code", "revision_no", "get_ver_list"], core.String);
    },
    /*src__models__wtypes.DocGetRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.DocGetRequestFields.docId*/get docId() {
      return "doc_id";
    },
    /*src__models__wtypes.DocGetRequestFields.specialCode*/get specialCode() {
      return "special_code";
    },
    /*src__models__wtypes.DocGetRequestFields.revisionNo*/get revisionNo() {
      return "revision_no";
    },
    /*src__models__wtypes.DocGetRequestFields.getVerList*/get getVerList() {
      return "get_ver_list";
    }
  });
  src__models__wtypes.DocGetResponseSerializer = class DocGetResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.DocGetResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, docId: core.int.as(map[$_get]("doc_id")), title: core.String.as(map[$_get]("title")), body: core.String.as(map[$_get]("body")), htmlDiff: core.String.as(map[$_get]("html_diff")), projectId: core.int.as(map[$_get]("project_id")), projectTitle: core.String.as(map[$_get]("project_title")), isProjectManager: core.String.as(map[$_get]("is_project_manager")), allowSave: core.String.as(map[$_get]("allow_save")), reasonNotEditable: core.String.as(map[$_get]("reason_not_editable")), createdAtR: core.String.as(map[$_get]("created_at_r")), proposalId: core.int.as(map[$_get]("proposal_id")), verList: core.Iterable.is(map[$_get]("ver_list")) ? ListOf_DocGetVersionItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("ver_list"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.DocGetVersionItemSerializer.fromMap, MapToDocGetVersionItem()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "doc_id", model.docId, "title", model.title, "body", model.body, "html_diff", model.htmlDiff, "project_id", model.projectId, "project_title", model.projectTitle, "is_project_manager", model.isProjectManager, "allow_save", model.allowSave, "reason_not_editable", model.reasonNotEditable, "created_at_r", model.createdAtR, "proposal_id", model.proposalId, "ver_list", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.verList;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.DocGetVersionItemSerializer.toMap(m), _DocGetVersionItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.DocGetResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.DocGetResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.DocGetResponseSerializer);
  src__models__wtypes.DocGetResponseFields = class DocGetResponseFields extends core.Object {};
  (src__models__wtypes.DocGetResponseFields.new = function() {
  }).prototype = src__models__wtypes.DocGetResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.DocGetResponseFields);
  dart.defineLazy(src__models__wtypes.DocGetResponseFields, {
    /*src__models__wtypes.DocGetResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "doc_id", "title", "body", "html_diff", "project_id", "project_title", "is_project_manager", "allow_save", "reason_not_editable", "created_at_r", "proposal_id", "ver_list"], core.String);
    },
    /*src__models__wtypes.DocGetResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.DocGetResponseFields.docId*/get docId() {
      return "doc_id";
    },
    /*src__models__wtypes.DocGetResponseFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.DocGetResponseFields.body*/get body() {
      return "body";
    },
    /*src__models__wtypes.DocGetResponseFields.htmlDiff*/get htmlDiff() {
      return "html_diff";
    },
    /*src__models__wtypes.DocGetResponseFields.projectId*/get projectId() {
      return "project_id";
    },
    /*src__models__wtypes.DocGetResponseFields.projectTitle*/get projectTitle() {
      return "project_title";
    },
    /*src__models__wtypes.DocGetResponseFields.isProjectManager*/get isProjectManager() {
      return "is_project_manager";
    },
    /*src__models__wtypes.DocGetResponseFields.allowSave*/get allowSave() {
      return "allow_save";
    },
    /*src__models__wtypes.DocGetResponseFields.reasonNotEditable*/get reasonNotEditable() {
      return "reason_not_editable";
    },
    /*src__models__wtypes.DocGetResponseFields.createdAtR*/get createdAtR() {
      return "created_at_r";
    },
    /*src__models__wtypes.DocGetResponseFields.proposalId*/get proposalId() {
      return "proposal_id";
    },
    /*src__models__wtypes.DocGetResponseFields.verList*/get verList() {
      return "ver_list";
    }
  });
  src__models__wtypes.DocGetVersionItemSerializer = class DocGetVersionItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.DocGetVersionItem.new({revisionNo: core.int.as(map[$_get]("revision_no")), createdAtR: core.String.as(map[$_get]("created_at_r"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["revision_no", model.revisionNo, "created_at_r", model.createdAtR]);
    }
  };
  (src__models__wtypes.DocGetVersionItemSerializer.new = function() {
  }).prototype = src__models__wtypes.DocGetVersionItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.DocGetVersionItemSerializer);
  src__models__wtypes.DocGetVersionItemFields = class DocGetVersionItemFields extends core.Object {};
  (src__models__wtypes.DocGetVersionItemFields.new = function() {
  }).prototype = src__models__wtypes.DocGetVersionItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.DocGetVersionItemFields);
  dart.defineLazy(src__models__wtypes.DocGetVersionItemFields, {
    /*src__models__wtypes.DocGetVersionItemFields.allFields*/get allFields() {
      return dart.constList(["revision_no", "created_at_r"], core.String);
    },
    /*src__models__wtypes.DocGetVersionItemFields.revisionNo*/get revisionNo() {
      return "revision_no";
    },
    /*src__models__wtypes.DocGetVersionItemFields.createdAtR*/get createdAtR() {
      return "created_at_r";
    }
  });
  src__models__wtypes.DocSaveRequestSerializer = class DocSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.DocSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, docId: core.int.as(map[$_get]("doc_id")), projectId: core.int.as(map[$_get]("project_id")), title: core.String.as(map[$_get]("title")), retitleMode: core.String.as(map[$_get]("retitle_mode")), body: core.String.as(map[$_get]("body")), summary: core.String.as(map[$_get]("summary"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "doc_id", model.docId, "project_id", model.projectId, "title", model.title, "retitle_mode", model.retitleMode, "body", model.body, "summary", model.summary]);
    }
  };
  (src__models__wtypes.DocSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.DocSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.DocSaveRequestSerializer);
  src__models__wtypes.DocSaveRequestFields = class DocSaveRequestFields extends core.Object {};
  (src__models__wtypes.DocSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.DocSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.DocSaveRequestFields);
  dart.defineLazy(src__models__wtypes.DocSaveRequestFields, {
    /*src__models__wtypes.DocSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "doc_id", "project_id", "title", "retitle_mode", "body", "summary"], core.String);
    },
    /*src__models__wtypes.DocSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.DocSaveRequestFields.docId*/get docId() {
      return "doc_id";
    },
    /*src__models__wtypes.DocSaveRequestFields.projectId*/get projectId() {
      return "project_id";
    },
    /*src__models__wtypes.DocSaveRequestFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.DocSaveRequestFields.retitleMode*/get retitleMode() {
      return "retitle_mode";
    },
    /*src__models__wtypes.DocSaveRequestFields.body*/get body() {
      return "body";
    },
    /*src__models__wtypes.DocSaveRequestFields.summary*/get summary() {
      return "summary";
    }
  });
  src__models__wtypes.DocRollbackRequestSerializer = class DocRollbackRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.DocRollbackRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, docId: core.int.as(map[$_get]("doc_id")), revisionNo: core.int.as(map[$_get]("revision_no"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "doc_id", model.docId, "revision_no", model.revisionNo]);
    }
  };
  (src__models__wtypes.DocRollbackRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.DocRollbackRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.DocRollbackRequestSerializer);
  src__models__wtypes.DocRollbackRequestFields = class DocRollbackRequestFields extends core.Object {};
  (src__models__wtypes.DocRollbackRequestFields.new = function() {
  }).prototype = src__models__wtypes.DocRollbackRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.DocRollbackRequestFields);
  dart.defineLazy(src__models__wtypes.DocRollbackRequestFields, {
    /*src__models__wtypes.DocRollbackRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "doc_id", "revision_no"], core.String);
    },
    /*src__models__wtypes.DocRollbackRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.DocRollbackRequestFields.docId*/get docId() {
      return "doc_id";
    },
    /*src__models__wtypes.DocRollbackRequestFields.revisionNo*/get revisionNo() {
      return "revision_no";
    }
  });
  src__models__wtypes.EventQueryRequestSerializer = class EventQueryRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.EventQueryRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, title: core.String.as(map[$_get]("title")), dateFrom: core.String.as(map[$_get]("date_from")), dateTo: core.String.as(map[$_get]("date_to")), miles: core.int.as(map[$_get]("miles")), lat: core.String.as(map[$_get]("lat")), lon: core.String.as(map[$_get]("lon"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "title", model.title, "date_from", model.dateFrom, "date_to", model.dateTo, "miles", model.miles, "lat", model.lat, "lon", model.lon]);
    }
  };
  (src__models__wtypes.EventQueryRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.EventQueryRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.EventQueryRequestSerializer);
  src__models__wtypes.EventQueryRequestFields = class EventQueryRequestFields extends core.Object {};
  (src__models__wtypes.EventQueryRequestFields.new = function() {
  }).prototype = src__models__wtypes.EventQueryRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.EventQueryRequestFields);
  dart.defineLazy(src__models__wtypes.EventQueryRequestFields, {
    /*src__models__wtypes.EventQueryRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "title", "date_from", "date_to", "miles", "lat", "lon"], core.String);
    },
    /*src__models__wtypes.EventQueryRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.EventQueryRequestFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.EventQueryRequestFields.dateFrom*/get dateFrom() {
      return "date_from";
    },
    /*src__models__wtypes.EventQueryRequestFields.dateTo*/get dateTo() {
      return "date_to";
    },
    /*src__models__wtypes.EventQueryRequestFields.miles*/get miles() {
      return "miles";
    },
    /*src__models__wtypes.EventQueryRequestFields.lat*/get lat() {
      return "lat";
    },
    /*src__models__wtypes.EventQueryRequestFields.lon*/get lon() {
      return "lon";
    }
  });
  src__models__wtypes.EventQueryResponseSerializer = class EventQueryResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.EventQueryResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, events: core.Iterable.is(map[$_get]("events")) ? ListOf_EventItemResponse().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("events"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.EventItemResponseSerializer.fromMap, MapToEventItemResponse()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "events", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.events;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.EventItemResponseSerializer.toMap(m), _EventItemResponseToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.EventQueryResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.EventQueryResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.EventQueryResponseSerializer);
  src__models__wtypes.EventQueryResponseFields = class EventQueryResponseFields extends core.Object {};
  (src__models__wtypes.EventQueryResponseFields.new = function() {
  }).prototype = src__models__wtypes.EventQueryResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.EventQueryResponseFields);
  dart.defineLazy(src__models__wtypes.EventQueryResponseFields, {
    /*src__models__wtypes.EventQueryResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "events"], core.String);
    },
    /*src__models__wtypes.EventQueryResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.EventQueryResponseFields.events*/get events() {
      return "events";
    }
  });
  src__models__wtypes.EventItemResponseSerializer = class EventItemResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.EventItemResponse.new({iid: core.int.as(map[$_get]("iid")), title: core.String.as(map[$_get]("title")), startTime: core.String.as(map[$_get]("start_time")), creatorNick: core.String.as(map[$_get]("creator_nick")), creatorId: core.int.as(map[$_get]("creator_id"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["iid", model.iid, "title", model.title, "start_time", model.startTime, "creator_nick", model.creatorNick, "creator_id", model.creatorId]);
    }
  };
  (src__models__wtypes.EventItemResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.EventItemResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.EventItemResponseSerializer);
  src__models__wtypes.EventItemResponseFields = class EventItemResponseFields extends core.Object {};
  (src__models__wtypes.EventItemResponseFields.new = function() {
  }).prototype = src__models__wtypes.EventItemResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.EventItemResponseFields);
  dart.defineLazy(src__models__wtypes.EventItemResponseFields, {
    /*src__models__wtypes.EventItemResponseFields.allFields*/get allFields() {
      return dart.constList(["iid", "title", "start_time", "creator_nick", "creator_id"], core.String);
    },
    /*src__models__wtypes.EventItemResponseFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.EventItemResponseFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.EventItemResponseFields.startTime*/get startTime() {
      return "start_time";
    },
    /*src__models__wtypes.EventItemResponseFields.creatorNick*/get creatorNick() {
      return "creator_nick";
    },
    /*src__models__wtypes.EventItemResponseFields.creatorId*/get creatorId() {
      return "creator_id";
    }
  });
  src__models__wtypes.EventRequestSerializer = class EventRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.EventRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, eventId: core.int.as(map[$_get]("event_id"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "event_id", model.eventId]);
    }
  };
  (src__models__wtypes.EventRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.EventRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.EventRequestSerializer);
  src__models__wtypes.EventRequestFields = class EventRequestFields extends core.Object {};
  (src__models__wtypes.EventRequestFields.new = function() {
  }).prototype = src__models__wtypes.EventRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.EventRequestFields);
  dart.defineLazy(src__models__wtypes.EventRequestFields, {
    /*src__models__wtypes.EventRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "event_id"], core.String);
    },
    /*src__models__wtypes.EventRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.EventRequestFields.eventId*/get eventId() {
      return "event_id";
    }
  });
  src__models__wtypes.EventGetResponseSerializer = class EventGetResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.EventGetResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, title: core.String.as(map[$_get]("title")), description: core.String.as(map[$_get]("description")), duration: core.String.as(map[$_get]("duration")), location: core.String.as(map[$_get]("location")), startTimeU: core.String.as(map[$_get]("start_time_u")), startTimeR: core.String.as(map[$_get]("start_time_r")), creatorNick: core.String.as(map[$_get]("creator_nick")), creatorId: core.int.as(map[$_get]("creator_id")), creatorAvatarUrl: core.String.as(map[$_get]("creator_avatar_url")), createdAtR: core.String.as(map[$_get]("created_at_r")), lat: core.String.as(map[$_get]("lat")), lon: core.String.as(map[$_get]("lon")), users: core.Iterable.is(map[$_get]("users")) ? ListOf_EventGetUserResponse().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("users"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.EventGetUserResponseSerializer.fromMap, MapToEventGetUserResponse()))) : null, convs: core.Iterable.is(map[$_get]("convs")) ? ListOf_EventGetConvResponse().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("convs"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.EventGetConvResponseSerializer.fromMap, MapToEventGetConvResponse()))) : null, isCreator: core.String.as(map[$_get]("is_creator"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "title", model.title, "description", model.description, "duration", model.duration, "location", model.location, "start_time_u", model.startTimeU, "start_time_r", model.startTimeR, "creator_nick", model.creatorNick, "creator_id", model.creatorId, "creator_avatar_url", model.creatorAvatarUrl, "created_at_r", model.createdAtR, "lat", model.lat, "lon", model.lon, "users", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.users;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.EventGetUserResponseSerializer.toMap(m), _EventGetUserResponseToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })(), "convs", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.convs;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.EventGetConvResponseSerializer.toMap(m), _EventGetConvResponseToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })(), "is_creator", model.isCreator]);
    }
  };
  (src__models__wtypes.EventGetResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.EventGetResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.EventGetResponseSerializer);
  src__models__wtypes.EventGetResponseFields = class EventGetResponseFields extends core.Object {};
  (src__models__wtypes.EventGetResponseFields.new = function() {
  }).prototype = src__models__wtypes.EventGetResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.EventGetResponseFields);
  dart.defineLazy(src__models__wtypes.EventGetResponseFields, {
    /*src__models__wtypes.EventGetResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "title", "description", "duration", "location", "start_time_u", "start_time_r", "creator_nick", "creator_id", "creator_avatar_url", "created_at_r", "lat", "lon", "users", "convs", "is_creator"], core.String);
    },
    /*src__models__wtypes.EventGetResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.EventGetResponseFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.EventGetResponseFields.description*/get description() {
      return "description";
    },
    /*src__models__wtypes.EventGetResponseFields.duration*/get duration() {
      return "duration";
    },
    /*src__models__wtypes.EventGetResponseFields.location*/get location() {
      return "location";
    },
    /*src__models__wtypes.EventGetResponseFields.startTimeU*/get startTimeU() {
      return "start_time_u";
    },
    /*src__models__wtypes.EventGetResponseFields.startTimeR*/get startTimeR() {
      return "start_time_r";
    },
    /*src__models__wtypes.EventGetResponseFields.creatorNick*/get creatorNick() {
      return "creator_nick";
    },
    /*src__models__wtypes.EventGetResponseFields.creatorId*/get creatorId() {
      return "creator_id";
    },
    /*src__models__wtypes.EventGetResponseFields.creatorAvatarUrl*/get creatorAvatarUrl() {
      return "creator_avatar_url";
    },
    /*src__models__wtypes.EventGetResponseFields.createdAtR*/get createdAtR() {
      return "created_at_r";
    },
    /*src__models__wtypes.EventGetResponseFields.lat*/get lat() {
      return "lat";
    },
    /*src__models__wtypes.EventGetResponseFields.lon*/get lon() {
      return "lon";
    },
    /*src__models__wtypes.EventGetResponseFields.users*/get users() {
      return "users";
    },
    /*src__models__wtypes.EventGetResponseFields.convs*/get convs() {
      return "convs";
    },
    /*src__models__wtypes.EventGetResponseFields.isCreator*/get isCreator() {
      return "is_creator";
    }
  });
  src__models__wtypes.EventGetUserResponseSerializer = class EventGetUserResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.EventGetUserResponse.new({userId: core.int.as(map[$_get]("user_id")), nick: core.String.as(map[$_get]("nick")), publicName: core.String.as(map[$_get]("public_name")), avatarUrl: core.String.as(map[$_get]("avatar_url")), status: core.String.as(map[$_get]("status")), statusDesc: core.String.as(map[$_get]("status_desc"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["user_id", model.userId, "nick", model.nick, "public_name", model.publicName, "avatar_url", model.avatarUrl, "status", model.status, "status_desc", model.statusDesc]);
    }
  };
  (src__models__wtypes.EventGetUserResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.EventGetUserResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.EventGetUserResponseSerializer);
  src__models__wtypes.EventGetUserResponseFields = class EventGetUserResponseFields extends core.Object {};
  (src__models__wtypes.EventGetUserResponseFields.new = function() {
  }).prototype = src__models__wtypes.EventGetUserResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.EventGetUserResponseFields);
  dart.defineLazy(src__models__wtypes.EventGetUserResponseFields, {
    /*src__models__wtypes.EventGetUserResponseFields.allFields*/get allFields() {
      return dart.constList(["user_id", "nick", "public_name", "avatar_url", "status", "status_desc"], core.String);
    },
    /*src__models__wtypes.EventGetUserResponseFields.userId*/get userId() {
      return "user_id";
    },
    /*src__models__wtypes.EventGetUserResponseFields.nick*/get nick() {
      return "nick";
    },
    /*src__models__wtypes.EventGetUserResponseFields.publicName*/get publicName() {
      return "public_name";
    },
    /*src__models__wtypes.EventGetUserResponseFields.avatarUrl*/get avatarUrl() {
      return "avatar_url";
    },
    /*src__models__wtypes.EventGetUserResponseFields.status*/get status() {
      return "status";
    },
    /*src__models__wtypes.EventGetUserResponseFields.statusDesc*/get statusDesc() {
      return "status_desc";
    }
  });
  src__models__wtypes.EventGetConvResponseSerializer = class EventGetConvResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.EventGetConvResponse.new({iid: core.int.as(map[$_get]("iid")), open: core.String.as(map[$_get]("open")), title: core.String.as(map[$_get]("title")), lastActivity: core.String.as(map[$_get]("last_activity"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["iid", model.iid, "open", model.open, "title", model.title, "last_activity", model.lastActivity]);
    }
  };
  (src__models__wtypes.EventGetConvResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.EventGetConvResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.EventGetConvResponseSerializer);
  src__models__wtypes.EventGetConvResponseFields = class EventGetConvResponseFields extends core.Object {};
  (src__models__wtypes.EventGetConvResponseFields.new = function() {
  }).prototype = src__models__wtypes.EventGetConvResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.EventGetConvResponseFields);
  dart.defineLazy(src__models__wtypes.EventGetConvResponseFields, {
    /*src__models__wtypes.EventGetConvResponseFields.allFields*/get allFields() {
      return dart.constList(["iid", "open", "title", "last_activity"], core.String);
    },
    /*src__models__wtypes.EventGetConvResponseFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.EventGetConvResponseFields.open*/get open() {
      return "open";
    },
    /*src__models__wtypes.EventGetConvResponseFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.EventGetConvResponseFields.lastActivity*/get lastActivity() {
      return "last_activity";
    }
  });
  src__models__wtypes.EventSaveRequestSerializer = class EventSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.EventSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, eventId: core.int.as(map[$_get]("event_id")), title: core.String.as(map[$_get]("title")), description: core.String.as(map[$_get]("description")), duration: core.String.as(map[$_get]("duration")), location: core.String.as(map[$_get]("location")), startTime: core.String.as(map[$_get]("start_time")), lat: core.String.as(map[$_get]("lat")), lon: core.String.as(map[$_get]("lon"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "event_id", model.eventId, "title", model.title, "description", model.description, "duration", model.duration, "location", model.location, "start_time", model.startTime, "lat", model.lat, "lon", model.lon]);
    }
  };
  (src__models__wtypes.EventSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.EventSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.EventSaveRequestSerializer);
  src__models__wtypes.EventSaveRequestFields = class EventSaveRequestFields extends core.Object {};
  (src__models__wtypes.EventSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.EventSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.EventSaveRequestFields);
  dart.defineLazy(src__models__wtypes.EventSaveRequestFields, {
    /*src__models__wtypes.EventSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "event_id", "title", "description", "duration", "location", "start_time", "lat", "lon"], core.String);
    },
    /*src__models__wtypes.EventSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.EventSaveRequestFields.eventId*/get eventId() {
      return "event_id";
    },
    /*src__models__wtypes.EventSaveRequestFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.EventSaveRequestFields.description*/get description() {
      return "description";
    },
    /*src__models__wtypes.EventSaveRequestFields.duration*/get duration() {
      return "duration";
    },
    /*src__models__wtypes.EventSaveRequestFields.location*/get location() {
      return "location";
    },
    /*src__models__wtypes.EventSaveRequestFields.startTime*/get startTime() {
      return "start_time";
    },
    /*src__models__wtypes.EventSaveRequestFields.lat*/get lat() {
      return "lat";
    },
    /*src__models__wtypes.EventSaveRequestFields.lon*/get lon() {
      return "lon";
    }
  });
  src__models__wtypes.EventUserSaveRequestSerializer = class EventUserSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.EventUserSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, eventId: core.int.as(map[$_get]("event_id")), status: core.String.as(map[$_get]("status")), statusDesc: core.String.as(map[$_get]("status_desc"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "event_id", model.eventId, "status", model.status, "status_desc", model.statusDesc]);
    }
  };
  (src__models__wtypes.EventUserSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.EventUserSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.EventUserSaveRequestSerializer);
  src__models__wtypes.EventUserSaveRequestFields = class EventUserSaveRequestFields extends core.Object {};
  (src__models__wtypes.EventUserSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.EventUserSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.EventUserSaveRequestFields);
  dart.defineLazy(src__models__wtypes.EventUserSaveRequestFields, {
    /*src__models__wtypes.EventUserSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "event_id", "status", "status_desc"], core.String);
    },
    /*src__models__wtypes.EventUserSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.EventUserSaveRequestFields.eventId*/get eventId() {
      return "event_id";
    },
    /*src__models__wtypes.EventUserSaveRequestFields.status*/get status() {
      return "status";
    },
    /*src__models__wtypes.EventUserSaveRequestFields.statusDesc*/get statusDesc() {
      return "status_desc";
    }
  });
  src__models__wtypes.ProjectQueryRequestSerializer = class ProjectQueryRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectQueryRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, catId: core.int.as(map[$_get]("cat_id")), title: core.String.as(map[$_get]("title"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "cat_id", model.catId, "title", model.title]);
    }
  };
  (src__models__wtypes.ProjectQueryRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectQueryRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectQueryRequestSerializer);
  src__models__wtypes.ProjectQueryRequestFields = class ProjectQueryRequestFields extends core.Object {};
  (src__models__wtypes.ProjectQueryRequestFields.new = function() {
  }).prototype = src__models__wtypes.ProjectQueryRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectQueryRequestFields);
  dart.defineLazy(src__models__wtypes.ProjectQueryRequestFields, {
    /*src__models__wtypes.ProjectQueryRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "cat_id", "title"], core.String);
    },
    /*src__models__wtypes.ProjectQueryRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProjectQueryRequestFields.catId*/get catId() {
      return "cat_id";
    },
    /*src__models__wtypes.ProjectQueryRequestFields.title*/get title() {
      return "title";
    }
  });
  src__models__wtypes.ProjectQueryResponseSerializer = class ProjectQueryResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectQueryResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, projects: core.Iterable.is(map[$_get]("projects")) ? ListOf_ProjectQueryItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("projects"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.ProjectQueryItemSerializer.fromMap, MapToProjectQueryItem()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "projects", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.projects;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.ProjectQueryItemSerializer.toMap(m), _ProjectQueryItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.ProjectQueryResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectQueryResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectQueryResponseSerializer);
  src__models__wtypes.ProjectQueryResponseFields = class ProjectQueryResponseFields extends core.Object {};
  (src__models__wtypes.ProjectQueryResponseFields.new = function() {
  }).prototype = src__models__wtypes.ProjectQueryResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectQueryResponseFields);
  dart.defineLazy(src__models__wtypes.ProjectQueryResponseFields, {
    /*src__models__wtypes.ProjectQueryResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "projects"], core.String);
    },
    /*src__models__wtypes.ProjectQueryResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProjectQueryResponseFields.projects*/get projects() {
      return "projects";
    }
  });
  src__models__wtypes.ProjectQueryItemSerializer = class ProjectQueryItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectQueryItem.new({projectId: core.int.as(map[$_get]("project_id")), title: core.String.as(map[$_get]("title")), description: core.String.as(map[$_get]("description")), leadership: core.String.as(map[$_get]("leadership")), privacy: core.String.as(map[$_get]("privacy"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["project_id", model.projectId, "title", model.title, "description", model.description, "leadership", model.leadership, "privacy", model.privacy]);
    }
  };
  (src__models__wtypes.ProjectQueryItemSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectQueryItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectQueryItemSerializer);
  src__models__wtypes.ProjectQueryItemFields = class ProjectQueryItemFields extends core.Object {};
  (src__models__wtypes.ProjectQueryItemFields.new = function() {
  }).prototype = src__models__wtypes.ProjectQueryItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectQueryItemFields);
  dart.defineLazy(src__models__wtypes.ProjectQueryItemFields, {
    /*src__models__wtypes.ProjectQueryItemFields.allFields*/get allFields() {
      return dart.constList(["project_id", "title", "description", "leadership", "privacy"], core.String);
    },
    /*src__models__wtypes.ProjectQueryItemFields.projectId*/get projectId() {
      return "project_id";
    },
    /*src__models__wtypes.ProjectQueryItemFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ProjectQueryItemFields.description*/get description() {
      return "description";
    },
    /*src__models__wtypes.ProjectQueryItemFields.leadership*/get leadership() {
      return "leadership";
    },
    /*src__models__wtypes.ProjectQueryItemFields.privacy*/get privacy() {
      return "privacy";
    }
  });
  src__models__wtypes.ProjectGetRequestSerializer = class ProjectGetRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectGetRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, projectId: core.int.as(map[$_get]("project_id"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "project_id", model.projectId]);
    }
  };
  (src__models__wtypes.ProjectGetRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectGetRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectGetRequestSerializer);
  src__models__wtypes.ProjectGetRequestFields = class ProjectGetRequestFields extends core.Object {};
  (src__models__wtypes.ProjectGetRequestFields.new = function() {
  }).prototype = src__models__wtypes.ProjectGetRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectGetRequestFields);
  dart.defineLazy(src__models__wtypes.ProjectGetRequestFields, {
    /*src__models__wtypes.ProjectGetRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "project_id"], core.String);
    },
    /*src__models__wtypes.ProjectGetRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProjectGetRequestFields.projectId*/get projectId() {
      return "project_id";
    }
  });
  src__models__wtypes.ProjectGetResponseSerializer = class ProjectGetResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectGetResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, active: core.String.as(map[$_get]("active")), leadership: core.String.as(map[$_get]("leadership")), privacy: core.String.as(map[$_get]("privacy")), title: core.String.as(map[$_get]("title")), description: core.String.as(map[$_get]("description")), categoryId: core.int.as(map[$_get]("category_id")), userKind: core.String.as(map[$_get]("user_kind")), proposals: core.Iterable.is(map[$_get]("proposals")) ? ListOf_ProjectProposalItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("proposals"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.ProjectProposalItemSerializer.fromMap, MapToProjectProposalItem()))) : null, convs: core.Iterable.is(map[$_get]("convs")) ? ListOf_ProjectConvItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("convs"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.ProjectConvItemSerializer.fromMap, MapToProjectConvItem()))) : null, docs: core.Iterable.is(map[$_get]("docs")) ? ListOf_ProjectDocItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("docs"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.ProjectDocItemSerializer.fromMap, MapToProjectDocItem()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "active", model.active, "leadership", model.leadership, "privacy", model.privacy, "title", model.title, "description", model.description, "category_id", model.categoryId, "user_kind", model.userKind, "proposals", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.proposals;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.ProjectProposalItemSerializer.toMap(m), _ProjectProposalItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })(), "convs", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.convs;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.ProjectConvItemSerializer.toMap(m), _ProjectConvItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })(), "docs", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.docs;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.ProjectDocItemSerializer.toMap(m), _ProjectDocItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.ProjectGetResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectGetResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectGetResponseSerializer);
  src__models__wtypes.ProjectGetResponseFields = class ProjectGetResponseFields extends core.Object {};
  (src__models__wtypes.ProjectGetResponseFields.new = function() {
  }).prototype = src__models__wtypes.ProjectGetResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectGetResponseFields);
  dart.defineLazy(src__models__wtypes.ProjectGetResponseFields, {
    /*src__models__wtypes.ProjectGetResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "active", "leadership", "privacy", "title", "description", "category_id", "user_kind", "proposals", "convs", "docs"], core.String);
    },
    /*src__models__wtypes.ProjectGetResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProjectGetResponseFields.active*/get active() {
      return "active";
    },
    /*src__models__wtypes.ProjectGetResponseFields.leadership*/get leadership() {
      return "leadership";
    },
    /*src__models__wtypes.ProjectGetResponseFields.privacy*/get privacy() {
      return "privacy";
    },
    /*src__models__wtypes.ProjectGetResponseFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ProjectGetResponseFields.description*/get description() {
      return "description";
    },
    /*src__models__wtypes.ProjectGetResponseFields.categoryId*/get categoryId() {
      return "category_id";
    },
    /*src__models__wtypes.ProjectGetResponseFields.userKind*/get userKind() {
      return "user_kind";
    },
    /*src__models__wtypes.ProjectGetResponseFields.proposals*/get proposals() {
      return "proposals";
    },
    /*src__models__wtypes.ProjectGetResponseFields.convs*/get convs() {
      return "convs";
    },
    /*src__models__wtypes.ProjectGetResponseFields.docs*/get docs() {
      return "docs";
    }
  });
  src__models__wtypes.ProjectProposalItemSerializer = class ProjectProposalItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectProposalItem.new({iid: core.int.as(map[$_get]("iid")), active: core.String.as(map[$_get]("active")), title: core.String.as(map[$_get]("title")), createdAtR: core.String.as(map[$_get]("created_at_r"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["iid", model.iid, "active", model.active, "title", model.title, "created_at_r", model.createdAtR]);
    }
  };
  (src__models__wtypes.ProjectProposalItemSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectProposalItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectProposalItemSerializer);
  src__models__wtypes.ProjectProposalItemFields = class ProjectProposalItemFields extends core.Object {};
  (src__models__wtypes.ProjectProposalItemFields.new = function() {
  }).prototype = src__models__wtypes.ProjectProposalItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectProposalItemFields);
  dart.defineLazy(src__models__wtypes.ProjectProposalItemFields, {
    /*src__models__wtypes.ProjectProposalItemFields.allFields*/get allFields() {
      return dart.constList(["iid", "active", "title", "created_at_r"], core.String);
    },
    /*src__models__wtypes.ProjectProposalItemFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.ProjectProposalItemFields.active*/get active() {
      return "active";
    },
    /*src__models__wtypes.ProjectProposalItemFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ProjectProposalItemFields.createdAtR*/get createdAtR() {
      return "created_at_r";
    }
  });
  src__models__wtypes.ProjectConvItemSerializer = class ProjectConvItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectConvItem.new({iid: core.int.as(map[$_get]("iid")), open: core.String.as(map[$_get]("open")), title: core.String.as(map[$_get]("title")), lastActivity: core.String.as(map[$_get]("last_activity"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["iid", model.iid, "open", model.open, "title", model.title, "last_activity", model.lastActivity]);
    }
  };
  (src__models__wtypes.ProjectConvItemSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectConvItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectConvItemSerializer);
  src__models__wtypes.ProjectConvItemFields = class ProjectConvItemFields extends core.Object {};
  (src__models__wtypes.ProjectConvItemFields.new = function() {
  }).prototype = src__models__wtypes.ProjectConvItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectConvItemFields);
  dart.defineLazy(src__models__wtypes.ProjectConvItemFields, {
    /*src__models__wtypes.ProjectConvItemFields.allFields*/get allFields() {
      return dart.constList(["iid", "open", "title", "last_activity"], core.String);
    },
    /*src__models__wtypes.ProjectConvItemFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.ProjectConvItemFields.open*/get open() {
      return "open";
    },
    /*src__models__wtypes.ProjectConvItemFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ProjectConvItemFields.lastActivity*/get lastActivity() {
      return "last_activity";
    }
  });
  src__models__wtypes.ProjectDocItemSerializer = class ProjectDocItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectDocItem.new({iid: core.int.as(map[$_get]("iid")), title: core.String.as(map[$_get]("title"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["iid", model.iid, "title", model.title]);
    }
  };
  (src__models__wtypes.ProjectDocItemSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectDocItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectDocItemSerializer);
  src__models__wtypes.ProjectDocItemFields = class ProjectDocItemFields extends core.Object {};
  (src__models__wtypes.ProjectDocItemFields.new = function() {
  }).prototype = src__models__wtypes.ProjectDocItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectDocItemFields);
  dart.defineLazy(src__models__wtypes.ProjectDocItemFields, {
    /*src__models__wtypes.ProjectDocItemFields.allFields*/get allFields() {
      return dart.constList(["iid", "title"], core.String);
    },
    /*src__models__wtypes.ProjectDocItemFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.ProjectDocItemFields.title*/get title() {
      return "title";
    }
  });
  src__models__wtypes.ProjectSaveRequestSerializer = class ProjectSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, projectId: core.int.as(map[$_get]("project_id")), leadership: core.String.as(map[$_get]("leadership")), privacy: core.String.as(map[$_get]("privacy")), title: core.String.as(map[$_get]("title")), description: core.String.as(map[$_get]("description")), categoryId: core.int.as(map[$_get]("category_id"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "project_id", model.projectId, "leadership", model.leadership, "privacy", model.privacy, "title", model.title, "description", model.description, "category_id", model.categoryId]);
    }
  };
  (src__models__wtypes.ProjectSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectSaveRequestSerializer);
  src__models__wtypes.ProjectSaveRequestFields = class ProjectSaveRequestFields extends core.Object {};
  (src__models__wtypes.ProjectSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ProjectSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ProjectSaveRequestFields, {
    /*src__models__wtypes.ProjectSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "project_id", "leadership", "privacy", "title", "description", "category_id"], core.String);
    },
    /*src__models__wtypes.ProjectSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProjectSaveRequestFields.projectId*/get projectId() {
      return "project_id";
    },
    /*src__models__wtypes.ProjectSaveRequestFields.leadership*/get leadership() {
      return "leadership";
    },
    /*src__models__wtypes.ProjectSaveRequestFields.privacy*/get privacy() {
      return "privacy";
    },
    /*src__models__wtypes.ProjectSaveRequestFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ProjectSaveRequestFields.description*/get description() {
      return "description";
    },
    /*src__models__wtypes.ProjectSaveRequestFields.categoryId*/get categoryId() {
      return "category_id";
    }
  });
  src__models__wtypes.ProjectUserQueryRequestSerializer = class ProjectUserQueryRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectUserQueryRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, projectId: core.int.as(map[$_get]("project_id")), name: core.String.as(map[$_get]("name")), resultPage: core.int.as(map[$_get]("result_page"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "project_id", model.projectId, "name", model.name, "result_page", model.resultPage]);
    }
  };
  (src__models__wtypes.ProjectUserQueryRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectUserQueryRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserQueryRequestSerializer);
  src__models__wtypes.ProjectUserQueryRequestFields = class ProjectUserQueryRequestFields extends core.Object {};
  (src__models__wtypes.ProjectUserQueryRequestFields.new = function() {
  }).prototype = src__models__wtypes.ProjectUserQueryRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserQueryRequestFields);
  dart.defineLazy(src__models__wtypes.ProjectUserQueryRequestFields, {
    /*src__models__wtypes.ProjectUserQueryRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "project_id", "name", "result_page"], core.String);
    },
    /*src__models__wtypes.ProjectUserQueryRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProjectUserQueryRequestFields.projectId*/get projectId() {
      return "project_id";
    },
    /*src__models__wtypes.ProjectUserQueryRequestFields.name_*/get name_() {
      return "name";
    },
    /*src__models__wtypes.ProjectUserQueryRequestFields.resultPage*/get resultPage() {
      return "result_page";
    }
  });
  src__models__wtypes.ProjectUserQueryResponseSerializer = class ProjectUserQueryResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectUserQueryResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, projectTitle: core.String.as(map[$_get]("project_title")), completeLoad: core.String.as(map[$_get]("complete_load")), editable: core.String.as(map[$_get]("editable")), users: core.Iterable.is(map[$_get]("users")) ? ListOf_ProjectUserItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("users"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.ProjectUserItemSerializer.fromMap, MapToProjectUserItem()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "project_title", model.projectTitle, "complete_load", model.completeLoad, "editable", model.editable, "users", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.users;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.ProjectUserItemSerializer.toMap(m), _ProjectUserItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.ProjectUserQueryResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectUserQueryResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserQueryResponseSerializer);
  src__models__wtypes.ProjectUserQueryResponseFields = class ProjectUserQueryResponseFields extends core.Object {};
  (src__models__wtypes.ProjectUserQueryResponseFields.new = function() {
  }).prototype = src__models__wtypes.ProjectUserQueryResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserQueryResponseFields);
  dart.defineLazy(src__models__wtypes.ProjectUserQueryResponseFields, {
    /*src__models__wtypes.ProjectUserQueryResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "project_title", "complete_load", "editable", "users"], core.String);
    },
    /*src__models__wtypes.ProjectUserQueryResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProjectUserQueryResponseFields.projectTitle*/get projectTitle() {
      return "project_title";
    },
    /*src__models__wtypes.ProjectUserQueryResponseFields.completeLoad*/get completeLoad() {
      return "complete_load";
    },
    /*src__models__wtypes.ProjectUserQueryResponseFields.editable*/get editable() {
      return "editable";
    },
    /*src__models__wtypes.ProjectUserQueryResponseFields.users*/get users() {
      return "users";
    }
  });
  src__models__wtypes.ProjectUserItemSerializer = class ProjectUserItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectUserItem.new({userId: core.int.as(map[$_get]("user_id")), kind: core.String.as(map[$_get]("kind")), throttle: core.String.as(map[$_get]("throttle")), nick: core.String.as(map[$_get]("nick")), publicName: core.String.as(map[$_get]("public_name")), avatarUrl: core.String.as(map[$_get]("avatar_url")), voteKind: core.String.as(map[$_get]("vote_kind"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["user_id", model.userId, "kind", model.kind, "throttle", model.throttle, "nick", model.nick, "public_name", model.publicName, "avatar_url", model.avatarUrl, "vote_kind", model.voteKind]);
    }
  };
  (src__models__wtypes.ProjectUserItemSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectUserItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserItemSerializer);
  src__models__wtypes.ProjectUserItemFields = class ProjectUserItemFields extends core.Object {};
  (src__models__wtypes.ProjectUserItemFields.new = function() {
  }).prototype = src__models__wtypes.ProjectUserItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserItemFields);
  dart.defineLazy(src__models__wtypes.ProjectUserItemFields, {
    /*src__models__wtypes.ProjectUserItemFields.allFields*/get allFields() {
      return dart.constList(["user_id", "kind", "throttle", "nick", "public_name", "avatar_url", "vote_kind"], core.String);
    },
    /*src__models__wtypes.ProjectUserItemFields.userId*/get userId() {
      return "user_id";
    },
    /*src__models__wtypes.ProjectUserItemFields.kind*/get kind() {
      return "kind";
    },
    /*src__models__wtypes.ProjectUserItemFields.throttle*/get throttle() {
      return "throttle";
    },
    /*src__models__wtypes.ProjectUserItemFields.nick*/get nick() {
      return "nick";
    },
    /*src__models__wtypes.ProjectUserItemFields.publicName*/get publicName() {
      return "public_name";
    },
    /*src__models__wtypes.ProjectUserItemFields.avatarUrl*/get avatarUrl() {
      return "avatar_url";
    },
    /*src__models__wtypes.ProjectUserItemFields.voteKind*/get voteKind() {
      return "vote_kind";
    }
  });
  src__models__wtypes.ProjectUserSaveRequestSerializer = class ProjectUserSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectUserSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, projectId: core.int.as(map[$_get]("project_id")), userId: core.int.as(map[$_get]("user_id")), kind: core.String.as(map[$_get]("kind"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "project_id", model.projectId, "user_id", model.userId, "kind", model.kind]);
    }
  };
  (src__models__wtypes.ProjectUserSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectUserSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserSaveRequestSerializer);
  src__models__wtypes.ProjectUserSaveRequestFields = class ProjectUserSaveRequestFields extends core.Object {};
  (src__models__wtypes.ProjectUserSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ProjectUserSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ProjectUserSaveRequestFields, {
    /*src__models__wtypes.ProjectUserSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "project_id", "user_id", "kind"], core.String);
    },
    /*src__models__wtypes.ProjectUserSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProjectUserSaveRequestFields.projectId*/get projectId() {
      return "project_id";
    },
    /*src__models__wtypes.ProjectUserSaveRequestFields.userId*/get userId() {
      return "user_id";
    },
    /*src__models__wtypes.ProjectUserSaveRequestFields.kind*/get kind() {
      return "kind";
    }
  });
  src__models__wtypes.ProjectUserUserSaveRequestSerializer = class ProjectUserUserSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProjectUserUserSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, projectId: core.int.as(map[$_get]("project_id")), aboutId: core.int.as(map[$_get]("about_id")), kind: core.String.as(map[$_get]("kind"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "project_id", model.projectId, "about_id", model.aboutId, "kind", model.kind]);
    }
  };
  (src__models__wtypes.ProjectUserUserSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ProjectUserUserSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserUserSaveRequestSerializer);
  src__models__wtypes.ProjectUserUserSaveRequestFields = class ProjectUserUserSaveRequestFields extends core.Object {};
  (src__models__wtypes.ProjectUserUserSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ProjectUserUserSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProjectUserUserSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ProjectUserUserSaveRequestFields, {
    /*src__models__wtypes.ProjectUserUserSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "project_id", "about_id", "kind"], core.String);
    },
    /*src__models__wtypes.ProjectUserUserSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProjectUserUserSaveRequestFields.projectId*/get projectId() {
      return "project_id";
    },
    /*src__models__wtypes.ProjectUserUserSaveRequestFields.aboutId*/get aboutId() {
      return "about_id";
    },
    /*src__models__wtypes.ProjectUserUserSaveRequestFields.kind*/get kind() {
      return "kind";
    }
  });
  src__models__wtypes.ProposalQueryRequestSerializer = class ProposalQueryRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProposalQueryRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, mode: core.String.as(map[$_get]("mode")), year: core.int.as(map[$_get]("year")), projectId: core.int.as(map[$_get]("project_id"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "mode", model.mode, "year", model.year, "project_id", model.projectId]);
    }
  };
  (src__models__wtypes.ProposalQueryRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ProposalQueryRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalQueryRequestSerializer);
  src__models__wtypes.ProposalQueryRequestFields = class ProposalQueryRequestFields extends core.Object {};
  (src__models__wtypes.ProposalQueryRequestFields.new = function() {
  }).prototype = src__models__wtypes.ProposalQueryRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalQueryRequestFields);
  dart.defineLazy(src__models__wtypes.ProposalQueryRequestFields, {
    /*src__models__wtypes.ProposalQueryRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "mode", "year", "project_id"], core.String);
    },
    /*src__models__wtypes.ProposalQueryRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProposalQueryRequestFields.mode*/get mode() {
      return "mode";
    },
    /*src__models__wtypes.ProposalQueryRequestFields.year*/get year() {
      return "year";
    },
    /*src__models__wtypes.ProposalQueryRequestFields.projectId*/get projectId() {
      return "project_id";
    }
  });
  src__models__wtypes.ProposalQueryResponseSerializer = class ProposalQueryResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProposalQueryResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, items: core.Iterable.is(map[$_get]("items")) ? ListOf_ProposalQueryItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("items"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.ProposalQueryItemSerializer.fromMap, MapToProposalQueryItem()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "items", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.items;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.ProposalQueryItemSerializer.toMap(m), _ProposalQueryItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.ProposalQueryResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ProposalQueryResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalQueryResponseSerializer);
  src__models__wtypes.ProposalQueryResponseFields = class ProposalQueryResponseFields extends core.Object {};
  (src__models__wtypes.ProposalQueryResponseFields.new = function() {
  }).prototype = src__models__wtypes.ProposalQueryResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalQueryResponseFields);
  dart.defineLazy(src__models__wtypes.ProposalQueryResponseFields, {
    /*src__models__wtypes.ProposalQueryResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "items"], core.String);
    },
    /*src__models__wtypes.ProposalQueryResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProposalQueryResponseFields.items*/get items() {
      return "items";
    }
  });
  src__models__wtypes.ProposalQueryItemSerializer = class ProposalQueryItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProposalQueryItem.new({iid: core.int.as(map[$_get]("iid")), title: core.String.as(map[$_get]("title")), kind: core.String.as(map[$_get]("kind"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["iid", model.iid, "title", model.title, "kind", model.kind]);
    }
  };
  (src__models__wtypes.ProposalQueryItemSerializer.new = function() {
  }).prototype = src__models__wtypes.ProposalQueryItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalQueryItemSerializer);
  src__models__wtypes.ProposalQueryItemFields = class ProposalQueryItemFields extends core.Object {};
  (src__models__wtypes.ProposalQueryItemFields.new = function() {
  }).prototype = src__models__wtypes.ProposalQueryItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalQueryItemFields);
  dart.defineLazy(src__models__wtypes.ProposalQueryItemFields, {
    /*src__models__wtypes.ProposalQueryItemFields.allFields*/get allFields() {
      return dart.constList(["iid", "title", "kind"], core.String);
    },
    /*src__models__wtypes.ProposalQueryItemFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.ProposalQueryItemFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ProposalQueryItemFields.kind*/get kind() {
      return "kind";
    }
  });
  src__models__wtypes.ProposalGetRequestSerializer = class ProposalGetRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProposalGetRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, proposalId: core.int.as(map[$_get]("proposal_id"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "proposal_id", model.proposalId]);
    }
  };
  (src__models__wtypes.ProposalGetRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ProposalGetRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalGetRequestSerializer);
  src__models__wtypes.ProposalGetRequestFields = class ProposalGetRequestFields extends core.Object {};
  (src__models__wtypes.ProposalGetRequestFields.new = function() {
  }).prototype = src__models__wtypes.ProposalGetRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalGetRequestFields);
  dart.defineLazy(src__models__wtypes.ProposalGetRequestFields, {
    /*src__models__wtypes.ProposalGetRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "proposal_id"], core.String);
    },
    /*src__models__wtypes.ProposalGetRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProposalGetRequestFields.proposalId*/get proposalId() {
      return "proposal_id";
    }
  });
  src__models__wtypes.ProposalGetResponseSerializer = class ProposalGetResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProposalGetResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, active: core.String.as(map[$_get]("active")), kind: core.String.as(map[$_get]("kind")), eligible: core.String.as(map[$_get]("eligible")), title: core.String.as(map[$_get]("title")), summary: core.String.as(map[$_get]("summary")), summaryHtml: core.String.as(map[$_get]("summary_html")), dtext: core.String.as(map[$_get]("dtext")), timeout: core.String.as(map[$_get]("timeout")), deleteTime: core.String.as(map[$_get]("delete_time")), winningOption: core.int.as(map[$_get]("winning_option")), createdBy: core.int.as(map[$_get]("created_by")), projectId: core.int.as(map[$_get]("project_id")), docId: core.int.as(map[$_get]("doc_id")), createdByNick: core.String.as(map[$_get]("created_by_nick")), createdByAvatarUrl: core.String.as(map[$_get]("created_by_avatar_url")), options: core.Iterable.is(map[$_get]("options")) ? ListOf_ProposalOptionItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("options"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.ProposalOptionItemSerializer.fromMap, MapToProposalOptionItem()))) : null, myVote: core.int.as(map[$_get]("my_vote")), statusDescription: core.String.as(map[$_get]("status_description")), myEligible: core.String.as(map[$_get]("my_eligible"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "active", model.active, "kind", model.kind, "eligible", model.eligible, "title", model.title, "summary", model.summary, "summary_html", model.summaryHtml, "dtext", model.dtext, "timeout", model.timeout, "delete_time", model.deleteTime, "winning_option", model.winningOption, "created_by", model.createdBy, "project_id", model.projectId, "doc_id", model.docId, "created_by_nick", model.createdByNick, "created_by_avatar_url", model.createdByAvatarUrl, "options", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.options;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.ProposalOptionItemSerializer.toMap(m), _ProposalOptionItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })(), "my_vote", model.myVote, "status_description", model.statusDescription, "my_eligible", model.myEligible]);
    }
  };
  (src__models__wtypes.ProposalGetResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ProposalGetResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalGetResponseSerializer);
  src__models__wtypes.ProposalGetResponseFields = class ProposalGetResponseFields extends core.Object {};
  (src__models__wtypes.ProposalGetResponseFields.new = function() {
  }).prototype = src__models__wtypes.ProposalGetResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalGetResponseFields);
  dart.defineLazy(src__models__wtypes.ProposalGetResponseFields, {
    /*src__models__wtypes.ProposalGetResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "active", "kind", "eligible", "title", "summary", "summary_html", "dtext", "timeout", "delete_time", "winning_option", "created_by", "project_id", "doc_id", "created_by_nick", "created_by_avatar_url", "options", "my_vote", "status_description", "my_eligible"], core.String);
    },
    /*src__models__wtypes.ProposalGetResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProposalGetResponseFields.active*/get active() {
      return "active";
    },
    /*src__models__wtypes.ProposalGetResponseFields.kind*/get kind() {
      return "kind";
    },
    /*src__models__wtypes.ProposalGetResponseFields.eligible*/get eligible() {
      return "eligible";
    },
    /*src__models__wtypes.ProposalGetResponseFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ProposalGetResponseFields.summary*/get summary() {
      return "summary";
    },
    /*src__models__wtypes.ProposalGetResponseFields.summaryHtml*/get summaryHtml() {
      return "summary_html";
    },
    /*src__models__wtypes.ProposalGetResponseFields.dtext*/get dtext() {
      return "dtext";
    },
    /*src__models__wtypes.ProposalGetResponseFields.timeout*/get timeout() {
      return "timeout";
    },
    /*src__models__wtypes.ProposalGetResponseFields.deleteTime*/get deleteTime() {
      return "delete_time";
    },
    /*src__models__wtypes.ProposalGetResponseFields.winningOption*/get winningOption() {
      return "winning_option";
    },
    /*src__models__wtypes.ProposalGetResponseFields.createdBy*/get createdBy() {
      return "created_by";
    },
    /*src__models__wtypes.ProposalGetResponseFields.projectId*/get projectId() {
      return "project_id";
    },
    /*src__models__wtypes.ProposalGetResponseFields.docId*/get docId() {
      return "doc_id";
    },
    /*src__models__wtypes.ProposalGetResponseFields.createdByNick*/get createdByNick() {
      return "created_by_nick";
    },
    /*src__models__wtypes.ProposalGetResponseFields.createdByAvatarUrl*/get createdByAvatarUrl() {
      return "created_by_avatar_url";
    },
    /*src__models__wtypes.ProposalGetResponseFields.options*/get options() {
      return "options";
    },
    /*src__models__wtypes.ProposalGetResponseFields.myVote*/get myVote() {
      return "my_vote";
    },
    /*src__models__wtypes.ProposalGetResponseFields.statusDescription*/get statusDescription() {
      return "status_description";
    },
    /*src__models__wtypes.ProposalGetResponseFields.myEligible*/get myEligible() {
      return "my_eligible";
    }
  });
  src__models__wtypes.ProposalOptionItemSerializer = class ProposalOptionItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProposalOptionItem.new({optionNo: core.int.as(map[$_get]("option_no")), voteCount: core.int.as(map[$_get]("vote_count")), optionDesc: core.String.as(map[$_get]("option_desc"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["option_no", model.optionNo, "vote_count", model.voteCount, "option_desc", model.optionDesc]);
    }
  };
  (src__models__wtypes.ProposalOptionItemSerializer.new = function() {
  }).prototype = src__models__wtypes.ProposalOptionItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalOptionItemSerializer);
  src__models__wtypes.ProposalOptionItemFields = class ProposalOptionItemFields extends core.Object {};
  (src__models__wtypes.ProposalOptionItemFields.new = function() {
  }).prototype = src__models__wtypes.ProposalOptionItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalOptionItemFields);
  dart.defineLazy(src__models__wtypes.ProposalOptionItemFields, {
    /*src__models__wtypes.ProposalOptionItemFields.allFields*/get allFields() {
      return dart.constList(["option_no", "vote_count", "option_desc"], core.String);
    },
    /*src__models__wtypes.ProposalOptionItemFields.optionNo*/get optionNo() {
      return "option_no";
    },
    /*src__models__wtypes.ProposalOptionItemFields.voteCount*/get voteCount() {
      return "vote_count";
    },
    /*src__models__wtypes.ProposalOptionItemFields.optionDesc*/get optionDesc() {
      return "option_desc";
    }
  });
  src__models__wtypes.ProposalSaveRequestSerializer = class ProposalSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProposalSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, kind: core.String.as(map[$_get]("kind")), projectId: core.int.as(map[$_get]("project_id")), eligible: core.String.as(map[$_get]("eligible")), title: core.String.as(map[$_get]("title")), summary: core.String.as(map[$_get]("summary")), days: core.int.as(map[$_get]("days")), options: core.Iterable.is(map[$_get]("options")) ? IterableOfString()._check(core.Iterable.as(map[$_get]("options"))[$cast](core.String))[$toList]() : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "kind", model.kind, "project_id", model.projectId, "eligible", model.eligible, "title", model.title, "summary", model.summary, "days", model.days, "options", model.options]);
    }
  };
  (src__models__wtypes.ProposalSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ProposalSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalSaveRequestSerializer);
  src__models__wtypes.ProposalSaveRequestFields = class ProposalSaveRequestFields extends core.Object {};
  (src__models__wtypes.ProposalSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ProposalSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ProposalSaveRequestFields, {
    /*src__models__wtypes.ProposalSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "kind", "project_id", "eligible", "title", "summary", "days", "options"], core.String);
    },
    /*src__models__wtypes.ProposalSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProposalSaveRequestFields.kind*/get kind() {
      return "kind";
    },
    /*src__models__wtypes.ProposalSaveRequestFields.projectId*/get projectId() {
      return "project_id";
    },
    /*src__models__wtypes.ProposalSaveRequestFields.eligible*/get eligible() {
      return "eligible";
    },
    /*src__models__wtypes.ProposalSaveRequestFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ProposalSaveRequestFields.summary*/get summary() {
      return "summary";
    },
    /*src__models__wtypes.ProposalSaveRequestFields.days*/get days() {
      return "days";
    },
    /*src__models__wtypes.ProposalSaveRequestFields.options*/get options() {
      return "options";
    }
  });
  src__models__wtypes.ProposalUserSaveRequestSerializer = class ProposalUserSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ProposalUserSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, proposalId: core.int.as(map[$_get]("proposal_id")), vote: core.int.as(map[$_get]("vote"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "proposal_id", model.proposalId, "vote", model.vote]);
    }
  };
  (src__models__wtypes.ProposalUserSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ProposalUserSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalUserSaveRequestSerializer);
  src__models__wtypes.ProposalUserSaveRequestFields = class ProposalUserSaveRequestFields extends core.Object {};
  (src__models__wtypes.ProposalUserSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ProposalUserSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ProposalUserSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ProposalUserSaveRequestFields, {
    /*src__models__wtypes.ProposalUserSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "proposal_id", "vote"], core.String);
    },
    /*src__models__wtypes.ProposalUserSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ProposalUserSaveRequestFields.proposalId*/get proposalId() {
      return "proposal_id";
    },
    /*src__models__wtypes.ProposalUserSaveRequestFields.vote*/get vote() {
      return "vote";
    }
  });
  src__models__wtypes.PushQueueGetRequestSerializer = class PushQueueGetRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.PushQueueGetRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, depth: core.String.as(map[$_get]("depth"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "depth", model.depth]);
    }
  };
  (src__models__wtypes.PushQueueGetRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.PushQueueGetRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.PushQueueGetRequestSerializer);
  src__models__wtypes.PushQueueGetRequestFields = class PushQueueGetRequestFields extends core.Object {};
  (src__models__wtypes.PushQueueGetRequestFields.new = function() {
  }).prototype = src__models__wtypes.PushQueueGetRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.PushQueueGetRequestFields);
  dart.defineLazy(src__models__wtypes.PushQueueGetRequestFields, {
    /*src__models__wtypes.PushQueueGetRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "depth"], core.String);
    },
    /*src__models__wtypes.PushQueueGetRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.PushQueueGetRequestFields.depth*/get depth() {
      return "depth";
    }
  });
  src__models__wtypes.PushQueueGetResponseSerializer = class PushQueueGetResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.PushQueueGetResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, items: core.Iterable.is(map[$_get]("items")) ? ListOf_PushQueueItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("items"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.PushQueueItemSerializer.fromMap, MapToPushQueueItem()))) : null, fullModeStatus: core.String.as(map[$_get]("full_mode_status"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "items", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.items;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.PushQueueItemSerializer.toMap(m), _PushQueueItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })(), "full_mode_status", model.fullModeStatus]);
    }
  };
  (src__models__wtypes.PushQueueGetResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.PushQueueGetResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.PushQueueGetResponseSerializer);
  src__models__wtypes.PushQueueGetResponseFields = class PushQueueGetResponseFields extends core.Object {};
  (src__models__wtypes.PushQueueGetResponseFields.new = function() {
  }).prototype = src__models__wtypes.PushQueueGetResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.PushQueueGetResponseFields);
  dart.defineLazy(src__models__wtypes.PushQueueGetResponseFields, {
    /*src__models__wtypes.PushQueueGetResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "items", "full_mode_status"], core.String);
    },
    /*src__models__wtypes.PushQueueGetResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.PushQueueGetResponseFields.items*/get items() {
      return "items";
    },
    /*src__models__wtypes.PushQueueGetResponseFields.fullModeStatus*/get fullModeStatus() {
      return "full_mode_status";
    }
  });
  src__models__wtypes.PushQueueItemSerializer = class PushQueueItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.PushQueueItem.new({kind: core.String.as(map[$_get]("kind")), why: core.String.as(map[$_get]("why")), iid: core.int.as(map[$_get]("iid")), sid: core.String.as(map[$_get]("sid")), text: core.String.as(map[$_get]("text")), linkText: core.String.as(map[$_get]("link_text")), linkPaneKey: core.String.as(map[$_get]("link_pane_key"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["kind", model.kind, "why", model.why, "iid", model.iid, "sid", model.sid, "text", model.text, "link_text", model.linkText, "link_pane_key", model.linkPaneKey]);
    }
  };
  (src__models__wtypes.PushQueueItemSerializer.new = function() {
  }).prototype = src__models__wtypes.PushQueueItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.PushQueueItemSerializer);
  src__models__wtypes.PushQueueItemFields = class PushQueueItemFields extends core.Object {};
  (src__models__wtypes.PushQueueItemFields.new = function() {
  }).prototype = src__models__wtypes.PushQueueItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.PushQueueItemFields);
  dart.defineLazy(src__models__wtypes.PushQueueItemFields, {
    /*src__models__wtypes.PushQueueItemFields.allFields*/get allFields() {
      return dart.constList(["kind", "why", "iid", "sid", "text", "link_text", "link_pane_key"], core.String);
    },
    /*src__models__wtypes.PushQueueItemFields.kind*/get kind() {
      return "kind";
    },
    /*src__models__wtypes.PushQueueItemFields.why*/get why() {
      return "why";
    },
    /*src__models__wtypes.PushQueueItemFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.PushQueueItemFields.sid*/get sid() {
      return "sid";
    },
    /*src__models__wtypes.PushQueueItemFields.text*/get text() {
      return "text";
    },
    /*src__models__wtypes.PushQueueItemFields.linkText*/get linkText() {
      return "link_text";
    },
    /*src__models__wtypes.PushQueueItemFields.linkPaneKey*/get linkPaneKey() {
      return "link_pane_key";
    }
  });
  src__models__wtypes.ResourceQueryRequestSerializer = class ResourceQueryRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ResourceQueryRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, categoryId: core.int.as(map[$_get]("category_id")), title: core.String.as(map[$_get]("title")), kind: core.String.as(map[$_get]("kind"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "category_id", model.categoryId, "title", model.title, "kind", model.kind]);
    }
  };
  (src__models__wtypes.ResourceQueryRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ResourceQueryRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceQueryRequestSerializer);
  src__models__wtypes.ResourceQueryRequestFields = class ResourceQueryRequestFields extends core.Object {};
  (src__models__wtypes.ResourceQueryRequestFields.new = function() {
  }).prototype = src__models__wtypes.ResourceQueryRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceQueryRequestFields);
  dart.defineLazy(src__models__wtypes.ResourceQueryRequestFields, {
    /*src__models__wtypes.ResourceQueryRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "category_id", "title", "kind"], core.String);
    },
    /*src__models__wtypes.ResourceQueryRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ResourceQueryRequestFields.categoryId*/get categoryId() {
      return "category_id";
    },
    /*src__models__wtypes.ResourceQueryRequestFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ResourceQueryRequestFields.kind*/get kind() {
      return "kind";
    }
  });
  src__models__wtypes.ResourceQueryResponseSerializer = class ResourceQueryResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ResourceQueryResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, items: core.Iterable.is(map[$_get]("items")) ? ListOf_ResourceItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("items"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.ResourceItemSerializer.fromMap, MapToResourceItem()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "items", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.items;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.ResourceItemSerializer.toMap(m), _ResourceItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.ResourceQueryResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ResourceQueryResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceQueryResponseSerializer);
  src__models__wtypes.ResourceQueryResponseFields = class ResourceQueryResponseFields extends core.Object {};
  (src__models__wtypes.ResourceQueryResponseFields.new = function() {
  }).prototype = src__models__wtypes.ResourceQueryResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceQueryResponseFields);
  dart.defineLazy(src__models__wtypes.ResourceQueryResponseFields, {
    /*src__models__wtypes.ResourceQueryResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "items"], core.String);
    },
    /*src__models__wtypes.ResourceQueryResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ResourceQueryResponseFields.items*/get items() {
      return "items";
    }
  });
  src__models__wtypes.ResourceItemSerializer = class ResourceItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ResourceItem.new({iid: core.int.as(map[$_get]("iid")), title: core.String.as(map[$_get]("title")), url: core.String.as(map[$_get]("url")), description: core.String.as(map[$_get]("description"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["iid", model.iid, "title", model.title, "url", model.url, "description", model.description]);
    }
  };
  (src__models__wtypes.ResourceItemSerializer.new = function() {
  }).prototype = src__models__wtypes.ResourceItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceItemSerializer);
  src__models__wtypes.ResourceItemFields = class ResourceItemFields extends core.Object {};
  (src__models__wtypes.ResourceItemFields.new = function() {
  }).prototype = src__models__wtypes.ResourceItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceItemFields);
  dart.defineLazy(src__models__wtypes.ResourceItemFields, {
    /*src__models__wtypes.ResourceItemFields.allFields*/get allFields() {
      return dart.constList(["iid", "title", "url", "description"], core.String);
    },
    /*src__models__wtypes.ResourceItemFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.ResourceItemFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ResourceItemFields.url*/get url() {
      return "url";
    },
    /*src__models__wtypes.ResourceItemFields.description*/get description() {
      return "description";
    }
  });
  src__models__wtypes.ResourceGetRequestSerializer = class ResourceGetRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ResourceGetRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, iid: core.int.as(map[$_get]("iid"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "iid", model.iid]);
    }
  };
  (src__models__wtypes.ResourceGetRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ResourceGetRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceGetRequestSerializer);
  src__models__wtypes.ResourceGetRequestFields = class ResourceGetRequestFields extends core.Object {};
  (src__models__wtypes.ResourceGetRequestFields.new = function() {
  }).prototype = src__models__wtypes.ResourceGetRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceGetRequestFields);
  dart.defineLazy(src__models__wtypes.ResourceGetRequestFields, {
    /*src__models__wtypes.ResourceGetRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "iid"], core.String);
    },
    /*src__models__wtypes.ResourceGetRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ResourceGetRequestFields.iid*/get iid() {
      return "iid";
    }
  });
  src__models__wtypes.ResourceGetResponseSerializer = class ResourceGetResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ResourceGetResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, categoryId: core.int.as(map[$_get]("category_id")), userId: core.int.as(map[$_get]("user_id")), importantCount: core.int.as(map[$_get]("important_count")), title: core.String.as(map[$_get]("title")), description: core.String.as(map[$_get]("description")), createdAtR: core.String.as(map[$_get]("created_at_r")), visible: core.String.as(map[$_get]("visible")), kind: core.String.as(map[$_get]("kind")), url: core.String.as(map[$_get]("url")), userKind: core.String.as(map[$_get]("user_kind")), isSiteAdmin: core.String.as(map[$_get]("is_site_admin")), isCreator: core.String.as(map[$_get]("is_creator")), nick: core.String.as(map[$_get]("nick"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "category_id", model.categoryId, "user_id", model.userId, "important_count", model.importantCount, "title", model.title, "description", model.description, "created_at_r", model.createdAtR, "visible", model.visible, "kind", model.kind, "url", model.url, "user_kind", model.userKind, "is_site_admin", model.isSiteAdmin, "is_creator", model.isCreator, "nick", model.nick]);
    }
  };
  (src__models__wtypes.ResourceGetResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.ResourceGetResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceGetResponseSerializer);
  src__models__wtypes.ResourceGetResponseFields = class ResourceGetResponseFields extends core.Object {};
  (src__models__wtypes.ResourceGetResponseFields.new = function() {
  }).prototype = src__models__wtypes.ResourceGetResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceGetResponseFields);
  dart.defineLazy(src__models__wtypes.ResourceGetResponseFields, {
    /*src__models__wtypes.ResourceGetResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "category_id", "user_id", "important_count", "title", "description", "created_at_r", "visible", "kind", "url", "user_kind", "is_site_admin", "is_creator", "nick"], core.String);
    },
    /*src__models__wtypes.ResourceGetResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ResourceGetResponseFields.categoryId*/get categoryId() {
      return "category_id";
    },
    /*src__models__wtypes.ResourceGetResponseFields.userId*/get userId() {
      return "user_id";
    },
    /*src__models__wtypes.ResourceGetResponseFields.importantCount*/get importantCount() {
      return "important_count";
    },
    /*src__models__wtypes.ResourceGetResponseFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ResourceGetResponseFields.description*/get description() {
      return "description";
    },
    /*src__models__wtypes.ResourceGetResponseFields.createdAtR*/get createdAtR() {
      return "created_at_r";
    },
    /*src__models__wtypes.ResourceGetResponseFields.visible*/get visible() {
      return "visible";
    },
    /*src__models__wtypes.ResourceGetResponseFields.kind*/get kind() {
      return "kind";
    },
    /*src__models__wtypes.ResourceGetResponseFields.url*/get url() {
      return "url";
    },
    /*src__models__wtypes.ResourceGetResponseFields.userKind*/get userKind() {
      return "user_kind";
    },
    /*src__models__wtypes.ResourceGetResponseFields.isSiteAdmin*/get isSiteAdmin() {
      return "is_site_admin";
    },
    /*src__models__wtypes.ResourceGetResponseFields.isCreator*/get isCreator() {
      return "is_creator";
    },
    /*src__models__wtypes.ResourceGetResponseFields.nick*/get nick() {
      return "nick";
    }
  });
  src__models__wtypes.ResourceSaveRequestSerializer = class ResourceSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ResourceSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, iid: core.int.as(map[$_get]("iid")), categoryId: core.int.as(map[$_get]("category_id")), title: core.String.as(map[$_get]("title")), description: core.String.as(map[$_get]("description")), kind: core.String.as(map[$_get]("kind")), url: core.String.as(map[$_get]("url"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "iid", model.iid, "category_id", model.categoryId, "title", model.title, "description", model.description, "kind", model.kind, "url", model.url]);
    }
  };
  (src__models__wtypes.ResourceSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ResourceSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceSaveRequestSerializer);
  src__models__wtypes.ResourceSaveRequestFields = class ResourceSaveRequestFields extends core.Object {};
  (src__models__wtypes.ResourceSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ResourceSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ResourceSaveRequestFields, {
    /*src__models__wtypes.ResourceSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "iid", "category_id", "title", "description", "kind", "url"], core.String);
    },
    /*src__models__wtypes.ResourceSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ResourceSaveRequestFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.ResourceSaveRequestFields.categoryId*/get categoryId() {
      return "category_id";
    },
    /*src__models__wtypes.ResourceSaveRequestFields.title*/get title() {
      return "title";
    },
    /*src__models__wtypes.ResourceSaveRequestFields.description*/get description() {
      return "description";
    },
    /*src__models__wtypes.ResourceSaveRequestFields.kind*/get kind() {
      return "kind";
    },
    /*src__models__wtypes.ResourceSaveRequestFields.url*/get url() {
      return "url";
    }
  });
  src__models__wtypes.ResourceTriageRequestSerializer = class ResourceTriageRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ResourceTriageRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, iid: core.int.as(map[$_get]("iid")), mode: core.String.as(map[$_get]("mode"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "iid", model.iid, "mode", model.mode]);
    }
  };
  (src__models__wtypes.ResourceTriageRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ResourceTriageRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceTriageRequestSerializer);
  src__models__wtypes.ResourceTriageRequestFields = class ResourceTriageRequestFields extends core.Object {};
  (src__models__wtypes.ResourceTriageRequestFields.new = function() {
  }).prototype = src__models__wtypes.ResourceTriageRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceTriageRequestFields);
  dart.defineLazy(src__models__wtypes.ResourceTriageRequestFields, {
    /*src__models__wtypes.ResourceTriageRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "iid", "mode"], core.String);
    },
    /*src__models__wtypes.ResourceTriageRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ResourceTriageRequestFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.ResourceTriageRequestFields.mode*/get mode() {
      return "mode";
    }
  });
  src__models__wtypes.ResourceUserSaveRequestSerializer = class ResourceUserSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.ResourceUserSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, iid: core.int.as(map[$_get]("iid")), kind: core.String.as(map[$_get]("kind"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "iid", model.iid, "kind", model.kind]);
    }
  };
  (src__models__wtypes.ResourceUserSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.ResourceUserSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceUserSaveRequestSerializer);
  src__models__wtypes.ResourceUserSaveRequestFields = class ResourceUserSaveRequestFields extends core.Object {};
  (src__models__wtypes.ResourceUserSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.ResourceUserSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.ResourceUserSaveRequestFields);
  dart.defineLazy(src__models__wtypes.ResourceUserSaveRequestFields, {
    /*src__models__wtypes.ResourceUserSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "iid", "kind"], core.String);
    },
    /*src__models__wtypes.ResourceUserSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.ResourceUserSaveRequestFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.ResourceUserSaveRequestFields.kind*/get kind() {
      return "kind";
    }
  });
  src__models__wtypes.UserQueryRequestSerializer = class UserQueryRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.UserQueryRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, name: core.String.as(map[$_get]("name"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "name", model.name]);
    }
  };
  (src__models__wtypes.UserQueryRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.UserQueryRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.UserQueryRequestSerializer);
  src__models__wtypes.UserQueryRequestFields = class UserQueryRequestFields extends core.Object {};
  (src__models__wtypes.UserQueryRequestFields.new = function() {
  }).prototype = src__models__wtypes.UserQueryRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.UserQueryRequestFields);
  dart.defineLazy(src__models__wtypes.UserQueryRequestFields, {
    /*src__models__wtypes.UserQueryRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "name"], core.String);
    },
    /*src__models__wtypes.UserQueryRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.UserQueryRequestFields.name_*/get name_() {
      return "name";
    }
  });
  src__models__wtypes.UserQueryResponseSerializer = class UserQueryResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.UserQueryResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, users: core.Iterable.is(map[$_get]("users")) ? ListOf_UserQueryItem().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("users"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.UserQueryItemSerializer.fromMap, MapToUserQueryItem()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "users", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.users;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.UserQueryItemSerializer.toMap(m), _UserQueryItemToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.UserQueryResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.UserQueryResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.UserQueryResponseSerializer);
  src__models__wtypes.UserQueryResponseFields = class UserQueryResponseFields extends core.Object {};
  (src__models__wtypes.UserQueryResponseFields.new = function() {
  }).prototype = src__models__wtypes.UserQueryResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.UserQueryResponseFields);
  dart.defineLazy(src__models__wtypes.UserQueryResponseFields, {
    /*src__models__wtypes.UserQueryResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "users"], core.String);
    },
    /*src__models__wtypes.UserQueryResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.UserQueryResponseFields.users*/get users() {
      return "users";
    }
  });
  src__models__wtypes.UserQueryItemSerializer = class UserQueryItemSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.UserQueryItem.new({iid: core.int.as(map[$_get]("iid")), nick: core.String.as(map[$_get]("nick")), kind: core.String.as(map[$_get]("kind")), publicName: core.String.as(map[$_get]("public_name")), avatarUrl: core.String.as(map[$_get]("avatar_url"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["iid", model.iid, "nick", model.nick, "kind", model.kind, "public_name", model.publicName, "avatar_url", model.avatarUrl]);
    }
  };
  (src__models__wtypes.UserQueryItemSerializer.new = function() {
  }).prototype = src__models__wtypes.UserQueryItemSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.UserQueryItemSerializer);
  src__models__wtypes.UserQueryItemFields = class UserQueryItemFields extends core.Object {};
  (src__models__wtypes.UserQueryItemFields.new = function() {
  }).prototype = src__models__wtypes.UserQueryItemFields.prototype;
  dart.addTypeTests(src__models__wtypes.UserQueryItemFields);
  dart.defineLazy(src__models__wtypes.UserQueryItemFields, {
    /*src__models__wtypes.UserQueryItemFields.allFields*/get allFields() {
      return dart.constList(["iid", "nick", "kind", "public_name", "avatar_url"], core.String);
    },
    /*src__models__wtypes.UserQueryItemFields.iid*/get iid() {
      return "iid";
    },
    /*src__models__wtypes.UserQueryItemFields.nick*/get nick() {
      return "nick";
    },
    /*src__models__wtypes.UserQueryItemFields.kind*/get kind() {
      return "kind";
    },
    /*src__models__wtypes.UserQueryItemFields.publicName*/get publicName() {
      return "public_name";
    },
    /*src__models__wtypes.UserQueryItemFields.avatarUrl*/get avatarUrl() {
      return "avatar_url";
    }
  });
  src__models__wtypes.UserGetRequestSerializer = class UserGetRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.UserGetRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, userId: core.int.as(map[$_get]("user_id")), includeDetail: core.String.as(map[$_get]("include_detail")), includeEditing: core.String.as(map[$_get]("include_editing"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "user_id", model.userId, "include_detail", model.includeDetail, "include_editing", model.includeEditing]);
    }
  };
  (src__models__wtypes.UserGetRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.UserGetRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.UserGetRequestSerializer);
  src__models__wtypes.UserGetRequestFields = class UserGetRequestFields extends core.Object {};
  (src__models__wtypes.UserGetRequestFields.new = function() {
  }).prototype = src__models__wtypes.UserGetRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.UserGetRequestFields);
  dart.defineLazy(src__models__wtypes.UserGetRequestFields, {
    /*src__models__wtypes.UserGetRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "user_id", "include_detail", "include_editing"], core.String);
    },
    /*src__models__wtypes.UserGetRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.UserGetRequestFields.userId*/get userId() {
      return "user_id";
    },
    /*src__models__wtypes.UserGetRequestFields.includeDetail*/get includeDetail() {
      return "include_detail";
    },
    /*src__models__wtypes.UserGetRequestFields.includeEditing*/get includeEditing() {
      return "include_editing";
    }
  });
  src__models__wtypes.UserGetResponseSerializer = class UserGetResponseSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.UserGetResponse.new({base: map[$_get]("base") != null ? src__models__wtypes.APIResponseBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, status: core.String.as(map[$_get]("status")), nick: core.String.as(map[$_get]("nick")), email: core.String.as(map[$_get]("email")), kind: core.String.as(map[$_get]("kind")), isSiteAdmin: core.String.as(map[$_get]("is_site_admin")), publicName: core.String.as(map[$_get]("public_name")), prefEmailNotify: core.String.as(map[$_get]("pref_email_notify")), publicLinks: core.Map.is(map[$_get]("public_links")) ? MapOfString$String()._check(core.Map.as(map[$_get]("public_links"))[$cast](core.String, core.String)) : null, timeZone: core.String.as(map[$_get]("time_zone")), allTimeZones: core.Iterable.is(map[$_get]("all_time_zones")) ? IterableOfString()._check(core.Iterable.as(map[$_get]("all_time_zones"))[$cast](core.String))[$toList]() : null, avatarUrl: core.String.as(map[$_get]("avatar_url")), userUserKind: core.String.as(map[$_get]("user_user_kind")), events: core.Iterable.is(map[$_get]("events")) ? ListOf_APIResponseAssociation().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("events"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.APIResponseAssociationSerializer.fromMap, MapToAPIResponseAssociation()))) : null, projects: core.Iterable.is(map[$_get]("projects")) ? ListOf_APIResponseAssociation().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("projects"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.APIResponseAssociationSerializer.fromMap, MapToAPIResponseAssociation()))) : null, resources: core.Iterable.is(map[$_get]("resources")) ? ListOf_APIResponseAssociation().unmodifiable(IterableOfMap()._check(core.Iterable.as(map[$_get]("resources"))[$where](dart.fn(x => core.Map.is(x), dynamicTobool()))[$cast](core.Map))[$map](dart.dynamic, dart.fn(src__models__wtypes.APIResponseAssociationSerializer.fromMap, MapToAPIResponseAssociation()))) : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIResponseBaseSerializer.toMap(model.base), "status", model.status, "nick", model.nick, "email", model.email, "kind", model.kind, "is_site_admin", model.isSiteAdmin, "public_name", model.publicName, "pref_email_notify", model.prefEmailNotify, "public_links", model.publicLinks, "time_zone", model.timeZone, "all_time_zones", model.allTimeZones, "avatar_url", model.avatarUrl, "user_user_kind", model.userUserKind, "events", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.events;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.APIResponseAssociationSerializer.toMap(m), _APIResponseAssociationToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })(), "projects", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.projects;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.APIResponseAssociationSerializer.toMap(m), _APIResponseAssociationToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })(), "resources", (() => {
          let t = IterableOfMapOfString$dynamic()._check((() => {
            let t = model.resources;
            return t == null ? null : t[$map](MapOfString$dynamic(), dart.fn(m => src__models__wtypes.APIResponseAssociationSerializer.toMap(m), _APIResponseAssociationToMapOfString$dynamic()));
          })());
          return t == null ? null : t[$toList]();
        })()]);
    }
  };
  (src__models__wtypes.UserGetResponseSerializer.new = function() {
  }).prototype = src__models__wtypes.UserGetResponseSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.UserGetResponseSerializer);
  src__models__wtypes.UserGetResponseFields = class UserGetResponseFields extends core.Object {};
  (src__models__wtypes.UserGetResponseFields.new = function() {
  }).prototype = src__models__wtypes.UserGetResponseFields.prototype;
  dart.addTypeTests(src__models__wtypes.UserGetResponseFields);
  dart.defineLazy(src__models__wtypes.UserGetResponseFields, {
    /*src__models__wtypes.UserGetResponseFields.allFields*/get allFields() {
      return dart.constList(["base", "status", "nick", "email", "kind", "is_site_admin", "public_name", "pref_email_notify", "public_links", "time_zone", "all_time_zones", "avatar_url", "user_user_kind", "events", "projects", "resources"], core.String);
    },
    /*src__models__wtypes.UserGetResponseFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.UserGetResponseFields.status*/get status() {
      return "status";
    },
    /*src__models__wtypes.UserGetResponseFields.nick*/get nick() {
      return "nick";
    },
    /*src__models__wtypes.UserGetResponseFields.email*/get email() {
      return "email";
    },
    /*src__models__wtypes.UserGetResponseFields.kind*/get kind() {
      return "kind";
    },
    /*src__models__wtypes.UserGetResponseFields.isSiteAdmin*/get isSiteAdmin() {
      return "is_site_admin";
    },
    /*src__models__wtypes.UserGetResponseFields.publicName*/get publicName() {
      return "public_name";
    },
    /*src__models__wtypes.UserGetResponseFields.prefEmailNotify*/get prefEmailNotify() {
      return "pref_email_notify";
    },
    /*src__models__wtypes.UserGetResponseFields.publicLinks*/get publicLinks() {
      return "public_links";
    },
    /*src__models__wtypes.UserGetResponseFields.timeZone*/get timeZone() {
      return "time_zone";
    },
    /*src__models__wtypes.UserGetResponseFields.allTimeZones*/get allTimeZones() {
      return "all_time_zones";
    },
    /*src__models__wtypes.UserGetResponseFields.avatarUrl*/get avatarUrl() {
      return "avatar_url";
    },
    /*src__models__wtypes.UserGetResponseFields.userUserKind*/get userUserKind() {
      return "user_user_kind";
    },
    /*src__models__wtypes.UserGetResponseFields.events*/get events() {
      return "events";
    },
    /*src__models__wtypes.UserGetResponseFields.projects*/get projects() {
      return "projects";
    },
    /*src__models__wtypes.UserGetResponseFields.resources*/get resources() {
      return "resources";
    }
  });
  src__models__wtypes.UserSaveRequestSerializer = class UserSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.UserSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, isNew: core.String.as(map[$_get]("is_new")), isDelete: core.String.as(map[$_get]("is_delete")), saveNick: core.String.as(map[$_get]("save_nick")), savePW: core.String.as(map[$_get]("save_p_w")), kind: core.String.as(map[$_get]("kind")), email: core.String.as(map[$_get]("email")), isSiteAdmin: core.String.as(map[$_get]("is_site_admin")), publicName: core.String.as(map[$_get]("public_name")), prefEmailNotify: core.String.as(map[$_get]("pref_email_notify")), publicLinks: core.Map.is(map[$_get]("public_links")) ? MapOfString$String()._check(core.Map.as(map[$_get]("public_links"))[$cast](core.String, core.String)) : null, timeZone: core.String.as(map[$_get]("time_zone"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "is_new", model.isNew, "is_delete", model.isDelete, "save_nick", model.saveNick, "save_p_w", model.savePW, "kind", model.kind, "email", model.email, "is_site_admin", model.isSiteAdmin, "public_name", model.publicName, "pref_email_notify", model.prefEmailNotify, "public_links", model.publicLinks, "time_zone", model.timeZone]);
    }
  };
  (src__models__wtypes.UserSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.UserSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.UserSaveRequestSerializer);
  src__models__wtypes.UserSaveRequestFields = class UserSaveRequestFields extends core.Object {};
  (src__models__wtypes.UserSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.UserSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.UserSaveRequestFields);
  dart.defineLazy(src__models__wtypes.UserSaveRequestFields, {
    /*src__models__wtypes.UserSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "is_new", "is_delete", "save_nick", "save_p_w", "kind", "email", "is_site_admin", "public_name", "pref_email_notify", "public_links", "time_zone"], core.String);
    },
    /*src__models__wtypes.UserSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.UserSaveRequestFields.isNew*/get isNew() {
      return "is_new";
    },
    /*src__models__wtypes.UserSaveRequestFields.isDelete*/get isDelete() {
      return "is_delete";
    },
    /*src__models__wtypes.UserSaveRequestFields.saveNick*/get saveNick() {
      return "save_nick";
    },
    /*src__models__wtypes.UserSaveRequestFields.savePW*/get savePW() {
      return "save_p_w";
    },
    /*src__models__wtypes.UserSaveRequestFields.kind*/get kind() {
      return "kind";
    },
    /*src__models__wtypes.UserSaveRequestFields.email*/get email() {
      return "email";
    },
    /*src__models__wtypes.UserSaveRequestFields.isSiteAdmin*/get isSiteAdmin() {
      return "is_site_admin";
    },
    /*src__models__wtypes.UserSaveRequestFields.publicName*/get publicName() {
      return "public_name";
    },
    /*src__models__wtypes.UserSaveRequestFields.prefEmailNotify*/get prefEmailNotify() {
      return "pref_email_notify";
    },
    /*src__models__wtypes.UserSaveRequestFields.publicLinks*/get publicLinks() {
      return "public_links";
    },
    /*src__models__wtypes.UserSaveRequestFields.timeZone*/get timeZone() {
      return "time_zone";
    }
  });
  src__models__wtypes.UserAvatarSaveRequestSerializer = class UserAvatarSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.UserAvatarSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, imageBytes: core.Iterable.is(map[$_get]("image_bytes")) ? IterableOfint()._check(core.Iterable.as(map[$_get]("image_bytes"))[$cast](core.int))[$toList]() : null});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "image_bytes", model.imageBytes]);
    }
  };
  (src__models__wtypes.UserAvatarSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.UserAvatarSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.UserAvatarSaveRequestSerializer);
  src__models__wtypes.UserAvatarSaveRequestFields = class UserAvatarSaveRequestFields extends core.Object {};
  (src__models__wtypes.UserAvatarSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.UserAvatarSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.UserAvatarSaveRequestFields);
  dart.defineLazy(src__models__wtypes.UserAvatarSaveRequestFields, {
    /*src__models__wtypes.UserAvatarSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "image_bytes"], core.String);
    },
    /*src__models__wtypes.UserAvatarSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.UserAvatarSaveRequestFields.imageBytes*/get imageBytes() {
      return "image_bytes";
    }
  });
  src__models__wtypes.UserNotifySaveRequestSerializer = class UserNotifySaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.UserNotifySaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, notifyId: core.String.as(map[$_get]("notify_id"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "notify_id", model.notifyId]);
    }
  };
  (src__models__wtypes.UserNotifySaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.UserNotifySaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.UserNotifySaveRequestSerializer);
  src__models__wtypes.UserNotifySaveRequestFields = class UserNotifySaveRequestFields extends core.Object {};
  (src__models__wtypes.UserNotifySaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.UserNotifySaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.UserNotifySaveRequestFields);
  dart.defineLazy(src__models__wtypes.UserNotifySaveRequestFields, {
    /*src__models__wtypes.UserNotifySaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "notify_id"], core.String);
    },
    /*src__models__wtypes.UserNotifySaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.UserNotifySaveRequestFields.notifyId*/get notifyId() {
      return "notify_id";
    }
  });
  src__models__wtypes.UserRecoverPasswordRequestSerializer = class UserRecoverPasswordRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.UserRecoverPasswordRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, recoveryNick: core.String.as(map[$_get]("recovery_nick")), mode: core.String.as(map[$_get]("mode")), recoveryPassword: core.String.as(map[$_get]("recovery_password")), code: core.String.as(map[$_get]("code"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "recovery_nick", model.recoveryNick, "mode", model.mode, "recovery_password", model.recoveryPassword, "code", model.code]);
    }
  };
  (src__models__wtypes.UserRecoverPasswordRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.UserRecoverPasswordRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.UserRecoverPasswordRequestSerializer);
  src__models__wtypes.UserRecoverPasswordRequestFields = class UserRecoverPasswordRequestFields extends core.Object {};
  (src__models__wtypes.UserRecoverPasswordRequestFields.new = function() {
  }).prototype = src__models__wtypes.UserRecoverPasswordRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.UserRecoverPasswordRequestFields);
  dart.defineLazy(src__models__wtypes.UserRecoverPasswordRequestFields, {
    /*src__models__wtypes.UserRecoverPasswordRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "recovery_nick", "mode", "recovery_password", "code"], core.String);
    },
    /*src__models__wtypes.UserRecoverPasswordRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.UserRecoverPasswordRequestFields.recoveryNick*/get recoveryNick() {
      return "recovery_nick";
    },
    /*src__models__wtypes.UserRecoverPasswordRequestFields.mode*/get mode() {
      return "mode";
    },
    /*src__models__wtypes.UserRecoverPasswordRequestFields.recoveryPassword*/get recoveryPassword() {
      return "recovery_password";
    },
    /*src__models__wtypes.UserRecoverPasswordRequestFields.code*/get code() {
      return "code";
    }
  });
  src__models__wtypes.UserUserSaveRequestSerializer = class UserUserSaveRequestSerializer extends core.Object {
    static fromMap(map) {
      return new src__models__wtypes.UserUserSaveRequest.new({base: map[$_get]("base") != null ? src__models__wtypes.APIRequestBaseSerializer.fromMap(core.Map.as(map[$_get]("base"))) : null, aboutId: core.int.as(map[$_get]("about_id")), kind: core.String.as(map[$_get]("kind"))});
    }
    static toMap(model) {
      if (model == null) {
        return null;
      }
      return new (IdentityMapOfString$dynamic()).from(["base", src__models__wtypes.APIRequestBaseSerializer.toMap(model.base), "about_id", model.aboutId, "kind", model.kind]);
    }
  };
  (src__models__wtypes.UserUserSaveRequestSerializer.new = function() {
  }).prototype = src__models__wtypes.UserUserSaveRequestSerializer.prototype;
  dart.addTypeTests(src__models__wtypes.UserUserSaveRequestSerializer);
  src__models__wtypes.UserUserSaveRequestFields = class UserUserSaveRequestFields extends core.Object {};
  (src__models__wtypes.UserUserSaveRequestFields.new = function() {
  }).prototype = src__models__wtypes.UserUserSaveRequestFields.prototype;
  dart.addTypeTests(src__models__wtypes.UserUserSaveRequestFields);
  dart.defineLazy(src__models__wtypes.UserUserSaveRequestFields, {
    /*src__models__wtypes.UserUserSaveRequestFields.allFields*/get allFields() {
      return dart.constList(["base", "about_id", "kind"], core.String);
    },
    /*src__models__wtypes.UserUserSaveRequestFields.base*/get base() {
      return "base";
    },
    /*src__models__wtypes.UserUserSaveRequestFields.aboutId*/get aboutId() {
      return "about_id";
    },
    /*src__models__wtypes.UserUserSaveRequestFields.kind*/get kind() {
      return "kind";
    }
  });
  dart.trackLibraries("packages/models/models.ddc", {
    "package:models/models.dart": models,
    "package:models/src/models/wtypes.dart": src__models__wtypes
  }, '{"version":3,"sourceRoot":"","sources":["src/models/wtypes.dart","src/models/wtypes.g.dart"],"names":[],"mappings":"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","file":"models.ddc.js"}');
  // Exports:
  return {
    models: models,
    src__models__wtypes: src__models__wtypes
  };
});

//# sourceMappingURL=models.ddc.js.map
