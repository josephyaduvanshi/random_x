
import 'dart:math';

// import 'generate_strong_password.dart';
// import '../misc/random_char_string.dart';

import '../../database/dictionary.dart';

// RandomStrongPassword rsp = RandomStrongPassword();
// RandomCharString rcs = RandomCharString();

List<List<String>> lists = const [FIRST_NAMES, LAST_NAMES];
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

generateUsername_({
  int count = 1,
  int randomNumberLength = 2,
  bool uniqueList = true,
  int? usernameLength,
}) {
  List<String> usernames = [];
  for (int i = 0; i < count; i++) {
    String adjective = ADJECTIVES[Random().nextInt(ADJECTIVES.length)];
    // String firstNames = FIRST_NAMES[Random().nextInt(FIRST_NAMES.length)];
    String lastName = LAST_NAMES[Random().nextInt(LAST_NAMES.length)];
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