import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:logging/logging.dart';
import 'package:quiver/async.dart';

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

  /**
   * Uploads data to path $host/$bucket/$path
   */
  Future upload(List<int> data, String path, {ContentType contentType,
    int maxAge, int trials: 100}) {
    var ct = contentType == null ? '' : contentType.toString();
    return _repeatMoreTimes(() => _put(path, data, ct), trials);
  }

  Future delete(String path) {
    return client.openUrl('DELETE', getUrl(path))
      .then((HttpClientRequest request) {
        DateTime now = new DateTime.now();
        request.headers.date = now;
        Map<String, String> amzHeaders = {};
        var contentType = '';
        request.headers.add(HttpHeaders.acceptEncodingHeader, 'deflate');
        String authorization = _getAuthorization(path, 'DELETE', '', contentType,
            now, bucket, amzHeaders: amzHeaders);
        request.headers.add(HttpHeaders.authorizationHeader, authorization);

        return request.close();
    }).then((HttpClientResponse response) {
      return _examineResponse(response, 'uploading');
    });
  }

  _put(String path, List<int> data, String contentType) {
    return client.openUrl('PUT', getUrl(path))
        .then((HttpClientRequest request) {
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
      return request.close();
    }).then((HttpClientResponse response) {
      return _examineResponse(response, 'uploading');
    });
  }

  _examineResponse(HttpClientResponse response, String operation) {
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

  _repeatMoreTimes(Function toCall, num trials) {
    Function _toCall = (_) => toCall().then((_) => false).catchError((e, s) {
      if (e is SocketException || e is HttpException) {
        logger.fine('Repeating upload due to exception:\n$e');
        return new Future.delayed(new Duration(milliseconds: 100), () => true);
      }
      else {
        logger.shout('Error: \n', e, s);
        throw e;
      }
    });
    return doWhileAsync(new List.filled(trials, null), _toCall);
  }

  /*
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
