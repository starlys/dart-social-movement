import 'dart:async';
import 'package:angel_framework/angel_framework.dart';
import 'servant.dart';
import '../models/models.dart';

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
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
  @Expose('$', method: 'POST')
  Future $(RequestContext req) async {
    await req.parseBody();
    final args = $RequestSerializer.fromMap(req.bodyAsMap);
    final result = await Servant().$(args);
    return $ResponseSerializer.toMap(result);
  }
  
}
