import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:logging/logging.dart';
//import 'package:quiver/async.dart';

Logger logger = new Logger('S3Bucket');

class S3Bucket {
  String _userName;
  String _accessKeyId;
  List<int> _secretAccessKey;
  final Function _hmacFactory;
  String _host;
  String bucket;

  HttpClient client = new HttpClient();
  getUrl (path) => Uri.parse('$_host/$bucket/$path');

  S3Bucket.config(this._userName, this._accessKeyId, secretAccessKey,
      this._host, this.bucket, this._hmacFactory);

  S3Bucket(String userName, String accessKeyId, String secretAccessKey,
                 String host, String bucket) :
    this.config(userName, accessKeyId, secretAccessKey, host, bucket,
        () => new Hmac(sha1, new Utf8Codec().encode(secretAccessKey)));

  S3Bucket subDir(String name) =>
      new S3Bucket.config(_userName, _accessKeyId, _secretAccessKey, _host,
          '$bucket/$name', _hmacFactory);

  ///Uploads data to path $host/$bucket/$path
  Future upload(List<int> data, String path, {ContentType contentType, int maxAge, int numTries: 100}) async {
    var ct = contentType == null ? '' : contentType.toString();
    for (int tryNo = 0; tryNo < numTries; ++tryNo) {
      try { 
        await _put(path, data, ct); 
        return;
      }
      catch (e, stack) {
        if (e is SocketException || e is HttpException) {
          logger.fine('Repeating upload due to exception:\n$e');
          await Future.delayed(new Duration(milliseconds: 100));
        }
        else {
          logger.shout('Error: \n', e, stack);
          throw e;
        }
      }
    }
  }

  Future delete(String path) async {
    final request = await client.openUrl('DELETE', getUrl(path));
    DateTime now = new DateTime.now();
    request.headers.date = now;
    Map<String, String> amzHeaders = {};
    var contentType = '';
    request.headers.add(HttpHeaders.acceptEncodingHeader, 'deflate');
    String authorization = _getAuthorization(path, 'DELETE', '', contentType,
        now, bucket, amzHeaders: amzHeaders);
    request.headers.add(HttpHeaders.authorizationHeader, authorization);
    final response = await request.close();
    await _examineResponse(response, 'uploading');
  }

  Future _put(String path, List<int> data, String contentType) async {
    final request = await client.openUrl('PUT', getUrl(path));
    DateTime now = new DateTime.now();
    request.headers.date = now;
    request.headers.add(HttpHeaders.contentTypeHeader, contentType);
    request.headers.add(HttpHeaders.contentLengthHeader, data.length);
    request.headers.add(HttpHeaders.connectionHeader, 'keep-alive');
    request.headers.add(HttpHeaders.connectionHeader, 'keep-alive');
    request.headers.add('x-amz-acl', 'public-read');
    request.headers.add(HttpHeaders.acceptEncodingHeader, 'deflate');

    var amzHeaders = {'x-amz-acl': 'public-read'};
    String authorization = _getAuthorization(path, 'PUT', '', contentType,
        now, bucket, amzHeaders: amzHeaders);
    request.headers.add(HttpHeaders.authorizationHeader, authorization);

    request.add(data);
    final response = await request.close();
    await _examineResponse(response, 'uploading');
  }

  void _examineResponse(HttpClientResponse response, String operation) {
    if (response.statusCode == 200 || response.statusCode == 204)
      logger.fine('File $operation successful. Status code: ${response.statusCode}');
    else {
      response.transform(utf8.decoder).toList().then((data) {
          var message =
              'File $operation not successful!\n'
              'Status code: ${response.statusCode}\n'
              'Reason phrase: ${response.reasonPhrase}\n'
              'Response body:\n${data.join('')}\n';
          throw new Exception(message);
      });
    }
  }

  /**
   * subresources: {nameOfSubresource: value} if subresource doesn't have value,
   * then value = ""
   * */
  String _getAuthorization(String path, String httpVerb, String contentMD5,
                           String contentType, DateTime now, String bucket,
                           {Map<String, String> subresources: const {},
                             Map<String, String> amzHeaders: const {}}){
    String date = HttpDate.format(now.toUtc());

    String canonicalizedResource = "";
    canonicalizedResource += bucket == "" ? "/" : "/$bucket/$path";
    if (subresources.isNotEmpty) {
      List keyList = subresources.keys.toList();
      keyList.sort();
      canonicalizedResource += "?${keyList[0]}";
      if (subresources[keyList[0]] != "") {
        canonicalizedResource += "=${subresources[keyList[0]]}";
      }
      keyList.removeAt(0);

      keyList.forEach((key) {
        canonicalizedResource += "&$key";
        if (subresources[key] != "") {
          canonicalizedResource += "=${subresources[key]}";
        }
      });

    }
    String canonicalizedAmzHeaders = "";
    if (amzHeaders.isNotEmpty){
      List buf = [];
      List keyList = amzHeaders.keys.toList();
      keyList.forEach((key) {
        String value = amzHeaders[key];
        String canonizedLine = '${key.toLowerCase()}:$value';
        buf.add(canonizedLine);

      });
      buf.sort();
      canonicalizedAmzHeaders = buf.join("\n");
      canonicalizedAmzHeaders += "\n";
    }


    String stringToSign = "$httpVerb\n"+
                          "$contentMD5\n"+
                          "$contentType\n"+
                          "${date}\n"+
                          "$canonicalizedAmzHeaders"+
                          "$canonicalizedResource";
    Hmac hmac = _hmacFactory();
    Utf8Codec codec = new Utf8Codec();
    logger.fine("Signature:\n$stringToSign");
    logger.fine("...end of signature.");
    List<int> encodedToSign = codec.encode(stringToSign);
    //hmac.add(encodedToSign);
    List<int> signed = hmac.convert(encodedToSign).bytes;
    //List<int> signed = hmac.close();
    String signature = base64Encode(signed);
    //String signature = CryptoUtils.bytesToBase64(signed);
    String authorization = "AWS $_accessKeyId:$signature";
    return authorization;
  }
}
