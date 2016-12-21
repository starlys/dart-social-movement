@MirrorsUsed(targets: 'APIRequestBase,APIResponseBase,AuthenticateResponse,APIResponseAssociation'
  /*cat:5*/',CategoryQueryRequest,CategoryQueryResponse,CategoryDeleteRequest'
  ',CategorySaveRequest,CategoryMoveContentsRequest,CategoryItemResponse'
  /*conv:17*/',ConvQueryRequest,ConvQueryResponse,ConvQueryConvItemResponse,ConvQueryPostItemResponse,ConvGetRequest,ConvGetResponse'
  ',ConvGetPostItem,ConvGetRulesRequest,ConvGetRulesResponse,ConvSaveRequest,ConvPostGetRequest,ConvPostGetResponse'
  ',ConvPostSaveRequest,ConvPostImageSaveRequest,ConvPostUserSaveRequest,ConvSetReadPositionRequest,ConvUserSaveRequest'
  /*doc:8*/',DocQueryRequest,DocQueryResponse,DocQueryItem,DocGetRequest,DocGetResponse,DocGetVersionItem'
  ',DocSaveRequest,DocRollbackRequest'
  /*event:9*/',EventQueryRequest,EventQueryResponse,EventItemResponse,EventRequest'
  ',EventGetResponse,EventGetUserResponse,EventGetConvResponse,EventSaveRequest,EventUserSaveRequest'
  /*proj:14*/',ProjectQueryRequest,ProjectQueryResponse,ProjectQueryItem,ProjectGetRequest,ProjectGetResponse'
  ',ProjectProposalItem,ProjectConvItem,ProjectDocItem,ProjectSaveRequest,ProjectUserQueryRequest'
  ',ProjectUserQueryResponse,ProjectUserItem,ProjectUserSaveRequest,ProjectUserUserSaveRequest'
  /*proposal:8*/',ProposalQueryRequest,ProposalQueryResponse,ProposalQueryItem,ProposalGetRequest'
  ',ProposalGetResponse,ProposalOptionItem,ProposalSaveRequest,ProposalUserSaveRequest'
  /*push:3*/',PushQueueGetRequest,PushQueueGetResponse,PushQueueItem'
  /*resource:8*/',ResourceQueryRequest,ResourceQueryResponse,ResourceItem'
  ',ResourceGetRequest,ResourceGetResponse,ResourceSaveRequest,ResourceTriageRequest'
  ',ResourceUserSaveRequest'
  /*user:10*/',UserQueryRequest,UserQueryResponse,UserQueryItem,UserGetRequest'
  ',UserGetResponse,UserSaveRequest,UserAvatarSaveRequest'
  ',UserNotifySaveRequest,UserRecoverPasswordRequest,UserUserSaveRequest'
  )
import 'dart:mirrors';

//file contains all the wire types used on client and server

//nestable class for API requests. The RPC library doesn't allow requests to
//be derived from a superclass, so APIRequestBase has to be nested in each
//request type
class APIRequestBase {
  ///user nickname
  String nick;

  ///password for uid
  String password;
}

///methods to help with serializing requests (client side only)
class APISerializer {

  ///copy values into a map for each property of the object; this only goes
  /// 1 level so any nested objects have to be handled by the caller
  static void membersToMap(dynamic obj, Map<String, dynamic> map) {
    //Map map = new Map<String,dynamic>();
    InstanceMirror im = reflect(obj);
    ClassMirror cm = im.type;
    while (cm != null) {
      var decls = cm.declarations.values.where((dm) => dm is VariableMirror);
      decls.forEach((dm) {
        var key = MirrorSystem.getName(dm.simpleName);
        var val = im.getField(dm.simpleName).reflectee;
        if (val != null) map[key] = val;
      });
      cm = cm.superclass;
    }
    //return map;
  }
}

//nestable class for API responses. The RPC library doesn't allow responses to
//be derived from a superclass, so APIResponseBase has to be nested in each
//response type
class APIResponseBase {
  String errorMessage;

  ///code depends on specific call
  String errorCode;

