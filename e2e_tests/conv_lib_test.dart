import 'dart:io';
import 'package:autzone_models/autzone_models.dart';
import 'package:autzone_common/autzone_common.dart'; 
import 'test_lib.dart';

///testing conv_lib through server libraries only; no network
main() async {
  await TestLib.initializeTests();

  await Database.safely('test', (db) async {
    //this test assumes these records exist
    final siteId = 1;
    final authorId = 1;
    final eventId = 5;

    //write a conv and some posts
    DateTime now = WLib.utcNow();
    final int convId = await MiscLib.queryScalar(db, 'insert into conv(site_id,project_id,event_id,title,open,from_conv_id,post_max_size,xuser_daily_max,created_at,last_activity,activity_flag)'
      'values(${siteId},null,${eventId}, @t, \'Y\', null, 1000, 100, @d1, @d2, \'N\')'
      'returning id',
      {'t': 'from e2e test', 'd1': now, 'd2': now}
      );
    final String post1Text = 'all good things';
    final String post2Text = 'must secretly be rainbows';
    await ConvLib.writeConvPost(db, convId, authorId, post1Text, 0, false, WLib.utcNow());
    await ConvLib.writeConvPost(db, convId, authorId, post2Text, 0, false, WLib.utcNow());

    //check if a "recent" equivalent post is found after 5 sec
    sleep(Duration(seconds: 5));
    bool exists = await ConvLib.checkRecentConvPostExists(db, convId, authorId, post1Text);
    assert(exists, 'expected post to be found by checkRecentConvPostExists');

    //check if a "recent" equivalent post is found after 65 sec
    sleep(Duration(seconds: 60));
    exists = await ConvLib.checkRecentConvPostExists(db, convId, authorId, post1Text);
    assert(!exists, 'expected post to be NOT found by checkRecentConvPostExists');
  });

  await TestLib.cleanUpTests();
}