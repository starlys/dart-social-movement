import 'dart:async';
import 'dart:html';
import 'dart:convert';
import 'messages.dart';
import 'twotier/wtypes.dart';
import 'root/globals.dart';

///helpers for calling RPC methods; must call init before use
class RpcLib {
  static String serverBaseUrl;

  ///init server URL - for development, if loaded from file://... then use
  /// local server
  static init() {
    if (window.location.protocol == "file:")
      serverBaseUrl = 'http://localhost:8083/servant/v1/';
    else
      serverBaseUrl = 'https://www.autistic.zone/servant/v1/';
  }

  ///call a server method; returns a Map (see APIDeserializer for ideas on what to do with the
  /// returned value)
  static Future<Map<String,dynamic>> rpcAsMap(String method, dynamic args) async {
    String url = serverBaseUrl + method;

    //seed map with credentials
    Map<String, dynamic> argsmap = new Map<String, dynamic>();
    argsmap['base'] = { 'nick': Globals.nick, 'password': Globals.password };

    //add map values for the properties of args
    APISerializer.membersToMap(args, argsmap);

    //send json request
    String js = JSON.encode(argsmap);
    Map<String, String> requestHeaders = {
      'Content-Type': "application/json"
    };
    HttpRequest hreq = await HttpRequest.request(url, method:'POST', //mimeType:'',
      responseType : 'text',
      requestHeaders : requestHeaders, sendData : js);
    Map responseMap = JSON.decode(hreq.responseText);
    return responseMap;

    //old technique
    /* //convert to formdata string like a=b&c=d, call http
    bool ok = true;
    HttpRequest hreq = await postFormData(url, argsmap)
      .catchError(() {
        ok = false;
      });

    //decode reponse to Map
    if (ok) {
      Map responseMap = JSON.decode(hreq.responseText);
      return responseMap;
    }

    return {'base': { 'errorMessage': 'Communications failure', 'errorCode': 1, 'ok': false} };
    */
  }

  //slight rewrite of HttpRequest.postFormData to allow non-string values
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

  ///call any server command that returns a plain APIResponseBase
  static Future<APIResponseBase> command(String command, dynamic req) async {
    Map raw = await rpcAsMap(command, req);
    APIResponseBase ret = new APIResponseBase();
    ret.deserialize(raw);
    Messages.showAPIError(ret);
    return ret;
  }


  //Remainder of methods don't have comments; they all just wrap the
  //server methods of the same name. Ideally a tool would write this
  // automatically but the time it takes to find a mature library for this
  // is probably more than writing it all out!