  ///'Y' if call was successful
  String ok = 'Y';

  ///the newly created id (used rarely; only in cases where a new id is created
  /// and no other more specific return type is needed)
  int newId;

  ///convert ok to bool
  bool get isOK => ok == 'Y';

  //idea might work but kind of complex to deal with nested lists
  /*//copy the key+values from map into this instance.
  //Includes inherited members, but only copies one level deep
  void mapToMembers(Map map) {
    _mapToMembers(map, this);
  }

  static void _mapToMembers(Map map, Object o) {
    InstanceMirror im = reflect(o);
    ClassMirror cm = im.type;
    while (cm != null) {
      List<VariableMirror> decls = cm.declarations.values.where((dm) => dm is VariableMirror);
      decls.forEach((VariableMirror dm) {
        var key = MirrorSystem.getName(dm.simpleName);
        if (dm.type.isSubtypeOf(reflectType(APIResponseMember))) {
          //recurse
          _mapToMembers(map[key], );
        } else {
          //simple assignment
          im.setField(dm.simpleName, map[key]);
        }
      });
      cm = cm.superclass;
    }
  }*/

  //deserialize any member of map that matches a variable declared in this
  // class, but only for simple types (int, string).
  // So, this is modified by setting its values from map.
  void deserialize(Map map) {
    APIDeserializer.deserialize(map, this, null);
  }

}

//helpers for deserializing RPC calls (used client side only)
class APIDeserializer {

  //deserialize any member of map that matches a variable declared in o's
  // class, but only for simple types (int, string).
  // So, o is modified by setting its values from map.
  // Because of the primitiveness of the RPC library, you have
  // to pass in o.base (or null) to obase to also deserialize that.
  static void deserialize(Map map, Object o, APIResponseBase obase) {
    InstanceMirror im = reflect(o);
    ClassMirror cm = im.type;
    while (cm != null) {
      List<VariableMirror> decls = cm.declarations.values.where((dm) => dm is VariableMirror);
      decls.forEach((VariableMirror dm) {
        var key = MirrorSystem.getName(dm.simpleName);
        var value = map[key];
        Type t = value.runtimeType;
        if (t == int || t == String)
          im.setField(dm.simpleName, value);
      });
      cm = cm.superclass;
    }

    //handle obase recursively
    if (obase != null) deserialize(map['base'], obase, null);
  }
}

///a general purpose container for links from one entity to others
class APIResponseAssociation {
  String linkText, linkPaneKey;
}

class AuthenticateResponse {
  APIResponseBase base = new APIResponseBase();
  String publicName, nick; //nick with corrected capitalization
  int userId;
  String isSiteAdmin; //Y or N
}

class CategoryQueryRequest {
  APIRequestBase base;
  String kind;
}

class CategoryQueryResponse  {
  APIResponseBase base = new APIResponseBase();
  List<CategoryItemResponse> categories;
}

class CategoryDeleteRequest {
  APIRequestBase base;
  int catId; //0 or null for new
  String kind;
}

class CategorySaveRequest {
  APIRequestBase base;
  int catId; //0 or null for new
  String kind;
  int referenceId; //null or some existing category id
  String referenceMode; //blank=not changing parent; "S"=catId is a sister of referenceId; "C"=catId is a child of referenceId
  //also note if referenceId is null and referenceMode=C, this indicates to make
  // it top level
  String title;
  String description;
}

class CategoryMoveContentsRequest {
  APIRequestBase base;
  int catId;
  String kind;
  List<int> relatedIds; //project or resource ids to move
}

//single entry in CategoryQueryResponse
class CategoryItemResponse {
  int id;
  int parentId; //null if none
  String title;
  String description;
}

class ConvQueryRequest {
  APIRequestBase base;
  String term; //search term
}

class ConvQueryResponse  {
  APIResponseBase base = new APIResponseBase();
  List<ConvQueryConvItemResponse> convs;
}

//entry in ConvQueryResponse for one conv record
class ConvQueryConvItemResponse {
  int convId;
  String hitText; //title text surrounding the match phrase
  List<ConvQueryPostItemResponse> posts; //null if none
}

