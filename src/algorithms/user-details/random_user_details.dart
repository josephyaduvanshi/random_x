import 'dart:math';
import '../../database/dictionary.dart';

/// Generate a random age between 0 and 100 and return it as a string.
///
/// Returns:
///   A string
String generateRandomAge() {
  Random rnd = Random();
  int age = rnd.nextInt(100);
  return age.toString();
}

/// Creating a list of FIRST_NAMES AND LAST_NAMES which
/// BY THE WAY WE ARE GETTING FROM THE DICTIONARY DIRECTORY.
List<List<String>> lists = const [
  DictionaryDatabase.FIRST_NAMES,
  DictionaryDatabase.LAST_NAMES
];

/// It generates a random name by randomly selecting a part from each list, and then joining them
/// together with a separator
///
/// Args:
///   repeatParts (bool): Whether or not to allow the same part of the name to be repeated. Defaults to
/// false
///   separator (String): The string to separate the parts of the name with. Defaults to
///
/// Returns:
///   A string
String generateName_({
  bool repeatParts = false,
  String separator = ' ',
}) {
  List<String> name = [];
  for (var l in lists) {
    String part = '';
    while (part == '' || (name.contains(part) && !repeatParts)) {
      part = l[Random().nextInt(l.length)];
    }
    name.add(part);
  }
  return name.join(separator);
}

/// It generates a random name, and if you want more than one, it will generate a list of random names
///
/// Args:
///   count (int): The number of names to generate. Defaults to 1
///   repeatParts (bool): If true, the name can have the same part twice. Defaults to false
///   uniqueList (bool): If true, the list of names will not contain duplicates. Defaults to true
///   separator (String): The separator between the parts of the name. Defaults to
///
/// Returns:
///   A list of names
generateNames_({
  int count = 1,
  bool repeatParts = false,
  bool uniqueList = true,
  String separator = ' ',
}) {
  List<String> names = [];
  for (var i = 0; i < count; i++) {
    String name = '';
    while (name == '' || (names.contains(name) && !uniqueList)) {
      name = generateName_(repeatParts: repeatParts, separator: separator);
    }
    names.add(name);
  }
  if (count == 1) {
    return names[0];
  }
  if (count <= 0) {
    throw Exception("Invalid count");
  }
  return names;
}

/// It generates a random username.
///
/// Args:
///   count (int): The number of usernames you want to generate. Defaults to 1
///   randomNumberLength (int): The length of the random number that will be appended to the end of the
/// username. Defaults to 2
///   uniqueList (bool): If true, the list will be unique. Defaults to true
///   usernameLength (int): The length of the username.
///
/// Returns:
///   A list of usernames
generateUsername_({
  int count = 1,
  int randomNumberLength = 2,
  bool uniqueList = true,
  int? usernameLength,
}) {
  List<String> usernames = [];
  for (int i = 0; i < count; i++) {
    String adjective = DictionaryDatabase
        .ADJECTIVES[Random().nextInt(DictionaryDatabase.ADJECTIVES.length)];
    // String firstNames = FIRST_NAMES[Random().nextInt(FIRST_NAMES.length)];
    String lastName = DictionaryDatabase
        .LAST_NAMES[Random().nextInt(DictionaryDatabase.LAST_NAMES.length)];
    String number = Random()
        .nextInt(translateLengthToNumber(randomNumberLength))
        .toString();
    usernames.add('$adjective$lastName$number');
  }
  if (uniqueList) {
    usernames = usernames.toSet().toList();
  }
  if (usernameLength != null) {
    usernames = usernames.map((e) => e.substring(0, usernameLength)).toList();
  }
  if (count == 1) {
    return usernames[0];
  }
  if (count <= 0) {
    throw Exception("Invalid count");
  }

  return usernames;
}

/// It takes a string of digits, and returns a string of digits with commas inserted between every three
/// digits
///
/// Args:
///   input (String): The string to be formatted.
///
/// Returns:
///   A function that takes a string and returns a string.
String formatStringDigitWithComma({required String input}) {
  return input.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}

/// It takes a length and returns a number
///
/// Args:
///   length (int): The length of the password.
///
/// Returns:
///   The number of digits in the number.
int translateLengthToNumber(int length) {
  try {
    switch (length) {
      case 1:
        return 9;
      case 2:
        return 99;
      case 3:
        return 999;
      case 4:
        return 9999;
      case 5:
        return 99999;
      case 6:
        return 99999;
      case 7:
        return 9998700;
      case 8:
        return 9980000;
      case 9:
        return 9990000;
      case 10:
        return 1000000000;
      default:
        return 3;
    }
  } catch (e) {
    return 3;
  }
}

