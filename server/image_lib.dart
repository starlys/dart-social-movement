import 'dart:async';
import 'package:image/image.dart';
import 'amazon/amazon_s3.dart';
import 'config.dart';
import 'misc_lib.dart';

///functions for handling avatar and post images, saving to Amazon S3 buckets
class ImageLib {
  static String _avatarUrlBase, _postUrlBase;
  static S3Bucket _avatarBucket, _postBucket;

  ///initialize library
  static void init(Config cfg) {
    String endpoint = cfg.settings['amazonS3']['endpoint'];
    String id = cfg.settings['amazonS3']['id'];
    String key = cfg.settings['amazonS3']['key'];
    String avatarBucketName = cfg.settings['amazonS3Avatar']['bucket'];
    String postBucketName = cfg.settings['amazonS3Post']['bucket'];

    _avatarUrlBase = cfg.settings['amazonS3Avatar']['url'];
    _postUrlBase = cfg.settings['amazonS3Post']['url'];

    _avatarBucket = new S3Bucket('username', id, key, endpoint, avatarBucketName);
    _postBucket = new S3Bucket('username', id, key, endpoint, postBucketName);
  }

  ///resize given image file to 100x100 and save as jpg in the user-avatar bucket; increment avatar_no;
  /// user record must already exist
  static Future saveAvatar(Connection db, int userId, List<int> imageBytes) async {
    //convert to 100x100
    Image img1 = decodeImage(imageBytes);
    Image img2 = copySquare(img1);
    Image img3 = copyResize(img2, 100);
    imageBytes = encodeJpg(img3, quality: 92);

    //get and increment avatar_no
    int avatarNo = await MiscLib.queryScalar(db, 'update xuser set avatar_no=avatar_no+1 where id=${userId} returning avatar_no');
    if (avatarNo == null) throw new Exception('Cannot save avatar for missing user');

    //save to S3
    String path = '${userId}_${avatarNo}.jpg';
    await _avatarBucket.upload(imageBytes, path);

    //delete the old one
    path = '${userId}_${avatarNo - 1}.jpg';
    try { await _avatarBucket.delete(path); }
    catch (ex) {}
  }

  ///get the full url for a user avatar, or null if none
  static String getAvatarUrl(int userId, int avatarNo) {
    if (avatarNo == 0) return 'images/paneuser.png';
    return '${_avatarUrlBase}${userId}_${avatarNo}.jpg';
  }

  ///resize given image file to 500 in max dimension (if too large) and save as jpg in the post bucket;
  /// post record must already exist
  static Future savePostImage(String postId, List<int> imageBytes) async {
    //convert to no more than 500
    Image img1 = decodeImage(imageBytes);
    Image img2 = copyReduceIfTooLarge(img1, 500);
    imageBytes = encodeJpg(img2, quality: 92);

    //save to S3
    String path = '${postId}.jpg';
    await _postBucket.upload(imageBytes, path);
  }

  ///download a post image then upload the identical image to a new path
  /// for a copied post
  static Future duplicatePostImage(String fromPostId, String toPostId) async {
    String sourceUrl = getPostImageUrl(fromPostId);
    List<int> imageBytes = await MiscLib.httpGetBinary(sourceUrl);
    String targetPath = '${toPostId}.jpg';
    await _postBucket.upload(imageBytes, targetPath);
  }

  ///delete a post image
  static Future deletePostImage(String postId) async {
    String path = '${postId}.jpg';
    await _postBucket.delete(path);
  }

  ///get the full url for a post image
  static String getPostImageUrl(String postId) {
    return '${_postUrlBase}${postId}.jpg';
  }

  ///return the largest square portion of the image, centered
  static Image copySquare(Image img) {
    if (img.width > img.height) {
      int d = img.height;
      int x = (img.width - d) ~/ 2;
      img = copyCrop(img, x, 0, d, d);
    } else if (img.height > img.width) {
      int d = img.width;
      int y = (img.height - d) ~/ 2;
      img = copyCrop(img, 0, y, d, d);
    }
    return img;
  }

  ///if the image is no more than maxd in both dimensions, return it as is;
  /// else resize the larger dimension to maxd
  static Image copyReduceIfTooLarge(Image img, int maxd) {
    if (img.width > img.height) { //landscape
      if (img.width > maxd)
        img = copyResize(img, maxd);
    } else { //portrait
      if (img.height > maxd) {
        double w = (maxd / img.height) * img.width;
        img = copyResize(img, w.round());
      }
    }
    return img;
  }

}