//entry in ConvQueryConvItemResponse
class ConvQueryPostItemResponse {
  String postId;
  String hitText; //post text surrounding the match phrase
}

class ConvGetRequest {
  APIRequestBase base;
  int convId;
  String mode; //U=unread, R=range, A=all
  String rangeFromWDT, rangeToWDT; //the exclusive range to include if mode=R, in wire-datetime format
  //For range loads: loads posts whose dates are between the given times, not
  // including the posts *at* those times
}

class ConvGetResponse  {
  APIResponseBase base = new APIResponseBase();
  String isManager; //Y if manager of owning proj/creator of owning event
  String isJoined; //Y if joined else N
  String readPositionWDT; //created_at of the last post read, or an earlier time, in wire-datetime format
  String title;
  String anySkipped; //Y if unread mode and earlier posts are omitted, else N
  List<ConvGetPostItem> posts;
  String replyAllowed; //Y if reply is allowed else N
  String replyAllowedDesc; //printable description of why reply isn't allowed or the amount that is allowed
  int replyMaxLength; //max length of reply
  String deleteMessage; //optional user message about when conv will be deleted
  String like; //from conv_xuser
  String bookmarked; //from conv_xuser
  String parentTitle; //title of parent item (project/event)
  String parentPaneKey; //pane key of parent item
}

//post element used in ConvGet
class ConvGetPostItem {
  String id; //uuid
  int authorId;
  String authorNick;
  String avatarUrl; //null if none
  String createdAtReadable;
  String createdAtWDT; //in wire-datetime format
  String ago; //for example "2 days"
  String ptext; //post text
  String imageUrl; //optional image in post
  String collapseMode; //blank or a string defined in ConvLib like "BlockedByAuthor"
  int collapsePosition; //position in ptext where expansion link should be placed; 0 means collapse all
  //note: use a high number for collapsePosition to not show a link
}

class ConvGetRulesRequest {
  APIRequestBase base;
  int convId;
}

class ConvGetRulesResponse  {
  APIResponseBase base = new APIResponseBase();
  int postMaxSize;
  int userDailyMax;
  String title;
}

class ConvSaveRequest {
  APIRequestBase base;
  int convId; //null or 0 if new conv
  int projectId;
  int eventId;
  int fromConvId;
  String openingPostId; //optional post id for the post this conv is spawned from
  String title;
  int postMaxSize;
  int userDailyMax;
}

class ConvPostGetRequest {
  APIRequestBase base;
  String postId;
}

class ConvPostGetResponse  {
  APIResponseBase base = new APIResponseBase();
  String avatarUrl; //of author
  String createdAtReadable; //including author timezone, example: '31 Dec 1999 17:05 (America/Denver)'
  String reaction; //from conv_post_user for the current user
  String throttleDescription; //in what way the author may be throttled, or empty/null if no restriction
  String canCensor; //Y if the current user has censoring authority and the post has gotten inappropriate votes
  String allReasons; //readable collection of reasons given in conv_post_user
}

class ConvPostSaveRequest {
  APIRequestBase base;
  int convId;
  String postId; //null/blank for new post
  String triggerWarning, ptext;
  String censored; //C or null
  String delete; //Y to delete or null
  String lastKnownWDT; //time of last viewed post in conv, in wire-datetime format (used to allow server to determine whether to update read position)
}

class ConvPostImageSaveRequest {
  APIRequestBase base;
  int convId;
  String ptext;
  List<int> imageBytes;
}

class ConvPostUserSaveRequest {
  APIRequestBase base;
  String postId;
  String reaction, reason; //see data model for definition; if reaction is null/empty, erases record
}

class ConvSetReadPositionRequest {
  APIRequestBase base;
  int convId;
  String positionWDT; //in wire-datetime format
}

class ConvUserSaveRequest {
  APIRequestBase base;
  int convId;
  String status; //null indicates no change; only J or Q values allowed
  String like; //null indicates no change
  String bookmarked; //null indicates no change
}

