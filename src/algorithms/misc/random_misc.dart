import 'dart:math';

import '../../rndx.dart';

class RandomMiscellaneous {
  /// Generate a random verification code of length 9, using numbers, dashes, and optionally special
  /// characters and/or alphabet
  ///
  /// Args:
  ///   length (int): The length of the code. Defaults to 9
  ///   useNumbers (bool): If true, the code will contain numbers. Defaults to true
  ///   useSpecialCharacters (bool): If true, the code will contain special characters. Defaults to false
  ///   useAlphabet (bool): If true, the code will contain alphabets. Defaults to false
  ///   useDashes (bool): If true, the code will be separated by dashes. Defaults to true
  ///   dashPosition (int): The position of the dash. Defaults to 3
  ///
  /// Returns:
  ///   A string of random characters.
  String generateRandomVerificationCodeCode({
    int length = 9,
    bool useNumbers = true,
    bool useSpecialCharacters = false,
    bool useAlphabet = false,
    bool useDashes = true,
    int dashPosition = 3,
  }) {
    String characters = '';
    if (useNumbers) {
      characters += '0123456789';
    }
    if (useSpecialCharacters) {
      characters += r'!@#$%^&*()_+-=[]{}|;:,./<>?';
    }
    if (useAlphabet) {
      characters += 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }
    final code = String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(Random().nextInt(characters.length))));
    if (useDashes) {
      return code.split('').asMap().entries.map((e) {
        if (e.key % dashPosition == 0 && e.key != 0) {
          return '-${e.value}';
        }
        return e.value;
      }).join();
    }
    return code;
  }

  /// Generates a random IMEI number.
  ///
  /// Returns:
  ///   A string of 15 random numbers.
  String generateRandomIMEINumber() {
    String imei = '';
    for (int i = 0; i < 15; i++) {
      imei += Random().nextInt(9).toString();
    }
    return imei;
  }

  /// It generates a random number between 0 and 99999999, converts it to a string, and returns it
  ///
  /// Returns:
  ///   A random number between 0 and 99999999.
  String generateRandomZoomID() {
    return Random().nextInt(99999999).toString();
  }

  /// It generates a random string of 20 characters.
  ///
  /// Returns:
  ///   A random string of 20 characters.
  String generateFirebaseRandomDocumentID() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 20);
  }

  /// `generateRandomGoogleAPIKey()` generates a random Google API key
  ///
  /// Returns:
  ///   A random string of 39 characters.
  String generateRandomGoogleAPIKey() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 39);
  }

  /// It generates a random string of length 18.
  ///
  /// Returns:
  ///   A random string of 18 characters.
  String generateRandomGoogleClientID() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 18);
  }

  /// `generateRandomGoogleClientSecret()` generates a random string of 24 characters, using only
  /// alphanumerical characters
  ///
  /// Returns:
  ///   A random string of 24 characters.
  String generateRandomGoogleClientSecret() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 24);
  }

  /// `generateRandomGoogleProjectID` generates a random string of 12 characters,
  /// consisting of letters and numbers
  ///
  /// Returns:
  ///   A random string of 12 characters.
  String generateRandomGoogleProjectID() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 12);
  }

  /// It generates a random string of 24 characters.
  ///
  /// Returns:
  ///   A random string of 24 characters.
  String generateRandomGoogleStorageBucket() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 24);
  }

  /// It takes a list of strings, and returns a list of strings where the first letter of each string is
  /// capitalized
  ///
  /// Args:
  ///   a (List<String>): The list of strings to be captalized.
  ///
  /// Returns:
  ///   A list of strings with the first letter of each string capitalized.
  captalizeOnlyFirstLetterOfEveryStringInAList(List<String> a) {
    return a.map((e) => e[0].toUpperCase() + e.substring(1)).toList();
  }
}
