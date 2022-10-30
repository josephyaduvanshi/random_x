import 'dart:convert';
import 'package:crypto/crypto.dart';

import '../../../random_x.dart';

class Gravatar {
  /// Declaring two variables.
  final String? email;
  final String hash;

  /// A constructor that takes an email address and generates a hash of it.
  Gravatar({this.email}) : hash = _generateHash(email ?? RndX.generateEmail());

  /// It takes an email address, trims it, converts it to lowercase, and then generates a hash of it using
  /// the MD5 algorithm
  ///
  /// Args:
  ///   email (String): The email address of the user.
  ///
  /// Returns:
  ///   A string that is the hash of the email address.
  static String _generateHash(String email) {
    String preparedEmail = email.trim().toLowerCase();
    return md5.convert(utf8.encode(preparedEmail)).toString();
  }

  /// It takes an email address, hashes it, and returns a URL to the Gravatar image for that email address
  ///
  /// Args:
  ///   size (int): The size of the image in pixels.
  ///   defaultImage (GravatarImage): The default image to use if the user doesn't have a gravatar.
  ///   forceDefault (bool): If true, the default image will always be returned. Defaults to false
  ///   fileExtension (bool): If true, the url will end with .png. Defaults to false
  ///   rating (GravatarRating): The maximum rating to allow.
  ///
  /// Returns:
  ///   A string that is the url to the gravatar image.
  String imageUrl({
    int? size,
    GravatarImage? defaultImage,
    bool forceDefault = false,
    bool fileExtension = false,
    GravatarRating? rating,
  }) {
    String hashDigest = hash;
    Map<String, String> query = {};

    if (size != null) query['s'] = size.toString();
    if (defaultImage != null) query['d'] = _imageString(defaultImage);
    if (forceDefault) query['f'] = 'y';
    if (rating != null) query['r'] = _ratingString(rating);
    if (fileExtension) hashDigest += '.png';
    return Uri.https('www.gravatar.com', '/avatar/$hashDigest', query)
        .toString();
  }

  /// It returns a string that is the URL of the JSON file for the Gravatar
  ///
  /// Returns:
  ///   A string.
  String jsonUrl() {
    return Uri.https('www.gravatar.com', '/$hash.json').toString();
  }

  /// Return a URL to a QR code image for the Gravatar hash.
  ///
  /// Returns:
  ///   A string that is the URL for the QR code.
  String qrUrl() {
    return Uri.https('www.gravatar.com', '/$hash.qr').toString();
  }

  /// `imageUrl()` returns a string that is the URL of the image
  ///
  /// Returns:
  ///   The imageUrl() method is being returned.
  String toStringUrl() {
    return imageUrl();
  }

  /// It takes a GravatarImage enum value and returns a string that represents the value
  ///
  /// Args:
  ///   value (GravatarImage): The email address to use for the gravatar.
  ///
  /// Returns:
  ///   A string.
  String _imageString(GravatarImage value) {
    switch (value) {
      case GravatarImage.nf:
        return '404';
      case GravatarImage.mp:
        return 'mp';
      case GravatarImage.identicon:
        return 'identicon';
      case GravatarImage.monsterid:
        return 'monsterid';
      case GravatarImage.wavatar:
        return 'wavatar';
      case GravatarImage.retro:
        return 'retro';
      case GravatarImage.robohash:
        return 'robohash';
      case GravatarImage.blank:
        return 'blank';
    }
  }

  /// It takes a `GravatarRating` value and returns a `String` value
  ///
  /// Args:
  ///   value (GravatarRating): The email address to use for the gravatar.
  ///
  /// Returns:
  ///   A string.
  String _ratingString(GravatarRating value) {
    switch (value) {
      case GravatarRating.g:
        return 'g';
      case GravatarRating.pg:
        return 'pg';
      case GravatarRating.r:
        return 'r';
      case GravatarRating.x:
        return 'x';
    }
  }
}
