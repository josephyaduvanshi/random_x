import 'dart:math';

class RandomDates {
  static final RandomDates _singleton = RandomDates._internal();
  factory RandomDates() {
    return _singleton;
  }
  RandomDates._internal();
  generateRandomDates({
    int count = 1,
    DateTime? start,
    DateTime? end,
    bool uniqueList = true,
  }) {
    List<DateTime> dates = <DateTime>[];
    for (int i = 0; i < count; i++) {
      dates.add(randomDateBetween(
          start: start ?? DateTime(1990, 1, 1), end: end ?? DateTime.now()));
    }
    if (uniqueList) {
      dates = dates.toSet().toList();
    }

    if (count == 1) {
      return dates[0];
    }

    return dates;
  }

  DateTime randomDateBetween({required DateTime start, required DateTime end}) {
    int range = end.difference(start).inDays;
    int randomDay = Random().nextInt(range);
    return start.add(Duration(days: randomDay));
  }

  DateTime randomBirthday({
    DateTime? start,
    DateTime? end,
  }) {
    return randomDateBetween(
        start: start ?? DateTime(1950, 1, 1), end: end ?? DateTime(2001, 1, 1));
  }

  DateTime randomFutureDate({
    DateTime? start,
    DateTime? end,
  }) {
    return randomDateBetween(
        start: start ?? DateTime.now(), end: end ?? DateTime(2050, 1, 1));
  }

  DateTime randomPastDate({
    DateTime? start,
    DateTime? end,
  }) {
    return randomDateBetween(
        start: start ?? DateTime(1950, 1, 1), end: end ?? DateTime.now());
  }

  DateTime randomFutureDateAfter({required DateTime date}) {
    DateTime start = date;
    DateTime end = DateTime(2050, 1, 1);
    return randomDateBetween(start: start, end: end);
  }

  DateTime randomPastDateBefore({required DateTime date}) {
    DateTime start = DateTime(1950, 1, 1);
    DateTime end = date;
    return randomDateBetween(start: start, end: end);
  }

  DateTime randomDateByAge({required int age}) {
    DateTime start = DateTime.now().subtract(Duration(days: age * 365));
    DateTime end = DateTime.now().subtract(Duration(days: (age - 1) * 365));
    return randomDateBetween(start: start, end: end);
  }

  DateTime randomFutureDateByAge({required int age}) {
    DateTime start = DateTime.now().add(Duration(days: age * 365));
    DateTime end = DateTime.now().add(Duration(days: (age + 1) * 365));
    return randomDateBetween(start: start, end: end);
  }
}