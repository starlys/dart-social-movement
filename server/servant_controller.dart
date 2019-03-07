import 'package:angel_framework/angel_framework.dart';
import 'servant.dart';

///exposed public API methods; this class only handles routing and serialization,
/// calling servant for the implementation
@Expose("/servant/v2")
class ServantController extends Controller {
  @Expose(method: 'POST', as: 'CategoryQuery')
  Future<CategoryQueryResponse> categoryQuery(RequestContext req, ResponseContext resp) async {
    await req.parseBody();
    CategoryQueryRequest args = //deserialize here
    var ctrlr = Servant();
    resp.serializer = x; //serialize using mautogen code
    return ctrlr.categoryQuery(args);
  }
}