/// Generate a random salary with a default length of 5
///
/// Args:
///   length (int): The length of the salary string. Defaults to 5
///
/// Returns:
///   A list of strings.
String generateRandomSalary({
  int length = 5,
}) {
  String salary = '';
  for (int i = 0; i < length; i++) {
    salary += Random().nextInt(9).toString();
  }
  return formatStringDigitWithComma(input: '\$$salary');
}

/// Generates a random height in either metric or imperial units.
///
/// Args:
///   isMetric (bool): If true, the height will be in meters. If false, the height will be in feet and
/// inches. Defaults to false
///   withCentimeters (bool): If true, the height will be returned with the height in centimeters.
/// Defaults to true
///
/// Returns:
///   A string that is a random height in either metric or imperial units.
String generateRandomHeight({
  bool isMetric = false,
  bool withCentimeters = true,
}) {
  String height = '';
  String heightInCentimeters = '';
  if (isMetric) {
    height += Random().nextInt(2).toString();
    height += '.';
    height += Random().nextInt(9).toString();
    height += 'm';
    if (withCentimeters) {
      heightInCentimeters = (double.parse(height.replaceAll("m", '')) * 100)
          .ceilToDouble()
          .toString();
      return '$height (${heightInCentimeters}cm)';
    }
    return height;
  } else {
    height += (Random().nextInt(4) + 4).toString();
    height += '\'';
    height += Random().nextInt(12).toString();
    height += '"';

    if (withCentimeters) {
      heightInCentimeters = heightToCentimeters(height);
      return '$height (${heightInCentimeters}cm)';
    }
    return height;
  }
}

/// It takes a string of height in feet and inches, converts it to centimeters, and returns a string of
/// the height in centimeters
///
/// Args:
///   height: The height in feet and inches.
///
/// Returns:
///   A string
String heightToCentimeters(final height) {
  final getFoot = double.parse(height.split('\'')[0].toString()).toDouble();
  final getInches =
      double.parse(height.split('\'')[1].toString().replaceAll('"', ''))
          .toDouble();
  return ((getFoot * 30.48) + (getInches * 2.54)).ceilToDouble().toString();
}

/// Generate a random email address
///
/// Args:
///   count (int): The number of emails you want to generate. Defaults to 1
///   randomNumberLength (int): The length of the random number that will be appended to the username.
/// Defaults to 2
///   uniqueList (bool): If true, the list of emails will be unique. Defaults to true
///   domain (String): The domain of the email address. Defaults to gmail.com
///
/// Returns:
///   A list of emails
generateRandomEmail_({
  int count = 1,
  int randomNumberLength = 2,
  bool uniqueList = true,
  String domain = 'gmail.com',
}) {
  List<String> emails = [];
  for (int i = 0; i < count; i++) {
    String username = generateUsername_(
        count: 1,
        randomNumberLength: randomNumberLength,
        uniqueList: uniqueList);
    emails.add('$username@$domain');
  }

  if (uniqueList) {
    emails = emails.toSet().toList();
  }
  if (count == 1) {
    return emails[0];
  }
  if (count <= 0) {
    throw Exception("Invalid count");
  }
  return emails;
}

/// It generates a random weight in pounds and kilograms.
///
/// Args:
///   min (int): The minimum weight you want to generate. Defaults to 40
///   max (int): The maximum value of the random number. Defaults to 300
///   withKG (bool): If true, the weight will be returned in pounds and kilograms. Defaults to true
///
/// Returns:
///   A string with a random weight in pounds and kilograms.
String generateRandomWeight({
  int min = 40,
  int max = 300,
  bool withKG = true,
}) {
  String weight = '';
  String weightInKG = '';
  weight += (Random().nextInt(max) + min).toString();
  weight =
      '$weight${(Random().nextDouble().toStringAsFixed(2)).replaceAll("0", "")}';
  if (withKG) {
    weightInKG = (double.parse(weight) * 0.453592).toStringAsFixed(2);
    return '$weight pounds (${weightInKG}kg)';
  }
  return '$weight pounds';
}

/// Generate a random number or a list of random numbers
///
/// Args:
///   count (int): The number of random numbers you want to generate. Defaults to 1
///   uniqueList (bool): If true, the list will contain unique numbers. Defaults to true
///
/// Returns:
///   A list of random numbers
generateRandomNumber_({
  int count = 1,
  bool uniqueList = true,
}) {
  List<int> numbers = [];
  for (int i = 0; i < count; i++) {
    numbers.add(Random().nextInt(999999999));
  }
  if (uniqueList) {
    numbers = numbers.toSet().toList();
  }
  if (count == 1) {
    return numbers[0];
  }
  if (count <= 0) {
    throw Exception("Invalid count");
  }

  return numbers;
}

void main(List<String> args) {
  print(generateRandomWeight());
}