  static Future<AuthenticateResponse> authenticate(APIRequestBase req) async {
    var authRaw = await RpcLib.rpcAsMap('Authenticate', req);
    AuthenticateResponse auth = new AuthenticateResponse();
    APIDeserializer.deserialize(authRaw, auth, auth.base);
    return auth;
  }
  static Future<UserGetResponse> userGet(UserGetRequest req) async {
    Map raw = await rpcAsMap('UserGet', req);
    UserGetResponse ret = new UserGetResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.allTimeZones = raw['allTimeZones'];
    ret.publicLinks = raw['publicLinks'];

    //associatios
    ret.events = new List<APIResponseAssociation>();
    ret.projects = new List<APIResponseAssociation>();
    ret.resources = new List<APIResponseAssociation>();
    for (Map m in raw['events']) {
      var c = new APIResponseAssociation();
      APIDeserializer.deserialize(m, c, null);
      ret.events.add(c);
    }
    for (Map m in raw['projects']) {
      var c = new APIResponseAssociation();
      APIDeserializer.deserialize(m, c, null);
      ret.projects.add(c);
    }
    for (Map m in raw['resources']) {
      var c = new APIResponseAssociation();
      APIDeserializer.deserialize(m, c, null);
      ret.resources.add(c);
    }

    return ret;
  }
  static Future<CategoryQueryResponse> categoryQuery(CategoryQueryRequest req) async {
    Map raw = await rpcAsMap('CategoryQuery', req);
    CategoryQueryResponse ret = new CategoryQueryResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.categories = new List<CategoryItemResponse>();
    for (Map m in raw['categories']) {
      var c = new CategoryItemResponse();
      APIDeserializer.deserialize(m, c, null);
      ret.categories.add(c);
    }
    return ret;
  }
  static Future<ProjectQueryResponse> projectQuery(ProjectQueryRequest req) async {
    Map raw = await rpcAsMap('ProjectQuery', req);
    ProjectQueryResponse ret = new ProjectQueryResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.projects = new List<ProjectQueryItem>();
    for (Map m in raw['projects']) {
      var c = new ProjectQueryItem();
      APIDeserializer.deserialize(m, c, null);
      ret.projects.add(c);
    }
    return ret;
  }
  static Future<ProjectUserQueryResponse> projectUserQuery(ProjectUserQueryRequest req) async {
    Map raw = await rpcAsMap('ProjectUserQuery', req);
    ProjectUserQueryResponse ret = new ProjectUserQueryResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.users = new List<ProjectUserItem>();
    for (Map m in raw['users']) {
      var c = new ProjectUserItem();
      APIDeserializer.deserialize(m, c, null);
      ret.users.add(c);
    }
    return ret;
  }
  static Future<ProjectGetResponse> projectGet(ProjectGetRequest req) async {
    Map raw = await rpcAsMap('ProjectGet', req);
    ProjectGetResponse ret = new ProjectGetResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.proposals = new List<ProjectProposalItem>();
    for (Map m in raw['proposals']) {
      var c = new ProjectProposalItem();
      APIDeserializer.deserialize(m, c, null);
      ret.proposals.add(c);
    }
    ret.convs = new List<ProjectConvItem>();
    for (Map m in raw['convs']) {
      var c = new ProjectConvItem();
      APIDeserializer.deserialize(m, c, null);
      ret.convs.add(c);
    }
    ret.docs = new List<ProjectDocItem>();
    for (Map m in raw['docs']) {
      var c = new ProjectDocItem();
      APIDeserializer.deserialize(m, c, null);
      ret.docs.add(c);
    }
    return ret;
  }
  static Future<ProposalQueryResponse> proposalQuery(ProposalQueryRequest req) async {
    Map raw = await rpcAsMap('ProposalQuery', req);
    ProposalQueryResponse ret = new ProposalQueryResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.items = new List<ProposalQueryItem>();
    for (Map m in raw['items']) {
      var c = new ProposalQueryItem();
      APIDeserializer.deserialize(m, c, null);
      ret.items.add(c);
    }
    return ret;
  }
  static Future<ProposalGetResponse> proposalGet(ProposalGetRequest req) async {
    Map raw = await rpcAsMap('ProposalGet', req);
    ProposalGetResponse ret = new ProposalGetResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.options = new List<ProposalOptionItem>();
    for (Map m in raw['options']) {
      var c = new ProposalOptionItem();
      APIDeserializer.deserialize(m, c, null);
      ret.options.add(c);
    }
    return ret;
  }
  static Future<ConvQueryResponse> convQuery(ConvQueryRequest req) async {
    Map raw = await rpcAsMap('ConvQuery', req);
    ConvQueryResponse ret = new ConvQueryResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.convs = new List<ConvQueryConvItemResponse>();
    for (Map m1 in raw['convs']) {
      var c = new ConvQueryConvItemResponse();
      APIDeserializer.deserialize(m1, c, null);
      ret.convs.add(c);
      c.posts = new List<ConvQueryPostItemResponse>();
      if (m1['posts'] != null) {
        for (Map m2 in m1['posts']) {
          var p = new ConvQueryPostItemResponse();
          APIDeserializer.deserialize(m2, p, null);
          c.posts.add(p);
        }
      }
    }
    return ret;
  }
  static Future<ConvGetResponse> convGet(ConvGetRequest req) async {
    Map raw = await rpcAsMap('ConvGet', req);
    ConvGetResponse ret = new ConvGetResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.posts = new List<ConvGetPostItem>();
    for (Map m in raw['posts']) {
      var c = new ConvGetPostItem();
      APIDeserializer.deserialize(m, c, null);
      ret.posts.add(c);
    }
    return ret;
  }
  static Future<ConvGetRulesResponse> convGetRules(ConvGetRulesRequest req) async {
    Map raw = await rpcAsMap('ConvGetRules', req);
    ConvGetRulesResponse ret = new ConvGetRulesResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    return ret;
  }
  static Future<ConvUserSaveResponse> convUserSave(ConvUserSaveRequest req) async {
    Map raw = await rpcAsMap('ConvUserSave', req);
    ConvUserSaveResponse ret = new ConvUserSaveResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    return ret;
  }
  static Future<DocQueryResponse> docQuery(DocQueryRequest req) async {
    Map raw = await rpcAsMap('DocQuery', req);
    DocQueryResponse ret = new DocQueryResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.docs = new List<DocQueryItem>();
    for (Map m in raw['docs']) {
      var c = new DocQueryItem();
      APIDeserializer.deserialize(m, c, null);
      ret.docs.add(c);
    }
    return ret;
  }
  static Future<DocGetResponse> docGet(DocGetRequest req) async {
    //print('DocGet called for ${req.docId}');
    Map raw = await rpcAsMap('DocGet', req);
    DocGetResponse ret = new DocGetResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.verList = new List<DocGetVersionItem>();
    for (Map m in raw['verList']) {
      var c = new DocGetVersionItem();
      APIDeserializer.deserialize(m, c, null);
      ret.verList.add(c);
    }
    return ret;
  }
  static Future<EventQueryResponse> eventQuery(EventQueryRequest req) async {
    Map raw = await rpcAsMap('EventQuery', req);
    EventQueryResponse ret = new EventQueryResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.events = new List<EventItemResponse>();
    for (Map m in raw['events']) {
      var c = new EventItemResponse();
      APIDeserializer.deserialize(m, c, null);
      ret.events.add(c);
    }
    return ret;
  }
  static Future<EventGetResponse> eventGet(EventRequest req) async {
    Map raw = await rpcAsMap('EventGet', req);
    EventGetResponse ret = new EventGetResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.users = new List<EventGetUserResponse>();
    for (Map m in raw['users']) {
      var c = new EventGetUserResponse();
      APIDeserializer.deserialize(m, c, null);
      ret.users.add(c);
    }
    ret.convs = new List<EventGetConvResponse>();
    for (Map m in raw['convs']) {
      var c = new EventGetConvResponse();
      APIDeserializer.deserialize(m, c, null);
      ret.convs.add(c);
    }
    return ret;
  }
  static Future<ResourceQueryResponse> resourceQuery(ResourceQueryRequest req) async {
    Map raw = await rpcAsMap('ResourceQuery', req);
    ResourceQueryResponse ret = new ResourceQueryResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.items = new List<ResourceItem>();
    for (Map m in raw['items']) {
      var c = new ResourceItem();
      APIDeserializer.deserialize(m, c, null);
      ret.items.add(c);
    }
    return ret;
  }
  static Future<ResourceGetResponse> resourceGet(ResourceGetRequest req) async {
    Map raw = await rpcAsMap('ResourceGet', req);
    ResourceGetResponse ret = new ResourceGetResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    return ret;
  }
  static Future<UserQueryResponse> userQuery(UserQueryRequest req) async {
    Map raw = await rpcAsMap('UserQuery', req);
    UserQueryResponse ret = new UserQueryResponse();
    APIDeserializer.deserialize(raw, ret, ret.base);
    Messages.showAPIError(ret.base);
    ret.users = new List<UserQueryItem>();
    for (Map m in raw['users']) {
      var c = new UserQueryItem();
      APIDeserializer.deserialize(m, c, null);
      ret.users.add(c);
    }
    return ret;
  }



}
