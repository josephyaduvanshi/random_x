import 'dart:math';
import 'algorithms/algorithm_x.dart';

/// Defining type of user agent.
enum UserAgentType { web, mobile, tablet, macOs, none }

/// Defining type of credit cards.
enum CreditCardType {
  americanExpress,
  dinersClub,
  discover,
  jCB,
  masterCard,
  visa,
  random
}

/// Defining type of random string.
enum RandomCharStringType {
  upperCase,
  lowerCase,
  upperLower,
  alphaNumerical,
  specialCharASCII
}

mixin RndX {
  /// A getter for the Random class.
  Random get rnd;

  /// Return a random integer between 0 and max-1.
  ///
  /// Args:
  ///   max (int): The maximum value (exclusive). Must be positive.
  int nextInt(int max) => rnd.nextInt(max);

  /// Return a random double between 0.0 and 1.0.
  double nextDouble() => rnd.nextDouble();

  /// Return a random boolean value.
  bool nextBool() => rnd.nextBool();

  /// Return a random integer between min and max, inclusive.
  ///
  /// Args:
  ///   min (int): The minimum value that can be returned.
  ///   max (int): The maximum value (exclusive) of the range of possible values.
  int nextIntInRange(int min, int max) => min + nextInt(max - min);

  /// "Generate a random double
  /// between min and max, inclusive."
  ///
  /// Args:
  ///   min (double): The minimum value of the range.
  ///   max (double): The maximum value to generate.
  double nextDoubleInRange(double min, double max) =>
      min + nextDouble() * (max - min);

  /// Returns true with the given probability.
  ///
  /// Args:
  ///   probability (double): The probability that the next value will be true.
  bool nextBoolWithProbability(double probability) =>
      nextDouble() < probability;

  /// "Return a random integer between min and max, with a probability of probability."
  ///
  /// The function is a bit more complicated than the previous ones, but it's still pretty simple. It
  /// takes three parameters: min, max, and probability. The first two are the minimum and maximum values
  /// that the function can return. The third is the probability that the function will return a value
  /// between min and max
  ///
  /// Args:
  ///   min (int): The minimum value that can be returned.
  ///   max (int): The maximum value that can be returned.
  ///   probability (double): The probability of the returned value being equal to max.
  ///
  /// Returns:
  ///   A random integer between min and max, with a probability of probability.
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

  /// It generates a list of names.
  ///
  /// Args:
  ///   count (int): The number of names to generate. Defaults to 1
  ///   repeatParts (bool): If true, the same part of the name can be used more than once. Defaults to
  /// false
  ///   uniqueList (bool): If true, the list of names will be unique. If false, the list of names may
  /// contain duplicates. Defaults to true
  ///   separator (String): The separator to use between the first and last name. Defaults to
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

  /// It generates a random name.
  ///
  /// Args:
  ///   repeatParts (bool): If true, the name will have repeated parts. Defaults to false
  ///   separator (String): The separator to use between the parts of the name. Defaults to
  static generateName({
    bool repeatParts = false,
    String separator = ' ',
  }) =>
      generateName_(
        repeatParts: repeatParts,
        separator: separator,
      );

  /// Generate a list of random usernames
  ///
  /// Args:
  ///   count (int): The number of usernames to generate. Defaults to 1
  ///   randomNumberLength (int): The length of the random number that will be appended to the username.
  /// Defaults to 2
  ///   uniqueList (bool): If true, the list of usernames will be unique. If false, the list of usernames
  /// will be non-unique. Defaults to true
  ///   usernameLength (int): The length of the username. If not specified, it will be a random number
  /// between 5 and 10.
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

  /// It generates a random email address.
  ///
  /// Args:
  ///   count (int): The number of emails to generate. Defaults to 1
  ///   randomNumberLength (int): The length of the random number that will be appended to the email.
  /// Defaults to 2
  ///   uniqueList (bool): If true, the list will be unique. If false, the list will contain duplicates.
  /// Defaults to true
  ///   domain (String): The domain of the email address. Defaults to gmail.com
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

  /// It generates a random hex color code.
  ///
  /// Args:
  ///   count (int): The number of hex color codes to generate. Defaults to 1
  ///   uniqueList (bool): If true, the list will contain unique colors. If false, the list may contain
  /// duplicate colors. Defaults to true
  static generateRandomHexColorCode({
    int count = 1,
    bool uniqueList = true,
  }) =>
      generateRandomHexColorCode_(
        count: count,
        uniqueList: uniqueList,
      );

  /// It generates a random pseudo word.
  ///
  /// Args:
  ///   maxWordSize (int): The maximum size of the word to be generated.
  ///   constantWordSize (bool): If true, the word size will be the same for every word. Defaults to false
  static generateRandomPseudoWord(
          {required int maxWordSize, bool constantWordSize = false}) =>
      generateRandomPsuedoWord_(
          maxWordSize: maxWordSize, constantWordSize: constantWordSize);

  /// It generates a list of random pseudo words.
  ///
  /// Args:
  ///   numOfWords (int): The number of words you want to generate.
  ///   maxWordSize (int): The maximum size of the word.
  ///   constantWordSize (bool): If true, all words will be the same size. Defaults to false
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

  /// It returns a randomised string.
  ///
  /// Args:
  ///   string (String): The string to randomise.
  ///   length (int): The length of the string to be returned.
  static randomiseString({required String string, int? length}) =>
      RandomCharString().randomiseString_(
        string: string,
        length: length,
      );

  static randomString(
          {required RandomCharStringType type, required int length}) =>
      RandomCharString().randString(type: type, length: length);

  /// It randomises a list of strings.
  ///
  /// Args:
  ///   list (List): The list to randomise.
  ///   length (int): The length of the string to be generated.
  static randomiseList({required List list, int? length}) =>
      RandomCharString().randomiseList_(
        list: list,
        length: length,
      );

  /// It generates a random string from a list of strings.
  ///
  /// Args:
  ///   list (List): The list of characters to choose from.
  ///   length (int): The length of the string to be generated.
  ///   separator (String): The separator to use between the random characters.
  static randStringFromListWithSeparatorAndRepeat_(
          {required List list,
          required int length,
          required String separator}) =>
      RandomCharString().randStringFromListWithSeparatorAndRepeat_(
        list: list,
        length: length,
        separator: separator,
      );

  /// It generates a random string from a list of strings.
  ///
  /// Args:
  ///   list (List): The list of characters to choose from.
  ///   length (int): The length of the string to be generated.
  ///   separator (String): The separator to use between the characters.
  static randStringFromListWithSeparator_(
          {required List list,
          required int length,
          required String separator}) =>
      RandomCharString().randStringFromListWithSeparator_(
          list: list, length: length, separator: separator);

  /// It generates a random string from a list of characters.
  ///
  /// Args:
  ///   list (List): The list of characters to choose from.
  ///   length (int): The length of the string to be generated.
  static randStringFromList_({required List list, required int length}) =>
      RandomCharString().randStringFromList_(list: list, length: length);

  /// It generates a random password.
  ///
  /// Args:
  ///   count (int): The number of passwords to generate. Defaults to 1
  ///   uniqueList (bool): If true, the list of passwords will be unique. If false, the list of passwords
  /// will be non-unique. Defaults to true
  ///   length (int): The length of the password. Defaults to 8
  ///   minLowercase (int): The minimum number of lowercase characters to include in the password.
  /// Defaults to 3
  ///   minUppercase (int): The minimum number of uppercase letters to be included in the password.
  /// Defaults to 1
  ///   minNumbers (int): The minimum number of numbers that should be in the password. Defaults to 3
  ///   minSpecialCharacters (int): The minimum number of special characters to include in the password.
  /// Defaults to 3
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

  /// It returns a random user agent string.
  ///
  /// Args:
  ///   count (int): The number of user agents you want to get. Defaults to 1
  ///   type (UserAgentType): The type of user agent you want to get. Defaults to UserAgentType
  static getRandomUA(
          {int count = 1, UserAgentType type = UserAgentType.none}) =>
      RandomUA().getRandomUA(count: count, type: type);

  // static Color get randomColor => Color(hexStringToInt());

  /// It generates a random phone number.
  static generatePhoneNumber() => generateRandomNumber_();

  /// It generates a random IPV4 address.
  static generateRandomIPV4() => generateRandomIPV4_();

  /// Generate a random IPV6 address.
  static generateRandomIPV6() => generateRandomIPV6_();

  /// Generate a random MAC address.
  static generateRandomMAC() => generateRandomMAC_();
}
