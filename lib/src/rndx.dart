import 'dart:math';
import 'algorithms/algorithm_x.dart';

/// Defining type of user agent.
enum UserAgentType { web, mobile, tablet, macOs, none }

/// Defining type of credit crds.
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

/// Creating an enum called GravatarImage for avatar type.
enum GravatarImage {
  nf,
  mp,
  identicon,
  monsterid,
  wavatar,
  retro,
  robohash,
  blank,
}

/// Creating an enum called GravatarRating for Age Rating.
enum GravatarRating {
  g,
  pg,
  r,
  x,
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
      RandomUserDetailsGen.generateNames_(
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
      RandomUserDetailsGen.generateName_(
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
      RandomUserDetailsGen.generateUsername_(
          count: count,
          randomNumberLength: randomNumberLength,
          uniqueList: uniqueList,
          usernameLength: usernameLength);

  /// It generates a random gender.
  static randomSex() => RandomUserDetailsGen.generateRandomGender_();

  /// It generates a random race.
  static randomRace() => RandomUserDetailsGen.generateRandomRace_();

  /// It returns a random birthday.
  ///
  /// Args:
  ///   start (DateTime): The start date of the range.
  ///   end (DateTime): The end date of the range.
  static randomBirthday({DateTime? start, DateTime? end}) =>
      RandomDates.randomBirthday(start: start, end: end);

  /// It generates a random date between the start and end date.
  ///
  /// Args:
  ///   start (DateTime): The start date of the range.
  ///   end (DateTime): The end date of the range.
  static generateRandomDateBetween(
          {required DateTime start, required DateTime end}) =>
      RandomDates.randomDateBetween(start: start, end: end);

  /// It returns a random future date.
  ///
  /// Args:
  ///   start (DateTime): The start date for the random date to be generated.
  ///   end (DateTime): The end date of the range.
  static randomFutureDate({DateTime? start, DateTime? end}) =>
      RandomDates.randomFutureDate(
        start: start,
        end: end,
      );

  /// It returns a random past date.
  ///
  /// Args:
  ///   start (DateTime): The start date of the range.
  ///   end (DateTime): The end date of the range.
  static randomPastDate({DateTime? start, DateTime? end}) =>
      RandomDates.randomPastDate(
        start: start,
        end: end,
      );

  /// It returns a random future date after the date passed in.
  ///
  /// Args:
  ///   date (DateTime): The date to start the random date generation from.
  static randomFutureDateAfter({required DateTime date}) =>
      RandomDates.randomFutureDateAfter(date: date);

  /// It returns a random past date before the date passed in.
  ///
  /// Args:
  ///   date (DateTime): The date to generate a random date before.
  static randomPastDateBefore({required DateTime date}) =>
      RandomDates.randomPastDateBefore(date: date);

  /// It returns a random date that is within the range of the age provided.
  ///
  /// Args:
  ///   age (int): The age of the person.
  static randomDateByAge({required int age}) =>
      RandomDates.randomDateByAge(age: age);

  /// It returns a random future date by age.
  ///
  /// Args:
  ///   age (int): The age of the person.
  static randomFutureDateByAge({required int age}) =>
      RandomDates.randomFutureDateByAge(age: age);

  /// Generate a list of random dates between a start and end date
  ///
  /// Args:
  ///   count (int): The number of dates you want to generate. Defaults to 1
  ///   start (DateTime): The start date of the range.
  ///   end (DateTime): The end date of the range.
  ///   uniqueList (bool): If true, the list will be unique. If false, the list will not be unique.
  /// Defaults to true
  static generateRandomDates({
    int count = 1,
    DateTime? start,
    DateTime? end,
    bool uniqueList = true,
  }) =>
      RandomDates.generateRandomDates(
        count: count,
        start: start,
        end: end,
        uniqueList: uniqueList,
      );

  /// It returns a random zodiac sign.
  static randomZodiacSign() => RandomUserDetailsGen.randomZodiacSign_();

  /// It generates a random blood group.
  static randomBloodGroup() => RandomUserDetailsGen.generateRandomBloodType_();

  /// It generates a random hair color.
  static randomHairColor() => RandomUserDetailsGen.generateRandomHairColor_();

  /// It generates a random eye color.
  static randomEyeColor() => RandomUserDetailsGen.generateRandomEyeColor_();

  /// It generates a random height.
  ///
  /// Args:
  ///   isMetric (bool): If true, the height will be in metric units. If false, it will be in imperial
  /// units. Defaults to false
  ///   withCentimeters (bool): If true, the height will be in the format of 5'10" (178 cm). If false, the
  /// height will be in the format of 5'10". Defaults to true
  static randomHeight({bool isMetric = false, bool withCentimeters = true}) =>
      RandomUserDetailsGen.generateRandomHeight(
        isMetric: isMetric,
        withCentimeters: withCentimeters,
      );

  /// It generates a random weight.
  ///
  /// Args:
  ///   min (int): The minimum weight value. Defaults to 40
  ///   max (int): The maximum weight value. Defaults to 300
  ///   withKG (bool): If true, the weight will be returned with the KG unit. Defaults to true
  static randomWeight({
    int min = 40,
    int max = 300,
    bool withKG = true,
  }) =>
      RandomUserDetailsGen.generateRandomWeight(
        min: min,
        max: max,
        withKG: withKG,
      );

  /// It returns a random address.
  ///
  /// Args:
  ///   count (int): The number of addresses you want to generate. Defaults to 1
  ///   uniqueList (bool): If true, the list will contain unique addresses. If false, the list may contain
  /// duplicate addresses. Defaults to true
  static randomAddressList({int count = 10, bool uniqueList = true}) =>
      RandomAddresses.getRandomAddressList(
        count: count,
        uniqueList: uniqueList,
      );

  static Address randomAddress() =>
      RandomAddresses.generateSingleRandomAddress();

  /// Generates a random postal code (UNITED STATES).
  static randomPostalCode() => RandomAddresses.generateRandomPostalCode();

  /// It returns a list of random addresses based on the street address (UNITED STATES).
  ///
  /// Args:
  ///   address1 (String): The street address of the address you want to get (UNITED STATES).
  ///   count (int): The number of addresses to return. Defaults to 1
  static getRandomAddressByStreetAddress(
          {required String address1, int count = 1}) =>
      RandomAddresses.getRandomAddressByStreetAddress(
          address1: address1, count: count);

  /// It returns a list of random addresses in the specified city (UNITED STATES).
  ///
  /// Args:
  ///   city (String): The city you want to get a random address from.
  ///   count (int): The number of addresses you want to generate. Defaults to 1
  static getRandomAddressByCity({required String city, int count = 1}) =>
      RandomAddresses.getRandomAddressByCity(city: city, count: count);

  /// It returns a list of random addresses in the specified state (UNITED STATES).
  ///
  /// Args:
  ///   state (String): The state you want to get a random address from.
  ///   count (int): The number of addresses you want to generate. Defaults to 1
  static getRandomAddressByState({required String state, int count = 1}) =>
      RandomAddresses.getRandomAddressByState(state: state, count: count);

  /// Generates a random city name.
  static generateRandomCity() => RandomAddresses.generateRandomCity();

  /// It generates a random state.
  static generateRandomState() => RandomAddresses.generateRandomState();

  /// Generates a random street address.
  static generateRandomStreetAddress() =>
      RandomAddresses.generateRandomAddress1();

  /// It generates a random address.
  static generateRandomAddress2() => RandomAddresses.generateRandomAddress2();

  /// Generates a random latitude.
  static generateRandomLatitude() => RandomAddresses.generateRandomLatitude();

  /// Generates a random longitude.
  static generateRandomLongitude() => RandomAddresses.generateRandomLongitude();

  /// Generates a random Social Security Number.
  ///
  /// Args:
  ///   count (int): The number of SSNs to generate. Defaults to 1
  ///   withdashes (bool): If you want the SSN to be formatted with dashes, set this to true. Defaults to
  /// false
  static randomSSN({int count = 1, bool withdashes = false}) =>
      RandomSSN.generate(
        count: count,
        withdashes: withdashes,
      );

  /// Generates a random salary.
  ///
  /// Args:
  ///   length (int): The length of the salary. Defaults to 5
  static randomSalary({int length = 5}) =>
      RandomUserDetailsGen.generateRandomSalary(length: length);

  /// It generates a random civil status.
  static randomCivilStatus() =>
      RandomUserDetailsGen.generateRandomCivilStatus_();

  /// It generates a random educational background.
  static randomEducationalBackground() =>
      RandomUserDetailsGen.generateRandomEducationalBakground_();

  /// It generates a random religion.
  static randomReligion() => RandomUserDetailsGen.generateRandomReligion_();

  /// It generates a random disease history.
  static randomDiseaseHistory() =>
      RandomUserDetailsGen.generateRandomDiseaseHistory_();

  /// It generates a random employment status.
  static randomEmploymentStatus() =>
      RandomUserDetailsGen.generateRandomEmploymentStatus_();

  /// It generates a random occupation.
  static randomOccupation() => RandomUserDetailsGen.generateRandomOccupation_();

  /// It generates a random vehicle.
  static randoVehicle() => RandomUserDetailsGen.generateRandomVehicle_();

  /// It generates a random list of hobbies.
  static randomHobbies() => RandomUserDetailsGen.generateRandomHobbies_();

  /// It generates a random favorite color.
  static randomFavoriteColor() =>
      RandomUserDetailsGen.generateRandomFavColor_();

  /// It generates a random favorite food.
  static randomFavoriteFood() => RandomUserDetailsGen.generateRandomFavFood_();

  /// It generates a random favorite music.
  static randomFavoriteMusic() =>
      RandomUserDetailsGen.generateRandomFavMusic_();

  /// It generates a random favorite movie.
  static randomFavoriteMovie() =>
      RandomUserDetailsGen.generateRandomFavMovie_();

  /// It generates a random favorite book.
  static randomFavoriteBook() => RandomUserDetailsGen.generateRandomFavBook_();

  /// It generates a random  favorite sports.
  static randomFavoriteSports() =>
      RandomUserDetailsGen.generateRandomFavSports_();

  /// It generates a random favorite genre.
  static randomFavoriteGenre() =>
      RandomUserDetailsGen.generateFavouriteGenre_();

  /// It generates a random device detail.
  static randomDeviceDetail() =>
      RandomUserDetailsGen.generateRandomDeviceDetail_();

  static randomWebsite({
    bool https = true,
  }) =>
      RandomUserDetailsGen.generateRandomWebsite(
        https: https,
      );

  /// It generates a random credit card number with a valid Luhn check digit.
  ///
  /// Args:
  ///   withCustomBin (bool): If you want to use a custom bin, set this to true. Defaults to false
  ///   customBin (String): This is the first 6 digits of the credit card number. Defaults to 52247
  ///   ccnType (CreditCardType): This is the type of credit card you want to generate. It can be any of
  /// the following:. Defaults to CreditCardType
  static RandomCreditCards randomFullCreditCard({
    bool withCustomBin = false,
    String customBin = '52247',
    CreditCardType ccnType = CreditCardType.random,
  }) =>
      CardGenerator.generateFullCC(
        withCustomBin: withCustomBin,
        customBin: customBin,
        ccnType: ccnType,
      );

  /// It generates a list of random credit cards.
  ///
  /// Args:
  ///   numberOfCards (int): The number of cards you want to generate. Defaults to 10
  ///   withCustomBin (bool): If you want to use a custom bin, set this to true. Defaults to false
  ///   customBin (String): This is the first 6 digits of the credit card number. Defaults to 52247
  ///   ccnType (CreditCardType): CreditCardType.random,. Defaults to CreditCardType
  static List<RandomCreditCards> randomFullBulkCreditCards({
    int numberOfCards = 10,
    bool withCustomBin = false,
    String customBin = '52247',
    CreditCardType ccnType = CreditCardType.random,
  }) =>
      CardGenerator.generateBulkFullCC(
        numberOfCards: numberOfCards,
        withCustomBin: withCustomBin,
        customBin: customBin,
        ccnType: ccnType,
      );

  /// It identifies the type of credit card based on the card number.
  ///
  /// Args:
  ///   cardNumber (String): The card number to identify.
  static identifyCreditCard(String cardNumber) =>
      CardGenerator.identifyCardType(cardNumber);

  /// It generates a random CompleteUserDetailsModel object.
  /// It includes the following:
  /// - Full Name
  /// - Gender
  /// - race
  /// - religion
  /// - birthday
  /// - zodiac sign
  /// - email
  /// - street address
  /// - city
  /// - state
  /// - country
  /// - postal code
  /// - phone number
  /// - ssn
  /// - height
  /// - weight
  /// - hair color
  /// - eye color
  /// - blood type
  /// - civil status
  /// - educational background
  /// - disease history
  /// - employment status
  /// - monthly salary
  /// - occupation
  /// - vehicle
  /// - hobbies
  /// - favorite color
  /// - favorite food
  /// - favorite music
  /// - favorite movie
  /// - favorite book
  /// - favorite sports
  /// - favorite genre
  /// - credit card number
  /// - credit card type
  /// - credit card expiration date
  /// - credit card cvv
  /// - username
  /// - password
  /// - website
  /// - device
  /// - ip address
  /// - mac address
  static CompleteUserDetailsModel randomCompletePersonDetails() =>
      CompleteUserDetailsGen.generate();

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
      RandomUserDetailsGen.generateRandomEmail_(
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

  /// It generates a random string of the specified length and type.
  ///
  /// Args:
  ///   type (RandomCharStringType): The type of string you want to generate.
  ///   length (int): The length of the string to be generated.
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
  ///   count (int): The number of user agents you want to generate. Defaults to 1
  ///   type (UserAgentType): The type of user agent you want to generate. Defaults to UserAgentType
  ///
  /// Returns:
  ///   A random user agent string.
  static getRandomUA(
          {int count = 1, UserAgentType type = UserAgentType.none}) =>
      RandomUA.getRandomUA(count: count, type: type);

  /// Returns true if the given string is a valid UUID.
  ///
  /// Args:
  ///   uuid (String): The UUID to validate.
  ///   version (String): The version of the UUID to validate against. If no version is specified, any
  /// valid UUID is accepted.
  static bool isUUID({required String uuid, String? version}) =>
      Uuid.isUUID(uuid: uuid, version: version);

  /// > Generate a random UUID (Universally Unique Identifier)
  /// > Version 4 UUIDs are pseudo-random.
  static String genUUID() => Uuid.uuidV4();

  /// Generates a GUID.
  ///
  /// Args:
  ///  - allUpperCase (bool): Whether the GUID should be all upper case or not. Defaults to false
  ///  - length (int): The length of the GUID. Default is 32. Defaults to 32
  static String guid({bool allUpperCase = false, int length = 32}) =>
      GUID().generateGUID(allUpperCase: allUpperCase, length: length);

  /// It generates a random hash string in base64 format.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  ///   allLowerCase (bool): If true, the hash will be all lowercase. Defaults to false
  static String randomHashBase64({
    int length = 32,
    bool allUpperCase = false,
    bool allLowerCase = false,
  }) =>
      RandomHash.randomHashBase64(
        length: length,
        allUpperCase: allUpperCase,
        allLowerCase: allLowerCase,
      );

  /// It generates a random MD5 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomMD5hashV1({int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomMD5hashV1(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random MD5 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomMD5hashV2({int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomMD5hashV2(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random SHA256 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomSHA256Hashv1(
          {int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomSHA256Hashv1(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random SHA256 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomSHA256Hashv2(
          {int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomSHA256Hashv2(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random SHA512 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomSHA512Hashv1(
          {int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomSHA512Hashv1(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random SHA512 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomSHA512Hashv2(
          {int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomSHA512Hashv2(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random SHA1 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomSHA1Hashv1(
          {int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomSHA1Hashv1(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random SHA1 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomSHA1Hashv2(
          {int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomSHA1Hashv2(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random SHA384 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomSHA384Hashv1(
          {int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomSHA384Hashv1(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random SHA384 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomSHA384Hashv2(
          {int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomSHA384Hashv2(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random SHA224 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomSHA224Hashv1(
          {int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomSHA224Hashv1(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random SHA224 hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomSHA224Hashv2(
          {int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomSHA224Hashv2(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random HMAC hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomHMACHash({int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomHMACHash(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random HMAC hash.
  ///
  /// Args:
  ///   length (int): The length of the hash. Defaults to 32
  ///   allUpperCase (bool): If true, the hash will be all uppercase. Defaults to false
  static String randomHMACHashv2(
          {int length = 32, bool allUpperCase = false}) =>
      RandomHash.randomHMACHashv2(
        length: length,
        allUpperCase: allUpperCase,
      );

  /// It generates a random verification code.
  ///
  /// Args:
  /// -  length (int): The length of the verification code. Defaults to 9
  /// -  useNumbers (bool): If true, the code will contain numbers. Defaults to true
  /// -  useSpecialCharacters (bool): If true, the code will contain special characters. Defaults to false
  /// -  useAlphabet (bool): If true, the code will contain alphabets. Defaults to false
  /// -  useDashes (bool): If true, the code will be separated by dashes. Defaults to true
  /// -  dashPosition (int): The position of the dash in the verification code. Defaults to 3
  static String randomVerifcationCodes({
    int length = 9,
    bool useNumbers = true,
    bool useSpecialCharacters = false,
    bool useAlphabet = false,
    bool useDashes = true,
    int dashPosition = 3,
  }) =>
      RandomMiscellaneous.generateRandomVerificationCodeCode(
        length: length,
        useNumbers: useNumbers,
        useSpecialCharacters: useSpecialCharacters,
        useAlphabet: useAlphabet,
        useDashes: useDashes,
        dashPosition: dashPosition,
      );

  /// Generates a random IMEI number.
  static String genIMEINumber() =>
      RandomMiscellaneous.generateRandomIMEINumber();

  /// Generates a random Zoom ID.
  static String randomZoomID() => RandomMiscellaneous.generateRandomZoomID();

  /// It generates a random document ID for Firebase.
  static String firebaseRandomDocumentID() =>
      RandomMiscellaneous.generateFirebaseRandomDocumentID();

  /// Generates a random Google API key.
  static String randomGoogleAPIKey() =>
      RandomMiscellaneous.generateRandomGoogleAPIKey();

  /// Generates a random Google Client ID.
  static String randomGoogleClientID() =>
      RandomMiscellaneous.generateRandomGoogleClientID();

  /// Generates a random Google Client Secret
  static String randomGoogleClientSecret() =>
      RandomMiscellaneous.generateRandomGoogleClientSecret();

  /// Generates a random Google Project ID.
  static String randomGoogleProjectID() =>
      RandomMiscellaneous.generateRandomGoogleProjectID();

  /// Generates a random Google Storage bucket name
  static String randomGoogleStorageBucket() =>
      RandomMiscellaneous.generateRandomGoogleStorageBucket();

  /// It generates a GUID with a separator.
  ///
  /// Args:
  /// -  separator (String): The separator to use between the GUID sections. Defaults to -
  /// -  allUpperCase (bool): If true, the GUID will be all upper case. Defaults to false
  /// -  length (int): The length of the GUID.
  static String guidWithSeparator({
    String separator = '-',
    bool allUpperCase = false,
    required int length,
  }) =>
      GUID().guidWithSeparator(
        separator: separator,
        allUpperCase: allUpperCase,
        length: length,
      );

  // static Color get randomColor => Color(hexStringToInt());

  /// It generates a random phone number.
  ///
  /// Args:
  ///   count (int): The number of phone numbers to generate. Defaults to 1
  ///   uniqueList (bool): If you want to generate a list of unique phone numbers, set this to true.
  /// Defaults to true
  static generatePhoneNumber({int count = 1, bool uniqueList = true}) =>
      RandomUserDetailsGen.generateRandomNumber_(
        count: count,
        uniqueList: uniqueList,
      );

  /// It returns a Gravatar image URL.
  ///
  /// Args:
  ///  - email (String): The email address of the user.
  ///  - size (int): The size of the image in pixels.
  ///  - defaultImage (GravatarImage): The default image to use if the user doesn't have a gravatar.
  ///  - forceDefault (bool): If true, always return the default image, never the user's image. Defaults to
  /// false
  ///  - fileExtension (bool): If true, the url will have a file extension (ex: .jpg). Defaults to false
  ///  - rating (GravatarRating): The maximum rating to allow.
  static String getRandomAvatarUrl({
    String? email,
    int? size,
    GravatarImage? defaultImage,
    bool forceDefault = false,
    bool fileExtension = false,
    GravatarRating? rating,
  }) =>
      Gravatar(email: email).imageUrl(
        size: size,
        defaultImage: defaultImage,
        forceDefault: forceDefault,
        fileExtension: fileExtension,
        rating: rating,
      );

  /// It returns the json url of the avatar.
  static String getavatarJsonUrl() => Gravatar().jsonUrl();

  /// It returns the QR code URL of the avatar.
  static String getAvatarQRUrl() => Gravatar().qrUrl();

  /// It generates a random IPV4 address.
  static String generateRandomIPV4() => generateRandomIPV4_();

  /// Generate a random IPV6 address.
  static String generateRandomIPV6() => generateRandomIPV6_();

  /// Generate a random MAC address.
  static String generateRandomMAC() => generateRandomMAC_();
}
