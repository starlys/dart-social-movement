import 'dart:async';
import 'dart:html';
import 'dart:convert';
import 'messages.dart';
import 'package:models/models.dart';
import 'root/globals.dart';

///helpers for calling RPC methods; must call init before use
class RpcLib {
  static String serverBaseUrl;

  ///init server URL - for development, if loaded from file://... then use
  /// local server
  static init() {
    if (window.location.protocol == "file:")
      serverBaseUrl = 'http://localhost:8083/servant/v2/';
    else
      serverBaseUrl = 'https://www.autistic.zone/servant/v2/';
  }

  ///add credentials to a Map version of the request wire object, and return it as a json string
  static String requestToJson(String method, Map<String,dynamic> requestMap) {
    requestMap['base'] = { 'nick': Globals.nick, 'password': Globals.password };
    return json.encode(requestMap);
  }

  ///make the RPC call and return the results as a Map
  static Future<Map<String,dynamic>> rpcAsMap(String method, Map<String,dynamic> requestMap) async {
    String url = serverBaseUrl + method;
    String requestJson =requestToJson(method, requestMap);

    //send json request
    Map<String, String> requestHeaders = {
      'Content-Type': "application/json"
    };
    HttpRequest hreq = await HttpRequest.request(url, method:'POST', 
      responseType: 'json',
      requestHeaders: requestHeaders, 
      sendData: requestJson);
    Map responseMap = json.decode(hreq.responseText);
    return responseMap;
  }

  ///slight rewrite of HttpRequest.postFormData to allow non-string values
  static Future<HttpRequest> postFormData(String url, Map<String, dynamic> data) {
    var parts = [];
    data.forEach((key, value) {
    parts.add("${Uri.encodeQueryComponent(key)}="
        "${Uri.encodeQueryComponent(value.toString())}");
    });
    var formData = parts.join("&");

    Map<String, String> requestHeaders = {
      'Content-Type': "application/x-www-form-urlencoded; charset=UTF-8"
    };

    return HttpRequest.request(url, method : "POST", withCredentials : false,
      responseType : 'text',
      requestHeaders : requestHeaders, sendData : formData);
  }

  //Remainder of methods don't have comments; they all just wrap the
  //server methods of the same name. Ideally a tool would write this
  // automatically but the time it takes to find a mature library for this
  // is probably more than writing it all out!
  //ALPHABETICAL LIST (at least the first word of each method)

