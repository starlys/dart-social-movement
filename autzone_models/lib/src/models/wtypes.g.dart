// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wtypes.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class APIRequestBase implements _APIRequestBase {
  const APIRequestBase({this.nick, this.password, this.siteCode});

  @override
  final String nick;

  @override
  final String password;

  @override
  final String siteCode;

  APIRequestBase copyWith({String nick, String password, String siteCode}) {
    return new APIRequestBase(
        nick: nick ?? this.nick,
        password: password ?? this.password,
        siteCode: siteCode ?? this.siteCode);
  }

  bool operator ==(other) {
    return other is _APIRequestBase &&
        other.nick == nick &&
        other.password == password &&
        other.siteCode == siteCode;
  }

  @override
  int get hashCode {
    return hashObjects([nick, password, siteCode]);
  }

  Map<String, dynamic> toJson() {
    return APIRequestBaseSerializer.toMap(this);
  }
}

@generatedSerializable
class APIResponseBase extends _APIResponseBase {
  APIResponseBase({this.errorMessage, this.errorCode, this.ok, this.newId});

  @override
  final String errorMessage;

  @override
  final String errorCode;

  @override
  final String ok;

  @override
  final int newId;

  APIResponseBase copyWith(
      {String errorMessage, String errorCode, String ok, int newId}) {
    return new APIResponseBase(
        errorMessage: errorMessage ?? this.errorMessage,
        errorCode: errorCode ?? this.errorCode,
        ok: ok ?? this.ok,
        newId: newId ?? this.newId);
  }

  bool operator ==(other) {
    return other is _APIResponseBase &&
        other.errorMessage == errorMessage &&
        other.errorCode == errorCode &&
        other.ok == ok &&
        other.newId == newId;
  }

  @override
  int get hashCode {
    return hashObjects([errorMessage, errorCode, ok, newId]);
  }

  Map<String, dynamic> toJson() {
    return APIResponseBaseSerializer.toMap(this);
  }
}

@generatedSerializable
class APIResponseAssociation implements _APIResponseAssociation {
  const APIResponseAssociation({this.linkText, this.linkPaneKey});

  @override
  final String linkText;

  @override
  final String linkPaneKey;

  APIResponseAssociation copyWith({String linkText, String linkPaneKey}) {
    return new APIResponseAssociation(
        linkText: linkText ?? this.linkText,
        linkPaneKey: linkPaneKey ?? this.linkPaneKey);
  }

  bool operator ==(other) {
    return other is _APIResponseAssociation &&
        other.linkText == linkText &&
        other.linkPaneKey == linkPaneKey;
  }

  @override
  int get hashCode {
    return hashObjects([linkText, linkPaneKey]);
  }

  Map<String, dynamic> toJson() {
    return APIResponseAssociationSerializer.toMap(this);
  }
}

@generatedSerializable
class AuthenticateResponse implements _AuthenticateResponse {
  const AuthenticateResponse(
      {this.base, this.publicName, this.nick, this.userId, this.isSiteAdmin});

  @override
  final _APIResponseBase base;

  @override
  final String publicName;

  @override
  final String nick;

  @override
  final int userId;

  @override
  final String isSiteAdmin;

  AuthenticateResponse copyWith(
      {_APIResponseBase base,
      String publicName,
      String nick,
      int userId,
      String isSiteAdmin}) {
    return new AuthenticateResponse(
        base: base ?? this.base,
        publicName: publicName ?? this.publicName,
        nick: nick ?? this.nick,
        userId: userId ?? this.userId,
        isSiteAdmin: isSiteAdmin ?? this.isSiteAdmin);
  }

  bool operator ==(other) {
    return other is _AuthenticateResponse &&
        other.base == base &&
        other.publicName == publicName &&
        other.nick == nick &&
        other.userId == userId &&
        other.isSiteAdmin == isSiteAdmin;
  }

  @override
  int get hashCode {
    return hashObjects([base, publicName, nick, userId, isSiteAdmin]);
  }

