import 'dart:async';
import 'package:mailer/mailer.dart';
import 'server/config_settings.dart';

///helpers for sending email; note that most processes add a row to the
/// outgoing email table, instead of sending it, for performance
class MailLib {

  ///send an email; return null on ok, or error message
  static Future<String> send(ConfigSettings cfg, String to, String subject, String body) async {
    try {
      var emailConfig = cfg.smtp;
      var options = new SmtpOptions() //AmazonSESSmtpOptions() //was SmtpOptions()
        ..username = emailConfig.user
        ..password = emailConfig.password
        ..hostName = emailConfig.host
        ..port = emailConfig.port
        //..secured = false
        //..requiresAuthentication = false
        ;
      var envelope = new Envelope()
        ..from = emailConfig.from
        ..recipients.add(to)
        ..subject = subject
        ..text = body;
        //html
      await (new SmtpTransport(options)).send(envelope);
    }
    catch (ex) {
      return 'mail error: ' + ex.toString();
    }
    return null;
  }
}