  static Future<AuthenticateResponse> authenticate(APIRequestBase req) async {
    final requestMap = APIRequestBaseSerializer.toMap(req);
    var responseMap = await RpcLib.rpcAsMap('Authenticate', requestMap);
    final response = AuthenticateResponseSerializer.fromMap(responseMap);
    return response;
  }
  static Future<CategoryQueryResponse> categoryQuery(CategoryQueryRequest req) async {
    final requestMap = CategoryQueryRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('CategoryQuery', requestMap);
    final response = CategoryQueryResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<APIResponseBase> categoryMoveContents(CategoryMoveContentsRequest req) async {
    final requestMap = CategoryMoveContentsRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('CategoryMoveContents', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> categorySave(CategorySaveRequest req) async {
    final requestMap = CategorySaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('CategorySave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> categoryDelete(CategoryDeleteRequest req) async {
    final requestMap = CategoryDeleteRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('CategoryDelete', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<ConvQueryResponse> convQuery(ConvQueryRequest req) async {
    final requestMap = ConvQueryRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ConvQuery', requestMap);
    final response = ConvQueryResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<ConvGetResponse> convGet(ConvGetRequest req) async {
    final requestMap = ConvGetRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ConvGet', requestMap);
    final response = ConvGetResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<APIResponseBase> convSetReadPosition(ConvSetReadPositionRequest req) async {
    final requestMap = ConvSetReadPositionRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ConvSetReadPosition', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<ConvPostGetResponse> convPostGet(ConvPostGetRequest req) async {
    final requestMap = ConvPostGetRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ConvPostGet', requestMap);
    final response = ConvPostGetResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<APIResponseBase> convSave(ConvSaveRequest req) async {
    final requestMap = ConvSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ConvSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> convPostSave(ConvPostSaveRequest req) async {
    final requestMap = ConvPostSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ConvPostSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> convPostUserSave(ConvPostUserSaveRequest req) async {
    final requestMap = ConvPostUserSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ConvPostUserSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> convPostImageSave(ConvPostImageSaveRequest req) async {
    final requestMap = ConvPostImageSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ConvPostImageSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<ConvGetRulesResponse> convGetRules(ConvGetRulesRequest req) async {
    final requestMap = ConvGetRulesRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ConvGetRules', requestMap);
    final response = ConvGetRulesResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<ConvUserSaveResponse> convUserSave(ConvUserSaveRequest req) async {
    final requestMap = ConvUserSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ConvUserSave', requestMap);
    final response = ConvUserSaveResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<DocQueryResponse> docQuery(DocQueryRequest req) async {
    final requestMap = DocQueryRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('DocQuery', requestMap);
    final response = DocQueryResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<DocGetResponse> docGet(DocGetRequest req) async {
    final requestMap = DocGetRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('DocGet', requestMap);
    final response = DocGetResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<APIResponseBase> docSave(DocSaveRequest req) async {
    final requestMap = DocSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('DocSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<EventQueryResponse> eventQuery(EventQueryRequest req) async {
    final requestMap = EventQueryRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('EventQuery', requestMap);
    final response = EventQueryResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<EventGetResponse> eventGet(EventRequest req) async {
    final requestMap = EventRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('EventGet', requestMap);
    final response = EventGetResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<APIResponseBase> eventSave(EventSaveRequest req) async {
    final requestMap = EventSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('EventSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> eventUserSave(EventUserSaveRequest req) async {
    final requestMap = EventUserSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('EventUserSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> eventDelete(EventRequest req) async {
    final requestMap = EventRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('EventDelete', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<ProjectQueryResponse> projectQuery(ProjectQueryRequest req) async {
    final requestMap = ProjectQueryRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ProjectQuery', requestMap);
    final response =ProjectQueryResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<ProjectUserQueryResponse> projectUserQuery(ProjectUserQueryRequest req) async {
    final requestMap = ProjectUserQueryRequestSerializer.toMap(req);
    Map responseMap = await rpcAsMap('ProjectUserQuery', requestMap);
    final response = ProjectUserQueryResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<ProjectGetResponse> projectGet(ProjectGetRequest req) async {
    final requestMap = ProjectGetRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ProjectGet', requestMap);
    final response = ProjectGetResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<APIResponseBase> projectSave(ProjectSaveRequest req) async {
    final requestMap = ProjectSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ProjectSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> projectUserSave(ProjectUserSaveRequest req) async {
    final requestMap = ProjectUserSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ProjectUserSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> projectUserUserSave(ProjectUserUserSaveRequest req) async {
    final requestMap = ProjectUserUserSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ProjectUserUserSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<ProposalQueryResponse> proposalQuery(ProposalQueryRequest req) async {
    final requestMap = ProposalQueryRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ProposalQuery', requestMap);
    final response = ProposalQueryResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<ProposalGetResponse> proposalGet(ProposalGetRequest req) async {
    final requestMap = ProposalGetRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ProposalGet', requestMap);
    final response = ProposalGetResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<APIResponseBase> proposalSave(ProposalSaveRequest req) async {
    final requestMap = ProposalSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ProposalSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> proposalDelete(ProposalGetRequest req) async {
    final requestMap = ProposalGetRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ProposalDelete', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> proposalUserSave(ProposalUserSaveRequest req) async {
    final requestMap = ProposalUserSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ProposalUserSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<PushQueueGetResponse> pushQueueGet(PushQueueGetRequest req) async {
    final requestMap = PushQueueGetRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('PushQueueGet', requestMap);
    final response = PushQueueGetResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<ResourceQueryResponse> resourceQuery(ResourceQueryRequest req) async {
    final requestMap = ResourceQueryRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ResourceQuery', requestMap);
    final response = ResourceQueryResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<ResourceGetResponse> resourceGet(ResourceGetRequest req) async {
    final requestMap = ResourceGetRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ResourceGet', requestMap);
    final response = ResourceGetResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<APIResponseBase> resourceTriage(ResourceTriageRequest req) async {
    final requestMap = ResourceTriageRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ResourceTriage', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> resourceSave(ResourceSaveRequest req) async {
    final requestMap = ResourceSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ResourceSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> resourceUserSave(ResourceUserSaveRequest req) async {
    final requestMap = ResourceUserSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('ResourceUserSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<UserGetResponse> userGet(UserGetRequest req) async {
    final requestMap = UserGetRequestSerializer.toMap(req);
    Map responseMap = await rpcAsMap('UserGet', requestMap);
    final response = UserGetResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<UserQueryResponse> userQuery(UserQueryRequest req) async {
    final requestMap = UserQueryRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('UserQuery', requestMap);
    final response = UserQueryResponseSerializer.fromMap(responseMap);
    Messages.showAPIError(response.base);
    return response;
  }
  static Future<APIResponseBase> userSave(UserSaveRequest req) async {
    final requestMap = UserSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('UserSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> userAvatarSave(UserAvatarSaveRequest req) async {
    final requestMap = UserAvatarSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('UserAvatarSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> userNotifySave(UserNotifySaveRequest req) async {
    final requestMap = UserNotifySaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('UserNotifySave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> userRecoverPassword(UserRecoverPasswordRequest req) async {
    final requestMap = UserRecoverPasswordRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('UserRecoverPassword', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
  static Future<APIResponseBase> userUserSave(UserUserSaveRequest req) async {
    final requestMap = UserUserSaveRequestSerializer.toMap(req); 
    Map responseMap = await rpcAsMap('UserUserSave', requestMap);
    final response = APIResponseBaseSerializer.fromMap(responseMap);
    Messages.showAPIError(response);
    return response;
  }
}