class ConvUserSaveResponse  {
  APIResponseBase base = new APIResponseBase();
  String action; //flag set when join was requested: 'J'=joined, 'R'=request sent, 'X'=disallowed
}

class DocQueryRequest {
  APIRequestBase base;
  String mode; //kind of documents to look for: R=root (that's the only value supported for now)
}

class DocQueryResponse {
  APIResponseBase base = new APIResponseBase();
  List<DocQueryItem> docs;
}

///element in DocQueryResponse
class DocQueryItem {
  int id;
  String title;
}

class DocGetRequest {
  APIRequestBase base;
  int docId;
  String specialCode; //if given, docId is ignored and the doc is looked up by code
  int revisionNo; //null for latest or a specific revision
  String getVerList; //Y or N; controls if the version list is returned
}

class DocGetResponse {
  APIResponseBase base = new APIResponseBase();
  int docId;
  String title, body;
  String htmlDiff; //readable diff from prior version to this version
  int projectId; //null for root docs (even though db has a value)
  String projectTitle;
  String isProjectManager; //Y if user is a manager of the related project else N
  String allowSave; //Y or N; controls whether changes are allowed by this user
  String reasonNotEditable; //null or a readable reason why user cannot edit this
  String createdAt; //when version created in readable format
  int proposalId; //proposal connected to the prior version (which created the requested version)
  List<DocGetVersionItem> verList; //list of all version (may be capped at ~100)
}

///element used in DocGetResponse
class DocGetVersionItem {
  int revisionNo;
  String createdAt; //when version created in readable format
}

class DocSaveRequest {
  APIRequestBase base;
  int docId; //0 for new document
  int projectId; //null for root doc, inspected for new docs only
  String title;
  String retitleMode; //R=retitle a project document, null=normal
  String body;
  String summary; //used for root doc proposals to summarize the change proposed
}

class DocRollbackRequest {
  APIRequestBase base;
  int docId;
  int revisionNo; //must match latest revision_no
}

class EventQueryRequest {
  APIRequestBase base;
  String title; //any part of title
  String dateFrom, dateTo; //required date range in user-entered date format (time should be zero, dateTo is inclusive of all events on that day)
  int miles; //0 or null to omit location search, else miles around lat/lon to include
  String lat, lon; //geolocation, or null to omit location search; float number as string, american format
}

class EventQueryResponse {
  APIResponseBase base = new APIResponseBase();
  List<EventItemResponse> events;
}

///used in EventQueryResponse for 1 event
class EventItemResponse {
  int id;
  String title;
  String startTime; //in readable format
  String creatorNick;
  int creatorId;
}

class EventRequest {
  APIRequestBase base;
  int eventId;
}

class EventGetResponse {
  APIResponseBase base = new APIResponseBase();
  String title, description, duration, location;
  String startTimeU; //in user entry packed date format
  String startTimeR; //in readable format
  String creatorNick;
  int creatorId;
  String creatorAvatarUrl; //null if none
  String createdAtR; //in readable format
  String lat, lon; //float number as string, american format
  List<EventGetUserResponse> users; //users going to event
  List<EventGetConvResponse> convs; //convs started about the event
  String isCreator; //Y if the requesting user is the event creator else N
}

///used in EventGetResponse
class EventGetUserResponse {
  int userId;
  String nick, publicName;
  String avatarUrl; //null if none
  String status, statusDesc;
}

///used in EventGetResponse for associated conv
class EventGetConvResponse {
  int id;
  String open, title;
  String lastActivity; //in wire date format
}

class EventSaveRequest {
  APIRequestBase base;
  int eventId; //0 for new record
  String title, description, duration, location;
  String startTime; //in user-entry packed date format
  String lat, lon; //float number as string, american format
}

class EventUserSaveRequest {
  APIRequestBase base;
  int eventId;
  String status, statusDesc;
  //note assumes this is about the requesting user
}

class ProjectQueryRequest {
  APIRequestBase base;
  int catId; //or null
  String title; //any part of title
}

class ProjectQueryResponse  {
  APIResponseBase base = new APIResponseBase();
  List<ProjectQueryItem> projects;
}

