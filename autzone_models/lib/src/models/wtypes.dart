import 'package:angel_serialize/angel_serialize.dart';

part 'wtypes.g.dart';

//file contains all the wire types used on client and server

//nestable class for API requests. The original library did not allow requests to
//be derived from a superclass, so _APIRequestBase has to be nested in each
//request type
@serializable
abstract class _APIRequestBase {
  ///user nickname
  String get nick;

  ///password for uid
  String get password;
}

//nestable class for API responses. The RPC library doesn't allow responses to
//be derived from a superclass, so APIResponseBase has to be nested in each
//response type
@serializable
abstract class _APIResponseBase {
  String get errorMessage;

  ///code depends on specific call
  String get errorCode;

  ///'Y' if call was successful
  String get ok;

  ///the newly created id (used rarely; only in cases where a new id is created
  /// and no other more specific return type is needed)
  int get newId;

  ///convert ok to bool
  bool get isOK => ok == 'Y';
}

///a general purpose container for links from one entity to others
@serializable
abstract class _APIResponseAssociation {
  String get linkText;
  String get linkPaneKey;
}

@serializable
abstract class _AuthenticateResponse {
  _APIResponseBase get base;
  String get publicName;
  String get nick; //nick with corrected capitalization
  int get userId;
  String get isSiteAdmin; //Y or N
}

@serializable
abstract class _CategoryQueryRequest {
  _APIRequestBase get base;
  String get kind;
}

@serializable
abstract class _CategoryQueryResponse  {
  _APIResponseBase get base;
  List<_CategoryItemResponse> get categories;
}

@serializable
abstract class _CategoryDeleteRequest {
  _APIRequestBase get base;
  int get catId; //0 or null for new
  String get kind;
}

@serializable
abstract class _CategorySaveRequest {
  _APIRequestBase get base;
  int get catId; //0 or null for new
  String get kind;
  int get referenceId; //null or some existing category id
  String get referenceMode; //blank=not changing parent; "S"=catId is a sister of referenceId; "C"=catId is a child of referenceId
  //also note if referenceId is null and referenceMode=C, this indicates to make
  // it top level
  String get title;
  String get description;
}

@serializable
abstract class _CategoryMoveContentsRequest {
  _APIRequestBase get base;
  int get catId;
  String get kind;
  List<int> get relatedIds; //project or resource ids to move
}

///single entry in CategoryQueryResponse
@serializable
abstract class _CategoryItemResponse {
  int get iid;
  int get parentId; //null if none
  String get title;
  String get description;
}

@serializable
abstract class _ConvQueryRequest {
  _APIRequestBase get base;
  String get term; //search term
}

@serializable
abstract class _ConvQueryResponse  {
  _APIResponseBase get base;
  List<_ConvQueryConvItemResponse> get convs;
}

///entry in ConvQueryResponse for one conv record
@serializable
abstract class _ConvQueryConvItemResponse {
  int get convId;
  String get hitText; //title text surrounding the match phrase
  List<_ConvQueryPostItemResponse> get posts; //null if none
}

abstract class ConvQueryConvItemResponseUtils {
  ///sort posts by latest first, given a map of times indexed by post id
  static void sortByDate(_ConvQueryConvItemResponse item, Map<String, DateTime> postCreatedAt) {
    item.posts.sort((_ConvQueryPostItemResponse a, _ConvQueryPostItemResponse b) {
      DateTime aDate = postCreatedAt[a.postId];
      DateTime bDate = postCreatedAt[b.postId];
      if (aDate == null || bDate == null) return 1; //shouldn't happen
      return bDate.compareTo(aDate);
    });
  }
}

//entry in ConvQueryConvItemResponse
@serializable
abstract class _ConvQueryPostItemResponse {
  String get postId;
  String get hitText; //post text surrounding the match phrase
}

@serializable
abstract class _ConvGetRequest {
  _APIRequestBase get base;
  int get convId;
  String get mode; //U=unread, R=range, A=all
  String get rangeFromWDT;
  String get rangeToWDT; //the exclusive range to include if mode=R, in wire-datetime format
  //For range loads: loads posts whose dates are between the given times, not
  // including the posts *at* those times
}

