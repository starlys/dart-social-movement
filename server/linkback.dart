import 'dart:io';
import 'dart:async';
import 'database.dart';
import 'api_globals.dart';

///http handlers for hard links such as those included in emails
class Linkback {

  //validate email address for user id; see xuser.proposed_email field for
  // explanation. Url is /linkback/ValidateEmail?id=1&code=abc
  static Future validateEmail(HttpRequest req) async {
    await Database.safely('ValidateEmail', null, (db) async {

      //get params
      Map params = req.uri.queryParameters;
      String idString = params['id'];
      int id = int.parse(idString);
      String code = params['code'];

      bool ok = false;
      String finalMessage = null;
      String email = null, actualCode = null;
      //load proposed_email and unpack
      Row row = await db.query('select proposed_email from xuser where id=@i',
        {'i':id}).single;
      if (row != null) {
        Map proposedEmail = row[0];
        if (proposedEmail != null) {
          email = proposedEmail['email'];
          actualCode = proposedEmail['code'];
          ok = email != null && actualCode != null;
        }
      }

      //if code matches, set new email
      if (ok) {
          if (code == actualCode) {
            try {
              await db.execute('update xuser set proposed_email=null,email=@e where id=${id}', {'e': email});
            }
            catch (ex) {
              ok = false; //duplicate email
              finalMessage = 'The email address is associated with another account and could not be used for this account.';
            }
          } else {
            ok = false;
          }
      }

      //compose html response
      String pageHtml = ok ? 'Email successfully updated.' : (finalMessage ?? 'Page called in error.');
      await _commonResponse(req, pageHtml);
    });//safely
  }

  //writes content and closes req, where body is plain text or html;
  //this gets wrapped in html+body tags
  static Future _commonResponse(HttpRequest req, String body) async {
    String homeUrl = ApiGlobals.config.homeUrl;
    String siteName = ApiGlobals.config.siteName;
    String page = '<html><body>' + body
      + '<hr />Close this tab, or continue to <a href="${homeUrl}">${siteName}</a></body></html>';

    req.response.headers.contentType = new ContentType('text', 'html');
    req.response.write(page);
    await req.response.close();
  }
}
