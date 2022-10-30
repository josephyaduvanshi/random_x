import 'dart:math';

class RandomStrongPassword {
  /// A list of lowercase letters.
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

  /// Creating a list of uppercase letters.
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

  /// Creating a list of symbols.
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

  /// Creating a list of digits.
  List<String> digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  /// It generates a random password.
  ///
  /// Args:
  ///   count (int): The number of passwords to generate. Defaults to 1
  ///   uniqueList (bool): If true, the list of passwords will be unique. If false, the list of passwords
  /// will be non-unique. Defaults to true
  ///   length (int): The length of the password. Defaults to 8
  ///   minLowercase (int): The minimum number of lowercase letters to include in the password. Defaults
  /// to 3
  ///   minUppercase (int): The minimum number of uppercase letters to include in the password. Defaults
  /// to 1
  ///   minNumbers (int): The minimum number of numbers that should be in the password. Defaults to 3
  ///   minSpecialCharacters (int): The minimum number of special characters to include in the password.
  /// Defaults to 3
  generateRandomPassword_({
    int count = 1,
    bool uniqueList = true,
    int length = 8,
    int minLowercase = 3,
    int minUppercase = 1,
    int minNumbers = 3,
    int minSpecialCharacters = 3,
  }) {
    if (length < 1) {
      throw ArgumentError('Length must be greater than 0');
    }

    /// Concatenating the lists.
    List<String> caractersList = digits + upperCase + lowerCase + symbols;

    /// Generating a random digit.
    String randomDigit = digits[Random().nextInt(digits.length)];

    /// Generating a random uppercase letter.
    String randomUpper = upperCase[Random().nextInt(upperCase.length)];

    /// Generating a random lowercase letter.
    String randomLower = lowerCase[Random().nextInt(lowerCase.length)];

    /// Generating a random symbol.
    String randomSymbol = symbols[Random().nextInt(symbols.length)];

    /// Adding the first random digit, uppercase letter, lowercase letter and symbol to the password.
    String tempPassword =
        randomDigit + randomUpper + randomLower + randomSymbol;

    /// Adding random characters to the password.
    for (int x = 0; x < length; x++) {
      tempPassword =
          tempPassword + caractersList[Random().nextInt(caractersList.length)];
    }

    /// Splitting the string into a list of characters.
    List<String> tempPasswordList = tempPassword.split('');

    /// It shuffles the list of characters.
    tempPasswordList.shuffle();

    /// Creating a variable called password and assigning it an empty string.
    String password = "";

    /// Concatenating the characters in the list.
    for (String i in tempPasswordList) {
      password = password + i;
    }

    /// It checks if the number of numbers in the password is less than the minimum number of numbers. If it
    /// is, it adds a random number to the password.
    if (countNumbers(password) < minNumbers) {
      password = password + digits[Random().nextInt(digits.length)];
    }

    /// It checks if the number of lowercase letters in the password is less than the minimum number of
    /// lowercase letters. If it is, it adds a random lowercase letter to the password.
    if (countLowerCase(password) < minLowercase) {
      password = password + lowerCase[Random().nextInt(lowerCase.length)];
    }

    /// It checks if the number of uppercase letters in the password is less than the minimum number of
    /// uppercase letters. If it is, it adds a random uppercase letter to the password.
    if (countUpperCase(password) < minUppercase) {
      password = password + upperCase[Random().nextInt(upperCase.length)];
    }

    /// It checks if the number of special characters in the password is less than the minimum number of
    /// special characters. If it is, it adds a random special character to the password.
    if (countSpecialCharacters(password) < minSpecialCharacters) {
      password = password + symbols[Random().nextInt(symbols.length)];
    }

    /// It checks if the number of passwords to generate is equal to 1. If it is, it returns the password.
    if (count == 1) {
      return password;
    }

    /// It checks if the number of passwords to generate is less than or equal to 0. If it is, it throws an
    /// exception.
    if (count <= 0) {
      throw Exception("Invalid count");
    }

    /// Generating a list of passwords.
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

  /// Count the number of lowercase letters in a string.
  ///
  /// Args:
  ///   string (String): The string to be checked.
  ///
  /// Returns:
  ///   The number of lowercase letters in the string.
  int countLowerCase(String string) {
    int count = 0;
    for (int i = 0; i < string.length; i++) {
      if (string[i].toLowerCase() == string[i]) {
        count++;
      }
    }
    return count;
  }

  /// Count the number of uppercase letters in a string.
  ///
  /// Args:
  ///   string (String): The string to be checked.
  ///
  /// Returns:
  ///   The number of uppercase letters in the string.
  int countUpperCase(String string) {
    int count = 0;
    for (int i = 0; i < string.length; i++) {
      if (string[i].toUpperCase() == string[i]) {
        count++;
      }
    }
    return count;
  }

  /// If the character at the current index is a number, increment the count.
  ///
  /// Args:
  ///   string (String): The string to be checked.
  ///
  /// Returns:
  ///   The number of numbers in the string.
  int countNumbers(String string) {
    int count = 0;
    for (int i = 0; i < string.length; i++) {
      if (int.tryParse(string[i]) != null) {
        count++;
      }
    }
    return count;
  }

  /// It takes a string and returns the number of special characters in it
  ///
  /// Args:
  ///   string (String): The string to be checked.
  ///
  /// Returns:
  ///   The number of special characters in the string.
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
