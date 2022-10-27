import 'dart:math';
import 'dart:typed_data';

class Uuid {
  static const int bufferWeight = 4096;
  static Uint8List? buf;
  static int bufIdx = 0;
  static List<String> hexBytes = [];

  static void clearBuffer() {
    buf = null;
    bufIdx = 0;
  }

  static Uint8List randomBytes(int n) {
    var r = Uint8List(n);
    for (var i = 0; i < n; i++) {
      r[i] = Random().nextInt(256);
    }
    return r;
  }

  static Uint8List randomBytesBuffered(int n) {
    if (buf == null || (bufIdx + n) > bufferWeight) {
      bufIdx = 0;
      buf = randomBytes(bufferWeight);
    }
    return buf!.sublist(bufIdx, bufIdx += n);
  }

  static Uint8List bucket() {
    var b = randomBytesBuffered(16);
    b[6] = (b[6] & 0x0f) | 0x40;
    b[8] = (b[8] & 0x3f) | 0x80;
    return b;
  }

  static String uuidV4() {
    for (var i = 0; i < 256; i++) {
      hexBytes.add((i + 0x100).toRadixString(16).substring(1));
    }
    var b = bucket();
    return '${hexBytes[b[0]]}${hexBytes[b[1]]}${hexBytes[b[2]]}${hexBytes[b[3]]}-${hexBytes[b[4]]}${hexBytes[b[5]]}-${hexBytes[b[6]]}${hexBytes[b[7]]}-${hexBytes[b[8]]}${hexBytes[b[9]]}-${hexBytes[b[10]]}${hexBytes[b[11]]}${hexBytes[b[12]]}${hexBytes[b[13]]}${hexBytes[b[14]]}${hexBytes[b[15]]}';
  }

  bool isUUID({
    required String uuid,
    String? version,
  }) {
    var pattern = uuidRegex[version ?? 'all'];
    return pattern != null && pattern.hasMatch(uuid) || false;
  }

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

