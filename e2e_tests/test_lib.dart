import 'dart:async';
import 'package:autzone_common/autzone_common.dart'; 

class TestLib {

  ///call this at the top of each test class
  static Future initializeTests() async {
    print("test starting");
    ApiGlobals.instance = ApiGlobals(ise2eTesting: true);
    await DateLib.init();
    ImageLib.init(ApiGlobals.instance.configFileSettings);
    await Database.init();
    await ApiGlobals.instance.sites.allCodes(); //forces load
  }

  static Future cleanUpTests() async {
    //clean up
    await Future.delayed(Duration(seconds: 2));
    await Database.dispose();
    print("test complete");
  }
}