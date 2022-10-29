import 'dart:math';

class RandomSSN {
  /// Generates a random SSN number.
  ///
  /// Args:
  ///   count (int): The number of SSNs you want to generate. Defaults to 1
  ///   withdashes (bool): If you want the SSN to be formatted with dashes, set this to true. Defaults to
  /// false
  ///
  /// Returns:
  ///   A list of strings.
  static generate({
    int count = 1,
    bool withdashes = false,
  }) {
    var random = Random();
    var ssn = List.generate(count, (index) {
      var ssn =
          List<String>.generate(9, (index) => random.nextInt(9).toString());
      if (withdashes) {
        ssn.insert(3, '-');
        ssn.insert(6, '-');
      }

      return ssn.join();
    });
    if (count == 1) {
      return ssn.join();
    }
    return ssn;
  }
}
