import 'dart:math';

import '../../rndx.dart';

class RandomMiscellaneous {
  generateRandomVerificationCodeCode({
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

  String generateRandomIMEINumber() {
    String imei = '';
    for (int i = 0; i < 15; i++) {
      imei += Random().nextInt(9).toString();
    }
    return imei;
  }

  String generateRandomZoomID() {
    return Random().nextInt(99999999).toString();
  }

  String generateFirebaseRandomDocumentID() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 20);
  }

  String generateRandomGoogleAPIKey() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 39);
  }

  String generateRandomGoogleClientID() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 18);
  }

  String generateRandomGoogleClientSecret() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 24);
  }

  String generateRandomGoogleProjectID() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 12);
  }

  String generateRandomGoogleStorageBucket() {
    return RndX.randomString(
        type: RandomCharStringType.alphaNumerical, length: 24);
  }

  captalizeOnlyFirstLetterOfEveryStringInAList(List<String> a) {
    return a.map((e) => e[0].toUpperCase() + e.substring(1)).toList();
  }
}