@serializable
abstract class _ConvGetResponse  {
  _APIResponseBase get base;
  String get isManager; //Y if manager of owning proj/creator of owning event
  String get isJoined; //Y if joined else N
  String get readPositionWDT; //created_at of the last post read, or an earlier time, in wire-datetime format
  String get title;
  String get anySkipped; //Y if unread mode and earlier posts are omitted, else N
  List<_ConvGetPostItem> get posts;
  String get replyAllowed; //Y if reply is allowed else N
  String get replyAllowedDesc; //printable description of why reply isn't allowed or the amount that is allowed
  int get replyMaxLength; //max length of reply
  String get deleteMessage; //optional user message about when conv will be deleted
  String get like; //from conv_xuser
  String get bookmarked; //from conv_xuser
  String get parentTitle; //title of parent item (project/event)
  String get parentPaneKey; //pane key of parent item
}

//post element used in ConvGet
@serializable
abstract class _ConvGetPostItem {
  String get iid; //uuid
  int get authorId;
  String get authorNick;
  String get avatarUrl; //null if none
  String get createdAtReadable;
  String get createdAtWDT; //in wire-datetime format
  String get ago; //for example "2 days"
  String get ptext; //post text
  String get imageUrl; //optional image in post
  String get collapseMode; //blank or a string defined in ConvLib like "BlockedByAuthor"
  int get collapsePosition; //position in ptext where expansion link should be placed; 0 means collapse all
  //note: use a high number for collapsePosition to not show a link
}

@serializable
abstract class _ConvGetRulesRequest {
  _APIRequestBase get base;
  int get convId;
}

@serializable
abstract class _ConvGetRulesResponse  {
  _APIResponseBase get base;
  int get postMaxSize;
  int get userDailyMax;
  String get title;
}

@serializable
abstract class _ConvSaveRequest {
  _APIRequestBase get base;
  int get convId; //null or 0 if new conv
  int get projectId;
  int get eventId;
  int get fromConvId;
  String get openingPostId; //optional post id for the post this conv is spawned from
  String get title;
  int get postMaxSize;
  int get userDailyMax;
}

@serializable
abstract class _ConvPostGetRequest {
  _APIRequestBase get base;
  String get postId;
}

@serializable
abstract class _ConvPostGetResponse  {
  _APIResponseBase get base;
  String get avatarUrl; //of author
  String get createdAtReadable; //including author timezone, example: '31 Dec 1999 17:05 (America/Denver)'
  String get reaction; //from conv_post_user for the current user
  String get throttleDescription; //in what way the author may be throttled, or empty/null if no restriction
  String get canCensor; //Y if the current user has censoring authority and the post has gotten inappropriate votes
  String get allReasons; //readable collection of reasons given in conv_post_user
}

@serializable
abstract class _ConvPostSaveRequest {
  _APIRequestBase get base;
  int get convId;
  String get postId; //null/blank for new post
  String get triggerWarning;
  String get ptext;
  String get censored; //C or null
  String get delete; //Y to delete or null
  String get lastKnownWDT; //time of last viewed post in conv, in wire-datetime format (used to allow server to determine whether to update read position)
}

@serializable
abstract class _ConvPostImageSaveRequest {
  _APIRequestBase get base;
  int get convId;
  String get ptext;
  List<int> get imageBytes;
}

@serializable
abstract class _ConvPostUserSaveRequest {
  _APIRequestBase get base;
  String get postId;
  String get reaction;
  String get reason; //see data model for definition; if reaction is null/empty, erases record
}

@serializable
abstract class _ConvSetReadPositionRequest {
  _APIRequestBase get base;
  int get convId;
  String get positionWDT; //in wire-datetime format
}

@serializable
abstract class _ConvUserSaveRequest {
  _APIRequestBase get base;
  int get convId;
  String get status; //null indicates no change; only J or Q values allowed
  String get like; //null indicates no change
  String get bookmarked; //null indicates no change
}

@serializable
abstract class _ConvUserSaveResponse  {
  _APIResponseBase get base;
  String get action; //flag set when join was requested: 'J'=joined, 'R'=request sent, 'X'=disallowed
}

@serializable
abstract class _DocQueryRequest {
  _APIRequestBase get base;
  String get mode; //kind of documents to look for: R=root (that's the only value supported for now)
}

@serializable
abstract class _DocQueryResponse {
  _APIResponseBase get base;
  List<_DocQueryItem> get docs;
}

///element in DocQueryResponse
@serializable
abstract class _DocQueryItem {
  int get iid;
  String get title;
}

@serializable
abstract class _DocGetRequest {
  _APIRequestBase get base;
  int get docId;
  String get specialCode; //if given, docId is ignored and the doc is looked up by code
  int get revisionNo; //null for latest or a specific revision
  String get getVerList; //Y or N; controls if the version list is returned
}

