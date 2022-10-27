import 'dart:math';

class RandomStrongPassword {
  List<String> lowerCase = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'j',
    'k',
    'm',
    'n',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  List<String> upperCase = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'J',
    'K',
    'M',
    'N',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  List<String> symbols = [
    '@',
    '#',
    '\$',
    '%',
    '?',
    '*',
    '!',
    '~',
    '&',
    '(',
    ')',
    '-',
    '_',
    '+',
    '=',
    '[',
    ']',
    '{',
    '}',
    '|',
    ';',
    ':',
    ',',
    '.',
    '<',
    '>',
    '/',
    '"',
    "'",
    '`',
    '^',
    '\\',
  ];
    generateRandomPassword_({
    int count = 1,
    bool uniqueList = true,
    int length = 8,
    int minLowercase = 3,
    int minUppercase = 1,
    int minNumbers = 3,
    int minSpecialCharacters = 3,
  }) {
    List<String> digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    List<String> caractersList = digits + upperCase + lowerCase + symbols;

    String randomDigit = digits[Random().nextInt(digits.length)];
    String randomUpper = upperCase[Random().nextInt(upperCase.length)];
    String randomLower = lowerCase[Random().nextInt(lowerCase.length)];
    String randomSymbol = symbols[Random().nextInt(symbols.length)];
    String tempPassword =
        randomDigit + randomUpper + randomLower + randomSymbol;
    for (int x = 0; x < length; x++) {
      tempPassword =
          tempPassword + caractersList[Random().nextInt(caractersList.length)];
    }

    List<String> tempPasswordList = tempPassword.split('');
    tempPasswordList.shuffle();
    String password = "";
    for (String i in tempPasswordList) {
      password = password + i;
    }
    if (countNumbers(password) < minNumbers) {
      password = password + digits[Random().nextInt(digits.length)];
    }
    if (countLowerCase(password) < minLowercase) {
      password = password + lowerCase[Random().nextInt(lowerCase.length)];
    }
    if (countUpperCase(password) < minUppercase) {
      password = password + upperCase[Random().nextInt(upperCase.length)];
    }
    if (countSpecialCharacters(password) < minSpecialCharacters) {
      password = password + symbols[Random().nextInt(symbols.length)];
    }

    if (count == 1) {
      return password;
    }
    if (count <= 0) {
      throw Exception("Invalid count");
    }
    if (count > 1) {
      List<String> passwords = [];
      for (int i = 0; i < count; i++) {
        passwords.add(generateRandomPassword_(count: 1, length: length));
      }
      if (uniqueList) {
        passwords = passwords.toSet().toList();
      }
      return passwords;
    }
  }

  int countLowerCase(String string) {
    int count = 0;
    for (int i = 0; i < string.length; i++) {
      if (string[i].toLowerCase() == string[i]) {
        count++;
      }
    }
    return count;
  }

  int countUpperCase(String string) {
    int count = 0;
    for (int i = 0; i < string.length; i++) {
      if (string[i].toUpperCase() == string[i]) {
        count++;
      }
    }
    return count;
  }

  int countNumbers(String string) {
    int count = 0;
    for (int i = 0; i < string.length; i++) {
      if (int.tryParse(string[i]) != null) {
        count++;
      }
    }
    return count;
  }

  int countSpecialCharacters(String string) {
    int count = 0;
    var t = string.split('');
    for (int i = 0; i < t.length; i++) {
      for (var item in symbols) {
        if (t[i] == item) {
          count++;
        }
      }
    }
    return count;
  }
}