  Map<String, dynamic> toJson() {
    return AuthenticateResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class CrossQueryRequest implements _CrossQueryRequest {
  const CrossQueryRequest({this.base});

  @override
  final _APIRequestBase base;

  CrossQueryRequest copyWith({_APIRequestBase base}) {
    return new CrossQueryRequest(base: base ?? this.base);
  }

  bool operator ==(other) {
    return other is _CrossQueryRequest && other.base == base;
  }

  @override
  int get hashCode {
    return hashObjects([base]);
  }

  Map<String, dynamic> toJson() {
    return CrossQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class CrossQueryResponse implements _CrossQueryResponse {
  const CrossQueryResponse(
      {this.base, List<_APIResponseAssociation> this.items});

  @override
  final _APIResponseBase base;

  @override
  final List<_APIResponseAssociation> items;

  CrossQueryResponse copyWith(
      {_APIResponseBase base, List<_APIResponseAssociation> items}) {
    return new CrossQueryResponse(
        base: base ?? this.base, items: items ?? this.items);
  }

  bool operator ==(other) {
    return other is _CrossQueryResponse &&
        other.base == base &&
        const ListEquality<_APIResponseAssociation>(
                const DefaultEquality<_APIResponseAssociation>())
            .equals(other.items, items);
  }

  @override
  int get hashCode {
    return hashObjects([base, items]);
  }

  Map<String, dynamic> toJson() {
    return CrossQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class CategoryQueryRequest implements _CategoryQueryRequest {
  const CategoryQueryRequest({this.base, this.kind});

  @override
  final _APIRequestBase base;

  @override
  final String kind;

  CategoryQueryRequest copyWith({_APIRequestBase base, String kind}) {
    return new CategoryQueryRequest(
        base: base ?? this.base, kind: kind ?? this.kind);
  }

  bool operator ==(other) {
    return other is _CategoryQueryRequest &&
        other.base == base &&
        other.kind == kind;
  }

  @override
  int get hashCode {
    return hashObjects([base, kind]);
  }

  Map<String, dynamic> toJson() {
    return CategoryQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class CategoryQueryResponse implements _CategoryQueryResponse {
  const CategoryQueryResponse(
      {this.base, List<_CategoryItemResponse> this.categories});

  @override
  final _APIResponseBase base;

  @override
  final List<_CategoryItemResponse> categories;

  CategoryQueryResponse copyWith(
      {_APIResponseBase base, List<_CategoryItemResponse> categories}) {
    return new CategoryQueryResponse(
        base: base ?? this.base, categories: categories ?? this.categories);
  }

  bool operator ==(other) {
    return other is _CategoryQueryResponse &&
        other.base == base &&
        const ListEquality<_CategoryItemResponse>(
                const DefaultEquality<_CategoryItemResponse>())
            .equals(other.categories, categories);
  }

  @override
  int get hashCode {
    return hashObjects([base, categories]);
  }

  Map<String, dynamic> toJson() {
    return CategoryQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class CategoryDeleteRequest implements _CategoryDeleteRequest {
  const CategoryDeleteRequest({this.base, this.catId, this.kind});

  @override
  final _APIRequestBase base;

  @override
  final int catId;

  @override
  final String kind;

  CategoryDeleteRequest copyWith(
      {_APIRequestBase base, int catId, String kind}) {
    return new CategoryDeleteRequest(
        base: base ?? this.base,
        catId: catId ?? this.catId,
        kind: kind ?? this.kind);
  }

  bool operator ==(other) {
    return other is _CategoryDeleteRequest &&
        other.base == base &&
        other.catId == catId &&
        other.kind == kind;
  }

  @override
  int get hashCode {
    return hashObjects([base, catId, kind]);
  }

  Map<String, dynamic> toJson() {
    return CategoryDeleteRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class CategorySaveRequest implements _CategorySaveRequest {
  const CategorySaveRequest(
      {this.base,
      this.catId,
      this.kind,
      this.referenceId,
      this.referenceMode,
      this.title,
      this.description});

  @override
  final _APIRequestBase base;

  @override
  final int catId;

  @override
  final String kind;

  @override
  final int referenceId;

  @override
  final String referenceMode;

  @override
  final String title;

  @override
  final String description;

  CategorySaveRequest copyWith(
      {_APIRequestBase base,
      int catId,
      String kind,
      int referenceId,
      String referenceMode,
      String title,
      String description}) {
    return new CategorySaveRequest(
        base: base ?? this.base,
        catId: catId ?? this.catId,
        kind: kind ?? this.kind,
        referenceId: referenceId ?? this.referenceId,
        referenceMode: referenceMode ?? this.referenceMode,
        title: title ?? this.title,
        description: description ?? this.description);
  }

  bool operator ==(other) {
    return other is _CategorySaveRequest &&
        other.base == base &&
        other.catId == catId &&
        other.kind == kind &&
        other.referenceId == referenceId &&
        other.referenceMode == referenceMode &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode {
    return hashObjects(
        [base, catId, kind, referenceId, referenceMode, title, description]);
  }

  Map<String, dynamic> toJson() {
    return CategorySaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class CategoryMoveContentsRequest implements _CategoryMoveContentsRequest {
  const CategoryMoveContentsRequest(
      {this.base, this.catId, this.kind, List<int> this.relatedIds});

  @override
  final _APIRequestBase base;

  @override
  final int catId;

  @override
  final String kind;

  @override
  final List<int> relatedIds;

  CategoryMoveContentsRequest copyWith(
      {_APIRequestBase base, int catId, String kind, List<int> relatedIds}) {
    return new CategoryMoveContentsRequest(
        base: base ?? this.base,
        catId: catId ?? this.catId,
        kind: kind ?? this.kind,
        relatedIds: relatedIds ?? this.relatedIds);
  }

  bool operator ==(other) {
    return other is _CategoryMoveContentsRequest &&
        other.base == base &&
        other.catId == catId &&
        other.kind == kind &&
        const ListEquality<int>(const DefaultEquality<int>())
            .equals(other.relatedIds, relatedIds);
  }

  @override
  int get hashCode {
    return hashObjects([base, catId, kind, relatedIds]);
  }

  Map<String, dynamic> toJson() {
    return CategoryMoveContentsRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class CategoryItemResponse implements _CategoryItemResponse {
  const CategoryItemResponse(
      {this.iid, this.parentId, this.title, this.description});

  @override
  final int iid;

  @override
  final int parentId;

  @override
  final String title;

  @override
  final String description;

  CategoryItemResponse copyWith(
      {int iid, int parentId, String title, String description}) {
    return new CategoryItemResponse(
        iid: iid ?? this.iid,
        parentId: parentId ?? this.parentId,
        title: title ?? this.title,
        description: description ?? this.description);
  }

  bool operator ==(other) {
    return other is _CategoryItemResponse &&
        other.iid == iid &&
        other.parentId == parentId &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode {
    return hashObjects([iid, parentId, title, description]);
  }

  Map<String, dynamic> toJson() {
    return CategoryItemResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvQueryRequest implements _ConvQueryRequest {
  const ConvQueryRequest({this.base, this.term});

  @override
  final _APIRequestBase base;

  @override
  final String term;

  ConvQueryRequest copyWith({_APIRequestBase base, String term}) {
    return new ConvQueryRequest(
        base: base ?? this.base, term: term ?? this.term);
  }

  bool operator ==(other) {
    return other is _ConvQueryRequest &&
        other.base == base &&
        other.term == term;
  }

  @override
  int get hashCode {
    return hashObjects([base, term]);
  }

  Map<String, dynamic> toJson() {
    return ConvQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvQueryResponse implements _ConvQueryResponse {
  const ConvQueryResponse(
      {this.base, List<_ConvQueryConvItemResponse> this.convs});

  @override
  final _APIResponseBase base;

  @override
  final List<_ConvQueryConvItemResponse> convs;

  ConvQueryResponse copyWith(
      {_APIResponseBase base, List<_ConvQueryConvItemResponse> convs}) {
    return new ConvQueryResponse(
        base: base ?? this.base, convs: convs ?? this.convs);
  }

  bool operator ==(other) {
    return other is _ConvQueryResponse &&
        other.base == base &&
        const ListEquality<_ConvQueryConvItemResponse>(
                const DefaultEquality<_ConvQueryConvItemResponse>())
            .equals(other.convs, convs);
  }

  @override
  int get hashCode {
    return hashObjects([base, convs]);
  }

  Map<String, dynamic> toJson() {
    return ConvQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvQueryConvItemResponse implements _ConvQueryConvItemResponse {
  const ConvQueryConvItemResponse(
      {this.convId, this.hitText, List<_ConvQueryPostItemResponse> this.posts});

  @override
  final int convId;

  @override
  final String hitText;

  @override
  final List<_ConvQueryPostItemResponse> posts;

  ConvQueryConvItemResponse copyWith(
      {int convId, String hitText, List<_ConvQueryPostItemResponse> posts}) {
    return new ConvQueryConvItemResponse(
        convId: convId ?? this.convId,
        hitText: hitText ?? this.hitText,
        posts: posts ?? this.posts);
  }

  bool operator ==(other) {
    return other is _ConvQueryConvItemResponse &&
        other.convId == convId &&
        other.hitText == hitText &&
        const ListEquality<_ConvQueryPostItemResponse>(
                const DefaultEquality<_ConvQueryPostItemResponse>())
            .equals(other.posts, posts);
  }

  @override
  int get hashCode {
    return hashObjects([convId, hitText, posts]);
  }

  Map<String, dynamic> toJson() {
    return ConvQueryConvItemResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvQueryPostItemResponse implements _ConvQueryPostItemResponse {
  const ConvQueryPostItemResponse({this.postId, this.hitText});

  @override
  final String postId;

  @override
  final String hitText;

  ConvQueryPostItemResponse copyWith({String postId, String hitText}) {
    return new ConvQueryPostItemResponse(
        postId: postId ?? this.postId, hitText: hitText ?? this.hitText);
  }

  bool operator ==(other) {
    return other is _ConvQueryPostItemResponse &&
        other.postId == postId &&
        other.hitText == hitText;
  }

  @override
  int get hashCode {
    return hashObjects([postId, hitText]);
  }

  Map<String, dynamic> toJson() {
    return ConvQueryPostItemResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvGetRequest implements _ConvGetRequest {
  const ConvGetRequest(
      {this.base, this.convId, this.mode, this.rangeFromWDT, this.rangeToWDT});

  @override
  final _APIRequestBase base;

  @override
  final int convId;

  @override
  final String mode;

  @override
  final String rangeFromWDT;

  @override
  final String rangeToWDT;

  ConvGetRequest copyWith(
      {_APIRequestBase base,
      int convId,
      String mode,
      String rangeFromWDT,
      String rangeToWDT}) {
    return new ConvGetRequest(
        base: base ?? this.base,
        convId: convId ?? this.convId,
        mode: mode ?? this.mode,
        rangeFromWDT: rangeFromWDT ?? this.rangeFromWDT,
        rangeToWDT: rangeToWDT ?? this.rangeToWDT);
  }

  bool operator ==(other) {
    return other is _ConvGetRequest &&
        other.base == base &&
        other.convId == convId &&
        other.mode == mode &&
        other.rangeFromWDT == rangeFromWDT &&
        other.rangeToWDT == rangeToWDT;
  }

  @override
  int get hashCode {
    return hashObjects([base, convId, mode, rangeFromWDT, rangeToWDT]);
  }

  Map<String, dynamic> toJson() {
    return ConvGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvGetResponse implements _ConvGetResponse {
  const ConvGetResponse(
      {this.base,
      this.isManager,
      this.isJoined,
      this.readPositionWDT,
      this.title,
      this.anySkipped,
      List<_ConvGetPostItem> this.posts,
      this.replyAllowed,
      this.replyAllowedDesc,
      this.replyMaxLength,
      this.deleteMessage,
      this.like,
      this.bookmarked,
      this.parentTitle,
      this.parentPaneKey});

  @override
  final _APIResponseBase base;

  @override
  final String isManager;

  @override
  final String isJoined;

  @override
  final String readPositionWDT;

  @override
  final String title;

  @override
  final String anySkipped;

  @override
  final List<_ConvGetPostItem> posts;

  @override
  final String replyAllowed;

  @override
  final String replyAllowedDesc;

  @override
  final int replyMaxLength;

  @override
  final String deleteMessage;

  @override
  final String like;

  @override
  final String bookmarked;

  @override
  final String parentTitle;

  @override
  final String parentPaneKey;

  ConvGetResponse copyWith(
      {_APIResponseBase base,
      String isManager,
      String isJoined,
      String readPositionWDT,
      String title,
      String anySkipped,
      List<_ConvGetPostItem> posts,
      String replyAllowed,
      String replyAllowedDesc,
      int replyMaxLength,
      String deleteMessage,
      String like,
      String bookmarked,
      String parentTitle,
      String parentPaneKey}) {
    return new ConvGetResponse(
        base: base ?? this.base,
        isManager: isManager ?? this.isManager,
        isJoined: isJoined ?? this.isJoined,
        readPositionWDT: readPositionWDT ?? this.readPositionWDT,
        title: title ?? this.title,
        anySkipped: anySkipped ?? this.anySkipped,
        posts: posts ?? this.posts,
        replyAllowed: replyAllowed ?? this.replyAllowed,
        replyAllowedDesc: replyAllowedDesc ?? this.replyAllowedDesc,
        replyMaxLength: replyMaxLength ?? this.replyMaxLength,
        deleteMessage: deleteMessage ?? this.deleteMessage,
        like: like ?? this.like,
        bookmarked: bookmarked ?? this.bookmarked,
        parentTitle: parentTitle ?? this.parentTitle,
        parentPaneKey: parentPaneKey ?? this.parentPaneKey);
  }

  bool operator ==(other) {
    return other is _ConvGetResponse &&
        other.base == base &&
        other.isManager == isManager &&
        other.isJoined == isJoined &&
        other.readPositionWDT == readPositionWDT &&
        other.title == title &&
        other.anySkipped == anySkipped &&
        const ListEquality<_ConvGetPostItem>(
                const DefaultEquality<_ConvGetPostItem>())
            .equals(other.posts, posts) &&
        other.replyAllowed == replyAllowed &&
        other.replyAllowedDesc == replyAllowedDesc &&
        other.replyMaxLength == replyMaxLength &&
        other.deleteMessage == deleteMessage &&
        other.like == like &&
        other.bookmarked == bookmarked &&
        other.parentTitle == parentTitle &&
        other.parentPaneKey == parentPaneKey;
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      isManager,
      isJoined,
      readPositionWDT,
      title,
      anySkipped,
      posts,
      replyAllowed,
      replyAllowedDesc,
      replyMaxLength,
      deleteMessage,
      like,
      bookmarked,
      parentTitle,
      parentPaneKey
    ]);
  }

  Map<String, dynamic> toJson() {
    return ConvGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvGetPostItem implements _ConvGetPostItem {
  const ConvGetPostItem(
      {this.iid,
      this.authorId,
      this.authorNick,
      this.avatarUrl,
      this.createdAtReadable,
      this.createdAtWDT,
      this.ago,
      this.ptext,
      this.imageUrl,
      this.collapseMode,
      this.collapsePosition});

  @override
  final String iid;

  @override
  final int authorId;

  @override
  final String authorNick;

  @override
  final String avatarUrl;

  @override
  final String createdAtReadable;

  @override
  final String createdAtWDT;

  @override
  final String ago;

  @override
  final String ptext;

  @override
  final String imageUrl;

  @override
  final String collapseMode;

  @override
  final int collapsePosition;

  ConvGetPostItem copyWith(
      {String iid,
      int authorId,
      String authorNick,
      String avatarUrl,
      String createdAtReadable,
      String createdAtWDT,
      String ago,
      String ptext,
      String imageUrl,
      String collapseMode,
      int collapsePosition}) {
    return new ConvGetPostItem(
        iid: iid ?? this.iid,
        authorId: authorId ?? this.authorId,
        authorNick: authorNick ?? this.authorNick,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        createdAtReadable: createdAtReadable ?? this.createdAtReadable,
        createdAtWDT: createdAtWDT ?? this.createdAtWDT,
        ago: ago ?? this.ago,
        ptext: ptext ?? this.ptext,
        imageUrl: imageUrl ?? this.imageUrl,
        collapseMode: collapseMode ?? this.collapseMode,
        collapsePosition: collapsePosition ?? this.collapsePosition);
  }

  bool operator ==(other) {
    return other is _ConvGetPostItem &&
        other.iid == iid &&
        other.authorId == authorId &&
        other.authorNick == authorNick &&
        other.avatarUrl == avatarUrl &&
        other.createdAtReadable == createdAtReadable &&
        other.createdAtWDT == createdAtWDT &&
        other.ago == ago &&
        other.ptext == ptext &&
        other.imageUrl == imageUrl &&
        other.collapseMode == collapseMode &&
        other.collapsePosition == collapsePosition;
  }

  @override
  int get hashCode {
    return hashObjects([
      iid,
      authorId,
      authorNick,
      avatarUrl,
      createdAtReadable,
      createdAtWDT,
      ago,
      ptext,
      imageUrl,
      collapseMode,
      collapsePosition
    ]);
  }

  Map<String, dynamic> toJson() {
    return ConvGetPostItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvGetRulesRequest implements _ConvGetRulesRequest {
  const ConvGetRulesRequest({this.base, this.convId});

  @override
  final _APIRequestBase base;

  @override
  final int convId;

  ConvGetRulesRequest copyWith({_APIRequestBase base, int convId}) {
    return new ConvGetRulesRequest(
        base: base ?? this.base, convId: convId ?? this.convId);
  }

  bool operator ==(other) {
    return other is _ConvGetRulesRequest &&
        other.base == base &&
        other.convId == convId;
  }

  @override
  int get hashCode {
    return hashObjects([base, convId]);
  }

  Map<String, dynamic> toJson() {
    return ConvGetRulesRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvGetRulesResponse implements _ConvGetRulesResponse {
  const ConvGetRulesResponse(
      {this.base, this.postMaxSize, this.userDailyMax, this.title});

  @override
  final _APIResponseBase base;

  @override
  final int postMaxSize;

  @override
  final int userDailyMax;

  @override
  final String title;

  ConvGetRulesResponse copyWith(
      {_APIResponseBase base,
      int postMaxSize,
      int userDailyMax,
      String title}) {
    return new ConvGetRulesResponse(
        base: base ?? this.base,
        postMaxSize: postMaxSize ?? this.postMaxSize,
        userDailyMax: userDailyMax ?? this.userDailyMax,
        title: title ?? this.title);
  }

  bool operator ==(other) {
    return other is _ConvGetRulesResponse &&
        other.base == base &&
        other.postMaxSize == postMaxSize &&
        other.userDailyMax == userDailyMax &&
        other.title == title;
  }

  @override
  int get hashCode {
    return hashObjects([base, postMaxSize, userDailyMax, title]);
  }

  Map<String, dynamic> toJson() {
    return ConvGetRulesResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvSaveRequest implements _ConvSaveRequest {
  const ConvSaveRequest(
      {this.base,
      this.convId,
      this.projectId,
      this.eventId,
      this.fromConvId,
      this.openingPostId,
      this.title,
      this.postMaxSize,
      this.userDailyMax});

  @override
  final _APIRequestBase base;

  @override
  final int convId;

  @override
  final int projectId;

  @override
  final int eventId;

  @override
  final int fromConvId;

  @override
  final String openingPostId;

  @override
  final String title;

  @override
  final int postMaxSize;

  @override
  final int userDailyMax;

  ConvSaveRequest copyWith(
      {_APIRequestBase base,
      int convId,
      int projectId,
      int eventId,
      int fromConvId,
      String openingPostId,
      String title,
      int postMaxSize,
      int userDailyMax}) {
    return new ConvSaveRequest(
        base: base ?? this.base,
        convId: convId ?? this.convId,
        projectId: projectId ?? this.projectId,
        eventId: eventId ?? this.eventId,
        fromConvId: fromConvId ?? this.fromConvId,
        openingPostId: openingPostId ?? this.openingPostId,
        title: title ?? this.title,
        postMaxSize: postMaxSize ?? this.postMaxSize,
        userDailyMax: userDailyMax ?? this.userDailyMax);
  }

  bool operator ==(other) {
    return other is _ConvSaveRequest &&
        other.base == base &&
        other.convId == convId &&
        other.projectId == projectId &&
        other.eventId == eventId &&
        other.fromConvId == fromConvId &&
        other.openingPostId == openingPostId &&
        other.title == title &&
        other.postMaxSize == postMaxSize &&
        other.userDailyMax == userDailyMax;
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      convId,
      projectId,
      eventId,
      fromConvId,
      openingPostId,
      title,
      postMaxSize,
      userDailyMax
    ]);
  }

  Map<String, dynamic> toJson() {
    return ConvSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvPostGetRequest implements _ConvPostGetRequest {
  const ConvPostGetRequest({this.base, this.postId});

  @override
  final _APIRequestBase base;

  @override
  final String postId;

  ConvPostGetRequest copyWith({_APIRequestBase base, String postId}) {
    return new ConvPostGetRequest(
        base: base ?? this.base, postId: postId ?? this.postId);
  }

  bool operator ==(other) {
    return other is _ConvPostGetRequest &&
        other.base == base &&
        other.postId == postId;
  }

  @override
  int get hashCode {
    return hashObjects([base, postId]);
  }

  Map<String, dynamic> toJson() {
    return ConvPostGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvPostGetResponse implements _ConvPostGetResponse {
  const ConvPostGetResponse(
      {this.base,
      this.avatarUrl,
      this.createdAtReadable,
      this.reaction,
      this.throttleDescription,
      this.canCensor,
      this.allReasons});

  @override
  final _APIResponseBase base;

  @override
  final String avatarUrl;

  @override
  final String createdAtReadable;

  @override
  final String reaction;

  @override
  final String throttleDescription;

  @override
  final String canCensor;

  @override
  final String allReasons;

  ConvPostGetResponse copyWith(
      {_APIResponseBase base,
      String avatarUrl,
      String createdAtReadable,
      String reaction,
      String throttleDescription,
      String canCensor,
      String allReasons}) {
    return new ConvPostGetResponse(
        base: base ?? this.base,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        createdAtReadable: createdAtReadable ?? this.createdAtReadable,
        reaction: reaction ?? this.reaction,
        throttleDescription: throttleDescription ?? this.throttleDescription,
        canCensor: canCensor ?? this.canCensor,
        allReasons: allReasons ?? this.allReasons);
  }

  bool operator ==(other) {
    return other is _ConvPostGetResponse &&
        other.base == base &&
        other.avatarUrl == avatarUrl &&
        other.createdAtReadable == createdAtReadable &&
        other.reaction == reaction &&
        other.throttleDescription == throttleDescription &&
        other.canCensor == canCensor &&
        other.allReasons == allReasons;
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      avatarUrl,
      createdAtReadable,
      reaction,
      throttleDescription,
      canCensor,
      allReasons
    ]);
  }

  Map<String, dynamic> toJson() {
    return ConvPostGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvPostSaveRequest implements _ConvPostSaveRequest {
  const ConvPostSaveRequest(
      {this.base,
      this.convId,
      this.postId,
      this.triggerWarning,
      this.ptext,
      this.censored,
      this.delete,
      this.lastKnownWDT});

  @override
  final _APIRequestBase base;

  @override
  final int convId;

  @override
  final String postId;

  @override
  final String triggerWarning;

  @override
  final String ptext;

  @override
  final String censored;

  @override
  final String delete;

  @override
  final String lastKnownWDT;

  ConvPostSaveRequest copyWith(
      {_APIRequestBase base,
      int convId,
      String postId,
      String triggerWarning,
      String ptext,
      String censored,
      String delete,
      String lastKnownWDT}) {
    return new ConvPostSaveRequest(
        base: base ?? this.base,
        convId: convId ?? this.convId,
        postId: postId ?? this.postId,
        triggerWarning: triggerWarning ?? this.triggerWarning,
        ptext: ptext ?? this.ptext,
        censored: censored ?? this.censored,
        delete: delete ?? this.delete,
        lastKnownWDT: lastKnownWDT ?? this.lastKnownWDT);
  }

  bool operator ==(other) {
    return other is _ConvPostSaveRequest &&
        other.base == base &&
        other.convId == convId &&
        other.postId == postId &&
        other.triggerWarning == triggerWarning &&
        other.ptext == ptext &&
        other.censored == censored &&
        other.delete == delete &&
        other.lastKnownWDT == lastKnownWDT;
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      convId,
      postId,
      triggerWarning,
      ptext,
      censored,
      delete,
      lastKnownWDT
    ]);
  }

  Map<String, dynamic> toJson() {
    return ConvPostSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvPostImageSaveRequest implements _ConvPostImageSaveRequest {
  const ConvPostImageSaveRequest(
      {this.base, this.convId, this.ptext, List<int> this.imageBytes});

  @override
  final _APIRequestBase base;

  @override
  final int convId;

  @override
  final String ptext;

  @override
  final List<int> imageBytes;

  ConvPostImageSaveRequest copyWith(
      {_APIRequestBase base, int convId, String ptext, List<int> imageBytes}) {
    return new ConvPostImageSaveRequest(
        base: base ?? this.base,
        convId: convId ?? this.convId,
        ptext: ptext ?? this.ptext,
        imageBytes: imageBytes ?? this.imageBytes);
  }

  bool operator ==(other) {
    return other is _ConvPostImageSaveRequest &&
        other.base == base &&
        other.convId == convId &&
        other.ptext == ptext &&
        const ListEquality<int>(const DefaultEquality<int>())
            .equals(other.imageBytes, imageBytes);
  }

  @override
  int get hashCode {
    return hashObjects([base, convId, ptext, imageBytes]);
  }

  Map<String, dynamic> toJson() {
    return ConvPostImageSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvPostUserSaveRequest implements _ConvPostUserSaveRequest {
  const ConvPostUserSaveRequest(
      {this.base, this.postId, this.reaction, this.reason});

  @override
  final _APIRequestBase base;

  @override
  final String postId;

  @override
  final String reaction;

  @override
  final String reason;

  ConvPostUserSaveRequest copyWith(
      {_APIRequestBase base, String postId, String reaction, String reason}) {
    return new ConvPostUserSaveRequest(
        base: base ?? this.base,
        postId: postId ?? this.postId,
        reaction: reaction ?? this.reaction,
        reason: reason ?? this.reason);
  }

  bool operator ==(other) {
    return other is _ConvPostUserSaveRequest &&
        other.base == base &&
        other.postId == postId &&
        other.reaction == reaction &&
        other.reason == reason;
  }

  @override
  int get hashCode {
    return hashObjects([base, postId, reaction, reason]);
  }

  Map<String, dynamic> toJson() {
    return ConvPostUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvSetReadPositionRequest implements _ConvSetReadPositionRequest {
  const ConvSetReadPositionRequest({this.base, this.convId, this.positionWDT});

  @override
  final _APIRequestBase base;

  @override
  final int convId;

  @override
  final String positionWDT;

  ConvSetReadPositionRequest copyWith(
      {_APIRequestBase base, int convId, String positionWDT}) {
    return new ConvSetReadPositionRequest(
        base: base ?? this.base,
        convId: convId ?? this.convId,
        positionWDT: positionWDT ?? this.positionWDT);
  }

  bool operator ==(other) {
    return other is _ConvSetReadPositionRequest &&
        other.base == base &&
        other.convId == convId &&
        other.positionWDT == positionWDT;
  }

  @override
  int get hashCode {
    return hashObjects([base, convId, positionWDT]);
  }

  Map<String, dynamic> toJson() {
    return ConvSetReadPositionRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvUserSaveRequest implements _ConvUserSaveRequest {
  const ConvUserSaveRequest(
      {this.base, this.convId, this.status, this.like, this.bookmarked});

  @override
  final _APIRequestBase base;

  @override
  final int convId;

  @override
  final String status;

  @override
  final String like;

  @override
  final String bookmarked;

  ConvUserSaveRequest copyWith(
      {_APIRequestBase base,
      int convId,
      String status,
      String like,
      String bookmarked}) {
    return new ConvUserSaveRequest(
        base: base ?? this.base,
        convId: convId ?? this.convId,
        status: status ?? this.status,
        like: like ?? this.like,
        bookmarked: bookmarked ?? this.bookmarked);
  }

  bool operator ==(other) {
    return other is _ConvUserSaveRequest &&
        other.base == base &&
        other.convId == convId &&
        other.status == status &&
        other.like == like &&
        other.bookmarked == bookmarked;
  }

  @override
  int get hashCode {
    return hashObjects([base, convId, status, like, bookmarked]);
  }

  Map<String, dynamic> toJson() {
    return ConvUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvUserSaveResponse implements _ConvUserSaveResponse {
  const ConvUserSaveResponse({this.base, this.action});

  @override
  final _APIResponseBase base;

  @override
  final String action;

  ConvUserSaveResponse copyWith({_APIResponseBase base, String action}) {
    return new ConvUserSaveResponse(
        base: base ?? this.base, action: action ?? this.action);
  }

  bool operator ==(other) {
    return other is _ConvUserSaveResponse &&
        other.base == base &&
        other.action == action;
  }

  @override
  int get hashCode {
    return hashObjects([base, action]);
  }

  Map<String, dynamic> toJson() {
    return ConvUserSaveResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class DocQueryRequest implements _DocQueryRequest {
  const DocQueryRequest({this.base, this.mode});

  @override
  final _APIRequestBase base;

  @override
  final String mode;

  DocQueryRequest copyWith({_APIRequestBase base, String mode}) {
    return new DocQueryRequest(
        base: base ?? this.base, mode: mode ?? this.mode);
  }

  bool operator ==(other) {
    return other is _DocQueryRequest &&
        other.base == base &&
        other.mode == mode;
  }

  @override
  int get hashCode {
    return hashObjects([base, mode]);
  }

  Map<String, dynamic> toJson() {
    return DocQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class DocQueryResponse implements _DocQueryResponse {
  const DocQueryResponse({this.base, List<_DocQueryItem> this.docs});

  @override
  final _APIResponseBase base;

  @override
  final List<_DocQueryItem> docs;

  DocQueryResponse copyWith({_APIResponseBase base, List<_DocQueryItem> docs}) {
    return new DocQueryResponse(
        base: base ?? this.base, docs: docs ?? this.docs);
  }

  bool operator ==(other) {
    return other is _DocQueryResponse &&
        other.base == base &&
        const ListEquality<_DocQueryItem>(
                const DefaultEquality<_DocQueryItem>())
            .equals(other.docs, docs);
  }

  @override
  int get hashCode {
    return hashObjects([base, docs]);
  }

  Map<String, dynamic> toJson() {
    return DocQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class DocQueryItem implements _DocQueryItem {
  const DocQueryItem({this.iid, this.title});

  @override
  final int iid;

  @override
  final String title;

  DocQueryItem copyWith({int iid, String title}) {
    return new DocQueryItem(iid: iid ?? this.iid, title: title ?? this.title);
  }

  bool operator ==(other) {
    return other is _DocQueryItem && other.iid == iid && other.title == title;
  }

  @override
  int get hashCode {
    return hashObjects([iid, title]);
  }

  Map<String, dynamic> toJson() {
    return DocQueryItemSerializer.toMap(this);
  }
}

@generatedSerializable
class DocGetRequest implements _DocGetRequest {
  const DocGetRequest(
      {this.base,
      this.docId,
      this.specialCode,
      this.revisionNo,
      this.getVerList});

  @override
  final _APIRequestBase base;

  @override
  final int docId;

  @override
  final String specialCode;

  @override
  final int revisionNo;

  @override
  final String getVerList;

  DocGetRequest copyWith(
      {_APIRequestBase base,
      int docId,
      String specialCode,
      int revisionNo,
      String getVerList}) {
    return new DocGetRequest(
        base: base ?? this.base,
        docId: docId ?? this.docId,
        specialCode: specialCode ?? this.specialCode,
        revisionNo: revisionNo ?? this.revisionNo,
        getVerList: getVerList ?? this.getVerList);
  }

  bool operator ==(other) {
    return other is _DocGetRequest &&
        other.base == base &&
        other.docId == docId &&
        other.specialCode == specialCode &&
        other.revisionNo == revisionNo &&
        other.getVerList == getVerList;
  }

  @override
  int get hashCode {
    return hashObjects([base, docId, specialCode, revisionNo, getVerList]);
  }

  Map<String, dynamic> toJson() {
    return DocGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class DocGetResponse implements _DocGetResponse {
  const DocGetResponse(
      {this.base,
      this.docId,
      this.title,
      this.body,
      this.htmlDiff,
      this.projectId,
      this.projectTitle,
      this.isProjectManager,
      this.allowSave,
      this.reasonNotEditable,
      this.createdAtR,
      this.proposalId,
      List<_DocGetVersionItem> this.verList});

  @override
  final _APIResponseBase base;

  @override
  final int docId;

  @override
  final String title;

  @override
  final String body;

  @override
  final String htmlDiff;

  @override
  final int projectId;

  @override
  final String projectTitle;

  @override
  final String isProjectManager;

  @override
  final String allowSave;

  @override
  final String reasonNotEditable;

  @override
  final String createdAtR;

  @override
  final int proposalId;

  @override
  final List<_DocGetVersionItem> verList;

  DocGetResponse copyWith(
      {_APIResponseBase base,
      int docId,
      String title,
      String body,
      String htmlDiff,
      int projectId,
      String projectTitle,
      String isProjectManager,
      String allowSave,
      String reasonNotEditable,
      String createdAtR,
      int proposalId,
      List<_DocGetVersionItem> verList}) {
    return new DocGetResponse(
        base: base ?? this.base,
        docId: docId ?? this.docId,
        title: title ?? this.title,
        body: body ?? this.body,
        htmlDiff: htmlDiff ?? this.htmlDiff,
        projectId: projectId ?? this.projectId,
        projectTitle: projectTitle ?? this.projectTitle,
        isProjectManager: isProjectManager ?? this.isProjectManager,
        allowSave: allowSave ?? this.allowSave,
        reasonNotEditable: reasonNotEditable ?? this.reasonNotEditable,
        createdAtR: createdAtR ?? this.createdAtR,
        proposalId: proposalId ?? this.proposalId,
        verList: verList ?? this.verList);
  }

  bool operator ==(other) {
    return other is _DocGetResponse &&
        other.base == base &&
        other.docId == docId &&
        other.title == title &&
        other.body == body &&
        other.htmlDiff == htmlDiff &&
        other.projectId == projectId &&
        other.projectTitle == projectTitle &&
        other.isProjectManager == isProjectManager &&
        other.allowSave == allowSave &&
        other.reasonNotEditable == reasonNotEditable &&
        other.createdAtR == createdAtR &&
        other.proposalId == proposalId &&
        const ListEquality<_DocGetVersionItem>(
                const DefaultEquality<_DocGetVersionItem>())
            .equals(other.verList, verList);
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      docId,
      title,
      body,
      htmlDiff,
      projectId,
      projectTitle,
      isProjectManager,
      allowSave,
      reasonNotEditable,
      createdAtR,
      proposalId,
      verList
    ]);
  }

  Map<String, dynamic> toJson() {
    return DocGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class DocGetVersionItem implements _DocGetVersionItem {
  const DocGetVersionItem({this.revisionNo, this.createdAtR});

  @override
  final int revisionNo;

  @override
  final String createdAtR;

  DocGetVersionItem copyWith({int revisionNo, String createdAtR}) {
    return new DocGetVersionItem(
        revisionNo: revisionNo ?? this.revisionNo,
        createdAtR: createdAtR ?? this.createdAtR);
  }

  bool operator ==(other) {
    return other is _DocGetVersionItem &&
        other.revisionNo == revisionNo &&
        other.createdAtR == createdAtR;
  }

  @override
  int get hashCode {
    return hashObjects([revisionNo, createdAtR]);
  }

  Map<String, dynamic> toJson() {
    return DocGetVersionItemSerializer.toMap(this);
  }
}

@generatedSerializable
class DocSaveRequest implements _DocSaveRequest {
  const DocSaveRequest(
      {this.base,
      this.docId,
      this.projectId,
      this.title,
      this.retitleMode,
      this.body,
      this.summary});

  @override
  final _APIRequestBase base;

  @override
  final int docId;

  @override
  final int projectId;

  @override
  final String title;

  @override
  final String retitleMode;

  @override
  final String body;

  @override
  final String summary;

  DocSaveRequest copyWith(
      {_APIRequestBase base,
      int docId,
      int projectId,
      String title,
      String retitleMode,
      String body,
      String summary}) {
    return new DocSaveRequest(
        base: base ?? this.base,
        docId: docId ?? this.docId,
        projectId: projectId ?? this.projectId,
        title: title ?? this.title,
        retitleMode: retitleMode ?? this.retitleMode,
        body: body ?? this.body,
        summary: summary ?? this.summary);
  }

  bool operator ==(other) {
    return other is _DocSaveRequest &&
        other.base == base &&
        other.docId == docId &&
        other.projectId == projectId &&
        other.title == title &&
        other.retitleMode == retitleMode &&
        other.body == body &&
        other.summary == summary;
  }

  @override
  int get hashCode {
    return hashObjects(
        [base, docId, projectId, title, retitleMode, body, summary]);
  }

  Map<String, dynamic> toJson() {
    return DocSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class DocRollbackRequest implements _DocRollbackRequest {
  const DocRollbackRequest({this.base, this.docId, this.revisionNo});

  @override
  final _APIRequestBase base;

  @override
  final int docId;

  @override
  final int revisionNo;

  DocRollbackRequest copyWith(
      {_APIRequestBase base, int docId, int revisionNo}) {
    return new DocRollbackRequest(
        base: base ?? this.base,
        docId: docId ?? this.docId,
        revisionNo: revisionNo ?? this.revisionNo);
  }

  bool operator ==(other) {
    return other is _DocRollbackRequest &&
        other.base == base &&
        other.docId == docId &&
        other.revisionNo == revisionNo;
  }

  @override
  int get hashCode {
    return hashObjects([base, docId, revisionNo]);
  }

  Map<String, dynamic> toJson() {
    return DocRollbackRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class EventQueryRequest implements _EventQueryRequest {
  const EventQueryRequest(
      {this.base,
      this.title,
      this.dateFrom,
      this.dateTo,
      this.miles,
      this.lat,
      this.lon});

  @override
  final _APIRequestBase base;

  @override
  final String title;

  @override
  final String dateFrom;

  @override
  final String dateTo;

  @override
  final int miles;

  @override
  final String lat;

  @override
  final String lon;

  EventQueryRequest copyWith(
      {_APIRequestBase base,
      String title,
      String dateFrom,
      String dateTo,
      int miles,
      String lat,
      String lon}) {
    return new EventQueryRequest(
        base: base ?? this.base,
        title: title ?? this.title,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        miles: miles ?? this.miles,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon);
  }

  bool operator ==(other) {
    return other is _EventQueryRequest &&
        other.base == base &&
        other.title == title &&
        other.dateFrom == dateFrom &&
        other.dateTo == dateTo &&
        other.miles == miles &&
        other.lat == lat &&
        other.lon == lon;
  }

  @override
  int get hashCode {
    return hashObjects([base, title, dateFrom, dateTo, miles, lat, lon]);
  }

  Map<String, dynamic> toJson() {
    return EventQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class EventQueryResponse implements _EventQueryResponse {
  const EventQueryResponse({this.base, List<_EventItemResponse> this.events});

  @override
  final _APIResponseBase base;

  @override
  final List<_EventItemResponse> events;

  EventQueryResponse copyWith(
      {_APIResponseBase base, List<_EventItemResponse> events}) {
    return new EventQueryResponse(
        base: base ?? this.base, events: events ?? this.events);
  }

  bool operator ==(other) {
    return other is _EventQueryResponse &&
        other.base == base &&
        const ListEquality<_EventItemResponse>(
                const DefaultEquality<_EventItemResponse>())
            .equals(other.events, events);
  }

  @override
  int get hashCode {
    return hashObjects([base, events]);
  }

  Map<String, dynamic> toJson() {
    return EventQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class EventItemResponse implements _EventItemResponse {
  const EventItemResponse(
      {this.iid, this.title, this.startTime, this.creatorNick, this.creatorId});

  @override
  final int iid;

  @override
  final String title;

  @override
  final String startTime;

  @override
  final String creatorNick;

  @override
  final int creatorId;

  EventItemResponse copyWith(
      {int iid,
      String title,
      String startTime,
      String creatorNick,
      int creatorId}) {
    return new EventItemResponse(
        iid: iid ?? this.iid,
        title: title ?? this.title,
        startTime: startTime ?? this.startTime,
        creatorNick: creatorNick ?? this.creatorNick,
        creatorId: creatorId ?? this.creatorId);
  }

  bool operator ==(other) {
    return other is _EventItemResponse &&
        other.iid == iid &&
        other.title == title &&
        other.startTime == startTime &&
        other.creatorNick == creatorNick &&
        other.creatorId == creatorId;
  }

  @override
  int get hashCode {
    return hashObjects([iid, title, startTime, creatorNick, creatorId]);
  }

  Map<String, dynamic> toJson() {
    return EventItemResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class EventRequest implements _EventRequest {
  const EventRequest({this.base, this.eventId});

  @override
  final _APIRequestBase base;

  @override
  final int eventId;

  EventRequest copyWith({_APIRequestBase base, int eventId}) {
    return new EventRequest(
        base: base ?? this.base, eventId: eventId ?? this.eventId);
  }

  bool operator ==(other) {
    return other is _EventRequest &&
        other.base == base &&
        other.eventId == eventId;
  }

  @override
  int get hashCode {
    return hashObjects([base, eventId]);
  }

  Map<String, dynamic> toJson() {
    return EventRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class EventGetResponse implements _EventGetResponse {
  const EventGetResponse(
      {this.base,
      this.title,
      this.description,
      this.duration,
      this.location,
      this.startTimeU,
      this.startTimeR,
      this.creatorNick,
      this.creatorId,
      this.creatorAvatarUrl,
      this.createdAtR,
      this.lat,
      this.lon,
      List<_EventGetUserResponse> this.users,
      List<_EventGetConvResponse> this.convs,
      this.isCreator});

  @override
  final _APIResponseBase base;

  @override
  final String title;

  @override
  final String description;

  @override
  final String duration;

  @override
  final String location;

  @override
  final String startTimeU;

  @override
  final String startTimeR;

  @override
  final String creatorNick;

  @override
  final int creatorId;

  @override
  final String creatorAvatarUrl;

  @override
  final String createdAtR;

  @override
  final String lat;

  @override
  final String lon;

  @override
  final List<_EventGetUserResponse> users;

  @override
  final List<_EventGetConvResponse> convs;

  @override
  final String isCreator;

  EventGetResponse copyWith(
      {_APIResponseBase base,
      String title,
      String description,
      String duration,
      String location,
      String startTimeU,
      String startTimeR,
      String creatorNick,
      int creatorId,
      String creatorAvatarUrl,
      String createdAtR,
      String lat,
      String lon,
      List<_EventGetUserResponse> users,
      List<_EventGetConvResponse> convs,
      String isCreator}) {
    return new EventGetResponse(
        base: base ?? this.base,
        title: title ?? this.title,
        description: description ?? this.description,
        duration: duration ?? this.duration,
        location: location ?? this.location,
        startTimeU: startTimeU ?? this.startTimeU,
        startTimeR: startTimeR ?? this.startTimeR,
        creatorNick: creatorNick ?? this.creatorNick,
        creatorId: creatorId ?? this.creatorId,
        creatorAvatarUrl: creatorAvatarUrl ?? this.creatorAvatarUrl,
        createdAtR: createdAtR ?? this.createdAtR,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        users: users ?? this.users,
        convs: convs ?? this.convs,
        isCreator: isCreator ?? this.isCreator);
  }

  bool operator ==(other) {
    return other is _EventGetResponse &&
        other.base == base &&
        other.title == title &&
        other.description == description &&
        other.duration == duration &&
        other.location == location &&
        other.startTimeU == startTimeU &&
        other.startTimeR == startTimeR &&
        other.creatorNick == creatorNick &&
        other.creatorId == creatorId &&
        other.creatorAvatarUrl == creatorAvatarUrl &&
        other.createdAtR == createdAtR &&
        other.lat == lat &&
        other.lon == lon &&
        const ListEquality<_EventGetUserResponse>(
                const DefaultEquality<_EventGetUserResponse>())
            .equals(other.users, users) &&
        const ListEquality<_EventGetConvResponse>(
                const DefaultEquality<_EventGetConvResponse>())
            .equals(other.convs, convs) &&
        other.isCreator == isCreator;
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      title,
      description,
      duration,
      location,
      startTimeU,
      startTimeR,
      creatorNick,
      creatorId,
      creatorAvatarUrl,
      createdAtR,
      lat,
      lon,
      users,
      convs,
      isCreator
    ]);
  }

  Map<String, dynamic> toJson() {
    return EventGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class EventGetUserResponse implements _EventGetUserResponse {
  const EventGetUserResponse(
      {this.userId,
      this.nick,
      this.publicName,
      this.avatarUrl,
      this.status,
      this.statusDesc});

  @override
  final int userId;

  @override
  final String nick;

  @override
  final String publicName;

  @override
  final String avatarUrl;

  @override
  final String status;

  @override
  final String statusDesc;

  EventGetUserResponse copyWith(
      {int userId,
      String nick,
      String publicName,
      String avatarUrl,
      String status,
      String statusDesc}) {
    return new EventGetUserResponse(
        userId: userId ?? this.userId,
        nick: nick ?? this.nick,
        publicName: publicName ?? this.publicName,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        status: status ?? this.status,
        statusDesc: statusDesc ?? this.statusDesc);
  }

  bool operator ==(other) {
    return other is _EventGetUserResponse &&
        other.userId == userId &&
        other.nick == nick &&
        other.publicName == publicName &&
        other.avatarUrl == avatarUrl &&
        other.status == status &&
        other.statusDesc == statusDesc;
  }

  @override
  int get hashCode {
    return hashObjects(
        [userId, nick, publicName, avatarUrl, status, statusDesc]);
  }

  Map<String, dynamic> toJson() {
    return EventGetUserResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class EventGetConvResponse implements _EventGetConvResponse {
  const EventGetConvResponse(
      {this.iid, this.open, this.title, this.lastActivity});

  @override
  final int iid;

  @override
  final String open;

  @override
  final String title;

  @override
  final String lastActivity;

  EventGetConvResponse copyWith(
      {int iid, String open, String title, String lastActivity}) {
    return new EventGetConvResponse(
        iid: iid ?? this.iid,
        open: open ?? this.open,
        title: title ?? this.title,
        lastActivity: lastActivity ?? this.lastActivity);
  }

  bool operator ==(other) {
    return other is _EventGetConvResponse &&
        other.iid == iid &&
        other.open == open &&
        other.title == title &&
        other.lastActivity == lastActivity;
  }

  @override
  int get hashCode {
    return hashObjects([iid, open, title, lastActivity]);
  }

  Map<String, dynamic> toJson() {
    return EventGetConvResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class EventSaveRequest implements _EventSaveRequest {
  const EventSaveRequest(
      {this.base,
      this.eventId,
      this.title,
      this.description,
      this.duration,
      this.location,
      this.startTime,
      this.lat,
      this.lon});

  @override
  final _APIRequestBase base;

  @override
  final int eventId;

  @override
  final String title;

  @override
  final String description;

  @override
  final String duration;

  @override
  final String location;

  @override
  final String startTime;

  @override
  final String lat;

  @override
  final String lon;

  EventSaveRequest copyWith(
      {_APIRequestBase base,
      int eventId,
      String title,
      String description,
      String duration,
      String location,
      String startTime,
      String lat,
      String lon}) {
    return new EventSaveRequest(
        base: base ?? this.base,
        eventId: eventId ?? this.eventId,
        title: title ?? this.title,
        description: description ?? this.description,
        duration: duration ?? this.duration,
        location: location ?? this.location,
        startTime: startTime ?? this.startTime,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon);
  }

  bool operator ==(other) {
    return other is _EventSaveRequest &&
        other.base == base &&
        other.eventId == eventId &&
        other.title == title &&
        other.description == description &&
        other.duration == duration &&
        other.location == location &&
        other.startTime == startTime &&
        other.lat == lat &&
        other.lon == lon;
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      eventId,
      title,
      description,
      duration,
      location,
      startTime,
      lat,
      lon
    ]);
  }

  Map<String, dynamic> toJson() {
    return EventSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class EventUserSaveRequest implements _EventUserSaveRequest {
  const EventUserSaveRequest(
      {this.base, this.eventId, this.status, this.statusDesc});

  @override
  final _APIRequestBase base;

  @override
  final int eventId;

  @override
  final String status;

  @override
  final String statusDesc;

  EventUserSaveRequest copyWith(
      {_APIRequestBase base, int eventId, String status, String statusDesc}) {
    return new EventUserSaveRequest(
        base: base ?? this.base,
        eventId: eventId ?? this.eventId,
        status: status ?? this.status,
        statusDesc: statusDesc ?? this.statusDesc);
  }

  bool operator ==(other) {
    return other is _EventUserSaveRequest &&
        other.base == base &&
        other.eventId == eventId &&
        other.status == status &&
        other.statusDesc == statusDesc;
  }

  @override
  int get hashCode {
    return hashObjects([base, eventId, status, statusDesc]);
  }

  Map<String, dynamic> toJson() {
    return EventUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectQueryRequest implements _ProjectQueryRequest {
  const ProjectQueryRequest({this.base, this.catId, this.title});

  @override
  final _APIRequestBase base;

  @override
  final int catId;

  @override
  final String title;

  ProjectQueryRequest copyWith(
      {_APIRequestBase base, int catId, String title}) {
    return new ProjectQueryRequest(
        base: base ?? this.base,
        catId: catId ?? this.catId,
        title: title ?? this.title);
  }

  bool operator ==(other) {
    return other is _ProjectQueryRequest &&
        other.base == base &&
        other.catId == catId &&
        other.title == title;
  }

  @override
  int get hashCode {
    return hashObjects([base, catId, title]);
  }

  Map<String, dynamic> toJson() {
    return ProjectQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectQueryResponse implements _ProjectQueryResponse {
  const ProjectQueryResponse(
      {this.base, List<_ProjectQueryItem> this.projects});

  @override
  final _APIResponseBase base;

  @override
  final List<_ProjectQueryItem> projects;

  ProjectQueryResponse copyWith(
      {_APIResponseBase base, List<_ProjectQueryItem> projects}) {
    return new ProjectQueryResponse(
        base: base ?? this.base, projects: projects ?? this.projects);
  }

  bool operator ==(other) {
    return other is _ProjectQueryResponse &&
        other.base == base &&
        const ListEquality<_ProjectQueryItem>(
                const DefaultEquality<_ProjectQueryItem>())
            .equals(other.projects, projects);
  }

  @override
  int get hashCode {
    return hashObjects([base, projects]);
  }

  Map<String, dynamic> toJson() {
    return ProjectQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectQueryItem implements _ProjectQueryItem {
  const ProjectQueryItem(
      {this.projectId,
      this.title,
      this.description,
      this.leadership,
      this.privacy});

  @override
  final int projectId;

  @override
  final String title;

  @override
  final String description;

  @override
  final String leadership;

  @override
  final String privacy;

  ProjectQueryItem copyWith(
      {int projectId,
      String title,
      String description,
      String leadership,
      String privacy}) {
    return new ProjectQueryItem(
        projectId: projectId ?? this.projectId,
        title: title ?? this.title,
        description: description ?? this.description,
        leadership: leadership ?? this.leadership,
        privacy: privacy ?? this.privacy);
  }

  bool operator ==(other) {
    return other is _ProjectQueryItem &&
        other.projectId == projectId &&
        other.title == title &&
        other.description == description &&
        other.leadership == leadership &&
        other.privacy == privacy;
  }

  @override
  int get hashCode {
    return hashObjects([projectId, title, description, leadership, privacy]);
  }

  Map<String, dynamic> toJson() {
    return ProjectQueryItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectGetRequest implements _ProjectGetRequest {
  const ProjectGetRequest({this.base, this.projectId});

  @override
  final _APIRequestBase base;

  @override
  final int projectId;

  ProjectGetRequest copyWith({_APIRequestBase base, int projectId}) {
    return new ProjectGetRequest(
        base: base ?? this.base, projectId: projectId ?? this.projectId);
  }

  bool operator ==(other) {
    return other is _ProjectGetRequest &&
        other.base == base &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    return hashObjects([base, projectId]);
  }

  Map<String, dynamic> toJson() {
    return ProjectGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectGetResponse implements _ProjectGetResponse {
  const ProjectGetResponse(
      {this.base,
      this.active,
      this.leadership,
      this.privacy,
      this.title,
      this.description,
      this.categoryId,
      this.userKind,
      List<_ProjectProposalItem> this.proposals,
      List<_ProjectConvItem> this.convs,
      List<_ProjectDocItem> this.docs});

  @override
  final _APIResponseBase base;

  @override
  final String active;

  @override
  final String leadership;

  @override
  final String privacy;

  @override
  final String title;

  @override
  final String description;

  @override
  final int categoryId;

  @override
  final String userKind;

  @override
  final List<_ProjectProposalItem> proposals;

  @override
  final List<_ProjectConvItem> convs;

  @override
  final List<_ProjectDocItem> docs;

  ProjectGetResponse copyWith(
      {_APIResponseBase base,
      String active,
      String leadership,
      String privacy,
      String title,
      String description,
      int categoryId,
      String userKind,
      List<_ProjectProposalItem> proposals,
      List<_ProjectConvItem> convs,
      List<_ProjectDocItem> docs}) {
    return new ProjectGetResponse(
        base: base ?? this.base,
        active: active ?? this.active,
        leadership: leadership ?? this.leadership,
        privacy: privacy ?? this.privacy,
        title: title ?? this.title,
        description: description ?? this.description,
        categoryId: categoryId ?? this.categoryId,
        userKind: userKind ?? this.userKind,
        proposals: proposals ?? this.proposals,
        convs: convs ?? this.convs,
        docs: docs ?? this.docs);
  }

  bool operator ==(other) {
    return other is _ProjectGetResponse &&
        other.base == base &&
        other.active == active &&
        other.leadership == leadership &&
        other.privacy == privacy &&
        other.title == title &&
        other.description == description &&
        other.categoryId == categoryId &&
        other.userKind == userKind &&
        const ListEquality<_ProjectProposalItem>(
                const DefaultEquality<_ProjectProposalItem>())
            .equals(other.proposals, proposals) &&
        const ListEquality<_ProjectConvItem>(
                const DefaultEquality<_ProjectConvItem>())
            .equals(other.convs, convs) &&
        const ListEquality<_ProjectDocItem>(
                const DefaultEquality<_ProjectDocItem>())
            .equals(other.docs, docs);
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      active,
      leadership,
      privacy,
      title,
      description,
      categoryId,
      userKind,
      proposals,
      convs,
      docs
    ]);
  }

  Map<String, dynamic> toJson() {
    return ProjectGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectProposalItem implements _ProjectProposalItem {
  const ProjectProposalItem(
      {this.iid, this.active, this.title, this.createdAtR});

  @override
  final int iid;

  @override
  final String active;

  @override
  final String title;

  @override
  final String createdAtR;

  ProjectProposalItem copyWith(
      {int iid, String active, String title, String createdAtR}) {
    return new ProjectProposalItem(
        iid: iid ?? this.iid,
        active: active ?? this.active,
        title: title ?? this.title,
        createdAtR: createdAtR ?? this.createdAtR);
  }

  bool operator ==(other) {
    return other is _ProjectProposalItem &&
        other.iid == iid &&
        other.active == active &&
        other.title == title &&
        other.createdAtR == createdAtR;
  }

  @override
  int get hashCode {
    return hashObjects([iid, active, title, createdAtR]);
  }

  Map<String, dynamic> toJson() {
    return ProjectProposalItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectConvItem implements _ProjectConvItem {
  const ProjectConvItem({this.iid, this.open, this.title, this.lastActivity});

  @override
  final int iid;

  @override
  final String open;

  @override
  final String title;

  @override
  final String lastActivity;

  ProjectConvItem copyWith(
      {int iid, String open, String title, String lastActivity}) {
    return new ProjectConvItem(
        iid: iid ?? this.iid,
        open: open ?? this.open,
        title: title ?? this.title,
        lastActivity: lastActivity ?? this.lastActivity);
  }

  bool operator ==(other) {
    return other is _ProjectConvItem &&
        other.iid == iid &&
        other.open == open &&
        other.title == title &&
        other.lastActivity == lastActivity;
  }

  @override
  int get hashCode {
    return hashObjects([iid, open, title, lastActivity]);
  }

  Map<String, dynamic> toJson() {
    return ProjectConvItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectDocItem implements _ProjectDocItem {
  const ProjectDocItem({this.iid, this.title});

  @override
  final int iid;

  @override
  final String title;

  ProjectDocItem copyWith({int iid, String title}) {
    return new ProjectDocItem(iid: iid ?? this.iid, title: title ?? this.title);
  }

  bool operator ==(other) {
    return other is _ProjectDocItem && other.iid == iid && other.title == title;
  }

  @override
  int get hashCode {
    return hashObjects([iid, title]);
  }

  Map<String, dynamic> toJson() {
    return ProjectDocItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectSaveRequest implements _ProjectSaveRequest {
  const ProjectSaveRequest(
      {this.base,
      this.projectId,
      this.leadership,
      this.privacy,
      this.title,
      this.description,
      this.categoryId});

  @override
  final _APIRequestBase base;

  @override
  final int projectId;

  @override
  final String leadership;

  @override
  final String privacy;

  @override
  final String title;

  @override
  final String description;

  @override
  final int categoryId;

  ProjectSaveRequest copyWith(
      {_APIRequestBase base,
      int projectId,
      String leadership,
      String privacy,
      String title,
      String description,
      int categoryId}) {
    return new ProjectSaveRequest(
        base: base ?? this.base,
        projectId: projectId ?? this.projectId,
        leadership: leadership ?? this.leadership,
        privacy: privacy ?? this.privacy,
        title: title ?? this.title,
        description: description ?? this.description,
        categoryId: categoryId ?? this.categoryId);
  }

  bool operator ==(other) {
    return other is _ProjectSaveRequest &&
        other.base == base &&
        other.projectId == projectId &&
        other.leadership == leadership &&
        other.privacy == privacy &&
        other.title == title &&
        other.description == description &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    return hashObjects(
        [base, projectId, leadership, privacy, title, description, categoryId]);
  }

  Map<String, dynamic> toJson() {
    return ProjectSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectUserQueryRequest implements _ProjectUserQueryRequest {
  const ProjectUserQueryRequest(
      {this.base, this.projectId, this.name, this.resultPage});

  @override
  final _APIRequestBase base;

  @override
  final int projectId;

  @override
  final String name;

  @override
  final int resultPage;

  ProjectUserQueryRequest copyWith(
      {_APIRequestBase base, int projectId, String name, int resultPage}) {
    return new ProjectUserQueryRequest(
        base: base ?? this.base,
        projectId: projectId ?? this.projectId,
        name: name ?? this.name,
        resultPage: resultPage ?? this.resultPage);
  }

  bool operator ==(other) {
    return other is _ProjectUserQueryRequest &&
        other.base == base &&
        other.projectId == projectId &&
        other.name == name &&
        other.resultPage == resultPage;
  }

  @override
  int get hashCode {
    return hashObjects([base, projectId, name, resultPage]);
  }

  Map<String, dynamic> toJson() {
    return ProjectUserQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectUserQueryResponse implements _ProjectUserQueryResponse {
  const ProjectUserQueryResponse(
      {this.base,
      this.projectTitle,
      this.completeLoad,
      this.editable,
      List<_ProjectUserItem> this.users});

  @override
  final _APIResponseBase base;

  @override
  final String projectTitle;

  @override
  final String completeLoad;

  @override
  final String editable;

  @override
  final List<_ProjectUserItem> users;

  ProjectUserQueryResponse copyWith(
      {_APIResponseBase base,
      String projectTitle,
      String completeLoad,
      String editable,
      List<_ProjectUserItem> users}) {
    return new ProjectUserQueryResponse(
        base: base ?? this.base,
        projectTitle: projectTitle ?? this.projectTitle,
        completeLoad: completeLoad ?? this.completeLoad,
        editable: editable ?? this.editable,
        users: users ?? this.users);
  }

  bool operator ==(other) {
    return other is _ProjectUserQueryResponse &&
        other.base == base &&
        other.projectTitle == projectTitle &&
        other.completeLoad == completeLoad &&
        other.editable == editable &&
        const ListEquality<_ProjectUserItem>(
                const DefaultEquality<_ProjectUserItem>())
            .equals(other.users, users);
  }

  @override
  int get hashCode {
    return hashObjects([base, projectTitle, completeLoad, editable, users]);
  }

  Map<String, dynamic> toJson() {
    return ProjectUserQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectUserItem implements _ProjectUserItem {
  const ProjectUserItem(
      {this.userId,
      this.kind,
      this.throttle,
      this.nick,
      this.publicName,
      this.avatarUrl,
      this.voteKind});

  @override
  final int userId;

  @override
  final String kind;

  @override
  final String throttle;

  @override
  final String nick;

  @override
  final String publicName;

  @override
  final String avatarUrl;

  @override
  final String voteKind;

  ProjectUserItem copyWith(
      {int userId,
      String kind,
      String throttle,
      String nick,
      String publicName,
      String avatarUrl,
      String voteKind}) {
    return new ProjectUserItem(
        userId: userId ?? this.userId,
        kind: kind ?? this.kind,
        throttle: throttle ?? this.throttle,
        nick: nick ?? this.nick,
        publicName: publicName ?? this.publicName,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        voteKind: voteKind ?? this.voteKind);
  }

  bool operator ==(other) {
    return other is _ProjectUserItem &&
        other.userId == userId &&
        other.kind == kind &&
        other.throttle == throttle &&
        other.nick == nick &&
        other.publicName == publicName &&
        other.avatarUrl == avatarUrl &&
        other.voteKind == voteKind;
  }

  @override
  int get hashCode {
    return hashObjects(
        [userId, kind, throttle, nick, publicName, avatarUrl, voteKind]);
  }

  Map<String, dynamic> toJson() {
    return ProjectUserItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectUserSaveRequest implements _ProjectUserSaveRequest {
  const ProjectUserSaveRequest(
      {this.base, this.projectId, this.userId, this.kind});

  @override
  final _APIRequestBase base;

  @override
  final int projectId;

  @override
  final int userId;

  @override
  final String kind;

  ProjectUserSaveRequest copyWith(
      {_APIRequestBase base, int projectId, int userId, String kind}) {
    return new ProjectUserSaveRequest(
        base: base ?? this.base,
        projectId: projectId ?? this.projectId,
        userId: userId ?? this.userId,
        kind: kind ?? this.kind);
  }

  bool operator ==(other) {
    return other is _ProjectUserSaveRequest &&
        other.base == base &&
        other.projectId == projectId &&
        other.userId == userId &&
        other.kind == kind;
  }

  @override
  int get hashCode {
    return hashObjects([base, projectId, userId, kind]);
  }

  Map<String, dynamic> toJson() {
    return ProjectUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectUserUserSaveRequest implements _ProjectUserUserSaveRequest {
  const ProjectUserUserSaveRequest(
      {this.base, this.projectId, this.aboutId, this.kind});

  @override
  final _APIRequestBase base;

  @override
  final int projectId;

  @override
  final int aboutId;

  @override
  final String kind;

  ProjectUserUserSaveRequest copyWith(
      {_APIRequestBase base, int projectId, int aboutId, String kind}) {
    return new ProjectUserUserSaveRequest(
        base: base ?? this.base,
        projectId: projectId ?? this.projectId,
        aboutId: aboutId ?? this.aboutId,
        kind: kind ?? this.kind);
  }

  bool operator ==(other) {
    return other is _ProjectUserUserSaveRequest &&
        other.base == base &&
        other.projectId == projectId &&
        other.aboutId == aboutId &&
        other.kind == kind;
  }

  @override
  int get hashCode {
    return hashObjects([base, projectId, aboutId, kind]);
  }

  Map<String, dynamic> toJson() {
    return ProjectUserUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalQueryRequest implements _ProposalQueryRequest {
  const ProposalQueryRequest({this.base, this.mode, this.year, this.projectId});

  @override
  final _APIRequestBase base;

  @override
  final String mode;

  @override
  final int year;

  @override
  final int projectId;

  ProposalQueryRequest copyWith(
      {_APIRequestBase base, String mode, int year, int projectId}) {
    return new ProposalQueryRequest(
        base: base ?? this.base,
        mode: mode ?? this.mode,
        year: year ?? this.year,
        projectId: projectId ?? this.projectId);
  }

  bool operator ==(other) {
    return other is _ProposalQueryRequest &&
        other.base == base &&
        other.mode == mode &&
        other.year == year &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    return hashObjects([base, mode, year, projectId]);
  }

  Map<String, dynamic> toJson() {
    return ProposalQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalQueryResponse implements _ProposalQueryResponse {
  const ProposalQueryResponse({this.base, List<_ProposalQueryItem> this.items});

  @override
  final _APIResponseBase base;

  @override
  final List<_ProposalQueryItem> items;

  ProposalQueryResponse copyWith(
      {_APIResponseBase base, List<_ProposalQueryItem> items}) {
    return new ProposalQueryResponse(
        base: base ?? this.base, items: items ?? this.items);
  }

  bool operator ==(other) {
    return other is _ProposalQueryResponse &&
        other.base == base &&
        const ListEquality<_ProposalQueryItem>(
                const DefaultEquality<_ProposalQueryItem>())
            .equals(other.items, items);
  }

  @override
  int get hashCode {
    return hashObjects([base, items]);
  }

  Map<String, dynamic> toJson() {
    return ProposalQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalQueryItem implements _ProposalQueryItem {
  const ProposalQueryItem({this.iid, this.title, this.kind});

  @override
  final int iid;

  @override
  final String title;

  @override
  final String kind;

  ProposalQueryItem copyWith({int iid, String title, String kind}) {
    return new ProposalQueryItem(
        iid: iid ?? this.iid,
        title: title ?? this.title,
        kind: kind ?? this.kind);
  }

  bool operator ==(other) {
    return other is _ProposalQueryItem &&
        other.iid == iid &&
        other.title == title &&
        other.kind == kind;
  }

  @override
  int get hashCode {
    return hashObjects([iid, title, kind]);
  }

  Map<String, dynamic> toJson() {
    return ProposalQueryItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalGetRequest implements _ProposalGetRequest {
  const ProposalGetRequest({this.base, this.proposalId});

  @override
  final _APIRequestBase base;

  @override
  final int proposalId;

  ProposalGetRequest copyWith({_APIRequestBase base, int proposalId}) {
    return new ProposalGetRequest(
        base: base ?? this.base, proposalId: proposalId ?? this.proposalId);
  }

  bool operator ==(other) {
    return other is _ProposalGetRequest &&
        other.base == base &&
        other.proposalId == proposalId;
  }

  @override
  int get hashCode {
    return hashObjects([base, proposalId]);
  }

  Map<String, dynamic> toJson() {
    return ProposalGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalGetResponse implements _ProposalGetResponse {
  const ProposalGetResponse(
      {this.base,
      this.active,
      this.kind,
      this.eligible,
      this.title,
      this.summary,
      this.summaryHtml,
      this.dtext,
      this.timeout,
      this.deleteTime,
      this.winningOption,
      this.createdBy,
      this.projectId,
      this.docId,
      this.createdByNick,
      this.createdByAvatarUrl,
      List<_ProposalOptionItem> this.options,
      this.myVote,
      this.statusDescription,
      this.myEligible});

  @override
  final _APIResponseBase base;

  @override
  final String active;

  @override
  final String kind;

  @override
  final String eligible;

  @override
  final String title;

  @override
  final String summary;

  @override
  final String summaryHtml;

  @override
  final String dtext;

  @override
  final String timeout;

  @override
  final String deleteTime;

  @override
  final int winningOption;

  @override
  final int createdBy;

  @override
  final int projectId;

  @override
  final int docId;

  @override
  final String createdByNick;

  @override
  final String createdByAvatarUrl;

  @override
  final List<_ProposalOptionItem> options;

  @override
  final int myVote;

  @override
  final String statusDescription;

  @override
  final String myEligible;

  ProposalGetResponse copyWith(
      {_APIResponseBase base,
      String active,
      String kind,
      String eligible,
      String title,
      String summary,
      String summaryHtml,
      String dtext,
      String timeout,
      String deleteTime,
      int winningOption,
      int createdBy,
      int projectId,
      int docId,
      String createdByNick,
      String createdByAvatarUrl,
      List<_ProposalOptionItem> options,
      int myVote,
      String statusDescription,
      String myEligible}) {
    return new ProposalGetResponse(
        base: base ?? this.base,
        active: active ?? this.active,
        kind: kind ?? this.kind,
        eligible: eligible ?? this.eligible,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        summaryHtml: summaryHtml ?? this.summaryHtml,
        dtext: dtext ?? this.dtext,
        timeout: timeout ?? this.timeout,
        deleteTime: deleteTime ?? this.deleteTime,
        winningOption: winningOption ?? this.winningOption,
        createdBy: createdBy ?? this.createdBy,
        projectId: projectId ?? this.projectId,
        docId: docId ?? this.docId,
        createdByNick: createdByNick ?? this.createdByNick,
        createdByAvatarUrl: createdByAvatarUrl ?? this.createdByAvatarUrl,
        options: options ?? this.options,
        myVote: myVote ?? this.myVote,
        statusDescription: statusDescription ?? this.statusDescription,
        myEligible: myEligible ?? this.myEligible);
  }

  bool operator ==(other) {
    return other is _ProposalGetResponse &&
        other.base == base &&
        other.active == active &&
        other.kind == kind &&
        other.eligible == eligible &&
        other.title == title &&
        other.summary == summary &&
        other.summaryHtml == summaryHtml &&
        other.dtext == dtext &&
        other.timeout == timeout &&
        other.deleteTime == deleteTime &&
        other.winningOption == winningOption &&
        other.createdBy == createdBy &&
        other.projectId == projectId &&
        other.docId == docId &&
        other.createdByNick == createdByNick &&
        other.createdByAvatarUrl == createdByAvatarUrl &&
        const ListEquality<_ProposalOptionItem>(
                const DefaultEquality<_ProposalOptionItem>())
            .equals(other.options, options) &&
        other.myVote == myVote &&
        other.statusDescription == statusDescription &&
        other.myEligible == myEligible;
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      active,
      kind,
      eligible,
      title,
      summary,
      summaryHtml,
      dtext,
      timeout,
      deleteTime,
      winningOption,
      createdBy,
      projectId,
      docId,
      createdByNick,
      createdByAvatarUrl,
      options,
      myVote,
      statusDescription,
      myEligible
    ]);
  }

  Map<String, dynamic> toJson() {
    return ProposalGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalOptionItem implements _ProposalOptionItem {
  const ProposalOptionItem({this.optionNo, this.voteCount, this.optionDesc});

  @override
  final int optionNo;

  @override
  final int voteCount;

  @override
  final String optionDesc;

  ProposalOptionItem copyWith(
      {int optionNo, int voteCount, String optionDesc}) {
    return new ProposalOptionItem(
        optionNo: optionNo ?? this.optionNo,
        voteCount: voteCount ?? this.voteCount,
        optionDesc: optionDesc ?? this.optionDesc);
  }

  bool operator ==(other) {
    return other is _ProposalOptionItem &&
        other.optionNo == optionNo &&
        other.voteCount == voteCount &&
        other.optionDesc == optionDesc;
  }

  @override
  int get hashCode {
    return hashObjects([optionNo, voteCount, optionDesc]);
  }

  Map<String, dynamic> toJson() {
    return ProposalOptionItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalSaveRequest implements _ProposalSaveRequest {
  const ProposalSaveRequest(
      {this.base,
      this.kind,
      this.projectId,
      this.eligible,
      this.title,
      this.summary,
      this.days,
      List<String> this.options});

  @override
  final _APIRequestBase base;

  @override
  final String kind;

  @override
  final int projectId;

  @override
  final String eligible;

  @override
  final String title;

  @override
  final String summary;

  @override
  final int days;

  @override
  final List<String> options;

  ProposalSaveRequest copyWith(
      {_APIRequestBase base,
      String kind,
      int projectId,
      String eligible,
      String title,
      String summary,
      int days,
      List<String> options}) {
    return new ProposalSaveRequest(
        base: base ?? this.base,
        kind: kind ?? this.kind,
        projectId: projectId ?? this.projectId,
        eligible: eligible ?? this.eligible,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        days: days ?? this.days,
        options: options ?? this.options);
  }

  bool operator ==(other) {
    return other is _ProposalSaveRequest &&
        other.base == base &&
        other.kind == kind &&
        other.projectId == projectId &&
        other.eligible == eligible &&
        other.title == title &&
        other.summary == summary &&
        other.days == days &&
        const ListEquality<String>(const DefaultEquality<String>())
            .equals(other.options, options);
  }

  @override
  int get hashCode {
    return hashObjects(
        [base, kind, projectId, eligible, title, summary, days, options]);
  }

  Map<String, dynamic> toJson() {
    return ProposalSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalUserSaveRequest implements _ProposalUserSaveRequest {
  const ProposalUserSaveRequest({this.base, this.proposalId, this.vote});

  @override
  final _APIRequestBase base;

  @override
  final int proposalId;

  @override
  final int vote;

  ProposalUserSaveRequest copyWith(
      {_APIRequestBase base, int proposalId, int vote}) {
    return new ProposalUserSaveRequest(
        base: base ?? this.base,
        proposalId: proposalId ?? this.proposalId,
        vote: vote ?? this.vote);
  }

  bool operator ==(other) {
    return other is _ProposalUserSaveRequest &&
        other.base == base &&
        other.proposalId == proposalId &&
        other.vote == vote;
  }

  @override
  int get hashCode {
    return hashObjects([base, proposalId, vote]);
  }

  Map<String, dynamic> toJson() {
    return ProposalUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class PushQueueGetRequest implements _PushQueueGetRequest {
  const PushQueueGetRequest({this.base, this.depth});

  @override
  final _APIRequestBase base;

  @override
  final String depth;

  PushQueueGetRequest copyWith({_APIRequestBase base, String depth}) {
    return new PushQueueGetRequest(
        base: base ?? this.base, depth: depth ?? this.depth);
  }

  bool operator ==(other) {
    return other is _PushQueueGetRequest &&
        other.base == base &&
        other.depth == depth;
  }

  @override
  int get hashCode {
    return hashObjects([base, depth]);
  }

  Map<String, dynamic> toJson() {
    return PushQueueGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class PushQueueGetResponse implements _PushQueueGetResponse {
  const PushQueueGetResponse(
      {this.base, List<_PushQueueItem> this.items, this.fullModeStatus});

  @override
  final _APIResponseBase base;

  @override
  final List<_PushQueueItem> items;

  @override
  final String fullModeStatus;

  PushQueueGetResponse copyWith(
      {_APIResponseBase base,
      List<_PushQueueItem> items,
      String fullModeStatus}) {
    return new PushQueueGetResponse(
        base: base ?? this.base,
        items: items ?? this.items,
        fullModeStatus: fullModeStatus ?? this.fullModeStatus);
  }

  bool operator ==(other) {
    return other is _PushQueueGetResponse &&
        other.base == base &&
        const ListEquality<_PushQueueItem>(
                const DefaultEquality<_PushQueueItem>())
            .equals(other.items, items) &&
        other.fullModeStatus == fullModeStatus;
  }

  @override
  int get hashCode {
    return hashObjects([base, items, fullModeStatus]);
  }

  Map<String, dynamic> toJson() {
    return PushQueueGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class PushQueueItem implements _PushQueueItem {
  const PushQueueItem(
      {this.kind,
      this.why,
      this.iid,
      this.sid,
      this.text,
      this.linkText,
      this.linkPaneKey});

  @override
  final String kind;

  @override
  final String why;

  @override
  final int iid;

  @override
  final String sid;

  @override
  final String text;

  @override
  final String linkText;

  @override
  final String linkPaneKey;

  PushQueueItem copyWith(
      {String kind,
      String why,
      int iid,
      String sid,
      String text,
      String linkText,
      String linkPaneKey}) {
    return new PushQueueItem(
        kind: kind ?? this.kind,
        why: why ?? this.why,
        iid: iid ?? this.iid,
        sid: sid ?? this.sid,
        text: text ?? this.text,
        linkText: linkText ?? this.linkText,
        linkPaneKey: linkPaneKey ?? this.linkPaneKey);
  }

  bool operator ==(other) {
    return other is _PushQueueItem &&
        other.kind == kind &&
        other.why == why &&
        other.iid == iid &&
        other.sid == sid &&
        other.text == text &&
        other.linkText == linkText &&
        other.linkPaneKey == linkPaneKey;
  }

  @override
  int get hashCode {
    return hashObjects([kind, why, iid, sid, text, linkText, linkPaneKey]);
  }

  Map<String, dynamic> toJson() {
    return PushQueueItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceQueryRequest implements _ResourceQueryRequest {
  const ResourceQueryRequest(
      {this.base, this.categoryId, this.title, this.kind});

  @override
  final _APIRequestBase base;

  @override
  final int categoryId;

  @override
  final String title;

  @override
  final String kind;

  ResourceQueryRequest copyWith(
      {_APIRequestBase base, int categoryId, String title, String kind}) {
    return new ResourceQueryRequest(
        base: base ?? this.base,
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
        kind: kind ?? this.kind);
  }

  bool operator ==(other) {
    return other is _ResourceQueryRequest &&
        other.base == base &&
        other.categoryId == categoryId &&
        other.title == title &&
        other.kind == kind;
  }

  @override
  int get hashCode {
    return hashObjects([base, categoryId, title, kind]);
  }

  Map<String, dynamic> toJson() {
    return ResourceQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceQueryResponse implements _ResourceQueryResponse {
  const ResourceQueryResponse({this.base, List<_ResourceItem> this.items});

  @override
  final _APIResponseBase base;

  @override
  final List<_ResourceItem> items;

  ResourceQueryResponse copyWith(
      {_APIResponseBase base, List<_ResourceItem> items}) {
    return new ResourceQueryResponse(
        base: base ?? this.base, items: items ?? this.items);
  }

  bool operator ==(other) {
    return other is _ResourceQueryResponse &&
        other.base == base &&
        const ListEquality<_ResourceItem>(
                const DefaultEquality<_ResourceItem>())
            .equals(other.items, items);
  }

  @override
  int get hashCode {
    return hashObjects([base, items]);
  }

  Map<String, dynamic> toJson() {
    return ResourceQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceItem implements _ResourceItem {
  const ResourceItem({this.iid, this.title, this.url, this.description});

  @override
  final int iid;

  @override
  final String title;

  @override
  final String url;

  @override
  final String description;

  ResourceItem copyWith(
      {int iid, String title, String url, String description}) {
    return new ResourceItem(
        iid: iid ?? this.iid,
        title: title ?? this.title,
        url: url ?? this.url,
        description: description ?? this.description);
  }

  bool operator ==(other) {
    return other is _ResourceItem &&
        other.iid == iid &&
        other.title == title &&
        other.url == url &&
        other.description == description;
  }

  @override
  int get hashCode {
    return hashObjects([iid, title, url, description]);
  }

  Map<String, dynamic> toJson() {
    return ResourceItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceGetRequest implements _ResourceGetRequest {
  const ResourceGetRequest({this.base, this.iid});

  @override
  final _APIRequestBase base;

  @override
  final int iid;

  ResourceGetRequest copyWith({_APIRequestBase base, int iid}) {
    return new ResourceGetRequest(
        base: base ?? this.base, iid: iid ?? this.iid);
  }

  bool operator ==(other) {
    return other is _ResourceGetRequest &&
        other.base == base &&
        other.iid == iid;
  }

  @override
  int get hashCode {
    return hashObjects([base, iid]);
  }

  Map<String, dynamic> toJson() {
    return ResourceGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceGetResponse implements _ResourceGetResponse {
  const ResourceGetResponse(
      {this.base,
      this.categoryId,
      this.userId,
      this.importantCount,
      this.title,
      this.description,
      this.createdAtR,
      this.visible,
      this.kind,
      this.url,
      this.userKind,
      this.isSiteAdmin,
      this.isCreator,
      this.nick});

  @override
  final _APIResponseBase base;

  @override
  final int categoryId;

  @override
  final int userId;

  @override
  final int importantCount;

  @override
  final String title;

  @override
  final String description;

  @override
  final String createdAtR;

  @override
  final String visible;

  @override
  final String kind;

  @override
  final String url;

  @override
  final String userKind;

  @override
  final String isSiteAdmin;

  @override
  final String isCreator;

  @override
  final String nick;

  ResourceGetResponse copyWith(
      {_APIResponseBase base,
      int categoryId,
      int userId,
      int importantCount,
      String title,
      String description,
      String createdAtR,
      String visible,
      String kind,
      String url,
      String userKind,
      String isSiteAdmin,
      String isCreator,
      String nick}) {
    return new ResourceGetResponse(
        base: base ?? this.base,
        categoryId: categoryId ?? this.categoryId,
        userId: userId ?? this.userId,
        importantCount: importantCount ?? this.importantCount,
        title: title ?? this.title,
        description: description ?? this.description,
        createdAtR: createdAtR ?? this.createdAtR,
        visible: visible ?? this.visible,
        kind: kind ?? this.kind,
        url: url ?? this.url,
        userKind: userKind ?? this.userKind,
        isSiteAdmin: isSiteAdmin ?? this.isSiteAdmin,
        isCreator: isCreator ?? this.isCreator,
        nick: nick ?? this.nick);
  }

  bool operator ==(other) {
    return other is _ResourceGetResponse &&
        other.base == base &&
        other.categoryId == categoryId &&
        other.userId == userId &&
        other.importantCount == importantCount &&
        other.title == title &&
        other.description == description &&
        other.createdAtR == createdAtR &&
        other.visible == visible &&
        other.kind == kind &&
        other.url == url &&
        other.userKind == userKind &&
        other.isSiteAdmin == isSiteAdmin &&
        other.isCreator == isCreator &&
        other.nick == nick;
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      categoryId,
      userId,
      importantCount,
      title,
      description,
      createdAtR,
      visible,
      kind,
      url,
      userKind,
      isSiteAdmin,
      isCreator,
      nick
    ]);
  }

  Map<String, dynamic> toJson() {
    return ResourceGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceSaveRequest implements _ResourceSaveRequest {
  const ResourceSaveRequest(
      {this.base,
      this.iid,
      this.categoryId,
      this.title,
      this.description,
      this.kind,
      this.url});

  @override
  final _APIRequestBase base;

  @override
  final int iid;

  @override
  final int categoryId;

  @override
  final String title;

  @override
  final String description;

  @override
  final String kind;

  @override
  final String url;

  ResourceSaveRequest copyWith(
      {_APIRequestBase base,
      int iid,
      int categoryId,
      String title,
      String description,
      String kind,
      String url}) {
    return new ResourceSaveRequest(
        base: base ?? this.base,
        iid: iid ?? this.iid,
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
        description: description ?? this.description,
        kind: kind ?? this.kind,
        url: url ?? this.url);
  }

  bool operator ==(other) {
    return other is _ResourceSaveRequest &&
        other.base == base &&
        other.iid == iid &&
        other.categoryId == categoryId &&
        other.title == title &&
        other.description == description &&
        other.kind == kind &&
        other.url == url;
  }

  @override
  int get hashCode {
    return hashObjects([base, iid, categoryId, title, description, kind, url]);
  }

  Map<String, dynamic> toJson() {
    return ResourceSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceTriageRequest implements _ResourceTriageRequest {
  const ResourceTriageRequest({this.base, this.iid, this.mode});

  @override
  final _APIRequestBase base;

  @override
  final int iid;

  @override
  final String mode;

  ResourceTriageRequest copyWith({_APIRequestBase base, int iid, String mode}) {
    return new ResourceTriageRequest(
        base: base ?? this.base, iid: iid ?? this.iid, mode: mode ?? this.mode);
  }

  bool operator ==(other) {
    return other is _ResourceTriageRequest &&
        other.base == base &&
        other.iid == iid &&
        other.mode == mode;
  }

  @override
  int get hashCode {
    return hashObjects([base, iid, mode]);
  }

  Map<String, dynamic> toJson() {
    return ResourceTriageRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceUserSaveRequest implements _ResourceUserSaveRequest {
  const ResourceUserSaveRequest({this.base, this.iid, this.kind});

  @override
  final _APIRequestBase base;

  @override
  final int iid;

  @override
  final String kind;

  ResourceUserSaveRequest copyWith(
      {_APIRequestBase base, int iid, String kind}) {
    return new ResourceUserSaveRequest(
        base: base ?? this.base, iid: iid ?? this.iid, kind: kind ?? this.kind);
  }

  bool operator ==(other) {
    return other is _ResourceUserSaveRequest &&
        other.base == base &&
        other.iid == iid &&
        other.kind == kind;
  }

  @override
  int get hashCode {
    return hashObjects([base, iid, kind]);
  }

  Map<String, dynamic> toJson() {
    return ResourceUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserQueryRequest implements _UserQueryRequest {
  const UserQueryRequest({this.base, this.name});

  @override
  final _APIRequestBase base;

  @override
  final String name;

  UserQueryRequest copyWith({_APIRequestBase base, String name}) {
    return new UserQueryRequest(
        base: base ?? this.base, name: name ?? this.name);
  }

  bool operator ==(other) {
    return other is _UserQueryRequest &&
        other.base == base &&
        other.name == name;
  }

  @override
  int get hashCode {
    return hashObjects([base, name]);
  }

  Map<String, dynamic> toJson() {
    return UserQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserQueryResponse implements _UserQueryResponse {
  const UserQueryResponse({this.base, List<_UserQueryItem> this.users});

  @override
  final _APIResponseBase base;

  @override
  final List<_UserQueryItem> users;

  UserQueryResponse copyWith(
      {_APIResponseBase base, List<_UserQueryItem> users}) {
    return new UserQueryResponse(
        base: base ?? this.base, users: users ?? this.users);
  }

  bool operator ==(other) {
    return other is _UserQueryResponse &&
        other.base == base &&
        const ListEquality<_UserQueryItem>(
                const DefaultEquality<_UserQueryItem>())
            .equals(other.users, users);
  }

  @override
  int get hashCode {
    return hashObjects([base, users]);
  }

  Map<String, dynamic> toJson() {
    return UserQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class UserQueryItem implements _UserQueryItem {
  const UserQueryItem(
      {this.iid, this.nick, this.kind, this.publicName, this.avatarUrl});

  @override
  final int iid;

  @override
  final String nick;

  @override
  final String kind;

  @override
  final String publicName;

  @override
  final String avatarUrl;

  UserQueryItem copyWith(
      {int iid,
      String nick,
      String kind,
      String publicName,
      String avatarUrl}) {
    return new UserQueryItem(
        iid: iid ?? this.iid,
        nick: nick ?? this.nick,
        kind: kind ?? this.kind,
        publicName: publicName ?? this.publicName,
        avatarUrl: avatarUrl ?? this.avatarUrl);
  }

  bool operator ==(other) {
    return other is _UserQueryItem &&
        other.iid == iid &&
        other.nick == nick &&
        other.kind == kind &&
        other.publicName == publicName &&
        other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode {
    return hashObjects([iid, nick, kind, publicName, avatarUrl]);
  }

  Map<String, dynamic> toJson() {
    return UserQueryItemSerializer.toMap(this);
  }
}

@generatedSerializable
class UserGetRequest implements _UserGetRequest {
  const UserGetRequest(
      {this.base, this.userId, this.includeDetail, this.includeEditing});

  @override
  final _APIRequestBase base;

  @override
  final int userId;

  @override
  final String includeDetail;

  @override
  final String includeEditing;

  UserGetRequest copyWith(
      {_APIRequestBase base,
      int userId,
      String includeDetail,
      String includeEditing}) {
    return new UserGetRequest(
        base: base ?? this.base,
        userId: userId ?? this.userId,
        includeDetail: includeDetail ?? this.includeDetail,
        includeEditing: includeEditing ?? this.includeEditing);
  }

  bool operator ==(other) {
    return other is _UserGetRequest &&
        other.base == base &&
        other.userId == userId &&
        other.includeDetail == includeDetail &&
        other.includeEditing == includeEditing;
  }

  @override
  int get hashCode {
    return hashObjects([base, userId, includeDetail, includeEditing]);
  }

  Map<String, dynamic> toJson() {
    return UserGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserGetResponse implements _UserGetResponse {
  const UserGetResponse(
      {this.base,
      this.status,
      this.nick,
      this.email,
      this.kind,
      this.isSiteAdmin,
      this.publicName,
      this.prefEmailNotify,
      Map<String, String> this.publicLinks,
      this.timeZone,
      List<String> this.allTimeZones,
      this.avatarUrl,
      this.userUserKind,
      List<_APIResponseAssociation> this.events,
      List<_APIResponseAssociation> this.projects,
      List<_APIResponseAssociation> this.resources});

  @override
  final _APIResponseBase base;

  @override
  final String status;

  @override
  final String nick;

  @override
  final String email;

  @override
  final String kind;

  @override
  final String isSiteAdmin;

  @override
  final String publicName;

  @override
  final String prefEmailNotify;

  @override
  final Map<String, String> publicLinks;

  @override
  final String timeZone;

  @override
  final List<String> allTimeZones;

  @override
  final String avatarUrl;

  @override
  final String userUserKind;

  @override
  final List<_APIResponseAssociation> events;

  @override
  final List<_APIResponseAssociation> projects;

  @override
  final List<_APIResponseAssociation> resources;

  UserGetResponse copyWith(
      {_APIResponseBase base,
      String status,
      String nick,
      String email,
      String kind,
      String isSiteAdmin,
      String publicName,
      String prefEmailNotify,
      Map<String, String> publicLinks,
      String timeZone,
      List<String> allTimeZones,
      String avatarUrl,
      String userUserKind,
      List<_APIResponseAssociation> events,
      List<_APIResponseAssociation> projects,
      List<_APIResponseAssociation> resources}) {
    return new UserGetResponse(
        base: base ?? this.base,
        status: status ?? this.status,
        nick: nick ?? this.nick,
        email: email ?? this.email,
        kind: kind ?? this.kind,
        isSiteAdmin: isSiteAdmin ?? this.isSiteAdmin,
        publicName: publicName ?? this.publicName,
        prefEmailNotify: prefEmailNotify ?? this.prefEmailNotify,
        publicLinks: publicLinks ?? this.publicLinks,
        timeZone: timeZone ?? this.timeZone,
        allTimeZones: allTimeZones ?? this.allTimeZones,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        userUserKind: userUserKind ?? this.userUserKind,
        events: events ?? this.events,
        projects: projects ?? this.projects,
        resources: resources ?? this.resources);
  }

  bool operator ==(other) {
    return other is _UserGetResponse &&
        other.base == base &&
        other.status == status &&
        other.nick == nick &&
        other.email == email &&
        other.kind == kind &&
        other.isSiteAdmin == isSiteAdmin &&
        other.publicName == publicName &&
        other.prefEmailNotify == prefEmailNotify &&
        const MapEquality<String, String>(
                keys: const DefaultEquality<String>(),
                values: const DefaultEquality<String>())
            .equals(other.publicLinks, publicLinks) &&
        other.timeZone == timeZone &&
        const ListEquality<String>(const DefaultEquality<String>())
            .equals(other.allTimeZones, allTimeZones) &&
        other.avatarUrl == avatarUrl &&
        other.userUserKind == userUserKind &&
        const ListEquality<_APIResponseAssociation>(
                const DefaultEquality<_APIResponseAssociation>())
            .equals(other.events, events) &&
        const ListEquality<_APIResponseAssociation>(
                const DefaultEquality<_APIResponseAssociation>())
            .equals(other.projects, projects) &&
        const ListEquality<_APIResponseAssociation>(
                const DefaultEquality<_APIResponseAssociation>())
            .equals(other.resources, resources);
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      status,
      nick,
      email,
      kind,
      isSiteAdmin,
      publicName,
      prefEmailNotify,
      publicLinks,
      timeZone,
      allTimeZones,
      avatarUrl,
      userUserKind,
      events,
      projects,
      resources
    ]);
  }

  Map<String, dynamic> toJson() {
    return UserGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class UserSaveRequest implements _UserSaveRequest {
  const UserSaveRequest(
      {this.base,
      this.isNew,
      this.isDelete,
      this.saveNick,
      this.savePW,
      this.kind,
      this.email,
      this.isSiteAdmin,
      this.publicName,
      this.prefEmailNotify,
      Map<String, String> this.publicLinks,
      this.timeZone});

  @override
  final _APIRequestBase base;

  @override
  final String isNew;

  @override
  final String isDelete;

  @override
  final String saveNick;

  @override
  final String savePW;

  @override
  final String kind;

  @override
  final String email;

  @override
  final String isSiteAdmin;

  @override
  final String publicName;

  @override
  final String prefEmailNotify;

  @override
  final Map<String, String> publicLinks;

  @override
  final String timeZone;

  UserSaveRequest copyWith(
      {_APIRequestBase base,
      String isNew,
      String isDelete,
      String saveNick,
      String savePW,
      String kind,
      String email,
      String isSiteAdmin,
      String publicName,
      String prefEmailNotify,
      Map<String, String> publicLinks,
      String timeZone}) {
    return new UserSaveRequest(
        base: base ?? this.base,
        isNew: isNew ?? this.isNew,
        isDelete: isDelete ?? this.isDelete,
        saveNick: saveNick ?? this.saveNick,
        savePW: savePW ?? this.savePW,
        kind: kind ?? this.kind,
        email: email ?? this.email,
        isSiteAdmin: isSiteAdmin ?? this.isSiteAdmin,
        publicName: publicName ?? this.publicName,
        prefEmailNotify: prefEmailNotify ?? this.prefEmailNotify,
        publicLinks: publicLinks ?? this.publicLinks,
        timeZone: timeZone ?? this.timeZone);
  }

  bool operator ==(other) {
    return other is _UserSaveRequest &&
        other.base == base &&
        other.isNew == isNew &&
        other.isDelete == isDelete &&
        other.saveNick == saveNick &&
        other.savePW == savePW &&
        other.kind == kind &&
        other.email == email &&
        other.isSiteAdmin == isSiteAdmin &&
        other.publicName == publicName &&
        other.prefEmailNotify == prefEmailNotify &&
        const MapEquality<String, String>(
                keys: const DefaultEquality<String>(),
                values: const DefaultEquality<String>())
            .equals(other.publicLinks, publicLinks) &&
        other.timeZone == timeZone;
  }

  @override
  int get hashCode {
    return hashObjects([
      base,
      isNew,
      isDelete,
      saveNick,
      savePW,
      kind,
      email,
      isSiteAdmin,
      publicName,
      prefEmailNotify,
      publicLinks,
      timeZone
    ]);
  }

  Map<String, dynamic> toJson() {
    return UserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserAvatarSaveRequest implements _UserAvatarSaveRequest {
  const UserAvatarSaveRequest({this.base, List<int> this.imageBytes});

  @override
  final _APIRequestBase base;

  @override
  final List<int> imageBytes;

  UserAvatarSaveRequest copyWith({_APIRequestBase base, List<int> imageBytes}) {
    return new UserAvatarSaveRequest(
        base: base ?? this.base, imageBytes: imageBytes ?? this.imageBytes);
  }

  bool operator ==(other) {
    return other is _UserAvatarSaveRequest &&
        other.base == base &&
        const ListEquality<int>(const DefaultEquality<int>())
            .equals(other.imageBytes, imageBytes);
  }

  @override
  int get hashCode {
    return hashObjects([base, imageBytes]);
  }

  Map<String, dynamic> toJson() {
    return UserAvatarSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserNotifySaveRequest implements _UserNotifySaveRequest {
  const UserNotifySaveRequest({this.base, this.notifyId});

  @override
  final _APIRequestBase base;

  @override
  final String notifyId;

  UserNotifySaveRequest copyWith({_APIRequestBase base, String notifyId}) {
    return new UserNotifySaveRequest(
        base: base ?? this.base, notifyId: notifyId ?? this.notifyId);
  }

  bool operator ==(other) {
    return other is _UserNotifySaveRequest &&
        other.base == base &&
        other.notifyId == notifyId;
  }

  @override
  int get hashCode {
    return hashObjects([base, notifyId]);
  }

  Map<String, dynamic> toJson() {
    return UserNotifySaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserRecoverPasswordRequest implements _UserRecoverPasswordRequest {
  const UserRecoverPasswordRequest(
      {this.base,
      this.recoveryNick,
      this.mode,
      this.recoveryPassword,
      this.code});

  @override
  final _APIRequestBase base;

  @override
  final String recoveryNick;

  @override
  final String mode;

  @override
  final String recoveryPassword;

  @override
  final String code;

  UserRecoverPasswordRequest copyWith(
      {_APIRequestBase base,
      String recoveryNick,
      String mode,
      String recoveryPassword,
      String code}) {
    return new UserRecoverPasswordRequest(
        base: base ?? this.base,
        recoveryNick: recoveryNick ?? this.recoveryNick,
        mode: mode ?? this.mode,
        recoveryPassword: recoveryPassword ?? this.recoveryPassword,
        code: code ?? this.code);
  }

  bool operator ==(other) {
    return other is _UserRecoverPasswordRequest &&
        other.base == base &&
        other.recoveryNick == recoveryNick &&
        other.mode == mode &&
        other.recoveryPassword == recoveryPassword &&
        other.code == code;
  }

  @override
  int get hashCode {
    return hashObjects([base, recoveryNick, mode, recoveryPassword, code]);
  }

  Map<String, dynamic> toJson() {
    return UserRecoverPasswordRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserUserSaveRequest implements _UserUserSaveRequest {
  const UserUserSaveRequest({this.base, this.aboutId, this.kind});

  @override
  final _APIRequestBase base;

  @override
  final int aboutId;

  @override
  final String kind;

  UserUserSaveRequest copyWith(
      {_APIRequestBase base, int aboutId, String kind}) {
    return new UserUserSaveRequest(
        base: base ?? this.base,
        aboutId: aboutId ?? this.aboutId,
        kind: kind ?? this.kind);
  }

  bool operator ==(other) {
    return other is _UserUserSaveRequest &&
        other.base == base &&
        other.aboutId == aboutId &&
        other.kind == kind;
  }

  @override
  int get hashCode {
    return hashObjects([base, aboutId, kind]);
  }

  Map<String, dynamic> toJson() {
    return UserUserSaveRequestSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

abstract class APIRequestBaseSerializer {
  static APIRequestBase fromMap(Map map) {
    return new APIRequestBase(
        nick: map['nick'] as String,
        password: map['password'] as String,
        siteCode: map['site_code'] as String);
  }

  static Map<String, dynamic> toMap(_APIRequestBase model) {
    if (model == null) {
      return null;
    }
    return {
      'nick': model.nick,
      'password': model.password,
      'site_code': model.siteCode
    };
  }
}

abstract class APIRequestBaseFields {
  static const List<String> allFields = <String>[nick, password, siteCode];

  static const String nick = 'nick';

  static const String password = 'password';

  static const String siteCode = 'site_code';
}

abstract class APIResponseBaseSerializer {
  static APIResponseBase fromMap(Map map) {
    return new APIResponseBase(
        errorMessage: map['error_message'] as String,
        errorCode: map['error_code'] as String,
        ok: map['ok'] as String,
        newId: map['new_id'] as int);
  }

  static Map<String, dynamic> toMap(_APIResponseBase model) {
    if (model == null) {
      return null;
    }
    return {
      'error_message': model.errorMessage,
      'error_code': model.errorCode,
      'ok': model.ok,
      'new_id': model.newId
    };
  }
}

abstract class APIResponseBaseFields {
  static const List<String> allFields = <String>[
    errorMessage,
    errorCode,
    ok,
    newId
  ];

  static const String errorMessage = 'error_message';

  static const String errorCode = 'error_code';

  static const String ok = 'ok';

  static const String newId = 'new_id';
}

abstract class APIResponseAssociationSerializer {
  static APIResponseAssociation fromMap(Map map) {
    return new APIResponseAssociation(
        linkText: map['link_text'] as String,
        linkPaneKey: map['link_pane_key'] as String);
  }

  static Map<String, dynamic> toMap(_APIResponseAssociation model) {
    if (model == null) {
      return null;
    }
    return {'link_text': model.linkText, 'link_pane_key': model.linkPaneKey};
  }
}

abstract class APIResponseAssociationFields {
  static const List<String> allFields = <String>[linkText, linkPaneKey];

  static const String linkText = 'link_text';

  static const String linkPaneKey = 'link_pane_key';
}

abstract class AuthenticateResponseSerializer {
  static AuthenticateResponse fromMap(Map map) {
    return new AuthenticateResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        publicName: map['public_name'] as String,
        nick: map['nick'] as String,
        userId: map['user_id'] as int,
        isSiteAdmin: map['is_site_admin'] as String);
  }

  static Map<String, dynamic> toMap(_AuthenticateResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'public_name': model.publicName,
      'nick': model.nick,
      'user_id': model.userId,
      'is_site_admin': model.isSiteAdmin
    };
  }
}

abstract class AuthenticateResponseFields {
  static const List<String> allFields = <String>[
    base,
    publicName,
    nick,
    userId,
    isSiteAdmin
  ];

  static const String base = 'base';

  static const String publicName = 'public_name';

  static const String nick = 'nick';

  static const String userId = 'user_id';

  static const String isSiteAdmin = 'is_site_admin';
}

abstract class CrossQueryRequestSerializer {
  static CrossQueryRequest fromMap(Map map) {
    return new CrossQueryRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null);
  }

  static Map<String, dynamic> toMap(_CrossQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {'base': APIRequestBaseSerializer.toMap(model.base)};
  }
}

abstract class CrossQueryRequestFields {
  static const List<String> allFields = <String>[base];

  static const String base = 'base';
}

abstract class CrossQueryResponseSerializer {
  static CrossQueryResponse fromMap(Map map) {
    return new CrossQueryResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        items: map['items'] is Iterable
            ? new List.unmodifiable(
                ((map['items'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(APIResponseAssociationSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_CrossQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'items': model.items
          ?.map((m) => APIResponseAssociationSerializer.toMap(m))
          ?.toList()
    };
  }
}

abstract class CrossQueryResponseFields {
  static const List<String> allFields = <String>[base, items];

  static const String base = 'base';

  static const String items = 'items';
}

abstract class CategoryQueryRequestSerializer {
  static CategoryQueryRequest fromMap(Map map) {
    return new CategoryQueryRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        kind: map['kind'] as String);
  }

  static Map<String, dynamic> toMap(_CategoryQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'kind': model.kind
    };
  }
}

abstract class CategoryQueryRequestFields {
  static const List<String> allFields = <String>[base, kind];

  static const String base = 'base';

  static const String kind = 'kind';
}

abstract class CategoryQueryResponseSerializer {
  static CategoryQueryResponse fromMap(Map map) {
    return new CategoryQueryResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        categories: map['categories'] is Iterable
            ? new List.unmodifiable(
                ((map['categories'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(CategoryItemResponseSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_CategoryQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'categories': model.categories
          ?.map((m) => CategoryItemResponseSerializer.toMap(m))
          ?.toList()
    };
  }
}

abstract class CategoryQueryResponseFields {
  static const List<String> allFields = <String>[base, categories];

  static const String base = 'base';

  static const String categories = 'categories';
}

abstract class CategoryDeleteRequestSerializer {
  static CategoryDeleteRequest fromMap(Map map) {
    return new CategoryDeleteRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        catId: map['cat_id'] as int,
        kind: map['kind'] as String);
  }

  static Map<String, dynamic> toMap(_CategoryDeleteRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'cat_id': model.catId,
      'kind': model.kind
    };
  }
}

abstract class CategoryDeleteRequestFields {
  static const List<String> allFields = <String>[base, catId, kind];

  static const String base = 'base';

  static const String catId = 'cat_id';

  static const String kind = 'kind';
}

abstract class CategorySaveRequestSerializer {
  static CategorySaveRequest fromMap(Map map) {
    return new CategorySaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        catId: map['cat_id'] as int,
        kind: map['kind'] as String,
        referenceId: map['reference_id'] as int,
        referenceMode: map['reference_mode'] as String,
        title: map['title'] as String,
        description: map['description'] as String);
  }

  static Map<String, dynamic> toMap(_CategorySaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'cat_id': model.catId,
      'kind': model.kind,
      'reference_id': model.referenceId,
      'reference_mode': model.referenceMode,
      'title': model.title,
      'description': model.description
    };
  }
}

abstract class CategorySaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    catId,
    kind,
    referenceId,
    referenceMode,
    title,
    description
  ];

  static const String base = 'base';

  static const String catId = 'cat_id';

  static const String kind = 'kind';

  static const String referenceId = 'reference_id';

  static const String referenceMode = 'reference_mode';

  static const String title = 'title';

  static const String description = 'description';
}

abstract class CategoryMoveContentsRequestSerializer {
  static CategoryMoveContentsRequest fromMap(Map map) {
    return new CategoryMoveContentsRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        catId: map['cat_id'] as int,
        kind: map['kind'] as String,
        relatedIds: map['related_ids'] is Iterable
            ? (map['related_ids'] as Iterable).cast<int>().toList()
            : null);
  }

  static Map<String, dynamic> toMap(_CategoryMoveContentsRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'cat_id': model.catId,
      'kind': model.kind,
      'related_ids': model.relatedIds
    };
  }
}

abstract class CategoryMoveContentsRequestFields {
  static const List<String> allFields = <String>[base, catId, kind, relatedIds];

  static const String base = 'base';

  static const String catId = 'cat_id';

  static const String kind = 'kind';

  static const String relatedIds = 'related_ids';
}

abstract class CategoryItemResponseSerializer {
  static CategoryItemResponse fromMap(Map map) {
    return new CategoryItemResponse(
        iid: map['iid'] as int,
        parentId: map['parent_id'] as int,
        title: map['title'] as String,
        description: map['description'] as String);
  }

  static Map<String, dynamic> toMap(_CategoryItemResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'iid': model.iid,
      'parent_id': model.parentId,
      'title': model.title,
      'description': model.description
    };
  }
}

abstract class CategoryItemResponseFields {
  static const List<String> allFields = <String>[
    iid,
    parentId,
    title,
    description
  ];

  static const String iid = 'iid';

  static const String parentId = 'parent_id';

  static const String title = 'title';

  static const String description = 'description';
}

abstract class ConvQueryRequestSerializer {
  static ConvQueryRequest fromMap(Map map) {
    return new ConvQueryRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        term: map['term'] as String);
  }

  static Map<String, dynamic> toMap(_ConvQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'term': model.term
    };
  }
}

abstract class ConvQueryRequestFields {
  static const List<String> allFields = <String>[base, term];

  static const String base = 'base';

  static const String term = 'term';
}

abstract class ConvQueryResponseSerializer {
  static ConvQueryResponse fromMap(Map map) {
    return new ConvQueryResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convs: map['convs'] is Iterable
            ? new List.unmodifiable(
                ((map['convs'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ConvQueryConvItemResponseSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'convs': model.convs
          ?.map((m) => ConvQueryConvItemResponseSerializer.toMap(m))
          ?.toList()
    };
  }
}

abstract class ConvQueryResponseFields {
  static const List<String> allFields = <String>[base, convs];

  static const String base = 'base';

  static const String convs = 'convs';
}

abstract class ConvQueryConvItemResponseSerializer {
  static ConvQueryConvItemResponse fromMap(Map map) {
    return new ConvQueryConvItemResponse(
        convId: map['conv_id'] as int,
        hitText: map['hit_text'] as String,
        posts: map['posts'] is Iterable
            ? new List.unmodifiable(
                ((map['posts'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ConvQueryPostItemResponseSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvQueryConvItemResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'conv_id': model.convId,
      'hit_text': model.hitText,
      'posts': model.posts
          ?.map((m) => ConvQueryPostItemResponseSerializer.toMap(m))
          ?.toList()
    };
  }
}

abstract class ConvQueryConvItemResponseFields {
  static const List<String> allFields = <String>[convId, hitText, posts];

  static const String convId = 'conv_id';

  static const String hitText = 'hit_text';

  static const String posts = 'posts';
}

abstract class ConvQueryPostItemResponseSerializer {
  static ConvQueryPostItemResponse fromMap(Map map) {
    return new ConvQueryPostItemResponse(
        postId: map['post_id'] as String, hitText: map['hit_text'] as String);
  }

  static Map<String, dynamic> toMap(_ConvQueryPostItemResponse model) {
    if (model == null) {
      return null;
    }
    return {'post_id': model.postId, 'hit_text': model.hitText};
  }
}

abstract class ConvQueryPostItemResponseFields {
  static const List<String> allFields = <String>[postId, hitText];

  static const String postId = 'post_id';

  static const String hitText = 'hit_text';
}

abstract class ConvGetRequestSerializer {
  static ConvGetRequest fromMap(Map map) {
    return new ConvGetRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        mode: map['mode'] as String,
        rangeFromWDT: map['range_from_w_d_t'] as String,
        rangeToWDT: map['range_to_w_d_t'] as String);
  }

  static Map<String, dynamic> toMap(_ConvGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'mode': model.mode,
      'range_from_w_d_t': model.rangeFromWDT,
      'range_to_w_d_t': model.rangeToWDT
    };
  }
}

abstract class ConvGetRequestFields {
  static const List<String> allFields = <String>[
    base,
    convId,
    mode,
    rangeFromWDT,
    rangeToWDT
  ];

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String mode = 'mode';

  static const String rangeFromWDT = 'range_from_w_d_t';

  static const String rangeToWDT = 'range_to_w_d_t';
}

abstract class ConvGetResponseSerializer {
  static ConvGetResponse fromMap(Map map) {
    return new ConvGetResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        isManager: map['is_manager'] as String,
        isJoined: map['is_joined'] as String,
        readPositionWDT: map['read_position_w_d_t'] as String,
        title: map['title'] as String,
        anySkipped: map['any_skipped'] as String,
        posts: map['posts'] is Iterable
            ? new List.unmodifiable(
                ((map['posts'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ConvGetPostItemSerializer.fromMap))
            : null,
        replyAllowed: map['reply_allowed'] as String,
        replyAllowedDesc: map['reply_allowed_desc'] as String,
        replyMaxLength: map['reply_max_length'] as int,
        deleteMessage: map['delete_message'] as String,
        like: map['like'] as String,
        bookmarked: map['bookmarked'] as String,
        parentTitle: map['parent_title'] as String,
        parentPaneKey: map['parent_pane_key'] as String);
  }

  static Map<String, dynamic> toMap(_ConvGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'is_manager': model.isManager,
      'is_joined': model.isJoined,
      'read_position_w_d_t': model.readPositionWDT,
      'title': model.title,
      'any_skipped': model.anySkipped,
      'posts':
          model.posts?.map((m) => ConvGetPostItemSerializer.toMap(m))?.toList(),
      'reply_allowed': model.replyAllowed,
      'reply_allowed_desc': model.replyAllowedDesc,
      'reply_max_length': model.replyMaxLength,
      'delete_message': model.deleteMessage,
      'like': model.like,
      'bookmarked': model.bookmarked,
      'parent_title': model.parentTitle,
      'parent_pane_key': model.parentPaneKey
    };
  }
}

abstract class ConvGetResponseFields {
  static const List<String> allFields = <String>[
    base,
    isManager,
    isJoined,
    readPositionWDT,
    title,
    anySkipped,
    posts,
    replyAllowed,
    replyAllowedDesc,
    replyMaxLength,
    deleteMessage,
    like,
    bookmarked,
    parentTitle,
    parentPaneKey
  ];

  static const String base = 'base';

  static const String isManager = 'is_manager';

  static const String isJoined = 'is_joined';

  static const String readPositionWDT = 'read_position_w_d_t';

  static const String title = 'title';

  static const String anySkipped = 'any_skipped';

  static const String posts = 'posts';

  static const String replyAllowed = 'reply_allowed';

  static const String replyAllowedDesc = 'reply_allowed_desc';

  static const String replyMaxLength = 'reply_max_length';

  static const String deleteMessage = 'delete_message';

  static const String like = 'like';

  static const String bookmarked = 'bookmarked';

  static const String parentTitle = 'parent_title';

  static const String parentPaneKey = 'parent_pane_key';
}

abstract class ConvGetPostItemSerializer {
  static ConvGetPostItem fromMap(Map map) {
    return new ConvGetPostItem(
        iid: map['iid'] as String,
        authorId: map['author_id'] as int,
        authorNick: map['author_nick'] as String,
        avatarUrl: map['avatar_url'] as String,
        createdAtReadable: map['created_at_readable'] as String,
        createdAtWDT: map['created_at_w_d_t'] as String,
        ago: map['ago'] as String,
        ptext: map['ptext'] as String,
        imageUrl: map['image_url'] as String,
        collapseMode: map['collapse_mode'] as String,
        collapsePosition: map['collapse_position'] as int);
  }

  static Map<String, dynamic> toMap(_ConvGetPostItem model) {
    if (model == null) {
      return null;
    }
    return {
      'iid': model.iid,
      'author_id': model.authorId,
      'author_nick': model.authorNick,
      'avatar_url': model.avatarUrl,
      'created_at_readable': model.createdAtReadable,
      'created_at_w_d_t': model.createdAtWDT,
      'ago': model.ago,
      'ptext': model.ptext,
      'image_url': model.imageUrl,
      'collapse_mode': model.collapseMode,
      'collapse_position': model.collapsePosition
    };
  }
}

abstract class ConvGetPostItemFields {
  static const List<String> allFields = <String>[
    iid,
    authorId,
    authorNick,
    avatarUrl,
    createdAtReadable,
    createdAtWDT,
    ago,
    ptext,
    imageUrl,
    collapseMode,
    collapsePosition
  ];

  static const String iid = 'iid';

  static const String authorId = 'author_id';

  static const String authorNick = 'author_nick';

  static const String avatarUrl = 'avatar_url';

  static const String createdAtReadable = 'created_at_readable';

  static const String createdAtWDT = 'created_at_w_d_t';

  static const String ago = 'ago';

  static const String ptext = 'ptext';

  static const String imageUrl = 'image_url';

  static const String collapseMode = 'collapse_mode';

  static const String collapsePosition = 'collapse_position';
}

abstract class ConvGetRulesRequestSerializer {
  static ConvGetRulesRequest fromMap(Map map) {
    return new ConvGetRulesRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int);
  }

  static Map<String, dynamic> toMap(_ConvGetRulesRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId
    };
  }
}

abstract class ConvGetRulesRequestFields {
  static const List<String> allFields = <String>[base, convId];

  static const String base = 'base';

  static const String convId = 'conv_id';
}

abstract class ConvGetRulesResponseSerializer {
  static ConvGetRulesResponse fromMap(Map map) {
    return new ConvGetRulesResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        postMaxSize: map['post_max_size'] as int,
        userDailyMax: map['user_daily_max'] as int,
        title: map['title'] as String);
  }

  static Map<String, dynamic> toMap(_ConvGetRulesResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'post_max_size': model.postMaxSize,
      'user_daily_max': model.userDailyMax,
      'title': model.title
    };
  }
}

abstract class ConvGetRulesResponseFields {
  static const List<String> allFields = <String>[
    base,
    postMaxSize,
    userDailyMax,
    title
  ];

  static const String base = 'base';

  static const String postMaxSize = 'post_max_size';

  static const String userDailyMax = 'user_daily_max';

  static const String title = 'title';
}

abstract class ConvSaveRequestSerializer {
  static ConvSaveRequest fromMap(Map map) {
    return new ConvSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        projectId: map['project_id'] as int,
        eventId: map['event_id'] as int,
        fromConvId: map['from_conv_id'] as int,
        openingPostId: map['opening_post_id'] as String,
        title: map['title'] as String,
        postMaxSize: map['post_max_size'] as int,
        userDailyMax: map['user_daily_max'] as int);
  }

  static Map<String, dynamic> toMap(_ConvSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'project_id': model.projectId,
      'event_id': model.eventId,
      'from_conv_id': model.fromConvId,
      'opening_post_id': model.openingPostId,
      'title': model.title,
      'post_max_size': model.postMaxSize,
      'user_daily_max': model.userDailyMax
    };
  }
}

abstract class ConvSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    convId,
    projectId,
    eventId,
    fromConvId,
    openingPostId,
    title,
    postMaxSize,
    userDailyMax
  ];

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String projectId = 'project_id';

  static const String eventId = 'event_id';

  static const String fromConvId = 'from_conv_id';

  static const String openingPostId = 'opening_post_id';

  static const String title = 'title';

  static const String postMaxSize = 'post_max_size';

  static const String userDailyMax = 'user_daily_max';
}

abstract class ConvPostGetRequestSerializer {
  static ConvPostGetRequest fromMap(Map map) {
    return new ConvPostGetRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        postId: map['post_id'] as String);
  }

  static Map<String, dynamic> toMap(_ConvPostGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'post_id': model.postId
    };
  }
}

abstract class ConvPostGetRequestFields {
  static const List<String> allFields = <String>[base, postId];

  static const String base = 'base';

  static const String postId = 'post_id';
}

abstract class ConvPostGetResponseSerializer {
  static ConvPostGetResponse fromMap(Map map) {
    return new ConvPostGetResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        avatarUrl: map['avatar_url'] as String,
        createdAtReadable: map['created_at_readable'] as String,
        reaction: map['reaction'] as String,
        throttleDescription: map['throttle_description'] as String,
        canCensor: map['can_censor'] as String,
        allReasons: map['all_reasons'] as String);
  }

  static Map<String, dynamic> toMap(_ConvPostGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'avatar_url': model.avatarUrl,
      'created_at_readable': model.createdAtReadable,
      'reaction': model.reaction,
      'throttle_description': model.throttleDescription,
      'can_censor': model.canCensor,
      'all_reasons': model.allReasons
    };
  }
}

abstract class ConvPostGetResponseFields {
  static const List<String> allFields = <String>[
    base,
    avatarUrl,
    createdAtReadable,
    reaction,
    throttleDescription,
    canCensor,
    allReasons
  ];

  static const String base = 'base';

  static const String avatarUrl = 'avatar_url';

  static const String createdAtReadable = 'created_at_readable';

  static const String reaction = 'reaction';

  static const String throttleDescription = 'throttle_description';

  static const String canCensor = 'can_censor';

  static const String allReasons = 'all_reasons';
}

abstract class ConvPostSaveRequestSerializer {
  static ConvPostSaveRequest fromMap(Map map) {
    return new ConvPostSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        postId: map['post_id'] as String,
        triggerWarning: map['trigger_warning'] as String,
        ptext: map['ptext'] as String,
        censored: map['censored'] as String,
        delete: map['delete'] as String,
        lastKnownWDT: map['last_known_w_d_t'] as String);
  }

  static Map<String, dynamic> toMap(_ConvPostSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'post_id': model.postId,
      'trigger_warning': model.triggerWarning,
      'ptext': model.ptext,
      'censored': model.censored,
      'delete': model.delete,
      'last_known_w_d_t': model.lastKnownWDT
    };
  }
}

abstract class ConvPostSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    convId,
    postId,
    triggerWarning,
    ptext,
    censored,
    delete,
    lastKnownWDT
  ];

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String postId = 'post_id';

  static const String triggerWarning = 'trigger_warning';

  static const String ptext = 'ptext';

  static const String censored = 'censored';

  static const String delete = 'delete';

  static const String lastKnownWDT = 'last_known_w_d_t';
}

abstract class ConvPostImageSaveRequestSerializer {
  static ConvPostImageSaveRequest fromMap(Map map) {
    return new ConvPostImageSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        ptext: map['ptext'] as String,
        imageBytes: map['image_bytes'] is Iterable
            ? (map['image_bytes'] as Iterable).cast<int>().toList()
            : null);
  }

  static Map<String, dynamic> toMap(_ConvPostImageSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'ptext': model.ptext,
      'image_bytes': model.imageBytes
    };
  }
}

abstract class ConvPostImageSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    convId,
    ptext,
    imageBytes
  ];

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String ptext = 'ptext';

  static const String imageBytes = 'image_bytes';
}

abstract class ConvPostUserSaveRequestSerializer {
  static ConvPostUserSaveRequest fromMap(Map map) {
    return new ConvPostUserSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        postId: map['post_id'] as String,
        reaction: map['reaction'] as String,
        reason: map['reason'] as String);
  }

  static Map<String, dynamic> toMap(_ConvPostUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'post_id': model.postId,
      'reaction': model.reaction,
      'reason': model.reason
    };
  }
}

abstract class ConvPostUserSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    postId,
    reaction,
    reason
  ];

  static const String base = 'base';

  static const String postId = 'post_id';

  static const String reaction = 'reaction';

  static const String reason = 'reason';
}

abstract class ConvSetReadPositionRequestSerializer {
  static ConvSetReadPositionRequest fromMap(Map map) {
    return new ConvSetReadPositionRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        positionWDT: map['position_w_d_t'] as String);
  }

  static Map<String, dynamic> toMap(_ConvSetReadPositionRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'position_w_d_t': model.positionWDT
    };
  }
}

abstract class ConvSetReadPositionRequestFields {
  static const List<String> allFields = <String>[base, convId, positionWDT];

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String positionWDT = 'position_w_d_t';
}

abstract class ConvUserSaveRequestSerializer {
  static ConvUserSaveRequest fromMap(Map map) {
    return new ConvUserSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        status: map['status'] as String,
        like: map['like'] as String,
        bookmarked: map['bookmarked'] as String);
  }

  static Map<String, dynamic> toMap(_ConvUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'status': model.status,
      'like': model.like,
      'bookmarked': model.bookmarked
    };
  }
}

abstract class ConvUserSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    convId,
    status,
    like,
    bookmarked
  ];

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String status = 'status';

  static const String like = 'like';

  static const String bookmarked = 'bookmarked';
}

abstract class ConvUserSaveResponseSerializer {
  static ConvUserSaveResponse fromMap(Map map) {
    return new ConvUserSaveResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        action: map['action'] as String);
  }

  static Map<String, dynamic> toMap(_ConvUserSaveResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'action': model.action
    };
  }
}

abstract class ConvUserSaveResponseFields {
  static const List<String> allFields = <String>[base, action];

  static const String base = 'base';

  static const String action = 'action';
}

abstract class DocQueryRequestSerializer {
  static DocQueryRequest fromMap(Map map) {
    return new DocQueryRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        mode: map['mode'] as String);
  }

  static Map<String, dynamic> toMap(_DocQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'mode': model.mode
    };
  }
}

abstract class DocQueryRequestFields {
  static const List<String> allFields = <String>[base, mode];

  static const String base = 'base';

  static const String mode = 'mode';
}

abstract class DocQueryResponseSerializer {
  static DocQueryResponse fromMap(Map map) {
    return new DocQueryResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        docs: map['docs'] is Iterable
            ? new List.unmodifiable(
                ((map['docs'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(DocQueryItemSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_DocQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'docs': model.docs?.map((m) => DocQueryItemSerializer.toMap(m))?.toList()
    };
  }
}

abstract class DocQueryResponseFields {
  static const List<String> allFields = <String>[base, docs];

  static const String base = 'base';

  static const String docs = 'docs';
}

abstract class DocQueryItemSerializer {
  static DocQueryItem fromMap(Map map) {
    return new DocQueryItem(
        iid: map['iid'] as int, title: map['title'] as String);
  }

  static Map<String, dynamic> toMap(_DocQueryItem model) {
    if (model == null) {
      return null;
    }
    return {'iid': model.iid, 'title': model.title};
  }
}

abstract class DocQueryItemFields {
  static const List<String> allFields = <String>[iid, title];

  static const String iid = 'iid';

  static const String title = 'title';
}

abstract class DocGetRequestSerializer {
  static DocGetRequest fromMap(Map map) {
    return new DocGetRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        docId: map['doc_id'] as int,
        specialCode: map['special_code'] as String,
        revisionNo: map['revision_no'] as int,
        getVerList: map['get_ver_list'] as String);
  }

  static Map<String, dynamic> toMap(_DocGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'doc_id': model.docId,
      'special_code': model.specialCode,
      'revision_no': model.revisionNo,
      'get_ver_list': model.getVerList
    };
  }
}

abstract class DocGetRequestFields {
  static const List<String> allFields = <String>[
    base,
    docId,
    specialCode,
    revisionNo,
    getVerList
  ];

  static const String base = 'base';

  static const String docId = 'doc_id';

  static const String specialCode = 'special_code';

  static const String revisionNo = 'revision_no';

  static const String getVerList = 'get_ver_list';
}

abstract class DocGetResponseSerializer {
  static DocGetResponse fromMap(Map map) {
    return new DocGetResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        docId: map['doc_id'] as int,
        title: map['title'] as String,
        body: map['body'] as String,
        htmlDiff: map['html_diff'] as String,
        projectId: map['project_id'] as int,
        projectTitle: map['project_title'] as String,
        isProjectManager: map['is_project_manager'] as String,
        allowSave: map['allow_save'] as String,
        reasonNotEditable: map['reason_not_editable'] as String,
        createdAtR: map['created_at_r'] as String,
        proposalId: map['proposal_id'] as int,
        verList: map['ver_list'] is Iterable
            ? new List.unmodifiable(
                ((map['ver_list'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(DocGetVersionItemSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_DocGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'doc_id': model.docId,
      'title': model.title,
      'body': model.body,
      'html_diff': model.htmlDiff,
      'project_id': model.projectId,
      'project_title': model.projectTitle,
      'is_project_manager': model.isProjectManager,
      'allow_save': model.allowSave,
      'reason_not_editable': model.reasonNotEditable,
      'created_at_r': model.createdAtR,
      'proposal_id': model.proposalId,
      'ver_list': model.verList
          ?.map((m) => DocGetVersionItemSerializer.toMap(m))
          ?.toList()
    };
  }
}

abstract class DocGetResponseFields {
  static const List<String> allFields = <String>[
    base,
    docId,
    title,
    body,
    htmlDiff,
    projectId,
    projectTitle,
    isProjectManager,
    allowSave,
    reasonNotEditable,
    createdAtR,
    proposalId,
    verList
  ];

  static const String base = 'base';

  static const String docId = 'doc_id';

  static const String title = 'title';

  static const String body = 'body';

  static const String htmlDiff = 'html_diff';

  static const String projectId = 'project_id';

  static const String projectTitle = 'project_title';

  static const String isProjectManager = 'is_project_manager';

  static const String allowSave = 'allow_save';

  static const String reasonNotEditable = 'reason_not_editable';

  static const String createdAtR = 'created_at_r';

  static const String proposalId = 'proposal_id';

  static const String verList = 'ver_list';
}

abstract class DocGetVersionItemSerializer {
  static DocGetVersionItem fromMap(Map map) {
    return new DocGetVersionItem(
        revisionNo: map['revision_no'] as int,
        createdAtR: map['created_at_r'] as String);
  }

  static Map<String, dynamic> toMap(_DocGetVersionItem model) {
    if (model == null) {
      return null;
    }
    return {'revision_no': model.revisionNo, 'created_at_r': model.createdAtR};
  }
}

abstract class DocGetVersionItemFields {
  static const List<String> allFields = <String>[revisionNo, createdAtR];

  static const String revisionNo = 'revision_no';

  static const String createdAtR = 'created_at_r';
}

abstract class DocSaveRequestSerializer {
  static DocSaveRequest fromMap(Map map) {
    return new DocSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        docId: map['doc_id'] as int,
        projectId: map['project_id'] as int,
        title: map['title'] as String,
        retitleMode: map['retitle_mode'] as String,
        body: map['body'] as String,
        summary: map['summary'] as String);
  }

  static Map<String, dynamic> toMap(_DocSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'doc_id': model.docId,
      'project_id': model.projectId,
      'title': model.title,
      'retitle_mode': model.retitleMode,
      'body': model.body,
      'summary': model.summary
    };
  }
}

abstract class DocSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    docId,
    projectId,
    title,
    retitleMode,
    body,
    summary
  ];

  static const String base = 'base';

  static const String docId = 'doc_id';

  static const String projectId = 'project_id';

  static const String title = 'title';

  static const String retitleMode = 'retitle_mode';

  static const String body = 'body';

  static const String summary = 'summary';
}

abstract class DocRollbackRequestSerializer {
  static DocRollbackRequest fromMap(Map map) {
    return new DocRollbackRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        docId: map['doc_id'] as int,
        revisionNo: map['revision_no'] as int);
  }

  static Map<String, dynamic> toMap(_DocRollbackRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'doc_id': model.docId,
      'revision_no': model.revisionNo
    };
  }
}

abstract class DocRollbackRequestFields {
  static const List<String> allFields = <String>[base, docId, revisionNo];

  static const String base = 'base';

  static const String docId = 'doc_id';

  static const String revisionNo = 'revision_no';
}

abstract class EventQueryRequestSerializer {
  static EventQueryRequest fromMap(Map map) {
    return new EventQueryRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        title: map['title'] as String,
        dateFrom: map['date_from'] as String,
        dateTo: map['date_to'] as String,
        miles: map['miles'] as int,
        lat: map['lat'] as String,
        lon: map['lon'] as String);
  }

  static Map<String, dynamic> toMap(_EventQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'title': model.title,
      'date_from': model.dateFrom,
      'date_to': model.dateTo,
      'miles': model.miles,
      'lat': model.lat,
      'lon': model.lon
    };
  }
}

abstract class EventQueryRequestFields {
  static const List<String> allFields = <String>[
    base,
    title,
    dateFrom,
    dateTo,
    miles,
    lat,
    lon
  ];

  static const String base = 'base';

  static const String title = 'title';

  static const String dateFrom = 'date_from';

  static const String dateTo = 'date_to';

  static const String miles = 'miles';

  static const String lat = 'lat';

  static const String lon = 'lon';
}

abstract class EventQueryResponseSerializer {
  static EventQueryResponse fromMap(Map map) {
    return new EventQueryResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        events: map['events'] is Iterable
            ? new List.unmodifiable(
                ((map['events'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(EventItemResponseSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_EventQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'events': model.events
          ?.map((m) => EventItemResponseSerializer.toMap(m))
          ?.toList()
    };
  }
}

abstract class EventQueryResponseFields {
  static const List<String> allFields = <String>[base, events];

  static const String base = 'base';

  static const String events = 'events';
}

abstract class EventItemResponseSerializer {
  static EventItemResponse fromMap(Map map) {
    return new EventItemResponse(
        iid: map['iid'] as int,
        title: map['title'] as String,
        startTime: map['start_time'] as String,
        creatorNick: map['creator_nick'] as String,
        creatorId: map['creator_id'] as int);
  }

  static Map<String, dynamic> toMap(_EventItemResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'iid': model.iid,
      'title': model.title,
      'start_time': model.startTime,
      'creator_nick': model.creatorNick,
      'creator_id': model.creatorId
    };
  }
}

abstract class EventItemResponseFields {
  static const List<String> allFields = <String>[
    iid,
    title,
    startTime,
    creatorNick,
    creatorId
  ];

  static const String iid = 'iid';

  static const String title = 'title';

  static const String startTime = 'start_time';

  static const String creatorNick = 'creator_nick';

  static const String creatorId = 'creator_id';
}

abstract class EventRequestSerializer {
  static EventRequest fromMap(Map map) {
    return new EventRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        eventId: map['event_id'] as int);
  }

  static Map<String, dynamic> toMap(_EventRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'event_id': model.eventId
    };
  }
}

abstract class EventRequestFields {
  static const List<String> allFields = <String>[base, eventId];

  static const String base = 'base';

  static const String eventId = 'event_id';
}

abstract class EventGetResponseSerializer {
  static EventGetResponse fromMap(Map map) {
    return new EventGetResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        title: map['title'] as String,
        description: map['description'] as String,
        duration: map['duration'] as String,
        location: map['location'] as String,
        startTimeU: map['start_time_u'] as String,
        startTimeR: map['start_time_r'] as String,
        creatorNick: map['creator_nick'] as String,
        creatorId: map['creator_id'] as int,
        creatorAvatarUrl: map['creator_avatar_url'] as String,
        createdAtR: map['created_at_r'] as String,
        lat: map['lat'] as String,
        lon: map['lon'] as String,
        users: map['users'] is Iterable
            ? new List.unmodifiable(
                ((map['users'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(EventGetUserResponseSerializer.fromMap))
            : null,
        convs: map['convs'] is Iterable
            ? new List.unmodifiable(
                ((map['convs'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(EventGetConvResponseSerializer.fromMap))
            : null,
        isCreator: map['is_creator'] as String);
  }

  static Map<String, dynamic> toMap(_EventGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'title': model.title,
      'description': model.description,
      'duration': model.duration,
      'location': model.location,
      'start_time_u': model.startTimeU,
      'start_time_r': model.startTimeR,
      'creator_nick': model.creatorNick,
      'creator_id': model.creatorId,
      'creator_avatar_url': model.creatorAvatarUrl,
      'created_at_r': model.createdAtR,
      'lat': model.lat,
      'lon': model.lon,
      'users': model.users
          ?.map((m) => EventGetUserResponseSerializer.toMap(m))
          ?.toList(),
      'convs': model.convs
          ?.map((m) => EventGetConvResponseSerializer.toMap(m))
          ?.toList(),
      'is_creator': model.isCreator
    };
  }
}

abstract class EventGetResponseFields {
  static const List<String> allFields = <String>[
    base,
    title,
    description,
    duration,
    location,
    startTimeU,
    startTimeR,
    creatorNick,
    creatorId,
    creatorAvatarUrl,
    createdAtR,
    lat,
    lon,
    users,
    convs,
    isCreator
  ];

  static const String base = 'base';

  static const String title = 'title';

  static const String description = 'description';

  static const String duration = 'duration';

  static const String location = 'location';

  static const String startTimeU = 'start_time_u';

  static const String startTimeR = 'start_time_r';

  static const String creatorNick = 'creator_nick';

  static const String creatorId = 'creator_id';

  static const String creatorAvatarUrl = 'creator_avatar_url';

  static const String createdAtR = 'created_at_r';

  static const String lat = 'lat';

  static const String lon = 'lon';

  static const String users = 'users';

  static const String convs = 'convs';

  static const String isCreator = 'is_creator';
}

abstract class EventGetUserResponseSerializer {
  static EventGetUserResponse fromMap(Map map) {
    return new EventGetUserResponse(
        userId: map['user_id'] as int,
        nick: map['nick'] as String,
        publicName: map['public_name'] as String,
        avatarUrl: map['avatar_url'] as String,
        status: map['status'] as String,
        statusDesc: map['status_desc'] as String);
  }

  static Map<String, dynamic> toMap(_EventGetUserResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'user_id': model.userId,
      'nick': model.nick,
      'public_name': model.publicName,
      'avatar_url': model.avatarUrl,
      'status': model.status,
      'status_desc': model.statusDesc
    };
  }
}

abstract class EventGetUserResponseFields {
  static const List<String> allFields = <String>[
    userId,
    nick,
    publicName,
    avatarUrl,
    status,
    statusDesc
  ];

  static const String userId = 'user_id';

  static const String nick = 'nick';

  static const String publicName = 'public_name';

  static const String avatarUrl = 'avatar_url';

  static const String status = 'status';

  static const String statusDesc = 'status_desc';
}

abstract class EventGetConvResponseSerializer {
  static EventGetConvResponse fromMap(Map map) {
    return new EventGetConvResponse(
        iid: map['iid'] as int,
        open: map['open'] as String,
        title: map['title'] as String,
        lastActivity: map['last_activity'] as String);
  }

  static Map<String, dynamic> toMap(_EventGetConvResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'iid': model.iid,
      'open': model.open,
      'title': model.title,
      'last_activity': model.lastActivity
    };
  }
}

abstract class EventGetConvResponseFields {
  static const List<String> allFields = <String>[
    iid,
    open,
    title,
    lastActivity
  ];

  static const String iid = 'iid';

  static const String open = 'open';

  static const String title = 'title';

  static const String lastActivity = 'last_activity';
}

abstract class EventSaveRequestSerializer {
  static EventSaveRequest fromMap(Map map) {
    return new EventSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        eventId: map['event_id'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        duration: map['duration'] as String,
        location: map['location'] as String,
        startTime: map['start_time'] as String,
        lat: map['lat'] as String,
        lon: map['lon'] as String);
  }

  static Map<String, dynamic> toMap(_EventSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'event_id': model.eventId,
      'title': model.title,
      'description': model.description,
      'duration': model.duration,
      'location': model.location,
      'start_time': model.startTime,
      'lat': model.lat,
      'lon': model.lon
    };
  }
}

abstract class EventSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    eventId,
    title,
    description,
    duration,
    location,
    startTime,
    lat,
    lon
  ];

  static const String base = 'base';

  static const String eventId = 'event_id';

  static const String title = 'title';

  static const String description = 'description';

  static const String duration = 'duration';

  static const String location = 'location';

  static const String startTime = 'start_time';

  static const String lat = 'lat';

  static const String lon = 'lon';
}

abstract class EventUserSaveRequestSerializer {
  static EventUserSaveRequest fromMap(Map map) {
    return new EventUserSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        eventId: map['event_id'] as int,
        status: map['status'] as String,
        statusDesc: map['status_desc'] as String);
  }

  static Map<String, dynamic> toMap(_EventUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'event_id': model.eventId,
      'status': model.status,
      'status_desc': model.statusDesc
    };
  }
}

abstract class EventUserSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    eventId,
    status,
    statusDesc
  ];

  static const String base = 'base';

  static const String eventId = 'event_id';

  static const String status = 'status';

  static const String statusDesc = 'status_desc';
}

abstract class ProjectQueryRequestSerializer {
  static ProjectQueryRequest fromMap(Map map) {
    return new ProjectQueryRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        catId: map['cat_id'] as int,
        title: map['title'] as String);
  }

  static Map<String, dynamic> toMap(_ProjectQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'cat_id': model.catId,
      'title': model.title
    };
  }
}

abstract class ProjectQueryRequestFields {
  static const List<String> allFields = <String>[base, catId, title];

  static const String base = 'base';

  static const String catId = 'cat_id';

  static const String title = 'title';
}

abstract class ProjectQueryResponseSerializer {
  static ProjectQueryResponse fromMap(Map map) {
    return new ProjectQueryResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projects: map['projects'] is Iterable
            ? new List.unmodifiable(
                ((map['projects'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ProjectQueryItemSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'projects': model.projects
          ?.map((m) => ProjectQueryItemSerializer.toMap(m))
          ?.toList()
    };
  }
}

abstract class ProjectQueryResponseFields {
  static const List<String> allFields = <String>[base, projects];

  static const String base = 'base';

  static const String projects = 'projects';
}

abstract class ProjectQueryItemSerializer {
  static ProjectQueryItem fromMap(Map map) {
    return new ProjectQueryItem(
        projectId: map['project_id'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        leadership: map['leadership'] as String,
        privacy: map['privacy'] as String);
  }

  static Map<String, dynamic> toMap(_ProjectQueryItem model) {
    if (model == null) {
      return null;
    }
    return {
      'project_id': model.projectId,
      'title': model.title,
      'description': model.description,
      'leadership': model.leadership,
      'privacy': model.privacy
    };
  }
}

abstract class ProjectQueryItemFields {
  static const List<String> allFields = <String>[
    projectId,
    title,
    description,
    leadership,
    privacy
  ];

  static const String projectId = 'project_id';

  static const String title = 'title';

  static const String description = 'description';

  static const String leadership = 'leadership';

  static const String privacy = 'privacy';
}

abstract class ProjectGetRequestSerializer {
  static ProjectGetRequest fromMap(Map map) {
    return new ProjectGetRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projectId: map['project_id'] as int);
  }

  static Map<String, dynamic> toMap(_ProjectGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'project_id': model.projectId
    };
  }
}

abstract class ProjectGetRequestFields {
  static const List<String> allFields = <String>[base, projectId];

  static const String base = 'base';

  static const String projectId = 'project_id';
}

abstract class ProjectGetResponseSerializer {
  static ProjectGetResponse fromMap(Map map) {
    return new ProjectGetResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        active: map['active'] as String,
        leadership: map['leadership'] as String,
        privacy: map['privacy'] as String,
        title: map['title'] as String,
        description: map['description'] as String,
        categoryId: map['category_id'] as int,
        userKind: map['user_kind'] as String,
        proposals: map['proposals'] is Iterable
            ? new List.unmodifiable(
                ((map['proposals'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ProjectProposalItemSerializer.fromMap))
            : null,
        convs: map['convs'] is Iterable
            ? new List.unmodifiable(
                ((map['convs'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ProjectConvItemSerializer.fromMap))
            : null,
        docs: map['docs'] is Iterable
            ? new List.unmodifiable(
                ((map['docs'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ProjectDocItemSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'active': model.active,
      'leadership': model.leadership,
      'privacy': model.privacy,
      'title': model.title,
      'description': model.description,
      'category_id': model.categoryId,
      'user_kind': model.userKind,
      'proposals': model.proposals
          ?.map((m) => ProjectProposalItemSerializer.toMap(m))
          ?.toList(),
      'convs':
          model.convs?.map((m) => ProjectConvItemSerializer.toMap(m))?.toList(),
      'docs':
          model.docs?.map((m) => ProjectDocItemSerializer.toMap(m))?.toList()
    };
  }
}

abstract class ProjectGetResponseFields {
  static const List<String> allFields = <String>[
    base,
    active,
    leadership,
    privacy,
    title,
    description,
    categoryId,
    userKind,
    proposals,
    convs,
    docs
  ];

  static const String base = 'base';

  static const String active = 'active';

  static const String leadership = 'leadership';

  static const String privacy = 'privacy';

  static const String title = 'title';

  static const String description = 'description';

  static const String categoryId = 'category_id';

  static const String userKind = 'user_kind';

  static const String proposals = 'proposals';

  static const String convs = 'convs';

  static const String docs = 'docs';
}

abstract class ProjectProposalItemSerializer {
  static ProjectProposalItem fromMap(Map map) {
    return new ProjectProposalItem(
        iid: map['iid'] as int,
        active: map['active'] as String,
        title: map['title'] as String,
        createdAtR: map['created_at_r'] as String);
  }

  static Map<String, dynamic> toMap(_ProjectProposalItem model) {
    if (model == null) {
      return null;
    }
    return {
      'iid': model.iid,
      'active': model.active,
      'title': model.title,
      'created_at_r': model.createdAtR
    };
  }
}

abstract class ProjectProposalItemFields {
  static const List<String> allFields = <String>[
    iid,
    active,
    title,
    createdAtR
  ];

  static const String iid = 'iid';

  static const String active = 'active';

  static const String title = 'title';

  static const String createdAtR = 'created_at_r';
}

abstract class ProjectConvItemSerializer {
  static ProjectConvItem fromMap(Map map) {
    return new ProjectConvItem(
        iid: map['iid'] as int,
        open: map['open'] as String,
        title: map['title'] as String,
        lastActivity: map['last_activity'] as String);
  }

  static Map<String, dynamic> toMap(_ProjectConvItem model) {
    if (model == null) {
      return null;
    }
    return {
      'iid': model.iid,
      'open': model.open,
      'title': model.title,
      'last_activity': model.lastActivity
    };
  }
}

abstract class ProjectConvItemFields {
  static const List<String> allFields = <String>[
    iid,
    open,
    title,
    lastActivity
  ];

  static const String iid = 'iid';

  static const String open = 'open';

  static const String title = 'title';

  static const String lastActivity = 'last_activity';
}

abstract class ProjectDocItemSerializer {
  static ProjectDocItem fromMap(Map map) {
    return new ProjectDocItem(
        iid: map['iid'] as int, title: map['title'] as String);
  }

  static Map<String, dynamic> toMap(_ProjectDocItem model) {
    if (model == null) {
      return null;
    }
    return {'iid': model.iid, 'title': model.title};
  }
}

abstract class ProjectDocItemFields {
  static const List<String> allFields = <String>[iid, title];

  static const String iid = 'iid';

  static const String title = 'title';
}

abstract class ProjectSaveRequestSerializer {
  static ProjectSaveRequest fromMap(Map map) {
    return new ProjectSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projectId: map['project_id'] as int,
        leadership: map['leadership'] as String,
        privacy: map['privacy'] as String,
        title: map['title'] as String,
        description: map['description'] as String,
        categoryId: map['category_id'] as int);
  }

  static Map<String, dynamic> toMap(_ProjectSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'project_id': model.projectId,
      'leadership': model.leadership,
      'privacy': model.privacy,
      'title': model.title,
      'description': model.description,
      'category_id': model.categoryId
    };
  }
}

abstract class ProjectSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    projectId,
    leadership,
    privacy,
    title,
    description,
    categoryId
  ];

  static const String base = 'base';

  static const String projectId = 'project_id';

  static const String leadership = 'leadership';

  static const String privacy = 'privacy';

  static const String title = 'title';

  static const String description = 'description';

  static const String categoryId = 'category_id';
}

abstract class ProjectUserQueryRequestSerializer {
  static ProjectUserQueryRequest fromMap(Map map) {
    return new ProjectUserQueryRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projectId: map['project_id'] as int,
        name: map['name'] as String,
        resultPage: map['result_page'] as int);
  }

  static Map<String, dynamic> toMap(_ProjectUserQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'project_id': model.projectId,
      'name': model.name,
      'result_page': model.resultPage
    };
  }
}

abstract class ProjectUserQueryRequestFields {
  static const List<String> allFields = <String>[
    base,
    projectId,
    name,
    resultPage
  ];

  static const String base = 'base';

  static const String projectId = 'project_id';

  static const String name = 'name';

  static const String resultPage = 'result_page';
}

abstract class ProjectUserQueryResponseSerializer {
  static ProjectUserQueryResponse fromMap(Map map) {
    return new ProjectUserQueryResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projectTitle: map['project_title'] as String,
        completeLoad: map['complete_load'] as String,
        editable: map['editable'] as String,
        users: map['users'] is Iterable
            ? new List.unmodifiable(
                ((map['users'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ProjectUserItemSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectUserQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'project_title': model.projectTitle,
      'complete_load': model.completeLoad,
      'editable': model.editable,
      'users':
          model.users?.map((m) => ProjectUserItemSerializer.toMap(m))?.toList()
    };
  }
}

abstract class ProjectUserQueryResponseFields {
  static const List<String> allFields = <String>[
    base,
    projectTitle,
    completeLoad,
    editable,
    users
  ];

  static const String base = 'base';

  static const String projectTitle = 'project_title';

  static const String completeLoad = 'complete_load';

  static const String editable = 'editable';

  static const String users = 'users';
}

abstract class ProjectUserItemSerializer {
  static ProjectUserItem fromMap(Map map) {
    return new ProjectUserItem(
        userId: map['user_id'] as int,
        kind: map['kind'] as String,
        throttle: map['throttle'] as String,
        nick: map['nick'] as String,
        publicName: map['public_name'] as String,
        avatarUrl: map['avatar_url'] as String,
        voteKind: map['vote_kind'] as String);
  }

  static Map<String, dynamic> toMap(_ProjectUserItem model) {
    if (model == null) {
      return null;
    }
    return {
      'user_id': model.userId,
      'kind': model.kind,
      'throttle': model.throttle,
      'nick': model.nick,
      'public_name': model.publicName,
      'avatar_url': model.avatarUrl,
      'vote_kind': model.voteKind
    };
  }
}

abstract class ProjectUserItemFields {
  static const List<String> allFields = <String>[
    userId,
    kind,
    throttle,
    nick,
    publicName,
    avatarUrl,
    voteKind
  ];

  static const String userId = 'user_id';

  static const String kind = 'kind';

  static const String throttle = 'throttle';

  static const String nick = 'nick';

  static const String publicName = 'public_name';

  static const String avatarUrl = 'avatar_url';

  static const String voteKind = 'vote_kind';
}

abstract class ProjectUserSaveRequestSerializer {
  static ProjectUserSaveRequest fromMap(Map map) {
    return new ProjectUserSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projectId: map['project_id'] as int,
        userId: map['user_id'] as int,
        kind: map['kind'] as String);
  }

  static Map<String, dynamic> toMap(_ProjectUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'project_id': model.projectId,
      'user_id': model.userId,
      'kind': model.kind
    };
  }
}

abstract class ProjectUserSaveRequestFields {
  static const List<String> allFields = <String>[base, projectId, userId, kind];

  static const String base = 'base';

  static const String projectId = 'project_id';

  static const String userId = 'user_id';

  static const String kind = 'kind';
}

abstract class ProjectUserUserSaveRequestSerializer {
  static ProjectUserUserSaveRequest fromMap(Map map) {
    return new ProjectUserUserSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projectId: map['project_id'] as int,
        aboutId: map['about_id'] as int,
        kind: map['kind'] as String);
  }

  static Map<String, dynamic> toMap(_ProjectUserUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'project_id': model.projectId,
      'about_id': model.aboutId,
      'kind': model.kind
    };
  }
}

abstract class ProjectUserUserSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    projectId,
    aboutId,
    kind
  ];

  static const String base = 'base';

  static const String projectId = 'project_id';

  static const String aboutId = 'about_id';

  static const String kind = 'kind';
}

abstract class ProposalQueryRequestSerializer {
  static ProposalQueryRequest fromMap(Map map) {
    return new ProposalQueryRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        mode: map['mode'] as String,
        year: map['year'] as int,
        projectId: map['project_id'] as int);
  }

  static Map<String, dynamic> toMap(_ProposalQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'mode': model.mode,
      'year': model.year,
      'project_id': model.projectId
    };
  }
}

abstract class ProposalQueryRequestFields {
  static const List<String> allFields = <String>[base, mode, year, projectId];

  static const String base = 'base';

  static const String mode = 'mode';

  static const String year = 'year';

  static const String projectId = 'project_id';
}

abstract class ProposalQueryResponseSerializer {
  static ProposalQueryResponse fromMap(Map map) {
    return new ProposalQueryResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        items: map['items'] is Iterable
            ? new List.unmodifiable(
                ((map['items'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ProposalQueryItemSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_ProposalQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'items': model.items
          ?.map((m) => ProposalQueryItemSerializer.toMap(m))
          ?.toList()
    };
  }
}

abstract class ProposalQueryResponseFields {
  static const List<String> allFields = <String>[base, items];

  static const String base = 'base';

  static const String items = 'items';
}

abstract class ProposalQueryItemSerializer {
  static ProposalQueryItem fromMap(Map map) {
    return new ProposalQueryItem(
        iid: map['iid'] as int,
        title: map['title'] as String,
        kind: map['kind'] as String);
  }

  static Map<String, dynamic> toMap(_ProposalQueryItem model) {
    if (model == null) {
      return null;
    }
    return {'iid': model.iid, 'title': model.title, 'kind': model.kind};
  }
}

abstract class ProposalQueryItemFields {
  static const List<String> allFields = <String>[iid, title, kind];

  static const String iid = 'iid';

  static const String title = 'title';

  static const String kind = 'kind';
}

abstract class ProposalGetRequestSerializer {
  static ProposalGetRequest fromMap(Map map) {
    return new ProposalGetRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        proposalId: map['proposal_id'] as int);
  }

  static Map<String, dynamic> toMap(_ProposalGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'proposal_id': model.proposalId
    };
  }
}

abstract class ProposalGetRequestFields {
  static const List<String> allFields = <String>[base, proposalId];

  static const String base = 'base';

  static const String proposalId = 'proposal_id';
}

abstract class ProposalGetResponseSerializer {
  static ProposalGetResponse fromMap(Map map) {
    return new ProposalGetResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        active: map['active'] as String,
        kind: map['kind'] as String,
        eligible: map['eligible'] as String,
        title: map['title'] as String,
        summary: map['summary'] as String,
        summaryHtml: map['summary_html'] as String,
        dtext: map['dtext'] as String,
        timeout: map['timeout'] as String,
        deleteTime: map['delete_time'] as String,
        winningOption: map['winning_option'] as int,
        createdBy: map['created_by'] as int,
        projectId: map['project_id'] as int,
        docId: map['doc_id'] as int,
        createdByNick: map['created_by_nick'] as String,
        createdByAvatarUrl: map['created_by_avatar_url'] as String,
        options: map['options'] is Iterable
            ? new List.unmodifiable(
                ((map['options'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ProposalOptionItemSerializer.fromMap))
            : null,
        myVote: map['my_vote'] as int,
        statusDescription: map['status_description'] as String,
        myEligible: map['my_eligible'] as String);
  }

  static Map<String, dynamic> toMap(_ProposalGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'active': model.active,
      'kind': model.kind,
      'eligible': model.eligible,
      'title': model.title,
      'summary': model.summary,
      'summary_html': model.summaryHtml,
      'dtext': model.dtext,
      'timeout': model.timeout,
      'delete_time': model.deleteTime,
      'winning_option': model.winningOption,
      'created_by': model.createdBy,
      'project_id': model.projectId,
      'doc_id': model.docId,
      'created_by_nick': model.createdByNick,
      'created_by_avatar_url': model.createdByAvatarUrl,
      'options': model.options
          ?.map((m) => ProposalOptionItemSerializer.toMap(m))
          ?.toList(),
      'my_vote': model.myVote,
      'status_description': model.statusDescription,
      'my_eligible': model.myEligible
    };
  }
}

abstract class ProposalGetResponseFields {
  static const List<String> allFields = <String>[
    base,
    active,
    kind,
    eligible,
    title,
    summary,
    summaryHtml,
    dtext,
    timeout,
    deleteTime,
    winningOption,
    createdBy,
    projectId,
    docId,
    createdByNick,
    createdByAvatarUrl,
    options,
    myVote,
    statusDescription,
    myEligible
  ];

  static const String base = 'base';

  static const String active = 'active';

  static const String kind = 'kind';

  static const String eligible = 'eligible';

  static const String title = 'title';

  static const String summary = 'summary';

  static const String summaryHtml = 'summary_html';

  static const String dtext = 'dtext';

  static const String timeout = 'timeout';

  static const String deleteTime = 'delete_time';

  static const String winningOption = 'winning_option';

  static const String createdBy = 'created_by';

  static const String projectId = 'project_id';

  static const String docId = 'doc_id';

  static const String createdByNick = 'created_by_nick';

  static const String createdByAvatarUrl = 'created_by_avatar_url';

  static const String options = 'options';

  static const String myVote = 'my_vote';

  static const String statusDescription = 'status_description';

  static const String myEligible = 'my_eligible';
}

abstract class ProposalOptionItemSerializer {
  static ProposalOptionItem fromMap(Map map) {
    return new ProposalOptionItem(
        optionNo: map['option_no'] as int,
        voteCount: map['vote_count'] as int,
        optionDesc: map['option_desc'] as String);
  }

  static Map<String, dynamic> toMap(_ProposalOptionItem model) {
    if (model == null) {
      return null;
    }
    return {
      'option_no': model.optionNo,
      'vote_count': model.voteCount,
      'option_desc': model.optionDesc
    };
  }
}

abstract class ProposalOptionItemFields {
  static const List<String> allFields = <String>[
    optionNo,
    voteCount,
    optionDesc
  ];

  static const String optionNo = 'option_no';

  static const String voteCount = 'vote_count';

  static const String optionDesc = 'option_desc';
}

abstract class ProposalSaveRequestSerializer {
  static ProposalSaveRequest fromMap(Map map) {
    return new ProposalSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        kind: map['kind'] as String,
        projectId: map['project_id'] as int,
        eligible: map['eligible'] as String,
        title: map['title'] as String,
        summary: map['summary'] as String,
        days: map['days'] as int,
        options: map['options'] is Iterable
            ? (map['options'] as Iterable).cast<String>().toList()
            : null);
  }

  static Map<String, dynamic> toMap(_ProposalSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'kind': model.kind,
      'project_id': model.projectId,
      'eligible': model.eligible,
      'title': model.title,
      'summary': model.summary,
      'days': model.days,
      'options': model.options
    };
  }
}

abstract class ProposalSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    kind,
    projectId,
    eligible,
    title,
    summary,
    days,
    options
  ];

  static const String base = 'base';

  static const String kind = 'kind';

  static const String projectId = 'project_id';

  static const String eligible = 'eligible';

  static const String title = 'title';

  static const String summary = 'summary';

  static const String days = 'days';

  static const String options = 'options';
}

abstract class ProposalUserSaveRequestSerializer {
  static ProposalUserSaveRequest fromMap(Map map) {
    return new ProposalUserSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        proposalId: map['proposal_id'] as int,
        vote: map['vote'] as int);
  }

  static Map<String, dynamic> toMap(_ProposalUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'proposal_id': model.proposalId,
      'vote': model.vote
    };
  }
}

abstract class ProposalUserSaveRequestFields {
  static const List<String> allFields = <String>[base, proposalId, vote];

  static const String base = 'base';

  static const String proposalId = 'proposal_id';

  static const String vote = 'vote';
}

abstract class PushQueueGetRequestSerializer {
  static PushQueueGetRequest fromMap(Map map) {
    return new PushQueueGetRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        depth: map['depth'] as String);
  }

  static Map<String, dynamic> toMap(_PushQueueGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'depth': model.depth
    };
  }
}

abstract class PushQueueGetRequestFields {
  static const List<String> allFields = <String>[base, depth];

  static const String base = 'base';

  static const String depth = 'depth';
}

abstract class PushQueueGetResponseSerializer {
  static PushQueueGetResponse fromMap(Map map) {
    return new PushQueueGetResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        items: map['items'] is Iterable
            ? new List.unmodifiable(
                ((map['items'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(PushQueueItemSerializer.fromMap))
            : null,
        fullModeStatus: map['full_mode_status'] as String);
  }

  static Map<String, dynamic> toMap(_PushQueueGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'items':
          model.items?.map((m) => PushQueueItemSerializer.toMap(m))?.toList(),
      'full_mode_status': model.fullModeStatus
    };
  }
}

abstract class PushQueueGetResponseFields {
  static const List<String> allFields = <String>[base, items, fullModeStatus];

  static const String base = 'base';

  static const String items = 'items';

  static const String fullModeStatus = 'full_mode_status';
}

abstract class PushQueueItemSerializer {
  static PushQueueItem fromMap(Map map) {
    return new PushQueueItem(
        kind: map['kind'] as String,
        why: map['why'] as String,
        iid: map['iid'] as int,
        sid: map['sid'] as String,
        text: map['text'] as String,
        linkText: map['link_text'] as String,
        linkPaneKey: map['link_pane_key'] as String);
  }

  static Map<String, dynamic> toMap(_PushQueueItem model) {
    if (model == null) {
      return null;
    }
    return {
      'kind': model.kind,
      'why': model.why,
      'iid': model.iid,
      'sid': model.sid,
      'text': model.text,
      'link_text': model.linkText,
      'link_pane_key': model.linkPaneKey
    };
  }
}

abstract class PushQueueItemFields {
  static const List<String> allFields = <String>[
    kind,
    why,
    iid,
    sid,
    text,
    linkText,
    linkPaneKey
  ];

  static const String kind = 'kind';

  static const String why = 'why';

  static const String iid = 'iid';

  static const String sid = 'sid';

  static const String text = 'text';

  static const String linkText = 'link_text';

  static const String linkPaneKey = 'link_pane_key';
}

abstract class ResourceQueryRequestSerializer {
  static ResourceQueryRequest fromMap(Map map) {
    return new ResourceQueryRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        categoryId: map['category_id'] as int,
        title: map['title'] as String,
        kind: map['kind'] as String);
  }

  static Map<String, dynamic> toMap(_ResourceQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'category_id': model.categoryId,
      'title': model.title,
      'kind': model.kind
    };
  }
}

abstract class ResourceQueryRequestFields {
  static const List<String> allFields = <String>[base, categoryId, title, kind];

  static const String base = 'base';

  static const String categoryId = 'category_id';

  static const String title = 'title';

  static const String kind = 'kind';
}

abstract class ResourceQueryResponseSerializer {
  static ResourceQueryResponse fromMap(Map map) {
    return new ResourceQueryResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        items: map['items'] is Iterable
            ? new List.unmodifiable(
                ((map['items'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ResourceItemSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_ResourceQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'items':
          model.items?.map((m) => ResourceItemSerializer.toMap(m))?.toList()
    };
  }
}

abstract class ResourceQueryResponseFields {
  static const List<String> allFields = <String>[base, items];

  static const String base = 'base';

  static const String items = 'items';
}

abstract class ResourceItemSerializer {
  static ResourceItem fromMap(Map map) {
    return new ResourceItem(
        iid: map['iid'] as int,
        title: map['title'] as String,
        url: map['url'] as String,
        description: map['description'] as String);
  }

  static Map<String, dynamic> toMap(_ResourceItem model) {
    if (model == null) {
      return null;
    }
    return {
      'iid': model.iid,
      'title': model.title,
      'url': model.url,
      'description': model.description
    };
  }
}

abstract class ResourceItemFields {
  static const List<String> allFields = <String>[iid, title, url, description];

  static const String iid = 'iid';

  static const String title = 'title';

  static const String url = 'url';

  static const String description = 'description';
}

abstract class ResourceGetRequestSerializer {
  static ResourceGetRequest fromMap(Map map) {
    return new ResourceGetRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        iid: map['iid'] as int);
  }

  static Map<String, dynamic> toMap(_ResourceGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'iid': model.iid
    };
  }
}

abstract class ResourceGetRequestFields {
  static const List<String> allFields = <String>[base, iid];

  static const String base = 'base';

  static const String iid = 'iid';
}

abstract class ResourceGetResponseSerializer {
  static ResourceGetResponse fromMap(Map map) {
    return new ResourceGetResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        categoryId: map['category_id'] as int,
        userId: map['user_id'] as int,
        importantCount: map['important_count'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        createdAtR: map['created_at_r'] as String,
        visible: map['visible'] as String,
        kind: map['kind'] as String,
        url: map['url'] as String,
        userKind: map['user_kind'] as String,
        isSiteAdmin: map['is_site_admin'] as String,
        isCreator: map['is_creator'] as String,
        nick: map['nick'] as String);
  }

  static Map<String, dynamic> toMap(_ResourceGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'category_id': model.categoryId,
      'user_id': model.userId,
      'important_count': model.importantCount,
      'title': model.title,
      'description': model.description,
      'created_at_r': model.createdAtR,
      'visible': model.visible,
      'kind': model.kind,
      'url': model.url,
      'user_kind': model.userKind,
      'is_site_admin': model.isSiteAdmin,
      'is_creator': model.isCreator,
      'nick': model.nick
    };
  }
}

abstract class ResourceGetResponseFields {
  static const List<String> allFields = <String>[
    base,
    categoryId,
    userId,
    importantCount,
    title,
    description,
    createdAtR,
    visible,
    kind,
    url,
    userKind,
    isSiteAdmin,
    isCreator,
    nick
  ];

  static const String base = 'base';

  static const String categoryId = 'category_id';

  static const String userId = 'user_id';

  static const String importantCount = 'important_count';

  static const String title = 'title';

  static const String description = 'description';

  static const String createdAtR = 'created_at_r';

  static const String visible = 'visible';

  static const String kind = 'kind';

  static const String url = 'url';

  static const String userKind = 'user_kind';

  static const String isSiteAdmin = 'is_site_admin';

  static const String isCreator = 'is_creator';

  static const String nick = 'nick';
}

abstract class ResourceSaveRequestSerializer {
  static ResourceSaveRequest fromMap(Map map) {
    return new ResourceSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        iid: map['iid'] as int,
        categoryId: map['category_id'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        kind: map['kind'] as String,
        url: map['url'] as String);
  }

  static Map<String, dynamic> toMap(_ResourceSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'iid': model.iid,
      'category_id': model.categoryId,
      'title': model.title,
      'description': model.description,
      'kind': model.kind,
      'url': model.url
    };
  }
}

abstract class ResourceSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    iid,
    categoryId,
    title,
    description,
    kind,
    url
  ];

  static const String base = 'base';

  static const String iid = 'iid';

  static const String categoryId = 'category_id';

  static const String title = 'title';

  static const String description = 'description';

  static const String kind = 'kind';

  static const String url = 'url';
}

abstract class ResourceTriageRequestSerializer {
  static ResourceTriageRequest fromMap(Map map) {
    return new ResourceTriageRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        iid: map['iid'] as int,
        mode: map['mode'] as String);
  }

  static Map<String, dynamic> toMap(_ResourceTriageRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'iid': model.iid,
      'mode': model.mode
    };
  }
}

abstract class ResourceTriageRequestFields {
  static const List<String> allFields = <String>[base, iid, mode];

  static const String base = 'base';

  static const String iid = 'iid';

  static const String mode = 'mode';
}

abstract class ResourceUserSaveRequestSerializer {
  static ResourceUserSaveRequest fromMap(Map map) {
    return new ResourceUserSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        iid: map['iid'] as int,
        kind: map['kind'] as String);
  }

  static Map<String, dynamic> toMap(_ResourceUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'iid': model.iid,
      'kind': model.kind
    };
  }
}

abstract class ResourceUserSaveRequestFields {
  static const List<String> allFields = <String>[base, iid, kind];

  static const String base = 'base';

  static const String iid = 'iid';

  static const String kind = 'kind';
}

abstract class UserQueryRequestSerializer {
  static UserQueryRequest fromMap(Map map) {
    return new UserQueryRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        name: map['name'] as String);
  }

  static Map<String, dynamic> toMap(_UserQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'name': model.name
    };
  }
}

abstract class UserQueryRequestFields {
  static const List<String> allFields = <String>[base, name];

  static const String base = 'base';

  static const String name = 'name';
}

abstract class UserQueryResponseSerializer {
  static UserQueryResponse fromMap(Map map) {
    return new UserQueryResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        users: map['users'] is Iterable
            ? new List.unmodifiable(
                ((map['users'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(UserQueryItemSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_UserQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'users':
          model.users?.map((m) => UserQueryItemSerializer.toMap(m))?.toList()
    };
  }
}

abstract class UserQueryResponseFields {
  static const List<String> allFields = <String>[base, users];

  static const String base = 'base';

  static const String users = 'users';
}

abstract class UserQueryItemSerializer {
  static UserQueryItem fromMap(Map map) {
    return new UserQueryItem(
        iid: map['iid'] as int,
        nick: map['nick'] as String,
        kind: map['kind'] as String,
        publicName: map['public_name'] as String,
        avatarUrl: map['avatar_url'] as String);
  }

  static Map<String, dynamic> toMap(_UserQueryItem model) {
    if (model == null) {
      return null;
    }
    return {
      'iid': model.iid,
      'nick': model.nick,
      'kind': model.kind,
      'public_name': model.publicName,
      'avatar_url': model.avatarUrl
    };
  }
}

abstract class UserQueryItemFields {
  static const List<String> allFields = <String>[
    iid,
    nick,
    kind,
    publicName,
    avatarUrl
  ];

  static const String iid = 'iid';

  static const String nick = 'nick';

  static const String kind = 'kind';

  static const String publicName = 'public_name';

  static const String avatarUrl = 'avatar_url';
}

abstract class UserGetRequestSerializer {
  static UserGetRequest fromMap(Map map) {
    return new UserGetRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        userId: map['user_id'] as int,
        includeDetail: map['include_detail'] as String,
        includeEditing: map['include_editing'] as String);
  }

  static Map<String, dynamic> toMap(_UserGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'user_id': model.userId,
      'include_detail': model.includeDetail,
      'include_editing': model.includeEditing
    };
  }
}

abstract class UserGetRequestFields {
  static const List<String> allFields = <String>[
    base,
    userId,
    includeDetail,
    includeEditing
  ];

  static const String base = 'base';

  static const String userId = 'user_id';

  static const String includeDetail = 'include_detail';

  static const String includeEditing = 'include_editing';
}

abstract class UserGetResponseSerializer {
  static UserGetResponse fromMap(Map map) {
    return new UserGetResponse(
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        status: map['status'] as String,
        nick: map['nick'] as String,
        email: map['email'] as String,
        kind: map['kind'] as String,
        isSiteAdmin: map['is_site_admin'] as String,
        publicName: map['public_name'] as String,
        prefEmailNotify: map['pref_email_notify'] as String,
        publicLinks: map['public_links'] is Map
            ? (map['public_links'] as Map).cast<String, String>()
            : null,
        timeZone: map['time_zone'] as String,
        allTimeZones: map['all_time_zones'] is Iterable
            ? (map['all_time_zones'] as Iterable).cast<String>().toList()
            : null,
        avatarUrl: map['avatar_url'] as String,
        userUserKind: map['user_user_kind'] as String,
        events: map['events'] is Iterable
            ? new List.unmodifiable(
                ((map['events'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(APIResponseAssociationSerializer.fromMap))
            : null,
        projects: map['projects'] is Iterable
            ? new List.unmodifiable(
                ((map['projects'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(APIResponseAssociationSerializer.fromMap))
            : null,
        resources: map['resources'] is Iterable
            ? new List.unmodifiable(
                ((map['resources'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(APIResponseAssociationSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_UserGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIResponseBaseSerializer.toMap(model.base),
      'status': model.status,
      'nick': model.nick,
      'email': model.email,
      'kind': model.kind,
      'is_site_admin': model.isSiteAdmin,
      'public_name': model.publicName,
      'pref_email_notify': model.prefEmailNotify,
      'public_links': model.publicLinks,
      'time_zone': model.timeZone,
      'all_time_zones': model.allTimeZones,
      'avatar_url': model.avatarUrl,
      'user_user_kind': model.userUserKind,
      'events': model.events
          ?.map((m) => APIResponseAssociationSerializer.toMap(m))
          ?.toList(),
      'projects': model.projects
          ?.map((m) => APIResponseAssociationSerializer.toMap(m))
          ?.toList(),
      'resources': model.resources
          ?.map((m) => APIResponseAssociationSerializer.toMap(m))
          ?.toList()
    };
  }
}

abstract class UserGetResponseFields {
  static const List<String> allFields = <String>[
    base,
    status,
    nick,
    email,
    kind,
    isSiteAdmin,
    publicName,
    prefEmailNotify,
    publicLinks,
    timeZone,
    allTimeZones,
    avatarUrl,
    userUserKind,
    events,
    projects,
    resources
  ];

  static const String base = 'base';

  static const String status = 'status';

  static const String nick = 'nick';

  static const String email = 'email';

  static const String kind = 'kind';

  static const String isSiteAdmin = 'is_site_admin';

  static const String publicName = 'public_name';

  static const String prefEmailNotify = 'pref_email_notify';

  static const String publicLinks = 'public_links';

  static const String timeZone = 'time_zone';

  static const String allTimeZones = 'all_time_zones';

  static const String avatarUrl = 'avatar_url';

  static const String userUserKind = 'user_user_kind';

  static const String events = 'events';

  static const String projects = 'projects';

  static const String resources = 'resources';
}

abstract class UserSaveRequestSerializer {
  static UserSaveRequest fromMap(Map map) {
    return new UserSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        isNew: map['is_new'] as String,
        isDelete: map['is_delete'] as String,
        saveNick: map['save_nick'] as String,
        savePW: map['save_p_w'] as String,
        kind: map['kind'] as String,
        email: map['email'] as String,
        isSiteAdmin: map['is_site_admin'] as String,
        publicName: map['public_name'] as String,
        prefEmailNotify: map['pref_email_notify'] as String,
        publicLinks: map['public_links'] is Map
            ? (map['public_links'] as Map).cast<String, String>()
            : null,
        timeZone: map['time_zone'] as String);
  }

  static Map<String, dynamic> toMap(_UserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'is_new': model.isNew,
      'is_delete': model.isDelete,
      'save_nick': model.saveNick,
      'save_p_w': model.savePW,
      'kind': model.kind,
      'email': model.email,
      'is_site_admin': model.isSiteAdmin,
      'public_name': model.publicName,
      'pref_email_notify': model.prefEmailNotify,
      'public_links': model.publicLinks,
      'time_zone': model.timeZone
    };
  }
}

abstract class UserSaveRequestFields {
  static const List<String> allFields = <String>[
    base,
    isNew,
    isDelete,
    saveNick,
    savePW,
    kind,
    email,
    isSiteAdmin,
    publicName,
    prefEmailNotify,
    publicLinks,
    timeZone
  ];

  static const String base = 'base';

  static const String isNew = 'is_new';

  static const String isDelete = 'is_delete';

  static const String saveNick = 'save_nick';

  static const String savePW = 'save_p_w';

  static const String kind = 'kind';

  static const String email = 'email';

  static const String isSiteAdmin = 'is_site_admin';

  static const String publicName = 'public_name';

  static const String prefEmailNotify = 'pref_email_notify';

  static const String publicLinks = 'public_links';

  static const String timeZone = 'time_zone';
}

abstract class UserAvatarSaveRequestSerializer {
  static UserAvatarSaveRequest fromMap(Map map) {
    return new UserAvatarSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        imageBytes: map['image_bytes'] is Iterable
            ? (map['image_bytes'] as Iterable).cast<int>().toList()
            : null);
  }

  static Map<String, dynamic> toMap(_UserAvatarSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'image_bytes': model.imageBytes
    };
  }
}

abstract class UserAvatarSaveRequestFields {
  static const List<String> allFields = <String>[base, imageBytes];

  static const String base = 'base';

  static const String imageBytes = 'image_bytes';
}

abstract class UserNotifySaveRequestSerializer {
  static UserNotifySaveRequest fromMap(Map map) {
    return new UserNotifySaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        notifyId: map['notify_id'] as String);
  }

  static Map<String, dynamic> toMap(_UserNotifySaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'notify_id': model.notifyId
    };
  }
}

abstract class UserNotifySaveRequestFields {
  static const List<String> allFields = <String>[base, notifyId];

  static const String base = 'base';

  static const String notifyId = 'notify_id';
}

abstract class UserRecoverPasswordRequestSerializer {
  static UserRecoverPasswordRequest fromMap(Map map) {
    return new UserRecoverPasswordRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        recoveryNick: map['recovery_nick'] as String,
        mode: map['mode'] as String,
        recoveryPassword: map['recovery_password'] as String,
        code: map['code'] as String);
  }

  static Map<String, dynamic> toMap(_UserRecoverPasswordRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'recovery_nick': model.recoveryNick,
      'mode': model.mode,
      'recovery_password': model.recoveryPassword,
      'code': model.code
    };
  }
}

abstract class UserRecoverPasswordRequestFields {
  static const List<String> allFields = <String>[
    base,
    recoveryNick,
    mode,
    recoveryPassword,
    code
  ];

  static const String base = 'base';

  static const String recoveryNick = 'recovery_nick';

  static const String mode = 'mode';

  static const String recoveryPassword = 'recovery_password';

  static const String code = 'code';
}

abstract class UserUserSaveRequestSerializer {
  static UserUserSaveRequest fromMap(Map map) {
    return new UserUserSaveRequest(
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        aboutId: map['about_id'] as int,
        kind: map['kind'] as String);
  }

  static Map<String, dynamic> toMap(_UserUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'base': APIRequestBaseSerializer.toMap(model.base),
      'about_id': model.aboutId,
      'kind': model.kind
    };
  }
}

abstract class UserUserSaveRequestFields {
  static const List<String> allFields = <String>[base, aboutId, kind];

  static const String base = 'base';

  static const String aboutId = 'about_id';

  static const String kind = 'kind';
}