@serializable
abstract class _DocGetResponse {
  _APIResponseBase get base;
  int get docId;
  String get title;
  String get body;
  String get htmlDiff; //readable diff from prior version to this version
  int get projectId; //null for root docs (even though db has a value)
  String get projectTitle;
  String get isProjectManager; //Y if user is a manager of the related project else N
  String get allowSave; //Y or N; controls whether changes are allowed by this user
  String get reasonNotEditable; //null or a readable reason why user cannot edit this
  String get createdAtR; //when version created in readable format
  int get proposalId; //proposal connected to the prior version (which created the requested version)
  List<_DocGetVersionItem> get verList; //list of all version (may be capped at ~100)
}

///element used in DocGetResponse
@serializable
abstract class _DocGetVersionItem {
  int get revisionNo;
  String get createdAtR; //when version created in readable format
}

@serializable
abstract class _DocSaveRequest {
  _APIRequestBase get base;
  int get docId; //0 for new document
  int get projectId; //null for root doc, inspected for new docs only
  String get title;
  String get retitleMode; //R=retitle a project document, null=normal
  String get body;
  String get summary; //used for root doc proposals to summarize the change proposed
}

@serializable
abstract class _DocRollbackRequest {
  _APIRequestBase get base;
  int get docId;
  int get revisionNo; //must match latest revision_no
}

@serializable
abstract class _EventQueryRequest {
  _APIRequestBase get base;
  String get title; //any part of title
  String get dateFrom;
  String get dateTo; //required date range in user-entered date format (time should be zero, dateTo is inclusive of all events on that day)
  int get miles; //0 or null to omit location search, else miles around lat/lon to include
  String get lat;
  String get lon; //geolocation, or null to omit location search; float number as string, american format
}

@serializable
abstract class _EventQueryResponse {
  _APIResponseBase get base;
  List<_EventItemResponse> get events;
}

///used in EventQueryResponse for 1 event
@serializable
abstract class _EventItemResponse {
  int get iid;
  String get title;
  String get startTime; //in readable format
  String get creatorNick;
  int get creatorId;
}

@serializable
abstract class _EventRequest {
  _APIRequestBase get base;
  int get eventId;
}

@serializable
abstract class _EventGetResponse {
  _APIResponseBase get base;
  String get title;
  String get description;
  String get duration;
  String get location;
  String get startTimeU; //in user entry packed date format
  String get startTimeR; //in readable format
  String get creatorNick;
  int get creatorId;
  String get creatorAvatarUrl; //null if none
  String get createdAtR; //in readable format
  String get lat;
  String get lon; //float number as string, american format
  List<_EventGetUserResponse> get users; //users going to event
  List<_EventGetConvResponse> get convs; //convs started about the event
  String get isCreator; //Y if the requesting user is the event creator else N
}

///used in EventGetResponse
@serializable
abstract class _EventGetUserResponse {
  int get userId;
  String get nick;
  String get publicName;
  String get avatarUrl; //null if none
  String get status;
  String get statusDesc;
}

///used in EventGetResponse for associated conv
@serializable
abstract class _EventGetConvResponse {
  int get iid;
  String get open;
  String get title;
  String get lastActivity; //in wire date format
}

@serializable
abstract class _EventSaveRequest {
  _APIRequestBase get base;
  int get eventId; //0 for new record
  String get title;
  String get description;
  String get duration;
  String get location;
  String get startTime; //in user-entry packed date format
  String get lat;
  String get lon; //float number as string, american format
}

@serializable
abstract class _EventUserSaveRequest {
  _APIRequestBase get base;
  int get eventId;
  String get status;
  String get statusDesc;
  //note assumes this is about the requesting user
}

@serializable
abstract class _ProjectQueryRequest {
  _APIRequestBase get base;
  int get catId; //or null
  String get title; //any part of title
}

@serializable
abstract class _ProjectQueryResponse  {
  _APIResponseBase get base;
  List<_ProjectQueryItem> get projects;
}

///element in ProjectQueryResponse
@serializable
abstract class _ProjectQueryItem {
  int get projectId;
  String get title;
  String get description;
  String get leadership;
  String get privacy;
}

@serializable
abstract class _ProjectGetRequest {
  _APIRequestBase get base;
  int get projectId;
}

@serializable
abstract class _ProjectGetResponse  {
  _APIResponseBase get base;
  String get active;
  String get leadership;
  String get privacy;
  String get title;
  String get description;
  int get categoryId;
  String get userKind; //from project_xuser.kind for current user

  //related child records
  List<_ProjectProposalItem> get proposals;
  List<_ProjectConvItem> get convs;
  List<_ProjectDocItem> get docs;
}

