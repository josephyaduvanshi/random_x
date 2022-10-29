import 'dart:math';

class RandomSSN {
  generate({
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
