import 'dart:math';

import '../../../random_x.dart';

class RandomCharString {
  /// Creating a singleton class.
  static final RandomCharString _singleton = RandomCharString._internal();

  /// A private constructor.
  RandomCharString._internal();

  /// `RandomCharString()` is a factory constructor that returns a singleton instance of the class
  ///
  /// Returns:
  ///   A singleton instance of the RandomCharString class.
  factory RandomCharString() {
    return _singleton;
  }

  /// It takes a string and an integer as parameters, and returns a string of random characters of the
  /// specified length
  ///
  /// Args:
  ///   type (String): The type of string you want to generate.
  ///   length (int): The length of the string to be generated.
  ///
  /// Returns:
  ///   A random string of the specified length and type.
  String randString({required RandomCharStringType type, required int length}) {
    /// Checking that the length is greater than zero. If it is not, it throws an exception.
    if (length <= 0) {
      throw Exception("Invalid length in RandString($type, $length)");
    }

    /// Generating a random string of upper case characters.
    if (type == RandomCharStringType.upperCase) {
      String response = "";
      for (int i = 0; i < length; i++) {
        int code = Random().nextInt(90 - 65) + 65;
        response += String.fromCharCode(code);
      }
      return response;
    }

    /// Generating a random string of lower case characters.
    else if (type == RandomCharStringType.lowerCase) {
      String response = "";
      for (int i = 0; i < length; i++) {
        int code = Random().nextInt(122 - 97) + 97;
        response += String.fromCharCode(code);
      }
      return response;
    }

    /// Generating a random string of upper and lower case characters.
    else if (type == RandomCharStringType.upperLower) {
      String response = "";
      int code = 0;
      for (int i = 0; i < length; i++) {
        int choice = Random().nextInt(1);
        if (choice == 0) {
          code = Random().nextInt(90 - 65) + 65;
        } else {
          code = Random().nextInt(122 - 97) + 97;
        }
        response += String.fromCharCode(code);
      }
      return response;
    }

    /// Generating a random string of upper and lower case characters and numbers.
    else if (type == RandomCharStringType.alphaNumerical) {
      String response = "";
      int code = 0;
      for (int i = 0; i < length; i++) {
        int choice = Random().nextInt(4);
        if (choice == 0) {
          code = Random().nextInt(90 - 65) + 65;
        } else if (choice == 1) {
          code = Random().nextInt(122 - 97) + 97;
        } else {
          code = Random().nextInt(57 - 48) + 48;
        }
        response += String.fromCharCode(code);
      }
      return response;
    }

    /// Generating a random string of special characters.
    else if (type == RandomCharStringType.specialCharASCII) {
      String response = "";
      for (int i = 0; i < length; i++) {
        int code = Random().nextInt(126 - 33) + 33;
        response += String.fromCharCode(code);
      }
      return response;
    }

    /// This is a catch-all for any other value of `type` that is not one of the valid values.
    else {
      throw Exception("Invalid type in RandString($type, $length)");
    }
  }

  /// Generate a random string of a given length from a given list of characters.
  ///
  /// Args:
  ///   list (List): The list of characters to choose from.
  ///   length (int): The length of the string you want to generate.
  ///
  /// Returns:
  ///   A string of random characters from the list.
  String randStringFromList_({required List list, required int length}) {
    if (length <= 0) {
      throw Exception("Invalid length in RandStringFromList($list, $length)");
    }
    String response = "";
    for (int i = 0; i < length; i++) {
      response += list[Random().nextInt(list.length)];
    }
    return response;
  }

  /// It takes a list of strings, a length, and a separator and returns a string of the length specified
  /// with the separator in between each string.
  ///
  /// Args:
  ///   list (List): The list of items to choose from.
  ///   length (int): The length of the string to be returned.
  ///   separator (String): The separator to use between each random string.
  ///
  /// Returns:
  ///   A string of random characters from the list, separated by the separator.
  String randStringFromListWithSeparator_(
      {required List list, required int length, required String separator}) {
    if (length <= 0) {
      throw Exception(
          "Invalid length in RandStringFromListWithSeparator($list, $length, $separator)");
    }
    String response = "";
    for (int i = 0; i < length; i++) {
      response += list[Random().nextInt(list.length)];
      if (i != length - 1) {
        response += separator;
      }
    }
    return response;
  }

  /// "Returns a string of length `length` that is made up of random elements from `list` separated by
  /// `separator`."
  ///
  /// The first thing to notice is that the function is marked as `required` in the function signature.
  /// This is because the function is a top-level function, and not a method of a class. This means that
  /// the function is not bound to an object, and therefore cannot be called with the `.` operator. This
  /// means that the function is called with the `()` operator, and therefore the function parameters must
  /// be marked as `required`
  ///
  /// Args:
  ///   list (List): The list of items to choose from.
  ///   length (int): The length of the string to be returned.
  ///   separator (String): The separator to use between each item in the list.
  ///
  /// Returns:
  ///   A string of random characters from the list, separated by the separator, and repeated length
  /// times.
  String randStringFromListWithSeparatorAndRepeat_(
      {required List list, required int length, required String separator}) {
    if (length <= 0) {
      throw Exception(
          "Invalid length in RandStringFromListWithSeparatorAndRepeat($list, $length, $separator)");
    }
    String response = "";
    for (int i = 0; i < length; i++) {
      response += list[Random().nextInt(list.length)];
      if (i != length - 1) {
        response += separator;
      }
    }
    return response;
  }

  /// It takes a string and returns a randomised version of it
  ///
  /// Args:
  ///   string (String): The string to randomise.
  ///   length (int): The length of the string to be returned.
  ///
  /// Returns:
  ///   A randomised string of the given length.
  String randomiseString_({
    required String string,
    int? length,
  }) {
    length ??= string.length;
    if (length <= 0) {
      throw Exception("Invalid length in randomiseString($string, $length)");
    }
    String randomisedText = "";
    List<String> list = string.split("");
    for (int i = 0; i < length; i++) {
      randomisedText += list.removeAt(Random().nextInt(list.length));
    }
    return randomisedText;
  }

  /// "It takes a list and returns a randomised version of that list."
  ///
  /// The function takes two parameters:
  ///
  /// * `list` is the list to be randomised.
  /// * `length` is the length of the randomised list. If `length` is not specified, the length of the
  /// randomised list will be the same as the length of the original list
  ///
  /// Args:
  ///   list (List): The list to be randomised.
  ///   length (int): The length of the list to return. If null, the length of the list will be used.
  ///
  /// Returns:
  ///   A list of the same length as the input list, but with the elements in a random order.
  randomiseList_({
    required List list,
    int? length,
  }) {
    length ??= list.length;
    if (length <= 0) {
      throw Exception("Invalid length in randomiseList($list, $length)");
    }
    List randomisedList = [];
    for (int i = 0; i < length; i++) {
      randomisedList.add(list.removeAt(Random().nextInt(list.length)));
    }
    return randomisedList;
  }
}