///element in ProjectGetResponse
@serializable
abstract class _ProjectProposalItem {
  int get iid;
  String get active;
  String get title;
  String get createdAtR;
}

///element in ProjectGetResponse
@serializable
abstract class _ProjectConvItem {
  int get iid;
  String get open;
  String get title;
  String get lastActivity;
}

///element in ProjectGetResponse
@serializable
abstract class _ProjectDocItem {
  int get iid;
  String get title;
}

@serializable
abstract class _ProjectSaveRequest {
  _APIRequestBase get base;
  int get projectId; //0 if new
  String get leadership;
  String get privacy;
  String get title;
  String get description;
  int get categoryId;
}

@serializable
abstract class _ProjectUserQueryRequest {
  _APIRequestBase get base;
  int get projectId;
  String get name; //matches any part of public name or nick
  int get resultPage; //0 for first page of 100 results
}

@serializable
abstract class _ProjectUserQueryResponse  {
  _APIResponseBase get base;
  String get projectTitle;
  String get completeLoad; //Y or N denoting if the load was complete
  String get editable; //Y or N denoting if this user can edit project users
  List<_ProjectUserItem> get users;
}

//element in ProjectUserQueryResponse
@serializable
abstract class _ProjectUserItem {
  int get userId;
  String get kind; //from project_xuser
  String get throttle; //readable description of throttling or null if none
  String get nick;
  String get publicName;
  String get avatarUrl;  //null if nonw
  String get voteKind; //from project_xuser_xuser by current user about userId
}

@serializable
abstract class _ProjectUserSaveRequest {
  _APIRequestBase get base;
  int get projectId;
  int get userId; //not necessarily the current user
  String get kind;
}

@serializable
abstract class _ProjectUserUserSaveRequest {
  _APIRequestBase get base;
  int get projectId;
  int get aboutId; //the user being voted for
  String get kind; //L or null
}

@serializable
abstract class _ProposalQueryRequest {
  _APIRequestBase get base;
  String get mode; //one of 'A'(active ROOT and SYS proposals), 'P'(PROJ), 'S'(closed SYS by year)
  int get year; //required year for mode=S
  int get projectId; //required for mode=P
}

@serializable
abstract class _ProposalQueryResponse  {
  _APIResponseBase get base;
  List<_ProposalQueryItem> get items;
}

///used in ProposalQueryResponse for one proposal
@serializable
abstract class _ProposalQueryItem {
  int get iid;
  String get title;
  String get kind;
}

@serializable
abstract class _ProposalGetRequest {
  _APIRequestBase get base;
  int get proposalId;
}

@serializable
abstract class _ProposalGetResponse  {
  _APIResponseBase get base;
  String get active;
  String get kind;
  String get eligible;
  String get title;
  String get summary;
  String get summaryHtml;
  String get dtext;
  String get timeout;
  String get deleteTime; //in wiredate format
  int get winningOption;
  int get createdBy;
  int get projectId;
  int get docId;
  String get createdByNick;
  String get createdByAvatarUrl;
  List<_ProposalOptionItem> get options;
  int get myVote; //null or the vote for the requesting user
  String get statusDescription; //readable description of the status and when it will close
  String get myEligible; //Y if this user eligible to vote else N
}

///detail on one proposal option used in ProposalGetResponse; note that
/// voteCount will be 0 or null if proposal is open
@serializable
abstract class _ProposalOptionItem {
  int get optionNo;
  int get voteCount;
  String get optionDesc;
}

@serializable
abstract class _ProposalSaveRequest {
  _APIRequestBase get base;
  String get kind; //see table def
  int get projectId; //for kind=PROJ only
  String get eligible; //see table def
  String get title;
  String get summary;
  int get days; //number of days to stay open
  List<String> get options; //description of the options (order of this list determines the option #s)
}

@serializable
abstract class _ProposalUserSaveRequest {
  _APIRequestBase get base;
  int get proposalId;
  int get vote; //may be null to delete vote
}

@serializable
abstract class _PushQueueGetRequest {
  _APIRequestBase get base;
  String get depth; //L=light, F=full
}

@serializable
abstract class _PushQueueGetResponse  {
  _APIResponseBase get base;
  List<_PushQueueItem> get items;
  String get fullModeStatus; //normally null; if 'T' then full mode is disallowed based on timing
}

