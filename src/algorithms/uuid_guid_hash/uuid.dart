import 'dart:math';
import 'dart:typed_data';

class Uuid {
  /// A constant that is used to determine the size of the buffer.
  static const int bufferWeight = 4096;

  /// A nullable type.
  static Uint8List? buf;

  /// Creating a static variable called bufIdx and a static list called hexBytes.
  static int bufIdx = 0;
  static List<String> hexBytes = [];

  /// It takes a string and
  /// returns a string
  static void clearBuffer() {
    buf = null;
    bufIdx = 0;
  }

  /// It generates a list of random bytes
  ///
  /// Args:
  ///   n (int): The number of bytes to generate.
  ///
  /// Returns:
  ///   A list of random bytes.
  static Uint8List randomBytes(int n) {
    var r = Uint8List(n);
    for (var i = 0; i < n; i++) {
      r[i] = Random().nextInt(256);
    }
    return r;
  }

  /// It returns a random byte array of length `n` by either returning a new random byte array or
  /// returning a portion of a previously generated random byte array
  ///
  /// Args:
  ///   n (int): The number of bytes to generate.
  ///
  /// Returns:
  ///   A Uint8List of random bytes.
  static Uint8List randomBytesBuffered(int n) {
    if (buf == null || (bufIdx + n) > bufferWeight) {
      bufIdx = 0;
      buf = randomBytes(bufferWeight);
    }
    return buf!.sublist(bufIdx, bufIdx += n);
  }

  /// It generates a random 16 byte buffer, sets the version to 4 (in the 7th byte), and sets two reserved
  /// bits (in bytes 8 and 9) to 1
  ///
  /// Returns:
  ///   A Uint8List of 16 bytes.

  static Uint8List bucket() {
    var b = randomBytesBuffered(16);
    b[6] = (b[6] & 0x0f) | 0x40;
    b[8] = (b[8] & 0x3f) | 0x80;
    return b;
  }

  /// It generates a random number, converts it to a hexadecimal string, and then returns a string that
  /// looks like a UUID
  ///
  /// Returns:
  ///   A UUID
  static String uuidV4() {
    for (var i = 0; i < 256; i++) {
      hexBytes.add((i + 0x100).toRadixString(16).substring(1));
    }
    var b = bucket();
    return '${hexBytes[b[0]]}${hexBytes[b[1]]}${hexBytes[b[2]]}${hexBytes[b[3]]}-${hexBytes[b[4]]}${hexBytes[b[5]]}-${hexBytes[b[6]]}${hexBytes[b[7]]}-${hexBytes[b[8]]}${hexBytes[b[9]]}-${hexBytes[b[10]]}${hexBytes[b[11]]}${hexBytes[b[12]]}${hexBytes[b[13]]}${hexBytes[b[14]]}${hexBytes[b[15]]}';
  }

  /// It returns true if the given string is a valid UUID, and false otherwise
  ///
  /// Args:
  ///   uuid (String): The UUID to validate.
  ///   version (String): The version of the UUID to validate against. If not provided, it will validate
  /// against all versions.
  ///
  /// Returns:
  ///   A boolean value.
  bool isUUID({
    required String uuid,
    String? version,
  }) {
    var pattern = uuidRegex[version ?? 'all'];
    return pattern != null && pattern.hasMatch(uuid) || false;
  }

  /// A map of regular expressions that are used to validate UUIDs.
  var uuidRegex = {
    '3': RegExp(
        r'^[0-9A-F]{8}-[0-9A-F]{4}-3[0-9A-F]{3}-[0-9A-F]{4}-[0-9A-F]{12}$',
        caseSensitive: false),
    '4': RegExp(
        r'^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$',
        caseSensitive: false),
    '5': RegExp(
        r'^[0-9A-F]{8}-[0-9A-F]{4}-5[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$',
        caseSensitive: false),
    'all': RegExp(
        r'^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$',
        caseSensitive: false)
  };
}
