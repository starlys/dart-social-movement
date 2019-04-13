import 'package:autzone_models/autzone_models.dart';
import 'test_lib.dart';
import '../autzone_api/lib/src/servant.dart';

///testing servant directly; no network
main() async {
  await TestLib.initializeTests();

  final servant = Servant();

  //exercise some calls to ensure database can process the queries
  var crossQuery = await servant.crossQuery(CrossQueryRequest(base: APIRequestBase(siteCode: 'AUT')));
  assert(crossQuery.items != null);

  await TestLib.cleanUpTests();
}