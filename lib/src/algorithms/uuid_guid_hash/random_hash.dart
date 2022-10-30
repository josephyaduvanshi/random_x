import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class RandomHash {
  /// It generates a random string of a given length, using the characters A-Z, a-z, 0-9, and the symbols
  /// + and /
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the returned string will be all uppercase. Defaults to false
  ///   allLowerCase (bool): If true, the returned string will be all lowercase. Defaults to false
  ///
  /// Returns:
  ///   A random hash in base64 format.
  static String randomHashBase64({
    int length = 32,
    bool allUpperCase = false,
    bool allLowerCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));

    return allUpperCase
        ? base64Url.encode(values).toUpperCase()
        : allUpperCase
            ? base64Url.encode(values).toLowerCase()
            : base64Url.encode(values);
  }

  /// It generates a random list of integers, encodes them as a base64 string, then hashes the result with
  /// MD5
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A random MD5 hash.
  static String randomMD5hashV1({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode(base64Url.encode(values));
    final digest = md5.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// It generates a random string of length `length` using the current timestamp and a random number
  /// generator
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the returned string will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A random MD5 hash.
  static String randomMD5hashV2({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final ts = DateTime.now().millisecondsSinceEpoch;
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode('$ts${base64Url.encode(values)}');
    final digest = md5.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// It generates a random list of integers, encodes them as a base64 string, then hashes the result with
  /// SHA256
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A random SHA256 hash.
  static String randomSHA256Hashv1({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode(base64Url.encode(values));
    final digest = sha256.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// `randomSHA256Hashv2` generates a random SHA256 hash using the current timestamp and a random list of
  /// bytes
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A random SHA256 hash.
  static String randomSHA256Hashv2({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final ts = DateTime.now().millisecondsSinceEpoch;
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode('$ts${base64Url.encode(values)}');
    final digest = sha256.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// It generates a random list of integers, encodes them as a base64 string, then hashes the result with
  /// SHA512
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A random SHA512 hash.
  static String randomSHA512Hashv1({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode(base64Url.encode(values));
    final digest = sha512.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// It generates a random string of length `length` using the current timestamp and a random number
  /// generator
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A random SHA512 hash.
  static String randomSHA512Hashv2({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final ts = DateTime.now().millisecondsSinceEpoch;
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode('$ts${base64Url.encode(values)}');
    final digest = sha512.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// It generates a random list of bytes, encodes them as a base64 string, then hashes the result with
  /// SHA1
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A random SHA1 hash.
  static String randomSHA1Hashv1({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode(base64Url.encode(values));
    final digest = sha1.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// It generates a random string of length `length` using the current timestamp and a random number
  /// generator
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A random SHA1 hash.
  static String randomSHA1Hashv2({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final ts = DateTime.now().millisecondsSinceEpoch;
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode('$ts${base64Url.encode(values)}');
    final digest = sha1.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// It generates a random list of bytes, encodes them as a base64 string, then hashes the result with
  /// SHA224
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A random SHA224 hash.
  static String randomSHA224Hashv1({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode(base64Url.encode(values));
    final digest = sha224.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// It generates a random string of the specified length, encodes it in UTF-8, hashes it with SHA-224,
  /// and returns the hash as a string
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A SHA224 hash string.
  static String randomSHA224Hashv2({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final ts = DateTime.now().millisecondsSinceEpoch;
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode('$ts${base64Url.encode(values)}');
    final digest = sha224.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// It generates a random list of bytes, encodes them as a base64 string, then hashes the base64 string
  /// with SHA384
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A SHA384 hash of a random string.
  static String randomSHA384Hashv1({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode(base64Url.encode(values));
    final digest = sha384.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// `randomSHA384Hashv2` generates a random SHA384 hash using the current timestamp and a random list of
  /// bytes
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A SHA384 hash of a random string.
  static String randomSHA384Hashv2({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final ts = DateTime.now().millisecondsSinceEpoch;
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode('$ts${base64Url.encode(values)}');
    final digest = sha384.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// It generates a random list of bytes, encodes them to base64, then hashes them with a random SHA256
  /// hash as the key
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A random HMAC hash.
  static String randomHMACHash({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode(base64Url.encode(values));
    final key = utf8.encode(randomSHA256Hashv1());
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }

  /// It generates a random string of the specified length using a secure random number generator, then it
  /// uses the current timestamp and the random string to generate a SHA256 HMAC hash
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///
  /// Returns:
  ///   A random HMAC hash.
  static String randomHMACHashv2({
    int length = 32,
    bool allUpperCase = false,
  }) {
    if (length < 1) {
      throw ArgumentError('length must be greater than 0');
    }
    final random = Random.secure();
    final ts = DateTime.now().millisecondsSinceEpoch;
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    final bytes = utf8.encode('$ts${base64Url.encode(values)}');
    final key = utf8.encode(randomSHA256Hashv1());
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return allUpperCase ? digest.toString().toUpperCase() : digest.toString();
  }
}
