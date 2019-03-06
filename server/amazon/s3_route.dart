import 'package:clean_router/common.dart';
import 'package:path/path.dart';

class S3Route extends Route {
  S3Route(host, bucket, path) : super(url.join(host, bucket, path));
}
