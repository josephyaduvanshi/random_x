import 'dart:math';

class GUID {
  /// Getting the current time in milliseconds.
  final ts = DateTime.now().millisecondsSinceEpoch;

  /// Creating a new instance of the Random class.
  final rnd = Random();

  /// Creating a new instance of the StringBuffer class.
  final _guid = StringBuffer();

  /// `_getRandomInt` returns a random integer between `min` and `max` (inclusive)
  ///
  /// Args:
  ///   min (int): The minimum value of the random number.
  ///   max (int): The maximum number of items to return.
  ///
  /// Returns:
  ///   A random integer between min and max.
  int _getRandomInt(int min, int max) {
    return min + rnd.nextInt(max - min);
  }

  /// Generates a GUID.
  ///
  /// Args:
  ///   allUpperCase (bool): If true, the GUID will be all upper case. Defaults to false
  ///   length (int): The length of the GUID to generate. Defaults to 32
  ///
  /// Returns:
  ///   A string of random characters.
  String generateGUID({
    bool allUpperCase = false,
    int length = 32,
  }) {
    if (length < 1) {
      throw ArgumentError.value(length, 'length', 'must be greater than 0');
    }
    for (var i = 0; i < length; i++) {
      var r = _getRandomInt(0, 16);
      _guid.write(r.toRadixString(16));
    }
    return allUpperCase ? _guid.toString().toUpperCase() : _guid.toString();
  }

  /// It generates a GUID with a separator.
  ///
  /// Args:
  ///   separator (String): The separator to use. Defaults to '-'. Defaults to -
  ///   allUpperCase (bool): If true, the GUID will be all upper case. Defaults to false
  ///   length (int): The length of the GUID.
  ///
  /// Returns:
  ///   A string of length 36.
  String guidWithSeparator({
    String separator = '-',
    bool allUpperCase = false,
    required int length,
  }) {
    if (length < 1) {
      throw ArgumentError.value(length, 'length', 'must be greater than 0');
    }
    String guid = generateGUID(length: length, allUpperCase: allUpperCase);

    for (var i = 8; i < length; i += 5) {
      guid = guid.replaceRange(i, i + 1, separator);
    }
    final g = guid.split(separator);
    for (var i = 0; i < g.length; i++) {
      if (i == g.length - 1) {
        g[i] = g[i].substring(0, 12);
      }
    }

    guid = g.join(separator);
    return guid;
  }
}
