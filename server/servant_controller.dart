import 'dart:async';
import 'package:angel_framework/angel_framework.dart';
//import 'package:angel_container/angel_container.dart';
//import 'package:reflectable/reflectable.dart';
import 'servant.dart';
import '../models/models.dart';
//import 'main.reflectable.dart'; // Import generated code.

/*
class ControllerReflector extends Reflectable {
  const ControllerReflector()
      : super(invokingCapability);
}
const Reflector controllerReflector = const ControllerReflector();
*/

///exposed public API methods; this class only handles routing and serialization,
/// calling servant for the implementation. See servant class for comments.
@Expose("/servant/v2")
class ServantController extends Controller {

  ///bounce back the given code/message
  /// verify with: http://localhost:8083/servant/v2/HelloWorld?errorCode=x&errorMessage=y
  @Expose('HelloWorld', method: 'GET')
  dynamic helloWorld(RequestContext req) {
    var errorCode = req.queryParameters['errorCode'] as String;
    var errorMessage = req.queryParameters['errorMessage'] as String;
    final result = APIResponseBase(ok: 'Y', errorCode: errorCode, errorMessage: errorMessage);
    return APIResponseBaseSerializer.toMap(result);
  }

  @Expose('Authenticate', method: 'POST')
  Future authenticate(RequestContext req) async {
    await req.parseBody();
    final args = APIRequestBaseSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().authenticate(args);
    return AuthenticateResponseSerializer.toMap(result);
  }

  @Expose('CategoryQuery', method: 'POST')
  Future categoryQuery(RequestContext req) async {
    await req.parseBody();
    final args = CategoryQueryRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().categoryQuery(args);
    return CategoryQueryResponseSerializer.toMap(result);
  }

  @Expose('CategorySave', method: 'POST')
  Future categorySave(RequestContext req) async {
    await req.parseBody();
    final args = CategorySaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().categorySave(args);
    return APIResponseBaseSerializer.toMap(result);
  }