///element in ProjectQueryResponse
class ProjectQueryItem {
  int projectId;
  String title, description, leadership, privacy;
}

class ProjectGetRequest {
  APIRequestBase base;
  int projectId;
}

class ProjectGetResponse  {
  APIResponseBase base = new APIResponseBase();
  String active, leadership, privacy, title, description;
  int categoryId;
  String userKind; //from project_xuser.kind for current user

  //related child records
  List<ProjectProposalItem> proposals;
  List<ProjectConvItem> convs;
  List<ProjectDocItem> docs;
}

///element in ProjectGetResponse
class ProjectProposalItem {
  int id;
  String active, title, createdAt;
}

///element in ProjectGetResponse
class ProjectConvItem {
  int id;
  String open, title, lastActivity;
}

///element in ProjectGetResponse
class ProjectDocItem {
  int id;
  String title;
}

class ProjectSaveRequest {
  APIRequestBase base;
  int projectId; //0 if new
  String leadership, privacy,title,description;
  int categoryId;
}

class ProjectUserQueryRequest {
  APIRequestBase base;
  int projectId;
  String name; //matches any part of public name or nick
  int resultPage = 0; //0 for first page of 100 results
}

class ProjectUserQueryResponse  {
  APIResponseBase base = new APIResponseBase();
  String projectTitle;
  String completeLoad; //Y or N denoting if the load was complete
  String editable; //Y or N denoting if this user can edit project users
  List<ProjectUserItem> users;
}

//element in ProjectUserQueryResponse
class ProjectUserItem {
  int userId;
  String kind; //from project_xuser
  String throttle; //readable description of throttling or null if none
  String nick, publicName;
  String avatarUrl;  //null if nonw
  String voteKind; //from project_xuser_xuser by current user about userId
}

class ProjectUserSaveRequest {
  APIRequestBase base;
  int projectId;
  int userId; //not necessarily the current user
  String kind;
}

class ProjectUserUserSaveRequest {
  APIRequestBase base;
  int projectId;
  int aboutId; //the user being voted for
  String kind; //L or null
}

class ProposalQueryRequest {
  APIRequestBase base;
  String mode; //one of 'A'(active ROOT and SYS proposals), 'P'(PROJ), 'S'(closed SYS by year)
  int year; //required year for mode=S
  int projectId; //required for mode=P
}

class ProposalQueryResponse  {
  APIResponseBase base = new APIResponseBase();
  List<ProposalQueryItem> items;
}

///used in ProposalQueryResponse for one proposal
class ProposalQueryItem {
  int id;
  String title, kind;
}

class ProposalGetRequest {
  APIRequestBase base;
  int proposalId;
}

class ProposalGetResponse  {
  APIResponseBase base = new APIResponseBase();
  String active, kind, eligible, title, summary, summaryHtml, dtext;
  String timeout, deleteTime; //in wiredate format
  int winningOption, createdBy, projectId, docId;
  String createdByNick, createdByAvatarUrl;
  List<ProposalOptionItem> options;
  int myVote; //null or the vote for the requesting user
  String statusDescription; //readable description of the status and when it will close
  String myEligible; //Y if this user eligible to vote else N
}

///detail on one proposal option used in ProposalGetResponse; note that
/// voteCount will be 0 or null if proposal is open
class ProposalOptionItem {
  int optionNo, voteCount;
  String optionDesc;
}

class ProposalSaveRequest {
  APIRequestBase base;
  String kind; //see table def
  int projectId; //for kind=PROJ only
  String eligible; //see table def
  String title, summary;
  int days; //number of days to stay open
  List<String> options; //description of the options (order of this list determines the option #s)
}

class ProposalUserSaveRequest {
  APIRequestBase base;
  int proposalId;
  int vote; //may be null to delete vote
}

class PushQueueGetRequest {
  APIRequestBase base;
  String depth; //L=light, F=full
}

class PushQueueGetResponse  {
  APIResponseBase base = new APIResponseBase();
  List<PushQueueItem> items;
  String fullModeStatus; //normally null; if 'T' then full mode is disallowed based on timing
}

