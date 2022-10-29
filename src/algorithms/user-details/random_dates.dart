import 'dart:math';

class RandomDates {
  /// Creating a singleton instance of the class.
  static final RandomDates _singleton = RandomDates._internal();

  /// `RandomDates()` is a factory constructor that returns a singleton instance of the class
  ///
  /// Returns:
  ///   A singleton instance of the RandomDates class.
  factory RandomDates() {
    return _singleton;
  }

  /// A private constructor that is used to create a singleton instance of the class.
  RandomDates._internal();

  /// Generate a random date between two dates
  ///
  /// Args:
  ///   count (int): The number of dates you want to generate. Defaults to 1
  ///   start (DateTime): The start date of the range.
  ///   end (DateTime): The end date of the range.
  ///   uniqueList (bool): If true, the list will be unique. Defaults to true
  ///
  /// Returns:
  ///   A list of DateTime objects.
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

  /// > Generate a random date between two dates
  ///
  /// Args:
  ///   start (DateTime): The start date of the range.
  ///   end (DateTime): The end date of the range.
  ///
  /// Returns:
  ///   A random date between the start and end dates.
  DateTime randomDateBetween({required DateTime start, required DateTime end}) {
    int range = end.difference(start).inDays;
    int randomDay = Random().nextInt(range);
    return start.add(Duration(days: randomDay));
  }

  /// Return a random date between the start and end dates.
  ///
  /// Args:
  ///   start (DateTime): The earliest date that can be returned.
  ///   end (DateTime): The end date of the range.
  ///
  /// Returns:
  ///   A random date between the start and end dates.
  DateTime randomBirthday({
    DateTime? start,
    DateTime? end,
  }) {
    return randomDateBetween(
        start: start ?? DateTime(1950, 1, 1), end: end ?? DateTime(2001, 1, 1));
  }

  /// Returns a random date between the start and end dates, inclusive.
  ///
  /// Args:
  ///   start (DateTime): The earliest date that can be returned.
  ///   end (DateTime): The end date of the range.
  ///
  /// Returns:
  ///   A random date between the start and end dates.
  DateTime randomFutureDate({
    DateTime? start,
    DateTime? end,
  }) {
    return randomDateBetween(
        start: start ?? DateTime.now(), end: end ?? DateTime(2050, 1, 1));
  }

  /// "Returns a random date between the start and end dates."
  ///
  /// The function takes two optional parameters: `start` and `end`. If `start` is not provided, it
  /// defaults to January 1, 1950. If `end` is not provided, it defaults to the current date
  ///
  /// Args:
  ///   start (DateTime): The start date of the range.
  ///   end (DateTime): The end date of the range.
  ///
  /// Returns:
  ///   A random date between the start and end dates.
  DateTime randomPastDate({
    DateTime? start,
    DateTime? end,
  }) {
    return randomDateBetween(
        start: start ?? DateTime(1950, 1, 1), end: end ?? DateTime.now());
  }

  /// Returns a random date between the start and end dates, inclusive.
  ///
  /// Args:
  ///   date (DateTime): The date to start the random date generation from.
  ///
  /// Returns:
  ///   A random date between the start and end dates.
  DateTime randomFutureDateAfter({required DateTime date}) {
    DateTime start = date;
    DateTime end = DateTime(2050, 1, 1);
    return randomDateBetween(start: start, end: end);
  }

  /// Returns a random date between the start and end dates, inclusive.
  ///
  /// Args:
  ///   date (DateTime): The date before which the random date should be generated.
  ///
  /// Returns:
  ///   A random date between the start and end dates.
  DateTime randomPastDateBefore({required DateTime date}) {
    DateTime start = DateTime(1950, 1, 1);
    DateTime end = date;
    return randomDateBetween(start: start, end: end);
  }

  /// Returns a random date between the start and end dates, inclusive.
  ///
  /// Args:
  ///   age (int): The age of the person.
  ///
  /// Returns:
  ///   A random date between the start and end dates.
  DateTime randomDateByAge({required int age}) {
    DateTime start = DateTime.now().subtract(Duration(days: age * 365));
    DateTime end = DateTime.now().subtract(Duration(days: (age - 1) * 365));
    return randomDateBetween(start: start, end: end);
  }

  /// Returns a random date between now and the date that is one year older than the age passed in.
  ///
  /// Args:
  ///   age (int): The age of the person.
  ///
  /// Returns:
  ///   A random date between the start and end date.
  DateTime randomFutureDateByAge({required int age}) {
    DateTime start = DateTime.now().add(Duration(days: age * 365));
    DateTime end = DateTime.now().add(Duration(days: (age + 1) * 365));
    return randomDateBetween(start: start, end: end);
  }
}