  @Expose('CategoryDelete', method: 'POST')
  Future categoryDelete(RequestContext req) async {
    await req.parseBody();
    final args = CategoryDeleteRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().categoryDelete(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('CategoryMoveContents', method: 'POST')
  Future categoryMoveContents(RequestContext req) async {
    await req.parseBody();
    final args = CategoryMoveContentsRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().categoryMoveContents(args);
    return APIResponseBaseSerializer.toMap(result);
  }

  @Expose('CategoryMoveContents', method: 'POST')
  Future convQuery(RequestContext req) async {
    await req.parseBody();
    final args = ConvQueryRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().convQuery(args);
    return ConvQueryResponseSerializer.toMap(result);
  }

  @Expose('ConvGet', method: 'POST')
  Future convGet(RequestContext req) async {
    await req.parseBody();
    final args = ConvGetRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().convGet(args);
    return ConvGetResponseSerializer.toMap(result);
  }

  @Expose('ConvGetRules', method: 'POST')
  Future convGetRules(RequestContext req) async {
    await req.parseBody();
    final args = ConvGetRulesRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().convGetRules(args);
    return ConvGetRulesResponseSerializer.toMap(result);
  }

  @Expose('ConvSave', method: 'POST')
  Future convSave(RequestContext req) async {
    await req.parseBody();
    final args = ConvSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().convSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ConvPostGet', method: 'POST')
  Future convPostGet(RequestContext req) async {
    await req.parseBody();
    final args = ConvPostGetRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().convPostGet(args);
    return ConvPostGetResponseSerializer.toMap(result);
  }
  
  @Expose('ConvPostSave', method: 'POST')
  Future convPostSave(RequestContext req) async {
    await req.parseBody();
    final args = ConvPostSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().convPostSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ConvPostImageSave', method: 'POST')
  Future convPostImageSave(RequestContext req) async {
    await req.parseBody();
    final args = ConvPostImageSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().convPostImageSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }

  @Expose('ConvPostUserSave', method: 'POST')
  Future convPostUserSave(RequestContext req) async {
    await req.parseBody();
    final args = ConvPostUserSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().convPostUserSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ConvSetReadPosition', method: 'POST')
  Future convSetReadPosition(RequestContext req) async {
    await req.parseBody();
    final args = ConvSetReadPositionRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().convSetReadPosition(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ConvUserSave', method: 'POST')
  Future convUserSave(RequestContext req) async {
    await req.parseBody();
    final args = ConvUserSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().convUserSave(args);
    return ConvUserSaveResponseSerializer.toMap(result);
  }
  
  @Expose('DocQuery', method: 'POST')
  Future docQuery(RequestContext req) async {
    await req.parseBody();
    final args = DocQueryRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().docQuery(args);
    return DocQueryResponseSerializer.toMap(result);
  }
  
  @Expose('DocGet', method: 'POST')
  Future docGet(RequestContext req) async {
    await req.parseBody();
    final args = DocGetRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().docGet(args);
    return DocGetResponseSerializer.toMap(result);
  }
  
  @Expose('DocSave', method: 'POST')
  Future docSave(RequestContext req) async {
    await req.parseBody();
    final args = DocSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().docSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('DocRollback', method: 'POST')
  Future docRollback(RequestContext req) async {
    await req.parseBody();
    final args = DocRollbackRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().docRollback(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('EventQuery', method: 'POST')
  Future eventQuery(RequestContext req) async {
    await req.parseBody();
    final args = EventQueryRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().eventQuery(args);
    return EventQueryResponseSerializer.toMap(result);
  }
  
  @Expose('EventGet', method: 'POST')
  Future eventGet(RequestContext req) async {
    await req.parseBody();
    final args = EventRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().eventGet(args);
    return EventGetResponseSerializer.toMap(result);
  }
  
  @Expose('EventSave', method: 'POST')
  Future eventSave(RequestContext req) async {
    await req.parseBody();
    final args = EventSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().eventSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('EventDelete', method: 'POST')
  Future eventDelete(RequestContext req) async {
    await req.parseBody();
    final args = EventRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().eventDelete(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('EventUserSave', method: 'POST')
  Future eventUserSave(RequestContext req) async {
    await req.parseBody();
    final args = EventUserSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().eventUserSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ProjectQuery', method: 'POST')
  Future projectQuery(RequestContext req) async {
    await req.parseBody();
    final args = ProjectQueryRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().projectQuery(args);
    return ProjectQueryResponseSerializer.toMap(result);
  }
  
  @Expose('ProjectGet', method: 'POST')
  Future projectGet(RequestContext req) async {
    await req.parseBody();
    final args = ProjectGetRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().projectGet(args);
    return ProjectGetResponseSerializer.toMap(result);
  }
  
  @Expose('ProjectSave', method: 'POST')
  Future projectSave(RequestContext req) async {
    await req.parseBody();
    final args = ProjectSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().projectSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ProjectUserQuery', method: 'POST')
  Future projectUserQuery(RequestContext req) async {
    await req.parseBody();
    final args = ProjectUserQueryRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().projectUserQuery(args);
    return ProjectUserQueryResponseSerializer.toMap(result);
  }
  
  @Expose('ProjectUserSave', method: 'POST')
  Future projectUserSave(RequestContext req) async {
    await req.parseBody();
    final args = ProjectUserSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().projectUserSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ProjectUserUserSave', method: 'POST')
  Future projectUserUserSave(RequestContext req) async {
    await req.parseBody();
    final args = ProjectUserUserSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().projectUserUserSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ProposalQuery', method: 'POST')
  Future proposalQuery(RequestContext req) async {
    await req.parseBody();
    final args = ProposalQueryRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().proposalQuery(args);
    return ProposalQueryResponseSerializer.toMap(result);
  }
  
  @Expose('ProposalGet', method: 'POST')
  Future proposalGet(RequestContext req) async {
    await req.parseBody();
    final args = ProposalGetRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().proposalGet(args);
    return ProposalGetResponseSerializer.toMap(result);
  }
  
  @Expose('ProposalSave', method: 'POST')
  Future proposalSave(RequestContext req) async {
    await req.parseBody();
    final args = ProposalSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().proposalSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ProposalDelete', method: 'POST')
  Future proposalDelete(RequestContext req) async {
    await req.parseBody();
    final args = ProposalGetRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().proposalDelete(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ProposalUserSave', method: 'POST')
  Future proposalUserSave(RequestContext req) async {
    await req.parseBody();
    final args = ProposalUserSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().proposalUserSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('PushQueueGet', method: 'POST')
  Future pushQueueGet(RequestContext req) async {
    await req.parseBody();
    final args = PushQueueGetRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().pushQueueGet(args);
    return PushQueueGetResponseSerializer.toMap(result);
  }
  
  @Expose('ResourceQuery', method: 'POST')
  Future resourceQuery(RequestContext req) async {
    await req.parseBody();
    final args = ResourceQueryRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().resourceQuery(args);
    return ResourceQueryResponseSerializer.toMap(result);
  }
  
  @Expose('ResourceGet', method: 'POST')
  Future resourceGet(RequestContext req) async {
    await req.parseBody();
    final args = ResourceGetRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().resourceGet(args);
    return ResourceGetResponseSerializer.toMap(result);
  }
  
  @Expose('ResourceSave', method: 'POST')
  Future resourceSave(RequestContext req) async {
    await req.parseBody();
    final args = ResourceSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().resourceSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ResourceTriage', method: 'POST')
  Future resourceTriage(RequestContext req) async {
    await req.parseBody();
    final args = ResourceTriageRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().resourceTriage(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('ResourceUserSave', method: 'POST')
  Future resourceUserSave(RequestContext req) async {
    await req.parseBody();
    final args = ResourceUserSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().resourceUserSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('UserQuery', method: 'POST')
  Future userQuery(RequestContext req) async {
    await req.parseBody();
    final args = UserQueryRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().userQuery(args);
    return UserQueryResponseSerializer.toMap(result);
  }
  
  @Expose('UserGet', method: 'POST')
  Future userGet(RequestContext req) async {
    await req.parseBody();
    final args = UserGetRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().userGet(args);
    return UserGetResponseSerializer.toMap(result);
  }
  
  @Expose('UserSave', method: 'POST')
  Future userSave(RequestContext req) async {
    await req.parseBody();
    final args = UserSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().userSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('UserAvatarSave', method: 'POST')
  Future userAvatarSave(RequestContext req) async {
    await req.parseBody();
    final args = UserAvatarSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().userAvatarSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('UserNotifySave', method: 'POST')
  Future UserNotifySave(RequestContext req) async {
    await req.parseBody();
    final args = UserNotifySaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().userNotifySave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('UserRecoverPassword', method: 'POST')
  Future userRecoverPassword(RequestContext req) async {
    await req.parseBody();
    final args = UserRecoverPasswordRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().userRecoverPassword(args);
    return APIResponseBaseSerializer.toMap(result);
  }
  
  @Expose('UserUserSave', method: 'POST')
  Future userUserSave(RequestContext req) async {
    await req.parseBody();
    final args = UserUserSaveRequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().userUserSave(args);
    return APIResponseBaseSerializer.toMap(result);
  }
}
