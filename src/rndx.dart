library rndx;

import 'dart:math';
import 'algorithms/colors/random_colors.dart';
import 'algorithms/misc/random_char_string.dart';
import 'algorithms/sys/random_ipv_mac.dart';
import 'algorithms/user-details/generate_strong_password.dart';
import 'algorithms/user-details/random_user_details.dart';
import 'algorithms/misc/random_word.dart';

mixin RndX {
  Random get rnd;
  int nextInt(int max) => rnd.nextInt(max);
  double nextDouble() => rnd.nextDouble();
  bool nextBool() => rnd.nextBool();
  int nextIntInRange(int min, int max) => min + nextInt(max - min);
  double nextDoubleInRange(double min, double max) =>
      min + nextDouble() * (max - min);
  bool nextBoolWithProbability(double probability) =>
      nextDouble() < probability;

  int nextIntWithProbability(int min, int max, double probability) {
    if (probability < 0 || probability > 1) {
      throw ArgumentError.value(
          probability, 'probability', 'must be between 0 and 1');
    }
    if (probability == 0) {
      return min;
    }
    if (probability == 1) {
      return max;
    }
    return (min + (max - min) * probability).toInt();
  }

  static generateNames({
    int count = 1,
    bool repeatParts = false,
    bool uniqueList = true,
    String separator = ' ',
  }) =>
      generateNames_(
        count: count,
        repeatParts: repeatParts,
        uniqueList: uniqueList,
        separator: separator,
      );

  static generateName({
    bool repeatParts = false,
    String separator = ' ',
  }) =>
      generateName_(
        repeatParts: repeatParts,
        separator: separator,
      );

  static generateUsername({
    int count = 1,
    int randomNumberLength = 2,
    bool uniqueList = true,
    int? usernameLength,
  }) =>
      generateUsername_(
          count: count,
          randomNumberLength: randomNumberLength,
          uniqueList: uniqueList,
          usernameLength: usernameLength);

  static generateEmail({
    int count = 1,
    int randomNumberLength = 2,
    bool uniqueList = true,
    String domain = 'gmail.com',
  }) =>
      generateRandomEmail_(
          count: count,
          randomNumberLength: randomNumberLength,
          uniqueList: uniqueList,
          domain: domain);

  static generateRandomHexColorCode({
    int count = 1,
    bool uniqueList = true,
  }) =>
      generateRandomHexColorCode_(
        count: count,
        uniqueList: uniqueList,
      );

  static generateRandomPseudoWord(
          {required int maxWordSize, bool constantWordSize = false}) =>
      generateRandomPsuedoWord_(
          maxWordSize: maxWordSize, constantWordSize: constantWordSize);

  static generateRandomPseudoWordList({
    required int numOfWords,
    required int maxWordSize,
    bool constantWordSize = false,
  }) =>
      generateRandomPsuedoWordList_(
        numOfWords: numOfWords,
        maxWordSize: maxWordSize,
        constantWordSize: constantWordSize,
      );

  static randomiseString({required String string, int? length}) =>
      RandomCharString().randomiseString_(
        string: string,
        length: length,
      );

  static randomiseList({required List list, int? length}) =>
      RandomCharString().randomiseList_(
        list: list,
        length: length,
      );

  static randStringFromListWithSeparatorAndRepeat_(
          {required List list,
          required int length,
          required String separator}) =>
      RandomCharString().randStringFromListWithSeparatorAndRepeat_(
        list: list,
        length: length,
        separator: separator,
      );

  static randStringFromListWithSeparator_(
          {required List list,
          required int length,
          required String separator}) =>
      RandomCharString().randStringFromListWithSeparator_(
          list: list, length: length, separator: separator);

  static randStringFromList_({required List list, required int length}) =>
      RandomCharString().randStringFromList_(list: list, length: length);

  static generatePassword({
    int count = 1,
    bool uniqueList = true,
    int length = 8,
    int minLowercase = 3,
    int minUppercase = 1,
    int minNumbers = 3,
    int minSpecialCharacters = 3,
  }) =>
      RandomStrongPassword().generateRandomPassword_(
        count: count,
        uniqueList: uniqueList,
        length: length,
        minLowercase: minLowercase,
        minUppercase: minUppercase,
        minNumbers: minNumbers,
        minSpecialCharacters: minSpecialCharacters,
      );

  // static Color get randomColor => Color(hexStringToInt());

  static generatePhoneNumber() => generateRandomNumber_();
  static generateRandomIPV4() => generateRandomIPV4_();
  static generateRandomIPV6() => generateRandomIPV6_();
  static generateRandomMAC() => generateRandomMAC_();
}

void main(List<String> args) {
  print(RndX.generateName());
  print(RndX.generateNames(count: 5));
  print(RndX.generateUsername());
  print(RndX.generateEmail());
  print(RndX.generateRandomHexColorCode());
  print(RndX.generateRandomPseudoWord(maxWordSize: 10));
  print(RndX.generateRandomPseudoWordList(numOfWords: 5, maxWordSize: 10));
  print(RndX.randomiseString(string: 'Hello World'));
  print(RndX.randomiseList(list: ['Hello', 'World']));
  print(RndX.randStringFromListWithSeparatorAndRepeat_(
      list: ['Hello', 'World'], length: 5, separator: ' '));
  print(RndX.randStringFromListWithSeparator_(
      list: ['Hello', 'World'], length: 5, separator: ' '));
  print(RndX.randStringFromList_(list: ['Hello', 'World'], length: 5));
  print(RndX.generatePassword());
  print(RndX.generatePhoneNumber());
  print(RndX.generateRandomIPV4());
  print(RndX.generateRandomIPV6());
  print(RndX.generateRandomMAC());
  
}