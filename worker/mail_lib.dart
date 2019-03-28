import 'dart:async';
import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server.dart';
import '../server/config_settings.dart';

///helpers for sending email; note that most processes add a row to the
/// outgoing email table, instead of sending it, for performance
class MailLib {

  ///send an email; return null on ok, or error message
  static Future<String> send(ConfigSettings cfg, String to, String subject, String body) async {
    try {
      final emailConfig = cfg.smtp;
      final server = new SmtpServer(emailConfig.host, port:emailConfig.port, username:emailConfig.user, password: emailConfig.password);
      final message = mailer.Message()
        ..from = emailConfig.from
        ..recipients.add(to)
        ..subject = subject
        ..text = body;
      await mailer.send(message, server);
    }
    catch (ex) {
      return 'mail error: ' + ex.toString();
    }
    return null;
  }
}