//Any of 3 kinds of push queue items. We aren't using separate classes
// for each, since the client uses these in inter-window messaging
// and it's better to avoid parsing complexity
@serializable
abstract class _PushQueueItem {
  String get kind; //N=notify, U=unread, S=suggested, B=Bookmarked
  String get why; //why the item is in the queue: G=general, V=votable, I=invited, R=recommended
    //all kinds other than S should have why=G
  int get iid; //conv or proposal ID
  String get sid; //notification ID
  String get text; //notification text
  String get linkText;
  String get linkPaneKey; //link to any other pane from notification, or link to conv or proposal
}

@serializable
abstract class _ResourceQueryRequest {
  _APIRequestBase get base;
  int get categoryId; //null to omit category searching
  String get title; //any part of title
  String get kind; //optional exact match for kind
}

@serializable
abstract class _ResourceQueryResponse  {
  _APIResponseBase get base;
  List<_ResourceItem> get items;
}

///resource used in ResourceQueryResponse
@serializable
abstract class _ResourceItem {
  int get iid;
  String get title;
  String get url;
  String get description;
}

@serializable
abstract class _ResourceGetRequest {
  _APIRequestBase get base;
  int get iid;
}

@serializable
abstract class _ResourceGetResponse  {
  _APIResponseBase get base;
  int get categoryId;
  int get userId;
  int get importantCount;
  String get title;
  String get description;
  String get createdAtR; //readable format
  String get visible;
  String get kind;
  String get url;
  String get userKind; //kind from resource_xuser
  String get isSiteAdmin; //Y if this user is a site admin
  String get isCreator; //Y if this user created the resource
  String get nick; //of the creator
}

@serializable
abstract class _ResourceSaveRequest {
  _APIRequestBase get base;
  int get iid; //0 for new record
  int get categoryId; //inspected for new resources only
  String get title;
  String get description;
  String get kind;
  String get url;
}

@serializable
abstract class _ResourceTriageRequest {
  _APIRequestBase get base;
  int get iid;
  String get mode; //R=reset; D=delete
}

@serializable
abstract class _ResourceUserSaveRequest {
  _APIRequestBase get base;
  int get iid;
  String get kind; //resource_xuser.kind
}

@serializable
abstract class _UserQueryRequest {
  _APIRequestBase get base;
  String get name; //any part of name or nick
}

@serializable
abstract class _UserQueryResponse  {
  _APIResponseBase get base;
  List<_UserQueryItem> get users;
}

///a user in UserQueryResponse
@serializable
abstract class _UserQueryItem {
  int get iid;
  String get nick;
  String get kind;
  String get publicName;
  String get avatarUrl; //null if none
}

@serializable
abstract class _UserGetRequest {
  _APIRequestBase get base;
  int get userId; //0 for blank data
  String get includeDetail; //Y or N; if Y, includes events, project, and resources
  String get includeEditing; //Y or N; if Y includes dropdown values for editing (such as timezones)
}

@serializable
abstract class _UserGetResponse  {
  _APIResponseBase get base;
  String get status;
  String get nick;
  String get email;
  String get kind;
  String get isSiteAdmin;
  String get publicName;
  String get prefEmailNotify; //Y or N
  Map<String,String> get publicLinks;
  String get timeZone;
  List<String> get allTimeZones; //dropdown values
  String get avatarUrl; //null if none
  String get userUserKind; //xuser_xuser.kind value by the current user about the user in this object
  List<_APIResponseAssociation> get events; //events the user is going to
  List<_APIResponseAssociation> get projects; //projects the user is part of
  List<_APIResponseAssociation> get resources; //resource the user created
}

@serializable
abstract class _UserSaveRequest {
  _APIRequestBase get base;
  String get isNew; //Y or N
  String get isDelete; //Y or N
  String get saveNick; //nick to create (new users only)
  String get savePW; //password to change to, or null if not changing
  String get kind;
  String get email;
  String get isSiteAdmin;
  String get publicName;
  String get prefEmailNotify;
  Map<String,String> get publicLinks;
  String get timeZone;
}

@serializable
abstract class _UserAvatarSaveRequest {
  _APIRequestBase get base;
  List<int> get imageBytes;
}

@serializable
abstract class _UserNotifySaveRequest {
  _APIRequestBase get base;
  String get notifyId; //id to dismiss
}

@serializable
abstract class _UserRecoverPasswordRequest {
  _APIRequestBase get base;
  String get recoveryNick;
  String get mode; //E=send email to start recovery; V=validate code from the email
  String get recoveryPassword; //new password in mode V
  String get code; //user entered code in mode V
}

@serializable
abstract class _UserUserSaveRequest {
  _APIRequestBase get base;
  int get aboutId; //the subject of the opinion being saved
  String get kind;
}
