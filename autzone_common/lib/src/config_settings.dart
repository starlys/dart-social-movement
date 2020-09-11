import 'dart:io';
import 'package:safe_config/safe_config.dart';

class ConfigSettings_AmazonS3 extends Configuration {
  String id, key, endpoint;
}

class ConfigSettings_AmazonS3Bucket extends Configuration {
  String bucket, url;
}

class ConfigSettings_Smtp extends Configuration {
  String host, user, password, from;
  int port;
}

class ConfigSettings_Database extends Configuration {
  String host, dbname, user;
  @optionalConfiguration
  String password;
  int port;
}

class ConfigSettings extends Configuration {
  ConfigSettings(String fileName) : super.fromFile(File(fileName));

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
  ConfigSettings_Database database_dev;
}
