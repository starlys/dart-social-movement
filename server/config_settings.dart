import 'package:safe_config/safe_config.dart';

class ConfigSettings_AmazonS3 {
  String id, key, endpoint;
}
class ConfigSettings_AmazonS3Bucket {
  String bucket, url;
}
class ConfigSettings_Smtp {
  String host, port, user, password, from;
}
class ConfigSettings_Database {
  String connection, connection_dev;
}
class ConfigSettings_Deletion {
  int conv_days;
}
class ConfigSettings_SiteAdmin {
  int min, max, percent;
}
class ConfigSettings_Spam {
  int reaction_weight_days, restrict1_score, restrict2_score, restrict3_score,
    restrict1_rest_days, restrict1_chars, restrict2_rest_days, restrict2_chars,
    restrict3_rest_days, restrict3_chars;
}
class ConfigSettings_Operation {
  int root_doc_vote_min, root_doc_vote_days, conv_inactive_days,
    conv_old_days, conv_too_big;
}

class ConfigSettings extends Configuration {
 	ApplicationConfiguration(String fileName) : super.fromFile(File(fileName));

  String dev;
  String homeUrl;
  String linkbackUrl;
  String domain;
  String siteName;
  ConfigSettings_AmazonS3 amazonS3;
  ConfigSettings_AmazonS3Bucket amazonS3Avatar;
  ConfigSettings_AmazonS3Bucket amazonS3Post;
  ConfigSettings_Smtp smtp;
  ConfigSettings_Database database;
  ConfigSettings_Deletion deletion;
  ConfigSettings_SiteAdmin site_admin;
  ConfigSettings_Spam spam;
  ConfigSettings_Operation operation;
}