//Any of 3 kinds of push queue items. We aren't using separate classes
// for each, since the client uses these in inter-window messaging
// and it's better to avoid parsing complexity
class PushQueueItem {
  String kind; //N=notify, U=unread, S=suggested, B=Bookmarked
  String why; //why the item is in the queue: G=general, V=votable, I=invited, R=recommended
    //all kinds other than S should have why=G
  int iid; //conv or proposal ID
  String sid; //notification ID
  String text; //notification text
  String linkText, linkPaneKey; //link to any other pane from notification, or link to conv or proposal
}

class ResourceQueryRequest {
  APIRequestBase base;
  int categoryId; //null to omit category searching
  String title; //any part of title
  String kind; //optional exact match for kind
}

class ResourceQueryResponse  {
  APIResponseBase base = new APIResponseBase();
  List<ResourceItem> items;
}

///resource used in ResourceQueryResponse
class ResourceItem {
  int id;
  String title, url, description;
}

class ResourceGetRequest {
  APIRequestBase base;
  int id;
}

class ResourceGetResponse  {
  APIResponseBase base = new APIResponseBase();
  int categoryId, userId, importantCount;
  String title, description;
  String createdAt; //readable format
  String visible, kind, url;
  String userKind; //kind from resource_xuser
  String isSiteAdmin; //Y if this user is a site admin
  String isCreator; //Y if this user created the resource
  String nick; //of the creator
}

class ResourceSaveRequest {
  APIRequestBase base;
  int id; //0 for new record
  int categoryId; //inspected for new resources only
  String title, description;
  String kind, url;
}

class ResourceTriageRequest {
  APIRequestBase base;
  int id;
  String mode; //R=reset; D=delete
}

class ResourceUserSaveRequest {
  APIRequestBase base;
  int id;
  String kind; //resource_xuser.kind
}

class UserQueryRequest {
  APIRequestBase base;
  String name; //any part of name or nick
}

class UserQueryResponse  {
  APIResponseBase base = new APIResponseBase();
  List<UserQueryItem> users;
}

///a user in UserQueryResponse
class UserQueryItem {
  int id;
  String nick, kind, publicName;
  String avatarUrl; //null if none
}

class UserGetRequest {
  APIRequestBase base;
  int userId; //0 for blank data
  String includeDetail; //Y or N; if Y, includes events, project, and resources
  String includeEditing; //Y or N; if Y includes dropdown values for editing (such as timezones)
}

class UserGetResponse  {
  APIResponseBase base = new APIResponseBase();
  String status, nick, email, kind, isSiteAdmin, publicName;
  String prefEmailNotify = 'N'; //Y or N
  Map<String,String> publicLinks;
  String timeZone;
  List<String> allTimeZones; //dropdown values
  String avatarUrl; //null if none
  String userUserKind; //xuser_xuser.kind value by the current user about the user in this object
  List<APIResponseAssociation> events; //events the user is going to
  List<APIResponseAssociation> projects; //projects the user is part of
  List<APIResponseAssociation> resources; //resource the user created
}

class UserSaveRequest {
  APIRequestBase base;
  String isNew; //Y or N
  String isDelete; //Y or N
  String saveNick; //nick to create (new users only)
  String savePW; //password to change to, or null if not changing
  String kind, email, isSiteAdmin, publicName, prefEmailNotify;
  Map<String,String> publicLinks;
  String timeZone;
}

class UserAvatarSaveRequest {
  APIRequestBase base;
  List<int> imageBytes;
}

class UserNotifySaveRequest {
  APIRequestBase base;
  String notifyId; //id to dismiss
}

class UserRecoverPasswordRequest {
  APIRequestBase base;
  String recoveryNick;
  String mode; //E=send email to start recovery; V=validate code from the email
  String recoveryPassword; //new password in mode V
  String code; //user entered code in mode V
}

class UserUserSaveRequest {
  APIRequestBase base;
  int aboutId; //the subject of the opinion being saved
  String kind;
}
