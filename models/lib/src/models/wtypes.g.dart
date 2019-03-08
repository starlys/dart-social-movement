// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wtypes.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class APIRequestBase extends _APIRequestBase {
  APIRequestBase(
      {this.id, this.nick, this.password, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final String nick;

  @override
  final String password;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  APIRequestBase copyWith(
      {String id,
      String nick,
      String password,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new APIRequestBase(
        id: id ?? this.id,
        nick: nick ?? this.nick,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _APIRequestBase &&
        other.id == id &&
        other.nick == nick &&
        other.password == password &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, nick, password, createdAt, updatedAt]);
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
class APIResponseAssociation extends _APIResponseAssociation {
  APIResponseAssociation(
      {this.id,
      this.linkText,
      this.linkPaneKey,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final String linkText;

  @override
  final String linkPaneKey;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  APIResponseAssociation copyWith(
      {String id,
      String linkText,
      String linkPaneKey,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new APIResponseAssociation(
        id: id ?? this.id,
        linkText: linkText ?? this.linkText,
        linkPaneKey: linkPaneKey ?? this.linkPaneKey,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _APIResponseAssociation &&
        other.id == id &&
        other.linkText == linkText &&
        other.linkPaneKey == linkPaneKey &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, linkText, linkPaneKey, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return APIResponseAssociationSerializer.toMap(this);
  }
}

@generatedSerializable
class AuthenticateResponse extends _AuthenticateResponse {
  AuthenticateResponse(
      {this.id,
      this.base,
      this.publicName,
      this.nick,
      this.userId,
      this.isSiteAdmin,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  AuthenticateResponse copyWith(
      {String id,
      _APIResponseBase base,
      String publicName,
      String nick,
      int userId,
      String isSiteAdmin,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new AuthenticateResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        publicName: publicName ?? this.publicName,
        nick: nick ?? this.nick,
        userId: userId ?? this.userId,
        isSiteAdmin: isSiteAdmin ?? this.isSiteAdmin,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _AuthenticateResponse &&
        other.id == id &&
        other.base == base &&
        other.publicName == publicName &&
        other.nick == nick &&
        other.userId == userId &&
        other.isSiteAdmin == isSiteAdmin &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      publicName,
      nick,
      userId,
      isSiteAdmin,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return AuthenticateResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class CategoryQueryRequest extends _CategoryQueryRequest {
  CategoryQueryRequest(
      {this.id, this.base, this.kind, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final String kind;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  CategoryQueryRequest copyWith(
      {String id,
      _APIRequestBase base,
      String kind,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new CategoryQueryRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        kind: kind ?? this.kind,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _CategoryQueryRequest &&
        other.id == id &&
        other.base == base &&
        other.kind == kind &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, kind, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return CategoryQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class CategoryQueryResponse extends _CategoryQueryResponse {
  CategoryQueryResponse(
      {this.id,
      this.base,
      List<_CategoryItemResponse> categories,
      this.createdAt,
      this.updatedAt})
      : this.categories = new List.unmodifiable(categories ?? []);

  @override
  final String id;

  @override
  final _APIResponseBase base;

  @override
  final List<_CategoryItemResponse> categories;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  CategoryQueryResponse copyWith(
      {String id,
      _APIResponseBase base,
      List<_CategoryItemResponse> categories,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new CategoryQueryResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        categories: categories ?? this.categories,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _CategoryQueryResponse &&
        other.id == id &&
        other.base == base &&
        const ListEquality<_CategoryItemResponse>(
                const DefaultEquality<_CategoryItemResponse>())
            .equals(other.categories, categories) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, categories, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return CategoryQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class CategoryDeleteRequest extends _CategoryDeleteRequest {
  CategoryDeleteRequest(
      {this.id,
      this.base,
      this.catId,
      this.kind,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int catId;

  @override
  final String kind;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  CategoryDeleteRequest copyWith(
      {String id,
      _APIRequestBase base,
      int catId,
      String kind,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new CategoryDeleteRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        catId: catId ?? this.catId,
        kind: kind ?? this.kind,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _CategoryDeleteRequest &&
        other.id == id &&
        other.base == base &&
        other.catId == catId &&
        other.kind == kind &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, catId, kind, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return CategoryDeleteRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class CategorySaveRequest extends _CategorySaveRequest {
  CategorySaveRequest(
      {this.id,
      this.base,
      this.catId,
      this.kind,
      this.referenceId,
      this.referenceMode,
      this.title,
      this.description,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  CategorySaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int catId,
      String kind,
      int referenceId,
      String referenceMode,
      String title,
      String description,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new CategorySaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        catId: catId ?? this.catId,
        kind: kind ?? this.kind,
        referenceId: referenceId ?? this.referenceId,
        referenceMode: referenceMode ?? this.referenceMode,
        title: title ?? this.title,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _CategorySaveRequest &&
        other.id == id &&
        other.base == base &&
        other.catId == catId &&
        other.kind == kind &&
        other.referenceId == referenceId &&
        other.referenceMode == referenceMode &&
        other.title == title &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      catId,
      kind,
      referenceId,
      referenceMode,
      title,
      description,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return CategorySaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class CategoryMoveContentsRequest extends _CategoryMoveContentsRequest {
  CategoryMoveContentsRequest(
      {this.id,
      this.base,
      this.catId,
      this.kind,
      List<int> relatedIds,
      this.createdAt,
      this.updatedAt})
      : this.relatedIds = new List.unmodifiable(relatedIds ?? []);

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int catId;

  @override
  final String kind;

  @override
  final List<int> relatedIds;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  CategoryMoveContentsRequest copyWith(
      {String id,
      _APIRequestBase base,
      int catId,
      String kind,
      List<int> relatedIds,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new CategoryMoveContentsRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        catId: catId ?? this.catId,
        kind: kind ?? this.kind,
        relatedIds: relatedIds ?? this.relatedIds,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _CategoryMoveContentsRequest &&
        other.id == id &&
        other.base == base &&
        other.catId == catId &&
        other.kind == kind &&
        const ListEquality<int>(const DefaultEquality<int>())
            .equals(other.relatedIds, relatedIds) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, base, catId, kind, relatedIds, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return CategoryMoveContentsRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class CategoryItemResponse extends _CategoryItemResponse {
  CategoryItemResponse(
      {this.id,
      this.iid,
      this.parentId,
      this.title,
      this.description,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final int iid;

  @override
  final int parentId;

  @override
  final String title;

  @override
  final String description;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  CategoryItemResponse copyWith(
      {String id,
      int iid,
      int parentId,
      String title,
      String description,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new CategoryItemResponse(
        id: id ?? this.id,
        iid: iid ?? this.iid,
        parentId: parentId ?? this.parentId,
        title: title ?? this.title,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _CategoryItemResponse &&
        other.id == id &&
        other.iid == iid &&
        other.parentId == parentId &&
        other.title == title &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, iid, parentId, title, description, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return CategoryItemResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvQueryRequest extends _ConvQueryRequest {
  ConvQueryRequest(
      {this.id, this.base, this.term, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final String term;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvQueryRequest copyWith(
      {String id,
      _APIRequestBase base,
      String term,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvQueryRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        term: term ?? this.term,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvQueryRequest &&
        other.id == id &&
        other.base == base &&
        other.term == term &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, term, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvQueryResponse extends _ConvQueryResponse {
  ConvQueryResponse(
      {this.id,
      this.base,
      List<_ConvQueryConvItemResponse> convs,
      this.createdAt,
      this.updatedAt})
      : this.convs = new List.unmodifiable(convs ?? []);

  @override
  final String id;

  @override
  final _APIResponseBase base;

  @override
  final List<_ConvQueryConvItemResponse> convs;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvQueryResponse copyWith(
      {String id,
      _APIResponseBase base,
      List<_ConvQueryConvItemResponse> convs,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvQueryResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        convs: convs ?? this.convs,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvQueryResponse &&
        other.id == id &&
        other.base == base &&
        const ListEquality<_ConvQueryConvItemResponse>(
                const DefaultEquality<_ConvQueryConvItemResponse>())
            .equals(other.convs, convs) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, convs, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvQueryConvItemResponse extends _ConvQueryConvItemResponse {
  ConvQueryConvItemResponse(
      {this.id,
      this.convId,
      this.hitText,
      List<_ConvQueryPostItemResponse> posts,
      this.createdAt,
      this.updatedAt})
      : this.posts = new List.unmodifiable(posts ?? []);

  @override
  final String id;

  @override
  final int convId;

  @override
  final String hitText;

  @override
  final List<_ConvQueryPostItemResponse> posts;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvQueryConvItemResponse copyWith(
      {String id,
      int convId,
      String hitText,
      List<_ConvQueryPostItemResponse> posts,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvQueryConvItemResponse(
        id: id ?? this.id,
        convId: convId ?? this.convId,
        hitText: hitText ?? this.hitText,
        posts: posts ?? this.posts,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvQueryConvItemResponse &&
        other.id == id &&
        other.convId == convId &&
        other.hitText == hitText &&
        const ListEquality<_ConvQueryPostItemResponse>(
                const DefaultEquality<_ConvQueryPostItemResponse>())
            .equals(other.posts, posts) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, convId, hitText, posts, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvQueryConvItemResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvQueryPostItemResponse extends _ConvQueryPostItemResponse {
  ConvQueryPostItemResponse(
      {this.id, this.postId, this.hitText, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final String postId;

  @override
  final String hitText;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvQueryPostItemResponse copyWith(
      {String id,
      String postId,
      String hitText,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvQueryPostItemResponse(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        hitText: hitText ?? this.hitText,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvQueryPostItemResponse &&
        other.id == id &&
        other.postId == postId &&
        other.hitText == hitText &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, postId, hitText, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvQueryPostItemResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvGetRequest extends _ConvGetRequest {
  ConvGetRequest(
      {this.id,
      this.base,
      this.convId,
      this.mode,
      this.rangeFromWDT,
      this.rangeToWDT,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvGetRequest copyWith(
      {String id,
      _APIRequestBase base,
      int convId,
      String mode,
      String rangeFromWDT,
      String rangeToWDT,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvGetRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        convId: convId ?? this.convId,
        mode: mode ?? this.mode,
        rangeFromWDT: rangeFromWDT ?? this.rangeFromWDT,
        rangeToWDT: rangeToWDT ?? this.rangeToWDT,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvGetRequest &&
        other.id == id &&
        other.base == base &&
        other.convId == convId &&
        other.mode == mode &&
        other.rangeFromWDT == rangeFromWDT &&
        other.rangeToWDT == rangeToWDT &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      convId,
      mode,
      rangeFromWDT,
      rangeToWDT,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ConvGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvGetResponse extends _ConvGetResponse {
  ConvGetResponse(
      {this.id,
      this.base,
      this.isManager,
      this.isJoined,
      this.readPositionWDT,
      this.title,
      this.anySkipped,
      List<_ConvGetPostItem> posts,
      this.replyAllowed,
      this.replyAllowedDesc,
      this.replyMaxLength,
      this.deleteMessage,
      this.like,
      this.bookmarked,
      this.parentTitle,
      this.parentPaneKey,
      this.createdAt,
      this.updatedAt})
      : this.posts = new List.unmodifiable(posts ?? []);

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvGetResponse copyWith(
      {String id,
      _APIResponseBase base,
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
      String parentPaneKey,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvGetResponse(
        id: id ?? this.id,
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
        parentPaneKey: parentPaneKey ?? this.parentPaneKey,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvGetResponse &&
        other.id == id &&
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
        other.parentPaneKey == parentPaneKey &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
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
      parentPaneKey,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ConvGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvGetPostItem extends _ConvGetPostItem {
  ConvGetPostItem(
      {this.id,
      this.iid,
      this.authorId,
      this.authorNick,
      this.avatarUrl,
      this.createdAtReadable,
      this.createdAtWDT,
      this.ago,
      this.ptext,
      this.imageUrl,
      this.collapseMode,
      this.collapsePosition,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvGetPostItem copyWith(
      {String id,
      String iid,
      int authorId,
      String authorNick,
      String avatarUrl,
      String createdAtReadable,
      String createdAtWDT,
      String ago,
      String ptext,
      String imageUrl,
      String collapseMode,
      int collapsePosition,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvGetPostItem(
        id: id ?? this.id,
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
        collapsePosition: collapsePosition ?? this.collapsePosition,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvGetPostItem &&
        other.id == id &&
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
        other.collapsePosition == collapsePosition &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
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
      collapsePosition,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ConvGetPostItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvGetRulesRequest extends _ConvGetRulesRequest {
  ConvGetRulesRequest(
      {this.id, this.base, this.convId, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int convId;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvGetRulesRequest copyWith(
      {String id,
      _APIRequestBase base,
      int convId,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvGetRulesRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        convId: convId ?? this.convId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvGetRulesRequest &&
        other.id == id &&
        other.base == base &&
        other.convId == convId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, convId, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvGetRulesRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvGetRulesResponse extends _ConvGetRulesResponse {
  ConvGetRulesResponse(
      {this.id,
      this.base,
      this.postMaxSize,
      this.userDailyMax,
      this.title,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIResponseBase base;

  @override
  final int postMaxSize;

  @override
  final int userDailyMax;

  @override
  final String title;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvGetRulesResponse copyWith(
      {String id,
      _APIResponseBase base,
      int postMaxSize,
      int userDailyMax,
      String title,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvGetRulesResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        postMaxSize: postMaxSize ?? this.postMaxSize,
        userDailyMax: userDailyMax ?? this.userDailyMax,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvGetRulesResponse &&
        other.id == id &&
        other.base == base &&
        other.postMaxSize == postMaxSize &&
        other.userDailyMax == userDailyMax &&
        other.title == title &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, base, postMaxSize, userDailyMax, title, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvGetRulesResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvSaveRequest extends _ConvSaveRequest {
  ConvSaveRequest(
      {this.id,
      this.base,
      this.convId,
      this.projectId,
      this.eventId,
      this.fromConvId,
      this.openingPostId,
      this.title,
      this.postMaxSize,
      this.userDailyMax,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int convId,
      int projectId,
      int eventId,
      int fromConvId,
      String openingPostId,
      String title,
      int postMaxSize,
      int userDailyMax,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        convId: convId ?? this.convId,
        projectId: projectId ?? this.projectId,
        eventId: eventId ?? this.eventId,
        fromConvId: fromConvId ?? this.fromConvId,
        openingPostId: openingPostId ?? this.openingPostId,
        title: title ?? this.title,
        postMaxSize: postMaxSize ?? this.postMaxSize,
        userDailyMax: userDailyMax ?? this.userDailyMax,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.convId == convId &&
        other.projectId == projectId &&
        other.eventId == eventId &&
        other.fromConvId == fromConvId &&
        other.openingPostId == openingPostId &&
        other.title == title &&
        other.postMaxSize == postMaxSize &&
        other.userDailyMax == userDailyMax &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      convId,
      projectId,
      eventId,
      fromConvId,
      openingPostId,
      title,
      postMaxSize,
      userDailyMax,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ConvSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvPostGetRequest extends _ConvPostGetRequest {
  ConvPostGetRequest(
      {this.id, this.base, this.postId, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final String postId;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvPostGetRequest copyWith(
      {String id,
      _APIRequestBase base,
      String postId,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvPostGetRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        postId: postId ?? this.postId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvPostGetRequest &&
        other.id == id &&
        other.base == base &&
        other.postId == postId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, postId, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvPostGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvPostGetResponse extends _ConvPostGetResponse {
  ConvPostGetResponse(
      {this.id,
      this.base,
      this.avatarUrl,
      this.createdAtReadable,
      this.reaction,
      this.throttleDescription,
      this.canCensor,
      this.allReasons,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvPostGetResponse copyWith(
      {String id,
      _APIResponseBase base,
      String avatarUrl,
      String createdAtReadable,
      String reaction,
      String throttleDescription,
      String canCensor,
      String allReasons,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvPostGetResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        createdAtReadable: createdAtReadable ?? this.createdAtReadable,
        reaction: reaction ?? this.reaction,
        throttleDescription: throttleDescription ?? this.throttleDescription,
        canCensor: canCensor ?? this.canCensor,
        allReasons: allReasons ?? this.allReasons,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvPostGetResponse &&
        other.id == id &&
        other.base == base &&
        other.avatarUrl == avatarUrl &&
        other.createdAtReadable == createdAtReadable &&
        other.reaction == reaction &&
        other.throttleDescription == throttleDescription &&
        other.canCensor == canCensor &&
        other.allReasons == allReasons &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      avatarUrl,
      createdAtReadable,
      reaction,
      throttleDescription,
      canCensor,
      allReasons,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ConvPostGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvPostSaveRequest extends _ConvPostSaveRequest {
  ConvPostSaveRequest(
      {this.id,
      this.base,
      this.convId,
      this.postId,
      this.triggerWarning,
      this.ptext,
      this.censored,
      this.delete,
      this.lastKnownWDT,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvPostSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int convId,
      String postId,
      String triggerWarning,
      String ptext,
      String censored,
      String delete,
      String lastKnownWDT,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvPostSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        convId: convId ?? this.convId,
        postId: postId ?? this.postId,
        triggerWarning: triggerWarning ?? this.triggerWarning,
        ptext: ptext ?? this.ptext,
        censored: censored ?? this.censored,
        delete: delete ?? this.delete,
        lastKnownWDT: lastKnownWDT ?? this.lastKnownWDT,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvPostSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.convId == convId &&
        other.postId == postId &&
        other.triggerWarning == triggerWarning &&
        other.ptext == ptext &&
        other.censored == censored &&
        other.delete == delete &&
        other.lastKnownWDT == lastKnownWDT &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      convId,
      postId,
      triggerWarning,
      ptext,
      censored,
      delete,
      lastKnownWDT,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ConvPostSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvPostImageSaveRequest extends _ConvPostImageSaveRequest {
  ConvPostImageSaveRequest(
      {this.id,
      this.base,
      this.convId,
      this.ptext,
      List<int> imageBytes,
      this.createdAt,
      this.updatedAt})
      : this.imageBytes = new List.unmodifiable(imageBytes ?? []);

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int convId;

  @override
  final String ptext;

  @override
  final List<int> imageBytes;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvPostImageSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int convId,
      String ptext,
      List<int> imageBytes,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvPostImageSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        convId: convId ?? this.convId,
        ptext: ptext ?? this.ptext,
        imageBytes: imageBytes ?? this.imageBytes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvPostImageSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.convId == convId &&
        other.ptext == ptext &&
        const ListEquality<int>(const DefaultEquality<int>())
            .equals(other.imageBytes, imageBytes) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, base, convId, ptext, imageBytes, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvPostImageSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvPostUserSaveRequest extends _ConvPostUserSaveRequest {
  ConvPostUserSaveRequest(
      {this.id,
      this.base,
      this.postId,
      this.reaction,
      this.reason,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final String postId;

  @override
  final String reaction;

  @override
  final String reason;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvPostUserSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      String postId,
      String reaction,
      String reason,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvPostUserSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        postId: postId ?? this.postId,
        reaction: reaction ?? this.reaction,
        reason: reason ?? this.reason,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvPostUserSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.postId == postId &&
        other.reaction == reaction &&
        other.reason == reason &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, base, postId, reaction, reason, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvPostUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvSetReadPositionRequest extends _ConvSetReadPositionRequest {
  ConvSetReadPositionRequest(
      {this.id,
      this.base,
      this.convId,
      this.positionWDT,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int convId;

  @override
  final String positionWDT;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvSetReadPositionRequest copyWith(
      {String id,
      _APIRequestBase base,
      int convId,
      String positionWDT,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvSetReadPositionRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        convId: convId ?? this.convId,
        positionWDT: positionWDT ?? this.positionWDT,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvSetReadPositionRequest &&
        other.id == id &&
        other.base == base &&
        other.convId == convId &&
        other.positionWDT == positionWDT &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, convId, positionWDT, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvSetReadPositionRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvUserSaveRequest extends _ConvUserSaveRequest {
  ConvUserSaveRequest(
      {this.id,
      this.base,
      this.convId,
      this.status,
      this.like,
      this.bookmarked,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvUserSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int convId,
      String status,
      String like,
      String bookmarked,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvUserSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        convId: convId ?? this.convId,
        status: status ?? this.status,
        like: like ?? this.like,
        bookmarked: bookmarked ?? this.bookmarked,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvUserSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.convId == convId &&
        other.status == status &&
        other.like == like &&
        other.bookmarked == bookmarked &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, base, convId, status, like, bookmarked, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ConvUserSaveResponse extends _ConvUserSaveResponse {
  ConvUserSaveResponse(
      {this.id, this.base, this.action, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIResponseBase base;

  @override
  final String action;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ConvUserSaveResponse copyWith(
      {String id,
      _APIResponseBase base,
      String action,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ConvUserSaveResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        action: action ?? this.action,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ConvUserSaveResponse &&
        other.id == id &&
        other.base == base &&
        other.action == action &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, action, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ConvUserSaveResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class DocQueryRequest extends _DocQueryRequest {
  DocQueryRequest(
      {this.id, this.base, this.mode, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final String mode;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  DocQueryRequest copyWith(
      {String id,
      _APIRequestBase base,
      String mode,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new DocQueryRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        mode: mode ?? this.mode,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _DocQueryRequest &&
        other.id == id &&
        other.base == base &&
        other.mode == mode &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, mode, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return DocQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class DocQueryResponse extends _DocQueryResponse {
  DocQueryResponse(
      {this.id,
      this.base,
      List<_DocQueryItem> docs,
      this.createdAt,
      this.updatedAt})
      : this.docs = new List.unmodifiable(docs ?? []);

  @override
  final String id;

  @override
  final _APIResponseBase base;

  @override
  final List<_DocQueryItem> docs;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  DocQueryResponse copyWith(
      {String id,
      _APIResponseBase base,
      List<_DocQueryItem> docs,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new DocQueryResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        docs: docs ?? this.docs,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _DocQueryResponse &&
        other.id == id &&
        other.base == base &&
        const ListEquality<_DocQueryItem>(
                const DefaultEquality<_DocQueryItem>())
            .equals(other.docs, docs) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, docs, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return DocQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class DocQueryItem extends _DocQueryItem {
  DocQueryItem({this.id, this.iid, this.title, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final int iid;

  @override
  final String title;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  DocQueryItem copyWith(
      {String id,
      int iid,
      String title,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new DocQueryItem(
        id: id ?? this.id,
        iid: iid ?? this.iid,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _DocQueryItem &&
        other.id == id &&
        other.iid == iid &&
        other.title == title &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, iid, title, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return DocQueryItemSerializer.toMap(this);
  }
}

@generatedSerializable
class DocGetRequest extends _DocGetRequest {
  DocGetRequest(
      {this.id,
      this.base,
      this.docId,
      this.specialCode,
      this.revisionNo,
      this.getVerList,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  DocGetRequest copyWith(
      {String id,
      _APIRequestBase base,
      int docId,
      String specialCode,
      int revisionNo,
      String getVerList,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new DocGetRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        docId: docId ?? this.docId,
        specialCode: specialCode ?? this.specialCode,
        revisionNo: revisionNo ?? this.revisionNo,
        getVerList: getVerList ?? this.getVerList,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _DocGetRequest &&
        other.id == id &&
        other.base == base &&
        other.docId == docId &&
        other.specialCode == specialCode &&
        other.revisionNo == revisionNo &&
        other.getVerList == getVerList &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      docId,
      specialCode,
      revisionNo,
      getVerList,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return DocGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class DocGetResponse extends _DocGetResponse {
  DocGetResponse(
      {this.id,
      this.base,
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
      List<_DocGetVersionItem> verList,
      this.createdAt,
      this.updatedAt})
      : this.verList = new List.unmodifiable(verList ?? []);

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  DocGetResponse copyWith(
      {String id,
      _APIResponseBase base,
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
      List<_DocGetVersionItem> verList,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new DocGetResponse(
        id: id ?? this.id,
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
        verList: verList ?? this.verList,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _DocGetResponse &&
        other.id == id &&
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
            .equals(other.verList, verList) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
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
      verList,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return DocGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class DocGetVersionItem extends _DocGetVersionItem {
  DocGetVersionItem(
      {this.id,
      this.revisionNo,
      this.createdAtR,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final int revisionNo;

  @override
  final String createdAtR;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  DocGetVersionItem copyWith(
      {String id,
      int revisionNo,
      String createdAtR,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new DocGetVersionItem(
        id: id ?? this.id,
        revisionNo: revisionNo ?? this.revisionNo,
        createdAtR: createdAtR ?? this.createdAtR,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _DocGetVersionItem &&
        other.id == id &&
        other.revisionNo == revisionNo &&
        other.createdAtR == createdAtR &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, revisionNo, createdAtR, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return DocGetVersionItemSerializer.toMap(this);
  }
}

@generatedSerializable
class DocSaveRequest extends _DocSaveRequest {
  DocSaveRequest(
      {this.id,
      this.base,
      this.docId,
      this.projectId,
      this.title,
      this.retitleMode,
      this.body,
      this.summary,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  DocSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int docId,
      int projectId,
      String title,
      String retitleMode,
      String body,
      String summary,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new DocSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        docId: docId ?? this.docId,
        projectId: projectId ?? this.projectId,
        title: title ?? this.title,
        retitleMode: retitleMode ?? this.retitleMode,
        body: body ?? this.body,
        summary: summary ?? this.summary,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _DocSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.docId == docId &&
        other.projectId == projectId &&
        other.title == title &&
        other.retitleMode == retitleMode &&
        other.body == body &&
        other.summary == summary &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      docId,
      projectId,
      title,
      retitleMode,
      body,
      summary,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return DocSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class DocRollbackRequest extends _DocRollbackRequest {
  DocRollbackRequest(
      {this.id,
      this.base,
      this.docId,
      this.revisionNo,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int docId;

  @override
  final int revisionNo;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  DocRollbackRequest copyWith(
      {String id,
      _APIRequestBase base,
      int docId,
      int revisionNo,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new DocRollbackRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        docId: docId ?? this.docId,
        revisionNo: revisionNo ?? this.revisionNo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _DocRollbackRequest &&
        other.id == id &&
        other.base == base &&
        other.docId == docId &&
        other.revisionNo == revisionNo &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, docId, revisionNo, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return DocRollbackRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class EventQueryRequest extends _EventQueryRequest {
  EventQueryRequest(
      {this.id,
      this.base,
      this.title,
      this.dateFrom,
      this.dateTo,
      this.miles,
      this.lat,
      this.lon,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  EventQueryRequest copyWith(
      {String id,
      _APIRequestBase base,
      String title,
      String dateFrom,
      String dateTo,
      int miles,
      String lat,
      String lon,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new EventQueryRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        title: title ?? this.title,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        miles: miles ?? this.miles,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _EventQueryRequest &&
        other.id == id &&
        other.base == base &&
        other.title == title &&
        other.dateFrom == dateFrom &&
        other.dateTo == dateTo &&
        other.miles == miles &&
        other.lat == lat &&
        other.lon == lon &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      title,
      dateFrom,
      dateTo,
      miles,
      lat,
      lon,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return EventQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class EventQueryResponse extends _EventQueryResponse {
  EventQueryResponse(
      {this.id,
      this.base,
      List<_EventItemResponse> events,
      this.createdAt,
      this.updatedAt})
      : this.events = new List.unmodifiable(events ?? []);

  @override
  final String id;

  @override
  final _APIResponseBase base;

  @override
  final List<_EventItemResponse> events;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  EventQueryResponse copyWith(
      {String id,
      _APIResponseBase base,
      List<_EventItemResponse> events,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new EventQueryResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        events: events ?? this.events,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _EventQueryResponse &&
        other.id == id &&
        other.base == base &&
        const ListEquality<_EventItemResponse>(
                const DefaultEquality<_EventItemResponse>())
            .equals(other.events, events) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, events, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return EventQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class EventItemResponse extends _EventItemResponse {
  EventItemResponse(
      {this.id,
      this.iid,
      this.title,
      this.startTime,
      this.creatorNick,
      this.creatorId,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  EventItemResponse copyWith(
      {String id,
      int iid,
      String title,
      String startTime,
      String creatorNick,
      int creatorId,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new EventItemResponse(
        id: id ?? this.id,
        iid: iid ?? this.iid,
        title: title ?? this.title,
        startTime: startTime ?? this.startTime,
        creatorNick: creatorNick ?? this.creatorNick,
        creatorId: creatorId ?? this.creatorId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _EventItemResponse &&
        other.id == id &&
        other.iid == iid &&
        other.title == title &&
        other.startTime == startTime &&
        other.creatorNick == creatorNick &&
        other.creatorId == creatorId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      iid,
      title,
      startTime,
      creatorNick,
      creatorId,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return EventItemResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class EventRequest extends _EventRequest {
  EventRequest(
      {this.id, this.base, this.eventId, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int eventId;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  EventRequest copyWith(
      {String id,
      _APIRequestBase base,
      int eventId,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new EventRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        eventId: eventId ?? this.eventId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _EventRequest &&
        other.id == id &&
        other.base == base &&
        other.eventId == eventId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, eventId, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return EventRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class EventGetResponse extends _EventGetResponse {
  EventGetResponse(
      {this.id,
      this.base,
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
      List<_EventGetUserResponse> users,
      List<_EventGetConvResponse> convs,
      this.isCreator,
      this.createdAt,
      this.updatedAt})
      : this.users = new List.unmodifiable(users ?? []),
        this.convs = new List.unmodifiable(convs ?? []);

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  EventGetResponse copyWith(
      {String id,
      _APIResponseBase base,
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
      String isCreator,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new EventGetResponse(
        id: id ?? this.id,
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
        isCreator: isCreator ?? this.isCreator,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _EventGetResponse &&
        other.id == id &&
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
        other.isCreator == isCreator &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
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
      isCreator,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return EventGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class EventGetUserResponse extends _EventGetUserResponse {
  EventGetUserResponse(
      {this.id,
      this.userId,
      this.nick,
      this.publicName,
      this.avatarUrl,
      this.status,
      this.statusDesc,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  EventGetUserResponse copyWith(
      {String id,
      int userId,
      String nick,
      String publicName,
      String avatarUrl,
      String status,
      String statusDesc,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new EventGetUserResponse(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        nick: nick ?? this.nick,
        publicName: publicName ?? this.publicName,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        status: status ?? this.status,
        statusDesc: statusDesc ?? this.statusDesc,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _EventGetUserResponse &&
        other.id == id &&
        other.userId == userId &&
        other.nick == nick &&
        other.publicName == publicName &&
        other.avatarUrl == avatarUrl &&
        other.status == status &&
        other.statusDesc == statusDesc &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      userId,
      nick,
      publicName,
      avatarUrl,
      status,
      statusDesc,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return EventGetUserResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class EventGetConvResponse extends _EventGetConvResponse {
  EventGetConvResponse(
      {this.id,
      this.iid,
      this.open,
      this.title,
      this.lastActivity,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final int iid;

  @override
  final String open;

  @override
  final String title;

  @override
  final String lastActivity;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  EventGetConvResponse copyWith(
      {String id,
      int iid,
      String open,
      String title,
      String lastActivity,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new EventGetConvResponse(
        id: id ?? this.id,
        iid: iid ?? this.iid,
        open: open ?? this.open,
        title: title ?? this.title,
        lastActivity: lastActivity ?? this.lastActivity,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _EventGetConvResponse &&
        other.id == id &&
        other.iid == iid &&
        other.open == open &&
        other.title == title &&
        other.lastActivity == lastActivity &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, iid, open, title, lastActivity, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return EventGetConvResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class EventSaveRequest extends _EventSaveRequest {
  EventSaveRequest(
      {this.id,
      this.base,
      this.eventId,
      this.title,
      this.description,
      this.duration,
      this.location,
      this.startTime,
      this.lat,
      this.lon,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  EventSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int eventId,
      String title,
      String description,
      String duration,
      String location,
      String startTime,
      String lat,
      String lon,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new EventSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        eventId: eventId ?? this.eventId,
        title: title ?? this.title,
        description: description ?? this.description,
        duration: duration ?? this.duration,
        location: location ?? this.location,
        startTime: startTime ?? this.startTime,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _EventSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.eventId == eventId &&
        other.title == title &&
        other.description == description &&
        other.duration == duration &&
        other.location == location &&
        other.startTime == startTime &&
        other.lat == lat &&
        other.lon == lon &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      eventId,
      title,
      description,
      duration,
      location,
      startTime,
      lat,
      lon,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return EventSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class EventUserSaveRequest extends _EventUserSaveRequest {
  EventUserSaveRequest(
      {this.id,
      this.base,
      this.eventId,
      this.status,
      this.statusDesc,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int eventId;

  @override
  final String status;

  @override
  final String statusDesc;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  EventUserSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int eventId,
      String status,
      String statusDesc,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new EventUserSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        eventId: eventId ?? this.eventId,
        status: status ?? this.status,
        statusDesc: statusDesc ?? this.statusDesc,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _EventUserSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.eventId == eventId &&
        other.status == status &&
        other.statusDesc == statusDesc &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, base, eventId, status, statusDesc, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return EventUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectQueryRequest extends _ProjectQueryRequest {
  ProjectQueryRequest(
      {this.id,
      this.base,
      this.catId,
      this.title,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int catId;

  @override
  final String title;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectQueryRequest copyWith(
      {String id,
      _APIRequestBase base,
      int catId,
      String title,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectQueryRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        catId: catId ?? this.catId,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectQueryRequest &&
        other.id == id &&
        other.base == base &&
        other.catId == catId &&
        other.title == title &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, catId, title, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProjectQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectQueryResponse extends _ProjectQueryResponse {
  ProjectQueryResponse(
      {this.id,
      this.base,
      List<_ProjectQueryItem> projects,
      this.createdAt,
      this.updatedAt})
      : this.projects = new List.unmodifiable(projects ?? []);

  @override
  final String id;

  @override
  final _APIResponseBase base;

  @override
  final List<_ProjectQueryItem> projects;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectQueryResponse copyWith(
      {String id,
      _APIResponseBase base,
      List<_ProjectQueryItem> projects,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectQueryResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        projects: projects ?? this.projects,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectQueryResponse &&
        other.id == id &&
        other.base == base &&
        const ListEquality<_ProjectQueryItem>(
                const DefaultEquality<_ProjectQueryItem>())
            .equals(other.projects, projects) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, projects, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProjectQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectQueryItem extends _ProjectQueryItem {
  ProjectQueryItem(
      {this.id,
      this.projectId,
      this.title,
      this.description,
      this.leadership,
      this.privacy,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectQueryItem copyWith(
      {String id,
      int projectId,
      String title,
      String description,
      String leadership,
      String privacy,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectQueryItem(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        title: title ?? this.title,
        description: description ?? this.description,
        leadership: leadership ?? this.leadership,
        privacy: privacy ?? this.privacy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectQueryItem &&
        other.id == id &&
        other.projectId == projectId &&
        other.title == title &&
        other.description == description &&
        other.leadership == leadership &&
        other.privacy == privacy &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      projectId,
      title,
      description,
      leadership,
      privacy,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ProjectQueryItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectGetRequest extends _ProjectGetRequest {
  ProjectGetRequest(
      {this.id, this.base, this.projectId, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int projectId;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectGetRequest copyWith(
      {String id,
      _APIRequestBase base,
      int projectId,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectGetRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        projectId: projectId ?? this.projectId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectGetRequest &&
        other.id == id &&
        other.base == base &&
        other.projectId == projectId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, projectId, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProjectGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectGetResponse extends _ProjectGetResponse {
  ProjectGetResponse(
      {this.id,
      this.base,
      this.active,
      this.leadership,
      this.privacy,
      this.title,
      this.description,
      this.categoryId,
      this.userKind,
      List<_ProjectProposalItem> proposals,
      List<_ProjectConvItem> convs,
      List<_ProjectDocItem> docs,
      this.createdAt,
      this.updatedAt})
      : this.proposals = new List.unmodifiable(proposals ?? []),
        this.convs = new List.unmodifiable(convs ?? []),
        this.docs = new List.unmodifiable(docs ?? []);

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectGetResponse copyWith(
      {String id,
      _APIResponseBase base,
      String active,
      String leadership,
      String privacy,
      String title,
      String description,
      int categoryId,
      String userKind,
      List<_ProjectProposalItem> proposals,
      List<_ProjectConvItem> convs,
      List<_ProjectDocItem> docs,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectGetResponse(
        id: id ?? this.id,
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
        docs: docs ?? this.docs,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectGetResponse &&
        other.id == id &&
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
            .equals(other.docs, docs) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
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
      docs,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ProjectGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectProposalItem extends _ProjectProposalItem {
  ProjectProposalItem(
      {this.id,
      this.iid,
      this.active,
      this.title,
      this.createdAtR,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final int iid;

  @override
  final String active;

  @override
  final String title;

  @override
  final String createdAtR;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectProposalItem copyWith(
      {String id,
      int iid,
      String active,
      String title,
      String createdAtR,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectProposalItem(
        id: id ?? this.id,
        iid: iid ?? this.iid,
        active: active ?? this.active,
        title: title ?? this.title,
        createdAtR: createdAtR ?? this.createdAtR,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectProposalItem &&
        other.id == id &&
        other.iid == iid &&
        other.active == active &&
        other.title == title &&
        other.createdAtR == createdAtR &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, iid, active, title, createdAtR, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProjectProposalItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectConvItem extends _ProjectConvItem {
  ProjectConvItem(
      {this.id,
      this.iid,
      this.open,
      this.title,
      this.lastActivity,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final int iid;

  @override
  final String open;

  @override
  final String title;

  @override
  final String lastActivity;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectConvItem copyWith(
      {String id,
      int iid,
      String open,
      String title,
      String lastActivity,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectConvItem(
        id: id ?? this.id,
        iid: iid ?? this.iid,
        open: open ?? this.open,
        title: title ?? this.title,
        lastActivity: lastActivity ?? this.lastActivity,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectConvItem &&
        other.id == id &&
        other.iid == iid &&
        other.open == open &&
        other.title == title &&
        other.lastActivity == lastActivity &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, iid, open, title, lastActivity, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProjectConvItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectDocItem extends _ProjectDocItem {
  ProjectDocItem(
      {this.id, this.iid, this.title, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final int iid;

  @override
  final String title;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectDocItem copyWith(
      {String id,
      int iid,
      String title,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectDocItem(
        id: id ?? this.id,
        iid: iid ?? this.iid,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectDocItem &&
        other.id == id &&
        other.iid == iid &&
        other.title == title &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, iid, title, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProjectDocItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectSaveRequest extends _ProjectSaveRequest {
  ProjectSaveRequest(
      {this.id,
      this.base,
      this.projectId,
      this.leadership,
      this.privacy,
      this.title,
      this.description,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int projectId,
      String leadership,
      String privacy,
      String title,
      String description,
      int categoryId,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        projectId: projectId ?? this.projectId,
        leadership: leadership ?? this.leadership,
        privacy: privacy ?? this.privacy,
        title: title ?? this.title,
        description: description ?? this.description,
        categoryId: categoryId ?? this.categoryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.projectId == projectId &&
        other.leadership == leadership &&
        other.privacy == privacy &&
        other.title == title &&
        other.description == description &&
        other.categoryId == categoryId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      projectId,
      leadership,
      privacy,
      title,
      description,
      categoryId,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ProjectSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectUserQueryRequest extends _ProjectUserQueryRequest {
  ProjectUserQueryRequest(
      {this.id,
      this.base,
      this.projectId,
      this.name,
      this.resultPage,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int projectId;

  @override
  final String name;

  @override
  final int resultPage;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectUserQueryRequest copyWith(
      {String id,
      _APIRequestBase base,
      int projectId,
      String name,
      int resultPage,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectUserQueryRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        projectId: projectId ?? this.projectId,
        name: name ?? this.name,
        resultPage: resultPage ?? this.resultPage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectUserQueryRequest &&
        other.id == id &&
        other.base == base &&
        other.projectId == projectId &&
        other.name == name &&
        other.resultPage == resultPage &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, base, projectId, name, resultPage, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProjectUserQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectUserQueryResponse extends _ProjectUserQueryResponse {
  ProjectUserQueryResponse(
      {this.id,
      this.base,
      this.projectTitle,
      this.completeLoad,
      this.editable,
      List<_ProjectUserItem> users,
      this.createdAt,
      this.updatedAt})
      : this.users = new List.unmodifiable(users ?? []);

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectUserQueryResponse copyWith(
      {String id,
      _APIResponseBase base,
      String projectTitle,
      String completeLoad,
      String editable,
      List<_ProjectUserItem> users,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectUserQueryResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        projectTitle: projectTitle ?? this.projectTitle,
        completeLoad: completeLoad ?? this.completeLoad,
        editable: editable ?? this.editable,
        users: users ?? this.users,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectUserQueryResponse &&
        other.id == id &&
        other.base == base &&
        other.projectTitle == projectTitle &&
        other.completeLoad == completeLoad &&
        other.editable == editable &&
        const ListEquality<_ProjectUserItem>(
                const DefaultEquality<_ProjectUserItem>())
            .equals(other.users, users) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      projectTitle,
      completeLoad,
      editable,
      users,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ProjectUserQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectUserItem extends _ProjectUserItem {
  ProjectUserItem(
      {this.id,
      this.userId,
      this.kind,
      this.throttle,
      this.nick,
      this.publicName,
      this.avatarUrl,
      this.voteKind,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectUserItem copyWith(
      {String id,
      int userId,
      String kind,
      String throttle,
      String nick,
      String publicName,
      String avatarUrl,
      String voteKind,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectUserItem(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        kind: kind ?? this.kind,
        throttle: throttle ?? this.throttle,
        nick: nick ?? this.nick,
        publicName: publicName ?? this.publicName,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        voteKind: voteKind ?? this.voteKind,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectUserItem &&
        other.id == id &&
        other.userId == userId &&
        other.kind == kind &&
        other.throttle == throttle &&
        other.nick == nick &&
        other.publicName == publicName &&
        other.avatarUrl == avatarUrl &&
        other.voteKind == voteKind &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      userId,
      kind,
      throttle,
      nick,
      publicName,
      avatarUrl,
      voteKind,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ProjectUserItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectUserSaveRequest extends _ProjectUserSaveRequest {
  ProjectUserSaveRequest(
      {this.id,
      this.base,
      this.projectId,
      this.userId,
      this.kind,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int projectId;

  @override
  final int userId;

  @override
  final String kind;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectUserSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int projectId,
      int userId,
      String kind,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectUserSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        projectId: projectId ?? this.projectId,
        userId: userId ?? this.userId,
        kind: kind ?? this.kind,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectUserSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.projectId == projectId &&
        other.userId == userId &&
        other.kind == kind &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, base, projectId, userId, kind, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProjectUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProjectUserUserSaveRequest extends _ProjectUserUserSaveRequest {
  ProjectUserUserSaveRequest(
      {this.id,
      this.base,
      this.projectId,
      this.aboutId,
      this.kind,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int projectId;

  @override
  final int aboutId;

  @override
  final String kind;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProjectUserUserSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int projectId,
      int aboutId,
      String kind,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProjectUserUserSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        projectId: projectId ?? this.projectId,
        aboutId: aboutId ?? this.aboutId,
        kind: kind ?? this.kind,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProjectUserUserSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.projectId == projectId &&
        other.aboutId == aboutId &&
        other.kind == kind &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, base, projectId, aboutId, kind, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProjectUserUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalQueryRequest extends _ProposalQueryRequest {
  ProposalQueryRequest(
      {this.id,
      this.base,
      this.mode,
      this.year,
      this.projectId,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final String mode;

  @override
  final int year;

  @override
  final int projectId;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProposalQueryRequest copyWith(
      {String id,
      _APIRequestBase base,
      String mode,
      int year,
      int projectId,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProposalQueryRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        mode: mode ?? this.mode,
        year: year ?? this.year,
        projectId: projectId ?? this.projectId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProposalQueryRequest &&
        other.id == id &&
        other.base == base &&
        other.mode == mode &&
        other.year == year &&
        other.projectId == projectId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, mode, year, projectId, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProposalQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalQueryResponse extends _ProposalQueryResponse {
  ProposalQueryResponse(
      {this.id,
      this.base,
      List<_ProposalQueryItem> items,
      this.createdAt,
      this.updatedAt})
      : this.items = new List.unmodifiable(items ?? []);

  @override
  final String id;

  @override
  final _APIResponseBase base;

  @override
  final List<_ProposalQueryItem> items;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProposalQueryResponse copyWith(
      {String id,
      _APIResponseBase base,
      List<_ProposalQueryItem> items,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProposalQueryResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        items: items ?? this.items,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProposalQueryResponse &&
        other.id == id &&
        other.base == base &&
        const ListEquality<_ProposalQueryItem>(
                const DefaultEquality<_ProposalQueryItem>())
            .equals(other.items, items) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, items, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProposalQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalQueryItem extends _ProposalQueryItem {
  ProposalQueryItem(
      {this.id,
      this.iid,
      this.title,
      this.kind,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final int iid;

  @override
  final String title;

  @override
  final String kind;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProposalQueryItem copyWith(
      {String id,
      int iid,
      String title,
      String kind,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProposalQueryItem(
        id: id ?? this.id,
        iid: iid ?? this.iid,
        title: title ?? this.title,
        kind: kind ?? this.kind,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProposalQueryItem &&
        other.id == id &&
        other.iid == iid &&
        other.title == title &&
        other.kind == kind &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, iid, title, kind, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProposalQueryItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalGetRequest extends _ProposalGetRequest {
  ProposalGetRequest(
      {this.id, this.base, this.proposalId, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int proposalId;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProposalGetRequest copyWith(
      {String id,
      _APIRequestBase base,
      int proposalId,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProposalGetRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        proposalId: proposalId ?? this.proposalId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProposalGetRequest &&
        other.id == id &&
        other.base == base &&
        other.proposalId == proposalId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, proposalId, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProposalGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalGetResponse extends _ProposalGetResponse {
  ProposalGetResponse(
      {this.id,
      this.base,
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
      List<_ProposalOptionItem> options,
      this.myVote,
      this.statusDescription,
      this.myEligible,
      this.createdAt,
      this.updatedAt})
      : this.options = new List.unmodifiable(options ?? []);

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProposalGetResponse copyWith(
      {String id,
      _APIResponseBase base,
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
      String myEligible,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProposalGetResponse(
        id: id ?? this.id,
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
        myEligible: myEligible ?? this.myEligible,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProposalGetResponse &&
        other.id == id &&
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
        other.myEligible == myEligible &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
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
      myEligible,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ProposalGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalOptionItem extends _ProposalOptionItem {
  ProposalOptionItem(
      {this.id,
      this.optionNo,
      this.voteCount,
      this.optionDesc,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final int optionNo;

  @override
  final int voteCount;

  @override
  final String optionDesc;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProposalOptionItem copyWith(
      {String id,
      int optionNo,
      int voteCount,
      String optionDesc,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProposalOptionItem(
        id: id ?? this.id,
        optionNo: optionNo ?? this.optionNo,
        voteCount: voteCount ?? this.voteCount,
        optionDesc: optionDesc ?? this.optionDesc,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProposalOptionItem &&
        other.id == id &&
        other.optionNo == optionNo &&
        other.voteCount == voteCount &&
        other.optionDesc == optionDesc &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, optionNo, voteCount, optionDesc, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProposalOptionItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalSaveRequest extends _ProposalSaveRequest {
  ProposalSaveRequest(
      {this.id,
      this.base,
      this.kind,
      this.projectId,
      this.eligible,
      this.title,
      this.summary,
      this.days,
      List<String> options,
      this.createdAt,
      this.updatedAt})
      : this.options = new List.unmodifiable(options ?? []);

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProposalSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      String kind,
      int projectId,
      String eligible,
      String title,
      String summary,
      int days,
      List<String> options,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProposalSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        kind: kind ?? this.kind,
        projectId: projectId ?? this.projectId,
        eligible: eligible ?? this.eligible,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        days: days ?? this.days,
        options: options ?? this.options,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProposalSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.kind == kind &&
        other.projectId == projectId &&
        other.eligible == eligible &&
        other.title == title &&
        other.summary == summary &&
        other.days == days &&
        const ListEquality<String>(const DefaultEquality<String>())
            .equals(other.options, options) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      kind,
      projectId,
      eligible,
      title,
      summary,
      days,
      options,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ProposalSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ProposalUserSaveRequest extends _ProposalUserSaveRequest {
  ProposalUserSaveRequest(
      {this.id,
      this.base,
      this.proposalId,
      this.vote,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int proposalId;

  @override
  final int vote;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ProposalUserSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int proposalId,
      int vote,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ProposalUserSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        proposalId: proposalId ?? this.proposalId,
        vote: vote ?? this.vote,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ProposalUserSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.proposalId == proposalId &&
        other.vote == vote &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, proposalId, vote, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ProposalUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class PushQueueGetRequest extends _PushQueueGetRequest {
  PushQueueGetRequest(
      {this.id, this.base, this.depth, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final String depth;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  PushQueueGetRequest copyWith(
      {String id,
      _APIRequestBase base,
      String depth,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new PushQueueGetRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        depth: depth ?? this.depth,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _PushQueueGetRequest &&
        other.id == id &&
        other.base == base &&
        other.depth == depth &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, depth, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return PushQueueGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class PushQueueGetResponse extends _PushQueueGetResponse {
  PushQueueGetResponse(
      {this.id,
      this.base,
      List<_PushQueueItem> items,
      this.fullModeStatus,
      this.createdAt,
      this.updatedAt})
      : this.items = new List.unmodifiable(items ?? []);

  @override
  final String id;

  @override
  final _APIResponseBase base;

  @override
  final List<_PushQueueItem> items;

  @override
  final String fullModeStatus;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  PushQueueGetResponse copyWith(
      {String id,
      _APIResponseBase base,
      List<_PushQueueItem> items,
      String fullModeStatus,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new PushQueueGetResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        items: items ?? this.items,
        fullModeStatus: fullModeStatus ?? this.fullModeStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _PushQueueGetResponse &&
        other.id == id &&
        other.base == base &&
        const ListEquality<_PushQueueItem>(
                const DefaultEquality<_PushQueueItem>())
            .equals(other.items, items) &&
        other.fullModeStatus == fullModeStatus &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, items, fullModeStatus, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return PushQueueGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class PushQueueItem extends _PushQueueItem {
  PushQueueItem(
      {this.id,
      this.kind,
      this.why,
      this.iid,
      this.sid,
      this.text,
      this.linkText,
      this.linkPaneKey,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  PushQueueItem copyWith(
      {String id,
      String kind,
      String why,
      int iid,
      String sid,
      String text,
      String linkText,
      String linkPaneKey,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new PushQueueItem(
        id: id ?? this.id,
        kind: kind ?? this.kind,
        why: why ?? this.why,
        iid: iid ?? this.iid,
        sid: sid ?? this.sid,
        text: text ?? this.text,
        linkText: linkText ?? this.linkText,
        linkPaneKey: linkPaneKey ?? this.linkPaneKey,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _PushQueueItem &&
        other.id == id &&
        other.kind == kind &&
        other.why == why &&
        other.iid == iid &&
        other.sid == sid &&
        other.text == text &&
        other.linkText == linkText &&
        other.linkPaneKey == linkPaneKey &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      kind,
      why,
      iid,
      sid,
      text,
      linkText,
      linkPaneKey,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return PushQueueItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceQueryRequest extends _ResourceQueryRequest {
  ResourceQueryRequest(
      {this.id,
      this.base,
      this.categoryId,
      this.title,
      this.kind,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int categoryId;

  @override
  final String title;

  @override
  final String kind;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ResourceQueryRequest copyWith(
      {String id,
      _APIRequestBase base,
      int categoryId,
      String title,
      String kind,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ResourceQueryRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
        kind: kind ?? this.kind,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ResourceQueryRequest &&
        other.id == id &&
        other.base == base &&
        other.categoryId == categoryId &&
        other.title == title &&
        other.kind == kind &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, base, categoryId, title, kind, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ResourceQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceQueryResponse extends _ResourceQueryResponse {
  ResourceQueryResponse(
      {this.id,
      this.base,
      List<_ResourceItem> items,
      this.createdAt,
      this.updatedAt})
      : this.items = new List.unmodifiable(items ?? []);

  @override
  final String id;

  @override
  final _APIResponseBase base;

  @override
  final List<_ResourceItem> items;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ResourceQueryResponse copyWith(
      {String id,
      _APIResponseBase base,
      List<_ResourceItem> items,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ResourceQueryResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        items: items ?? this.items,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ResourceQueryResponse &&
        other.id == id &&
        other.base == base &&
        const ListEquality<_ResourceItem>(
                const DefaultEquality<_ResourceItem>())
            .equals(other.items, items) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, items, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ResourceQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceItem extends _ResourceItem {
  ResourceItem(
      {this.id,
      this.iid,
      this.title,
      this.url,
      this.description,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final int iid;

  @override
  final String title;

  @override
  final String url;

  @override
  final String description;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ResourceItem copyWith(
      {String id,
      int iid,
      String title,
      String url,
      String description,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ResourceItem(
        id: id ?? this.id,
        iid: iid ?? this.iid,
        title: title ?? this.title,
        url: url ?? this.url,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ResourceItem &&
        other.id == id &&
        other.iid == iid &&
        other.title == title &&
        other.url == url &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, iid, title, url, description, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ResourceItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceGetRequest extends _ResourceGetRequest {
  ResourceGetRequest(
      {this.id, this.base, this.iid, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int iid;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ResourceGetRequest copyWith(
      {String id,
      _APIRequestBase base,
      int iid,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ResourceGetRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        iid: iid ?? this.iid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ResourceGetRequest &&
        other.id == id &&
        other.base == base &&
        other.iid == iid &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, iid, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ResourceGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceGetResponse extends _ResourceGetResponse {
  ResourceGetResponse(
      {this.id,
      this.base,
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
      this.nick,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ResourceGetResponse copyWith(
      {String id,
      _APIResponseBase base,
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
      String nick,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ResourceGetResponse(
        id: id ?? this.id,
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
        nick: nick ?? this.nick,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ResourceGetResponse &&
        other.id == id &&
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
        other.nick == nick &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
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
      nick,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ResourceGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceSaveRequest extends _ResourceSaveRequest {
  ResourceSaveRequest(
      {this.id,
      this.base,
      this.iid,
      this.categoryId,
      this.title,
      this.description,
      this.kind,
      this.url,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ResourceSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int iid,
      int categoryId,
      String title,
      String description,
      String kind,
      String url,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ResourceSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        iid: iid ?? this.iid,
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
        description: description ?? this.description,
        kind: kind ?? this.kind,
        url: url ?? this.url,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ResourceSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.iid == iid &&
        other.categoryId == categoryId &&
        other.title == title &&
        other.description == description &&
        other.kind == kind &&
        other.url == url &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      iid,
      categoryId,
      title,
      description,
      kind,
      url,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return ResourceSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceTriageRequest extends _ResourceTriageRequest {
  ResourceTriageRequest(
      {this.id,
      this.base,
      this.iid,
      this.mode,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int iid;

  @override
  final String mode;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ResourceTriageRequest copyWith(
      {String id,
      _APIRequestBase base,
      int iid,
      String mode,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ResourceTriageRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        iid: iid ?? this.iid,
        mode: mode ?? this.mode,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ResourceTriageRequest &&
        other.id == id &&
        other.base == base &&
        other.iid == iid &&
        other.mode == mode &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, iid, mode, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ResourceTriageRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class ResourceUserSaveRequest extends _ResourceUserSaveRequest {
  ResourceUserSaveRequest(
      {this.id,
      this.base,
      this.iid,
      this.kind,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int iid;

  @override
  final String kind;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ResourceUserSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int iid,
      String kind,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new ResourceUserSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        iid: iid ?? this.iid,
        kind: kind ?? this.kind,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ResourceUserSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.iid == iid &&
        other.kind == kind &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, iid, kind, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return ResourceUserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserQueryRequest extends _UserQueryRequest {
  UserQueryRequest(
      {this.id, this.base, this.name, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final String name;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  UserQueryRequest copyWith(
      {String id,
      _APIRequestBase base,
      String name,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new UserQueryRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _UserQueryRequest &&
        other.id == id &&
        other.base == base &&
        other.name == name &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, name, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return UserQueryRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserQueryResponse extends _UserQueryResponse {
  UserQueryResponse(
      {this.id,
      this.base,
      List<_UserQueryItem> users,
      this.createdAt,
      this.updatedAt})
      : this.users = new List.unmodifiable(users ?? []);

  @override
  final String id;

  @override
  final _APIResponseBase base;

  @override
  final List<_UserQueryItem> users;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  UserQueryResponse copyWith(
      {String id,
      _APIResponseBase base,
      List<_UserQueryItem> users,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new UserQueryResponse(
        id: id ?? this.id,
        base: base ?? this.base,
        users: users ?? this.users,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _UserQueryResponse &&
        other.id == id &&
        other.base == base &&
        const ListEquality<_UserQueryItem>(
                const DefaultEquality<_UserQueryItem>())
            .equals(other.users, users) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, users, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return UserQueryResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class UserQueryItem extends _UserQueryItem {
  UserQueryItem(
      {this.id,
      this.iid,
      this.nick,
      this.kind,
      this.publicName,
      this.avatarUrl,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  UserQueryItem copyWith(
      {String id,
      int iid,
      String nick,
      String kind,
      String publicName,
      String avatarUrl,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new UserQueryItem(
        id: id ?? this.id,
        iid: iid ?? this.iid,
        nick: nick ?? this.nick,
        kind: kind ?? this.kind,
        publicName: publicName ?? this.publicName,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _UserQueryItem &&
        other.id == id &&
        other.iid == iid &&
        other.nick == nick &&
        other.kind == kind &&
        other.publicName == publicName &&
        other.avatarUrl == avatarUrl &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, iid, nick, kind, publicName, avatarUrl, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return UserQueryItemSerializer.toMap(this);
  }
}

@generatedSerializable
class UserGetRequest extends _UserGetRequest {
  UserGetRequest(
      {this.id,
      this.base,
      this.userId,
      this.includeDetail,
      this.includeEditing,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int userId;

  @override
  final String includeDetail;

  @override
  final String includeEditing;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  UserGetRequest copyWith(
      {String id,
      _APIRequestBase base,
      int userId,
      String includeDetail,
      String includeEditing,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new UserGetRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        userId: userId ?? this.userId,
        includeDetail: includeDetail ?? this.includeDetail,
        includeEditing: includeEditing ?? this.includeEditing,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _UserGetRequest &&
        other.id == id &&
        other.base == base &&
        other.userId == userId &&
        other.includeDetail == includeDetail &&
        other.includeEditing == includeEditing &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      userId,
      includeDetail,
      includeEditing,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return UserGetRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserGetResponse extends _UserGetResponse {
  UserGetResponse(
      {this.id,
      this.base,
      this.status,
      this.nick,
      this.email,
      this.kind,
      this.isSiteAdmin,
      this.publicName,
      this.prefEmailNotify,
      Map<String, String> publicLinks,
      this.timeZone,
      List<String> allTimeZones,
      this.avatarUrl,
      this.userUserKind,
      List<_APIResponseAssociation> events,
      List<_APIResponseAssociation> projects,
      List<_APIResponseAssociation> resources,
      this.createdAt,
      this.updatedAt})
      : this.publicLinks = new Map.unmodifiable(publicLinks ?? {}),
        this.allTimeZones = new List.unmodifiable(allTimeZones ?? []),
        this.events = new List.unmodifiable(events ?? []),
        this.projects = new List.unmodifiable(projects ?? []),
        this.resources = new List.unmodifiable(resources ?? []);

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  UserGetResponse copyWith(
      {String id,
      _APIResponseBase base,
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
      List<_APIResponseAssociation> resources,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new UserGetResponse(
        id: id ?? this.id,
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
        resources: resources ?? this.resources,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _UserGetResponse &&
        other.id == id &&
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
            .equals(other.resources, resources) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
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
      resources,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return UserGetResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class UserSaveRequest extends _UserSaveRequest {
  UserSaveRequest(
      {this.id,
      this.base,
      this.isNew,
      this.isDelete,
      this.saveNick,
      this.savePW,
      this.kind,
      this.email,
      this.isSiteAdmin,
      this.publicName,
      this.prefEmailNotify,
      Map<String, String> publicLinks,
      this.timeZone,
      this.createdAt,
      this.updatedAt})
      : this.publicLinks = new Map.unmodifiable(publicLinks ?? {});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  UserSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
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
      String timeZone,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new UserSaveRequest(
        id: id ?? this.id,
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
        timeZone: timeZone ?? this.timeZone,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _UserSaveRequest &&
        other.id == id &&
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
        other.timeZone == timeZone &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
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
      timeZone,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return UserSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserAvatarSaveRequest extends _UserAvatarSaveRequest {
  UserAvatarSaveRequest(
      {this.id,
      this.base,
      List<int> imageBytes,
      this.createdAt,
      this.updatedAt})
      : this.imageBytes = new List.unmodifiable(imageBytes ?? []);

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final List<int> imageBytes;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  UserAvatarSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      List<int> imageBytes,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new UserAvatarSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        imageBytes: imageBytes ?? this.imageBytes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _UserAvatarSaveRequest &&
        other.id == id &&
        other.base == base &&
        const ListEquality<int>(const DefaultEquality<int>())
            .equals(other.imageBytes, imageBytes) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, imageBytes, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return UserAvatarSaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserNotifySaveRequest extends _UserNotifySaveRequest {
  UserNotifySaveRequest(
      {this.id, this.base, this.notifyId, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final String notifyId;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  UserNotifySaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      String notifyId,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new UserNotifySaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        notifyId: notifyId ?? this.notifyId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _UserNotifySaveRequest &&
        other.id == id &&
        other.base == base &&
        other.notifyId == notifyId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, notifyId, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return UserNotifySaveRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserRecoverPasswordRequest extends _UserRecoverPasswordRequest {
  UserRecoverPasswordRequest(
      {this.id,
      this.base,
      this.recoveryNick,
      this.mode,
      this.recoveryPassword,
      this.code,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

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

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  UserRecoverPasswordRequest copyWith(
      {String id,
      _APIRequestBase base,
      String recoveryNick,
      String mode,
      String recoveryPassword,
      String code,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new UserRecoverPasswordRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        recoveryNick: recoveryNick ?? this.recoveryNick,
        mode: mode ?? this.mode,
        recoveryPassword: recoveryPassword ?? this.recoveryPassword,
        code: code ?? this.code,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _UserRecoverPasswordRequest &&
        other.id == id &&
        other.base == base &&
        other.recoveryNick == recoveryNick &&
        other.mode == mode &&
        other.recoveryPassword == recoveryPassword &&
        other.code == code &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      base,
      recoveryNick,
      mode,
      recoveryPassword,
      code,
      createdAt,
      updatedAt
    ]);
  }

  Map<String, dynamic> toJson() {
    return UserRecoverPasswordRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class UserUserSaveRequest extends _UserUserSaveRequest {
  UserUserSaveRequest(
      {this.id,
      this.base,
      this.aboutId,
      this.kind,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _APIRequestBase base;

  @override
  final int aboutId;

  @override
  final String kind;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  UserUserSaveRequest copyWith(
      {String id,
      _APIRequestBase base,
      int aboutId,
      String kind,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new UserUserSaveRequest(
        id: id ?? this.id,
        base: base ?? this.base,
        aboutId: aboutId ?? this.aboutId,
        kind: kind ?? this.kind,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _UserUserSaveRequest &&
        other.id == id &&
        other.base == base &&
        other.aboutId == aboutId &&
        other.kind == kind &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, base, aboutId, kind, createdAt, updatedAt]);
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
        id: map['id'] as String,
        nick: map['nick'] as String,
        password: map['password'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_APIRequestBase model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'nick': model.nick,
      'password': model.password,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class APIRequestBaseFields {
  static const List<String> allFields = <String>[
    id,
    nick,
    password,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String nick = 'nick';

  static const String password = 'password';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
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
        id: map['id'] as String,
        linkText: map['link_text'] as String,
        linkPaneKey: map['link_pane_key'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_APIResponseAssociation model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'link_text': model.linkText,
      'link_pane_key': model.linkPaneKey,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class APIResponseAssociationFields {
  static const List<String> allFields = <String>[
    id,
    linkText,
    linkPaneKey,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String linkText = 'link_text';

  static const String linkPaneKey = 'link_pane_key';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class AuthenticateResponseSerializer {
  static AuthenticateResponse fromMap(Map map) {
    return new AuthenticateResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        publicName: map['public_name'] as String,
        nick: map['nick'] as String,
        userId: map['user_id'] as int,
        isSiteAdmin: map['is_site_admin'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_AuthenticateResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'public_name': model.publicName,
      'nick': model.nick,
      'user_id': model.userId,
      'is_site_admin': model.isSiteAdmin,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class AuthenticateResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    publicName,
    nick,
    userId,
    isSiteAdmin,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String publicName = 'public_name';

  static const String nick = 'nick';

  static const String userId = 'user_id';

  static const String isSiteAdmin = 'is_site_admin';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class CategoryQueryRequestSerializer {
  static CategoryQueryRequest fromMap(Map map) {
    return new CategoryQueryRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        kind: map['kind'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_CategoryQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'kind': model.kind,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class CategoryQueryRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    kind,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String kind = 'kind';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class CategoryQueryResponseSerializer {
  static CategoryQueryResponse fromMap(Map map) {
    return new CategoryQueryResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        categories: map['categories'] is Iterable
            ? new List.unmodifiable(
                ((map['categories'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(CategoryItemResponseSerializer.fromMap))
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_CategoryQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'categories': model.categories
          ?.map((m) => CategoryItemResponseSerializer.toMap(m))
          ?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class CategoryQueryResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    categories,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String categories = 'categories';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class CategoryDeleteRequestSerializer {
  static CategoryDeleteRequest fromMap(Map map) {
    return new CategoryDeleteRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        catId: map['cat_id'] as int,
        kind: map['kind'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_CategoryDeleteRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'cat_id': model.catId,
      'kind': model.kind,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class CategoryDeleteRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    catId,
    kind,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String catId = 'cat_id';

  static const String kind = 'kind';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class CategorySaveRequestSerializer {
  static CategorySaveRequest fromMap(Map map) {
    return new CategorySaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        catId: map['cat_id'] as int,
        kind: map['kind'] as String,
        referenceId: map['reference_id'] as int,
        referenceMode: map['reference_mode'] as String,
        title: map['title'] as String,
        description: map['description'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_CategorySaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'cat_id': model.catId,
      'kind': model.kind,
      'reference_id': model.referenceId,
      'reference_mode': model.referenceMode,
      'title': model.title,
      'description': model.description,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class CategorySaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    catId,
    kind,
    referenceId,
    referenceMode,
    title,
    description,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String catId = 'cat_id';

  static const String kind = 'kind';

  static const String referenceId = 'reference_id';

  static const String referenceMode = 'reference_mode';

  static const String title = 'title';

  static const String description = 'description';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class CategoryMoveContentsRequestSerializer {
  static CategoryMoveContentsRequest fromMap(Map map) {
    return new CategoryMoveContentsRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        catId: map['cat_id'] as int,
        kind: map['kind'] as String,
        relatedIds: map['related_ids'] is Iterable
            ? (map['related_ids'] as Iterable).cast<int>().toList()
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_CategoryMoveContentsRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'cat_id': model.catId,
      'kind': model.kind,
      'related_ids': model.relatedIds,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class CategoryMoveContentsRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    catId,
    kind,
    relatedIds,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String catId = 'cat_id';

  static const String kind = 'kind';

  static const String relatedIds = 'related_ids';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class CategoryItemResponseSerializer {
  static CategoryItemResponse fromMap(Map map) {
    return new CategoryItemResponse(
        id: map['id'] as String,
        iid: map['iid'] as int,
        parentId: map['parent_id'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_CategoryItemResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'iid': model.iid,
      'parent_id': model.parentId,
      'title': model.title,
      'description': model.description,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class CategoryItemResponseFields {
  static const List<String> allFields = <String>[
    id,
    iid,
    parentId,
    title,
    description,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String iid = 'iid';

  static const String parentId = 'parent_id';

  static const String title = 'title';

  static const String description = 'description';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvQueryRequestSerializer {
  static ConvQueryRequest fromMap(Map map) {
    return new ConvQueryRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        term: map['term'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'term': model.term,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvQueryRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    term,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String term = 'term';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvQueryResponseSerializer {
  static ConvQueryResponse fromMap(Map map) {
    return new ConvQueryResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convs: map['convs'] is Iterable
            ? new List.unmodifiable(
                ((map['convs'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ConvQueryConvItemResponseSerializer.fromMap))
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'convs': model.convs
          ?.map((m) => ConvQueryConvItemResponseSerializer.toMap(m))
          ?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvQueryResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    convs,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String convs = 'convs';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvQueryConvItemResponseSerializer {
  static ConvQueryConvItemResponse fromMap(Map map) {
    return new ConvQueryConvItemResponse(
        id: map['id'] as String,
        convId: map['conv_id'] as int,
        hitText: map['hit_text'] as String,
        posts: map['posts'] is Iterable
            ? new List.unmodifiable(
                ((map['posts'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ConvQueryPostItemResponseSerializer.fromMap))
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvQueryConvItemResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'conv_id': model.convId,
      'hit_text': model.hitText,
      'posts': model.posts
          ?.map((m) => ConvQueryPostItemResponseSerializer.toMap(m))
          ?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvQueryConvItemResponseFields {
  static const List<String> allFields = <String>[
    id,
    convId,
    hitText,
    posts,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String convId = 'conv_id';

  static const String hitText = 'hit_text';

  static const String posts = 'posts';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvQueryPostItemResponseSerializer {
  static ConvQueryPostItemResponse fromMap(Map map) {
    return new ConvQueryPostItemResponse(
        id: map['id'] as String,
        postId: map['post_id'] as String,
        hitText: map['hit_text'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvQueryPostItemResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'post_id': model.postId,
      'hit_text': model.hitText,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvQueryPostItemResponseFields {
  static const List<String> allFields = <String>[
    id,
    postId,
    hitText,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String postId = 'post_id';

  static const String hitText = 'hit_text';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvGetRequestSerializer {
  static ConvGetRequest fromMap(Map map) {
    return new ConvGetRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        mode: map['mode'] as String,
        rangeFromWDT: map['range_from_w_d_t'] as String,
        rangeToWDT: map['range_to_w_d_t'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'mode': model.mode,
      'range_from_w_d_t': model.rangeFromWDT,
      'range_to_w_d_t': model.rangeToWDT,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvGetRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    convId,
    mode,
    rangeFromWDT,
    rangeToWDT,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String mode = 'mode';

  static const String rangeFromWDT = 'range_from_w_d_t';

  static const String rangeToWDT = 'range_to_w_d_t';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvGetResponseSerializer {
  static ConvGetResponse fromMap(Map map) {
    return new ConvGetResponse(
        id: map['id'] as String,
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
        parentPaneKey: map['parent_pane_key'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
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
      'parent_pane_key': model.parentPaneKey,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvGetResponseFields {
  static const List<String> allFields = <String>[
    id,
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
    parentPaneKey,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

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

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvGetPostItemSerializer {
  static ConvGetPostItem fromMap(Map map) {
    return new ConvGetPostItem(
        id: map['id'] as String,
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
        collapsePosition: map['collapse_position'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvGetPostItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
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
      'collapse_position': model.collapsePosition,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvGetPostItemFields {
  static const List<String> allFields = <String>[
    id,
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
    collapsePosition,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

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

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvGetRulesRequestSerializer {
  static ConvGetRulesRequest fromMap(Map map) {
    return new ConvGetRulesRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvGetRulesRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvGetRulesRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    convId,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvGetRulesResponseSerializer {
  static ConvGetRulesResponse fromMap(Map map) {
    return new ConvGetRulesResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        postMaxSize: map['post_max_size'] as int,
        userDailyMax: map['user_daily_max'] as int,
        title: map['title'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvGetRulesResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'post_max_size': model.postMaxSize,
      'user_daily_max': model.userDailyMax,
      'title': model.title,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvGetRulesResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    postMaxSize,
    userDailyMax,
    title,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String postMaxSize = 'post_max_size';

  static const String userDailyMax = 'user_daily_max';

  static const String title = 'title';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvSaveRequestSerializer {
  static ConvSaveRequest fromMap(Map map) {
    return new ConvSaveRequest(
        id: map['id'] as String,
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
        userDailyMax: map['user_daily_max'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'project_id': model.projectId,
      'event_id': model.eventId,
      'from_conv_id': model.fromConvId,
      'opening_post_id': model.openingPostId,
      'title': model.title,
      'post_max_size': model.postMaxSize,
      'user_daily_max': model.userDailyMax,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    convId,
    projectId,
    eventId,
    fromConvId,
    openingPostId,
    title,
    postMaxSize,
    userDailyMax,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String projectId = 'project_id';

  static const String eventId = 'event_id';

  static const String fromConvId = 'from_conv_id';

  static const String openingPostId = 'opening_post_id';

  static const String title = 'title';

  static const String postMaxSize = 'post_max_size';

  static const String userDailyMax = 'user_daily_max';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvPostGetRequestSerializer {
  static ConvPostGetRequest fromMap(Map map) {
    return new ConvPostGetRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        postId: map['post_id'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvPostGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'post_id': model.postId,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvPostGetRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    postId,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String postId = 'post_id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvPostGetResponseSerializer {
  static ConvPostGetResponse fromMap(Map map) {
    return new ConvPostGetResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        avatarUrl: map['avatar_url'] as String,
        createdAtReadable: map['created_at_readable'] as String,
        reaction: map['reaction'] as String,
        throttleDescription: map['throttle_description'] as String,
        canCensor: map['can_censor'] as String,
        allReasons: map['all_reasons'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvPostGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'avatar_url': model.avatarUrl,
      'created_at_readable': model.createdAtReadable,
      'reaction': model.reaction,
      'throttle_description': model.throttleDescription,
      'can_censor': model.canCensor,
      'all_reasons': model.allReasons,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvPostGetResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    avatarUrl,
    createdAtReadable,
    reaction,
    throttleDescription,
    canCensor,
    allReasons,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String avatarUrl = 'avatar_url';

  static const String createdAtReadable = 'created_at_readable';

  static const String reaction = 'reaction';

  static const String throttleDescription = 'throttle_description';

  static const String canCensor = 'can_censor';

  static const String allReasons = 'all_reasons';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvPostSaveRequestSerializer {
  static ConvPostSaveRequest fromMap(Map map) {
    return new ConvPostSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        postId: map['post_id'] as String,
        triggerWarning: map['trigger_warning'] as String,
        ptext: map['ptext'] as String,
        censored: map['censored'] as String,
        delete: map['delete'] as String,
        lastKnownWDT: map['last_known_w_d_t'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvPostSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'post_id': model.postId,
      'trigger_warning': model.triggerWarning,
      'ptext': model.ptext,
      'censored': model.censored,
      'delete': model.delete,
      'last_known_w_d_t': model.lastKnownWDT,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvPostSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    convId,
    postId,
    triggerWarning,
    ptext,
    censored,
    delete,
    lastKnownWDT,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String postId = 'post_id';

  static const String triggerWarning = 'trigger_warning';

  static const String ptext = 'ptext';

  static const String censored = 'censored';

  static const String delete = 'delete';

  static const String lastKnownWDT = 'last_known_w_d_t';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvPostImageSaveRequestSerializer {
  static ConvPostImageSaveRequest fromMap(Map map) {
    return new ConvPostImageSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        ptext: map['ptext'] as String,
        imageBytes: map['image_bytes'] is Iterable
            ? (map['image_bytes'] as Iterable).cast<int>().toList()
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvPostImageSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'ptext': model.ptext,
      'image_bytes': model.imageBytes,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvPostImageSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    convId,
    ptext,
    imageBytes,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String ptext = 'ptext';

  static const String imageBytes = 'image_bytes';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvPostUserSaveRequestSerializer {
  static ConvPostUserSaveRequest fromMap(Map map) {
    return new ConvPostUserSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        postId: map['post_id'] as String,
        reaction: map['reaction'] as String,
        reason: map['reason'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvPostUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'post_id': model.postId,
      'reaction': model.reaction,
      'reason': model.reason,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvPostUserSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    postId,
    reaction,
    reason,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String postId = 'post_id';

  static const String reaction = 'reaction';

  static const String reason = 'reason';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvSetReadPositionRequestSerializer {
  static ConvSetReadPositionRequest fromMap(Map map) {
    return new ConvSetReadPositionRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        positionWDT: map['position_w_d_t'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvSetReadPositionRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'position_w_d_t': model.positionWDT,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvSetReadPositionRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    convId,
    positionWDT,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String positionWDT = 'position_w_d_t';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvUserSaveRequestSerializer {
  static ConvUserSaveRequest fromMap(Map map) {
    return new ConvUserSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        convId: map['conv_id'] as int,
        status: map['status'] as String,
        like: map['like'] as String,
        bookmarked: map['bookmarked'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'conv_id': model.convId,
      'status': model.status,
      'like': model.like,
      'bookmarked': model.bookmarked,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvUserSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    convId,
    status,
    like,
    bookmarked,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String convId = 'conv_id';

  static const String status = 'status';

  static const String like = 'like';

  static const String bookmarked = 'bookmarked';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ConvUserSaveResponseSerializer {
  static ConvUserSaveResponse fromMap(Map map) {
    return new ConvUserSaveResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        action: map['action'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ConvUserSaveResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'action': model.action,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ConvUserSaveResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    action,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String action = 'action';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class DocQueryRequestSerializer {
  static DocQueryRequest fromMap(Map map) {
    return new DocQueryRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        mode: map['mode'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_DocQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'mode': model.mode,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class DocQueryRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    mode,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String mode = 'mode';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class DocQueryResponseSerializer {
  static DocQueryResponse fromMap(Map map) {
    return new DocQueryResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        docs: map['docs'] is Iterable
            ? new List.unmodifiable(
                ((map['docs'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(DocQueryItemSerializer.fromMap))
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_DocQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'docs': model.docs?.map((m) => DocQueryItemSerializer.toMap(m))?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class DocQueryResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    docs,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String docs = 'docs';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class DocQueryItemSerializer {
  static DocQueryItem fromMap(Map map) {
    return new DocQueryItem(
        id: map['id'] as String,
        iid: map['iid'] as int,
        title: map['title'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_DocQueryItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'iid': model.iid,
      'title': model.title,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class DocQueryItemFields {
  static const List<String> allFields = <String>[
    id,
    iid,
    title,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String iid = 'iid';

  static const String title = 'title';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class DocGetRequestSerializer {
  static DocGetRequest fromMap(Map map) {
    return new DocGetRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        docId: map['doc_id'] as int,
        specialCode: map['special_code'] as String,
        revisionNo: map['revision_no'] as int,
        getVerList: map['get_ver_list'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_DocGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'doc_id': model.docId,
      'special_code': model.specialCode,
      'revision_no': model.revisionNo,
      'get_ver_list': model.getVerList,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class DocGetRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    docId,
    specialCode,
    revisionNo,
    getVerList,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String docId = 'doc_id';

  static const String specialCode = 'special_code';

  static const String revisionNo = 'revision_no';

  static const String getVerList = 'get_ver_list';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class DocGetResponseSerializer {
  static DocGetResponse fromMap(Map map) {
    return new DocGetResponse(
        id: map['id'] as String,
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
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_DocGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
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
          ?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class DocGetResponseFields {
  static const List<String> allFields = <String>[
    id,
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
    verList,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

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

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class DocGetVersionItemSerializer {
  static DocGetVersionItem fromMap(Map map) {
    return new DocGetVersionItem(
        id: map['id'] as String,
        revisionNo: map['revision_no'] as int,
        createdAtR: map['created_at_r'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_DocGetVersionItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'revision_no': model.revisionNo,
      'created_at_r': model.createdAtR,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class DocGetVersionItemFields {
  static const List<String> allFields = <String>[
    id,
    revisionNo,
    createdAtR,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String revisionNo = 'revision_no';

  static const String createdAtR = 'created_at_r';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class DocSaveRequestSerializer {
  static DocSaveRequest fromMap(Map map) {
    return new DocSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        docId: map['doc_id'] as int,
        projectId: map['project_id'] as int,
        title: map['title'] as String,
        retitleMode: map['retitle_mode'] as String,
        body: map['body'] as String,
        summary: map['summary'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_DocSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'doc_id': model.docId,
      'project_id': model.projectId,
      'title': model.title,
      'retitle_mode': model.retitleMode,
      'body': model.body,
      'summary': model.summary,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class DocSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    docId,
    projectId,
    title,
    retitleMode,
    body,
    summary,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String docId = 'doc_id';

  static const String projectId = 'project_id';

  static const String title = 'title';

  static const String retitleMode = 'retitle_mode';

  static const String body = 'body';

  static const String summary = 'summary';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class DocRollbackRequestSerializer {
  static DocRollbackRequest fromMap(Map map) {
    return new DocRollbackRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        docId: map['doc_id'] as int,
        revisionNo: map['revision_no'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_DocRollbackRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'doc_id': model.docId,
      'revision_no': model.revisionNo,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class DocRollbackRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    docId,
    revisionNo,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String docId = 'doc_id';

  static const String revisionNo = 'revision_no';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class EventQueryRequestSerializer {
  static EventQueryRequest fromMap(Map map) {
    return new EventQueryRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        title: map['title'] as String,
        dateFrom: map['date_from'] as String,
        dateTo: map['date_to'] as String,
        miles: map['miles'] as int,
        lat: map['lat'] as String,
        lon: map['lon'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_EventQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'title': model.title,
      'date_from': model.dateFrom,
      'date_to': model.dateTo,
      'miles': model.miles,
      'lat': model.lat,
      'lon': model.lon,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class EventQueryRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    title,
    dateFrom,
    dateTo,
    miles,
    lat,
    lon,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String title = 'title';

  static const String dateFrom = 'date_from';

  static const String dateTo = 'date_to';

  static const String miles = 'miles';

  static const String lat = 'lat';

  static const String lon = 'lon';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class EventQueryResponseSerializer {
  static EventQueryResponse fromMap(Map map) {
    return new EventQueryResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        events: map['events'] is Iterable
            ? new List.unmodifiable(
                ((map['events'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(EventItemResponseSerializer.fromMap))
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_EventQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'events': model.events
          ?.map((m) => EventItemResponseSerializer.toMap(m))
          ?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class EventQueryResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    events,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String events = 'events';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class EventItemResponseSerializer {
  static EventItemResponse fromMap(Map map) {
    return new EventItemResponse(
        id: map['id'] as String,
        iid: map['iid'] as int,
        title: map['title'] as String,
        startTime: map['start_time'] as String,
        creatorNick: map['creator_nick'] as String,
        creatorId: map['creator_id'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_EventItemResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'iid': model.iid,
      'title': model.title,
      'start_time': model.startTime,
      'creator_nick': model.creatorNick,
      'creator_id': model.creatorId,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class EventItemResponseFields {
  static const List<String> allFields = <String>[
    id,
    iid,
    title,
    startTime,
    creatorNick,
    creatorId,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String iid = 'iid';

  static const String title = 'title';

  static const String startTime = 'start_time';

  static const String creatorNick = 'creator_nick';

  static const String creatorId = 'creator_id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class EventRequestSerializer {
  static EventRequest fromMap(Map map) {
    return new EventRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        eventId: map['event_id'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_EventRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'event_id': model.eventId,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class EventRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    eventId,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String eventId = 'event_id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class EventGetResponseSerializer {
  static EventGetResponse fromMap(Map map) {
    return new EventGetResponse(
        id: map['id'] as String,
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
        isCreator: map['is_creator'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_EventGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
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
      'is_creator': model.isCreator,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class EventGetResponseFields {
  static const List<String> allFields = <String>[
    id,
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
    isCreator,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

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

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class EventGetUserResponseSerializer {
  static EventGetUserResponse fromMap(Map map) {
    return new EventGetUserResponse(
        id: map['id'] as String,
        userId: map['user_id'] as int,
        nick: map['nick'] as String,
        publicName: map['public_name'] as String,
        avatarUrl: map['avatar_url'] as String,
        status: map['status'] as String,
        statusDesc: map['status_desc'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_EventGetUserResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'user_id': model.userId,
      'nick': model.nick,
      'public_name': model.publicName,
      'avatar_url': model.avatarUrl,
      'status': model.status,
      'status_desc': model.statusDesc,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class EventGetUserResponseFields {
  static const List<String> allFields = <String>[
    id,
    userId,
    nick,
    publicName,
    avatarUrl,
    status,
    statusDesc,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String userId = 'user_id';

  static const String nick = 'nick';

  static const String publicName = 'public_name';

  static const String avatarUrl = 'avatar_url';

  static const String status = 'status';

  static const String statusDesc = 'status_desc';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class EventGetConvResponseSerializer {
  static EventGetConvResponse fromMap(Map map) {
    return new EventGetConvResponse(
        id: map['id'] as String,
        iid: map['iid'] as int,
        open: map['open'] as String,
        title: map['title'] as String,
        lastActivity: map['last_activity'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_EventGetConvResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'iid': model.iid,
      'open': model.open,
      'title': model.title,
      'last_activity': model.lastActivity,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class EventGetConvResponseFields {
  static const List<String> allFields = <String>[
    id,
    iid,
    open,
    title,
    lastActivity,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String iid = 'iid';

  static const String open = 'open';

  static const String title = 'title';

  static const String lastActivity = 'last_activity';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class EventSaveRequestSerializer {
  static EventSaveRequest fromMap(Map map) {
    return new EventSaveRequest(
        id: map['id'] as String,
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
        lon: map['lon'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_EventSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'event_id': model.eventId,
      'title': model.title,
      'description': model.description,
      'duration': model.duration,
      'location': model.location,
      'start_time': model.startTime,
      'lat': model.lat,
      'lon': model.lon,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class EventSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    eventId,
    title,
    description,
    duration,
    location,
    startTime,
    lat,
    lon,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String eventId = 'event_id';

  static const String title = 'title';

  static const String description = 'description';

  static const String duration = 'duration';

  static const String location = 'location';

  static const String startTime = 'start_time';

  static const String lat = 'lat';

  static const String lon = 'lon';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class EventUserSaveRequestSerializer {
  static EventUserSaveRequest fromMap(Map map) {
    return new EventUserSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        eventId: map['event_id'] as int,
        status: map['status'] as String,
        statusDesc: map['status_desc'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_EventUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'event_id': model.eventId,
      'status': model.status,
      'status_desc': model.statusDesc,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class EventUserSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    eventId,
    status,
    statusDesc,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String eventId = 'event_id';

  static const String status = 'status';

  static const String statusDesc = 'status_desc';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectQueryRequestSerializer {
  static ProjectQueryRequest fromMap(Map map) {
    return new ProjectQueryRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        catId: map['cat_id'] as int,
        title: map['title'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'cat_id': model.catId,
      'title': model.title,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectQueryRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    catId,
    title,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String catId = 'cat_id';

  static const String title = 'title';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectQueryResponseSerializer {
  static ProjectQueryResponse fromMap(Map map) {
    return new ProjectQueryResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projects: map['projects'] is Iterable
            ? new List.unmodifiable(
                ((map['projects'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ProjectQueryItemSerializer.fromMap))
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'projects': model.projects
          ?.map((m) => ProjectQueryItemSerializer.toMap(m))
          ?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectQueryResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    projects,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String projects = 'projects';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectQueryItemSerializer {
  static ProjectQueryItem fromMap(Map map) {
    return new ProjectQueryItem(
        id: map['id'] as String,
        projectId: map['project_id'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        leadership: map['leadership'] as String,
        privacy: map['privacy'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectQueryItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'project_id': model.projectId,
      'title': model.title,
      'description': model.description,
      'leadership': model.leadership,
      'privacy': model.privacy,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectQueryItemFields {
  static const List<String> allFields = <String>[
    id,
    projectId,
    title,
    description,
    leadership,
    privacy,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String projectId = 'project_id';

  static const String title = 'title';

  static const String description = 'description';

  static const String leadership = 'leadership';

  static const String privacy = 'privacy';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectGetRequestSerializer {
  static ProjectGetRequest fromMap(Map map) {
    return new ProjectGetRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projectId: map['project_id'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'project_id': model.projectId,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectGetRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    projectId,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String projectId = 'project_id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectGetResponseSerializer {
  static ProjectGetResponse fromMap(Map map) {
    return new ProjectGetResponse(
        id: map['id'] as String,
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
            ? new List.unmodifiable(((map['proposals'] as Iterable).where((x) => x is Map))
                .cast<Map>()
                .map(ProjectProposalItemSerializer.fromMap))
            : null,
        convs: map['convs'] is Iterable
            ? new List.unmodifiable(((map['convs'] as Iterable).where((x) => x is Map))
                .cast<Map>()
                .map(ProjectConvItemSerializer.fromMap))
            : null,
        docs: map['docs'] is Iterable
            ? new List.unmodifiable(((map['docs'] as Iterable).where((x) => x is Map))
                .cast<Map>()
                .map(ProjectDocItemSerializer.fromMap))
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null ? (map['updated_at'] is DateTime ? (map['updated_at'] as DateTime) : DateTime.parse(map['updated_at'].toString())) : null);
  }

  static Map<String, dynamic> toMap(_ProjectGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
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
          model.docs?.map((m) => ProjectDocItemSerializer.toMap(m))?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectGetResponseFields {
  static const List<String> allFields = <String>[
    id,
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
    docs,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

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

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectProposalItemSerializer {
  static ProjectProposalItem fromMap(Map map) {
    return new ProjectProposalItem(
        id: map['id'] as String,
        iid: map['iid'] as int,
        active: map['active'] as String,
        title: map['title'] as String,
        createdAtR: map['created_at_r'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectProposalItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'iid': model.iid,
      'active': model.active,
      'title': model.title,
      'created_at_r': model.createdAtR,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectProposalItemFields {
  static const List<String> allFields = <String>[
    id,
    iid,
    active,
    title,
    createdAtR,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String iid = 'iid';

  static const String active = 'active';

  static const String title = 'title';

  static const String createdAtR = 'created_at_r';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectConvItemSerializer {
  static ProjectConvItem fromMap(Map map) {
    return new ProjectConvItem(
        id: map['id'] as String,
        iid: map['iid'] as int,
        open: map['open'] as String,
        title: map['title'] as String,
        lastActivity: map['last_activity'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectConvItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'iid': model.iid,
      'open': model.open,
      'title': model.title,
      'last_activity': model.lastActivity,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectConvItemFields {
  static const List<String> allFields = <String>[
    id,
    iid,
    open,
    title,
    lastActivity,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String iid = 'iid';

  static const String open = 'open';

  static const String title = 'title';

  static const String lastActivity = 'last_activity';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectDocItemSerializer {
  static ProjectDocItem fromMap(Map map) {
    return new ProjectDocItem(
        id: map['id'] as String,
        iid: map['iid'] as int,
        title: map['title'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectDocItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'iid': model.iid,
      'title': model.title,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectDocItemFields {
  static const List<String> allFields = <String>[
    id,
    iid,
    title,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String iid = 'iid';

  static const String title = 'title';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectSaveRequestSerializer {
  static ProjectSaveRequest fromMap(Map map) {
    return new ProjectSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projectId: map['project_id'] as int,
        leadership: map['leadership'] as String,
        privacy: map['privacy'] as String,
        title: map['title'] as String,
        description: map['description'] as String,
        categoryId: map['category_id'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'project_id': model.projectId,
      'leadership': model.leadership,
      'privacy': model.privacy,
      'title': model.title,
      'description': model.description,
      'category_id': model.categoryId,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    projectId,
    leadership,
    privacy,
    title,
    description,
    categoryId,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String projectId = 'project_id';

  static const String leadership = 'leadership';

  static const String privacy = 'privacy';

  static const String title = 'title';

  static const String description = 'description';

  static const String categoryId = 'category_id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectUserQueryRequestSerializer {
  static ProjectUserQueryRequest fromMap(Map map) {
    return new ProjectUserQueryRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projectId: map['project_id'] as int,
        name: map['name'] as String,
        resultPage: map['result_page'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectUserQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'project_id': model.projectId,
      'name': model.name,
      'result_page': model.resultPage,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectUserQueryRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    projectId,
    name,
    resultPage,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String projectId = 'project_id';

  static const String name = 'name';

  static const String resultPage = 'result_page';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectUserQueryResponseSerializer {
  static ProjectUserQueryResponse fromMap(Map map) {
    return new ProjectUserQueryResponse(
        id: map['id'] as String,
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
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectUserQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'project_title': model.projectTitle,
      'complete_load': model.completeLoad,
      'editable': model.editable,
      'users':
          model.users?.map((m) => ProjectUserItemSerializer.toMap(m))?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectUserQueryResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    projectTitle,
    completeLoad,
    editable,
    users,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String projectTitle = 'project_title';

  static const String completeLoad = 'complete_load';

  static const String editable = 'editable';

  static const String users = 'users';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectUserItemSerializer {
  static ProjectUserItem fromMap(Map map) {
    return new ProjectUserItem(
        id: map['id'] as String,
        userId: map['user_id'] as int,
        kind: map['kind'] as String,
        throttle: map['throttle'] as String,
        nick: map['nick'] as String,
        publicName: map['public_name'] as String,
        avatarUrl: map['avatar_url'] as String,
        voteKind: map['vote_kind'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectUserItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'user_id': model.userId,
      'kind': model.kind,
      'throttle': model.throttle,
      'nick': model.nick,
      'public_name': model.publicName,
      'avatar_url': model.avatarUrl,
      'vote_kind': model.voteKind,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectUserItemFields {
  static const List<String> allFields = <String>[
    id,
    userId,
    kind,
    throttle,
    nick,
    publicName,
    avatarUrl,
    voteKind,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String userId = 'user_id';

  static const String kind = 'kind';

  static const String throttle = 'throttle';

  static const String nick = 'nick';

  static const String publicName = 'public_name';

  static const String avatarUrl = 'avatar_url';

  static const String voteKind = 'vote_kind';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectUserSaveRequestSerializer {
  static ProjectUserSaveRequest fromMap(Map map) {
    return new ProjectUserSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projectId: map['project_id'] as int,
        userId: map['user_id'] as int,
        kind: map['kind'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'project_id': model.projectId,
      'user_id': model.userId,
      'kind': model.kind,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectUserSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    projectId,
    userId,
    kind,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String projectId = 'project_id';

  static const String userId = 'user_id';

  static const String kind = 'kind';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProjectUserUserSaveRequestSerializer {
  static ProjectUserUserSaveRequest fromMap(Map map) {
    return new ProjectUserUserSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        projectId: map['project_id'] as int,
        aboutId: map['about_id'] as int,
        kind: map['kind'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProjectUserUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'project_id': model.projectId,
      'about_id': model.aboutId,
      'kind': model.kind,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProjectUserUserSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    projectId,
    aboutId,
    kind,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String projectId = 'project_id';

  static const String aboutId = 'about_id';

  static const String kind = 'kind';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProposalQueryRequestSerializer {
  static ProposalQueryRequest fromMap(Map map) {
    return new ProposalQueryRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        mode: map['mode'] as String,
        year: map['year'] as int,
        projectId: map['project_id'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProposalQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'mode': model.mode,
      'year': model.year,
      'project_id': model.projectId,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProposalQueryRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    mode,
    year,
    projectId,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String mode = 'mode';

  static const String year = 'year';

  static const String projectId = 'project_id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProposalQueryResponseSerializer {
  static ProposalQueryResponse fromMap(Map map) {
    return new ProposalQueryResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        items: map['items'] is Iterable
            ? new List.unmodifiable(
                ((map['items'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ProposalQueryItemSerializer.fromMap))
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProposalQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'items': model.items
          ?.map((m) => ProposalQueryItemSerializer.toMap(m))
          ?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProposalQueryResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    items,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String items = 'items';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProposalQueryItemSerializer {
  static ProposalQueryItem fromMap(Map map) {
    return new ProposalQueryItem(
        id: map['id'] as String,
        iid: map['iid'] as int,
        title: map['title'] as String,
        kind: map['kind'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProposalQueryItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'iid': model.iid,
      'title': model.title,
      'kind': model.kind,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProposalQueryItemFields {
  static const List<String> allFields = <String>[
    id,
    iid,
    title,
    kind,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String iid = 'iid';

  static const String title = 'title';

  static const String kind = 'kind';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProposalGetRequestSerializer {
  static ProposalGetRequest fromMap(Map map) {
    return new ProposalGetRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        proposalId: map['proposal_id'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProposalGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'proposal_id': model.proposalId,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProposalGetRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    proposalId,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String proposalId = 'proposal_id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProposalGetResponseSerializer {
  static ProposalGetResponse fromMap(Map map) {
    return new ProposalGetResponse(
        id: map['id'] as String,
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
        myEligible: map['my_eligible'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProposalGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
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
      'my_eligible': model.myEligible,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProposalGetResponseFields {
  static const List<String> allFields = <String>[
    id,
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
    myEligible,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

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

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProposalOptionItemSerializer {
  static ProposalOptionItem fromMap(Map map) {
    return new ProposalOptionItem(
        id: map['id'] as String,
        optionNo: map['option_no'] as int,
        voteCount: map['vote_count'] as int,
        optionDesc: map['option_desc'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProposalOptionItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'option_no': model.optionNo,
      'vote_count': model.voteCount,
      'option_desc': model.optionDesc,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProposalOptionItemFields {
  static const List<String> allFields = <String>[
    id,
    optionNo,
    voteCount,
    optionDesc,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String optionNo = 'option_no';

  static const String voteCount = 'vote_count';

  static const String optionDesc = 'option_desc';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProposalSaveRequestSerializer {
  static ProposalSaveRequest fromMap(Map map) {
    return new ProposalSaveRequest(
        id: map['id'] as String,
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
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProposalSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'kind': model.kind,
      'project_id': model.projectId,
      'eligible': model.eligible,
      'title': model.title,
      'summary': model.summary,
      'days': model.days,
      'options': model.options,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProposalSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    kind,
    projectId,
    eligible,
    title,
    summary,
    days,
    options,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String kind = 'kind';

  static const String projectId = 'project_id';

  static const String eligible = 'eligible';

  static const String title = 'title';

  static const String summary = 'summary';

  static const String days = 'days';

  static const String options = 'options';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ProposalUserSaveRequestSerializer {
  static ProposalUserSaveRequest fromMap(Map map) {
    return new ProposalUserSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        proposalId: map['proposal_id'] as int,
        vote: map['vote'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ProposalUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'proposal_id': model.proposalId,
      'vote': model.vote,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ProposalUserSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    proposalId,
    vote,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String proposalId = 'proposal_id';

  static const String vote = 'vote';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class PushQueueGetRequestSerializer {
  static PushQueueGetRequest fromMap(Map map) {
    return new PushQueueGetRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        depth: map['depth'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_PushQueueGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'depth': model.depth,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class PushQueueGetRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    depth,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String depth = 'depth';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class PushQueueGetResponseSerializer {
  static PushQueueGetResponse fromMap(Map map) {
    return new PushQueueGetResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        items: map['items'] is Iterable
            ? new List.unmodifiable(
                ((map['items'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(PushQueueItemSerializer.fromMap))
            : null,
        fullModeStatus: map['full_mode_status'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_PushQueueGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'items':
          model.items?.map((m) => PushQueueItemSerializer.toMap(m))?.toList(),
      'full_mode_status': model.fullModeStatus,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class PushQueueGetResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    items,
    fullModeStatus,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String items = 'items';

  static const String fullModeStatus = 'full_mode_status';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class PushQueueItemSerializer {
  static PushQueueItem fromMap(Map map) {
    return new PushQueueItem(
        id: map['id'] as String,
        kind: map['kind'] as String,
        why: map['why'] as String,
        iid: map['iid'] as int,
        sid: map['sid'] as String,
        text: map['text'] as String,
        linkText: map['link_text'] as String,
        linkPaneKey: map['link_pane_key'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_PushQueueItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'kind': model.kind,
      'why': model.why,
      'iid': model.iid,
      'sid': model.sid,
      'text': model.text,
      'link_text': model.linkText,
      'link_pane_key': model.linkPaneKey,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class PushQueueItemFields {
  static const List<String> allFields = <String>[
    id,
    kind,
    why,
    iid,
    sid,
    text,
    linkText,
    linkPaneKey,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String kind = 'kind';

  static const String why = 'why';

  static const String iid = 'iid';

  static const String sid = 'sid';

  static const String text = 'text';

  static const String linkText = 'link_text';

  static const String linkPaneKey = 'link_pane_key';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ResourceQueryRequestSerializer {
  static ResourceQueryRequest fromMap(Map map) {
    return new ResourceQueryRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        categoryId: map['category_id'] as int,
        title: map['title'] as String,
        kind: map['kind'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ResourceQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'category_id': model.categoryId,
      'title': model.title,
      'kind': model.kind,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ResourceQueryRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    categoryId,
    title,
    kind,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String categoryId = 'category_id';

  static const String title = 'title';

  static const String kind = 'kind';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ResourceQueryResponseSerializer {
  static ResourceQueryResponse fromMap(Map map) {
    return new ResourceQueryResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        items: map['items'] is Iterable
            ? new List.unmodifiable(
                ((map['items'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ResourceItemSerializer.fromMap))
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ResourceQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'items':
          model.items?.map((m) => ResourceItemSerializer.toMap(m))?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ResourceQueryResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    items,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String items = 'items';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ResourceItemSerializer {
  static ResourceItem fromMap(Map map) {
    return new ResourceItem(
        id: map['id'] as String,
        iid: map['iid'] as int,
        title: map['title'] as String,
        url: map['url'] as String,
        description: map['description'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ResourceItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'iid': model.iid,
      'title': model.title,
      'url': model.url,
      'description': model.description,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ResourceItemFields {
  static const List<String> allFields = <String>[
    id,
    iid,
    title,
    url,
    description,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String iid = 'iid';

  static const String title = 'title';

  static const String url = 'url';

  static const String description = 'description';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ResourceGetRequestSerializer {
  static ResourceGetRequest fromMap(Map map) {
    return new ResourceGetRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        iid: map['iid'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ResourceGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'iid': model.iid,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ResourceGetRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    iid,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String iid = 'iid';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ResourceGetResponseSerializer {
  static ResourceGetResponse fromMap(Map map) {
    return new ResourceGetResponse(
        id: map['id'] as String,
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
        nick: map['nick'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ResourceGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
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
      'nick': model.nick,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ResourceGetResponseFields {
  static const List<String> allFields = <String>[
    id,
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
    nick,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

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

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ResourceSaveRequestSerializer {
  static ResourceSaveRequest fromMap(Map map) {
    return new ResourceSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        iid: map['iid'] as int,
        categoryId: map['category_id'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        kind: map['kind'] as String,
        url: map['url'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ResourceSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'iid': model.iid,
      'category_id': model.categoryId,
      'title': model.title,
      'description': model.description,
      'kind': model.kind,
      'url': model.url,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ResourceSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    iid,
    categoryId,
    title,
    description,
    kind,
    url,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String iid = 'iid';

  static const String categoryId = 'category_id';

  static const String title = 'title';

  static const String description = 'description';

  static const String kind = 'kind';

  static const String url = 'url';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ResourceTriageRequestSerializer {
  static ResourceTriageRequest fromMap(Map map) {
    return new ResourceTriageRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        iid: map['iid'] as int,
        mode: map['mode'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ResourceTriageRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'iid': model.iid,
      'mode': model.mode,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ResourceTriageRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    iid,
    mode,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String iid = 'iid';

  static const String mode = 'mode';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class ResourceUserSaveRequestSerializer {
  static ResourceUserSaveRequest fromMap(Map map) {
    return new ResourceUserSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        iid: map['iid'] as int,
        kind: map['kind'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ResourceUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'iid': model.iid,
      'kind': model.kind,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ResourceUserSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    iid,
    kind,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String iid = 'iid';

  static const String kind = 'kind';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class UserQueryRequestSerializer {
  static UserQueryRequest fromMap(Map map) {
    return new UserQueryRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        name: map['name'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_UserQueryRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'name': model.name,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserQueryRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    name,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String name = 'name';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class UserQueryResponseSerializer {
  static UserQueryResponse fromMap(Map map) {
    return new UserQueryResponse(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIResponseBaseSerializer.fromMap(map['base'] as Map)
            : null,
        users: map['users'] is Iterable
            ? new List.unmodifiable(
                ((map['users'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(UserQueryItemSerializer.fromMap))
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_UserQueryResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIResponseBaseSerializer.toMap(model.base),
      'users':
          model.users?.map((m) => UserQueryItemSerializer.toMap(m))?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserQueryResponseFields {
  static const List<String> allFields = <String>[
    id,
    base,
    users,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String users = 'users';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class UserQueryItemSerializer {
  static UserQueryItem fromMap(Map map) {
    return new UserQueryItem(
        id: map['id'] as String,
        iid: map['iid'] as int,
        nick: map['nick'] as String,
        kind: map['kind'] as String,
        publicName: map['public_name'] as String,
        avatarUrl: map['avatar_url'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_UserQueryItem model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'iid': model.iid,
      'nick': model.nick,
      'kind': model.kind,
      'public_name': model.publicName,
      'avatar_url': model.avatarUrl,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserQueryItemFields {
  static const List<String> allFields = <String>[
    id,
    iid,
    nick,
    kind,
    publicName,
    avatarUrl,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String iid = 'iid';

  static const String nick = 'nick';

  static const String kind = 'kind';

  static const String publicName = 'public_name';

  static const String avatarUrl = 'avatar_url';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class UserGetRequestSerializer {
  static UserGetRequest fromMap(Map map) {
    return new UserGetRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        userId: map['user_id'] as int,
        includeDetail: map['include_detail'] as String,
        includeEditing: map['include_editing'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_UserGetRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'user_id': model.userId,
      'include_detail': model.includeDetail,
      'include_editing': model.includeEditing,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserGetRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    userId,
    includeDetail,
    includeEditing,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String userId = 'user_id';

  static const String includeDetail = 'include_detail';

  static const String includeEditing = 'include_editing';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class UserGetResponseSerializer {
  static UserGetResponse fromMap(Map map) {
    return new UserGetResponse(
        id: map['id'] as String,
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
            ? new List.unmodifiable(((map['events'] as Iterable).where((x) => x is Map))
                .cast<Map>()
                .map(APIResponseAssociationSerializer.fromMap))
            : null,
        projects: map['projects'] is Iterable
            ? new List.unmodifiable(((map['projects'] as Iterable).where((x) => x is Map))
                .cast<Map>()
                .map(APIResponseAssociationSerializer.fromMap))
            : null,
        resources: map['resources'] is Iterable
            ? new List.unmodifiable(
                ((map['resources'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(APIResponseAssociationSerializer.fromMap))
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime ? (map['created_at'] as DateTime) : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null ? (map['updated_at'] is DateTime ? (map['updated_at'] as DateTime) : DateTime.parse(map['updated_at'].toString())) : null);
  }

  static Map<String, dynamic> toMap(_UserGetResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
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
          ?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserGetResponseFields {
  static const List<String> allFields = <String>[
    id,
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
    resources,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

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

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class UserSaveRequestSerializer {
  static UserSaveRequest fromMap(Map map) {
    return new UserSaveRequest(
        id: map['id'] as String,
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
        timeZone: map['time_zone'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_UserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
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
      'time_zone': model.timeZone,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
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
    timeZone,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

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

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class UserAvatarSaveRequestSerializer {
  static UserAvatarSaveRequest fromMap(Map map) {
    return new UserAvatarSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        imageBytes: map['image_bytes'] is Iterable
            ? (map['image_bytes'] as Iterable).cast<int>().toList()
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_UserAvatarSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'image_bytes': model.imageBytes,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserAvatarSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    imageBytes,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String imageBytes = 'image_bytes';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class UserNotifySaveRequestSerializer {
  static UserNotifySaveRequest fromMap(Map map) {
    return new UserNotifySaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        notifyId: map['notify_id'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_UserNotifySaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'notify_id': model.notifyId,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserNotifySaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    notifyId,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String notifyId = 'notify_id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class UserRecoverPasswordRequestSerializer {
  static UserRecoverPasswordRequest fromMap(Map map) {
    return new UserRecoverPasswordRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        recoveryNick: map['recovery_nick'] as String,
        mode: map['mode'] as String,
        recoveryPassword: map['recovery_password'] as String,
        code: map['code'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_UserRecoverPasswordRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'recovery_nick': model.recoveryNick,
      'mode': model.mode,
      'recovery_password': model.recoveryPassword,
      'code': model.code,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserRecoverPasswordRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    recoveryNick,
    mode,
    recoveryPassword,
    code,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String recoveryNick = 'recovery_nick';

  static const String mode = 'mode';

  static const String recoveryPassword = 'recovery_password';

  static const String code = 'code';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class UserUserSaveRequestSerializer {
  static UserUserSaveRequest fromMap(Map map) {
    return new UserUserSaveRequest(
        id: map['id'] as String,
        base: map['base'] != null
            ? APIRequestBaseSerializer.fromMap(map['base'] as Map)
            : null,
        aboutId: map['about_id'] as int,
        kind: map['kind'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_UserUserSaveRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'base': APIRequestBaseSerializer.toMap(model.base),
      'about_id': model.aboutId,
      'kind': model.kind,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserUserSaveRequestFields {
  static const List<String> allFields = <String>[
    id,
    base,
    aboutId,
    kind,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String base = 'base';

  static const String aboutId = 'about_id';

  static const String kind = 'kind';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
