import 'dart:async';
import 'package:angel_framework/angel_framework.dart';
import 'servant.dart';
import '../models/models.dart';

///exposed public API methods; this class only handles routing and serialization,
/// calling servant for the implementation
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
}
