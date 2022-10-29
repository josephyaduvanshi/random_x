import 'dart:math';
import '../../database/dictionary.dart';
import '../../rndx.dart';

class RandomUserDetailsGen {
  /// Generate a random age between 0 and 100 and return it as a string.
  ///
  /// Returns:
  ///   A string
  static String generateRandomAge() {
    Random rnd = Random();
    int age = rnd.nextInt(100);
    return age.toString();
  }

  /// Creating a list of FIRST_NAMES AND LAST_NAMES which
  /// BY THE WAY WE ARE GETTING FROM THE DICTIONARY DIRECTORY.
  static List<List<String>> lists = const [
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
  static String generateName_({
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
  static generateNames_({
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
  static generateUsername_({
    int count = 1,
    int randomNumberLength = 2,
    bool uniqueList = true,
    int? usernameLength,
  }) {
    List<String> usernames = [];
    for (int i = 0; i < count; i++) {
      String adjective = DictionaryDatabase
          .adjectives[Random().nextInt(DictionaryDatabase.adjectives.length)];
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
  static String formatStringDigitWithComma({required String input}) {
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
  static int translateLengthToNumber(int length) {
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

  static String generateRandomWebsite({
    bool https = true,
  }) {
    String website = RndX.generateRandomPseudoWord(maxWordSize: 10);
    String domain = RndX.generateRandomPseudoWord(maxWordSize: 3);
    if (https) {
      website = 'https://www.$website.$domain';
      return website;
    } else {
      return '$website.$domain';
    }
  }

  /// Generate a random salary with a default length of 5
  ///
  /// Args:
  ///   length (int): The length of the salary string. Defaults to 5
  ///
  /// Returns:
  ///   A list of strings.
  static String generateRandomSalary({
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
  static String generateRandomHeight({
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
  static String heightToCentimeters(final height) {
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
  static generateRandomEmail_({
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
  static String generateRandomWeight({
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
  static generateRandomNumber_({
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

  /// * Generate a random gender from the list of genders in the database
  ///
  /// Returns:
  ///   A random gender from the list of genders in the database.
  static String generateRandomGender_() {
    List<String> genderList = DictionaryDatabase.sexList;
    return genderList[Random().nextInt(genderList.length)];
  }

  /// It generates a random race from the raceList
  ///
  /// Returns:
  ///   A random race from the raceList.
  static String generateRandomRace_() {
    List<String> raceList = DictionaryDatabase.raceList;
    return raceList[Random().nextInt(raceList.length)];
  }

  /// It returns a random zodiac sign.
  ///
  /// Returns:
  ///   A random zodiac sign from the list of zodiac signs.
  static String randomZodiacSign_() {
    List<String> zodiacSigns = DictionaryDatabase.zodiacSign;
    return zodiacSigns[Random().nextInt(zodiacSigns.length)];
  }

  /// It generates a random blood type from the bloodTypeList
  ///
  /// Returns:
  ///   A random blood type from the bloodTypeList.
  static String generateRandomBloodType_() {
    List<String> bloodTypeList = DictionaryDatabase.bloodGroup;
    return bloodTypeList[Random().nextInt(bloodTypeList.length)];
  }

  /// It generates a random eye color from the eyeColorList
  ///
  /// Returns:
  ///   A random eye color from the eyeColorList.
  static String generateRandomEyeColor_() {
    List<String> eyeColorList = DictionaryDatabase.eyeColor;
    return eyeColorList[Random().nextInt(eyeColorList.length)];
  }

  /// It generates a random hair color from the hairColorList
  ///
  /// Returns:
  ///   A random hair color from the hairColorList.
  static String generateRandomHairColor_() {
    List<String> hairColorList = DictionaryDatabase.hairColor;
    return hairColorList[Random().nextInt(hairColorList.length)];
  }

  /// It returns a random civil status from the list of civil status in the database
  ///
  /// Returns:
  ///   A random civil status from the list of civil status.
  static String generateRandomCivilStatus_() {
    List<String> civilStatusList = DictionaryDatabase.civilStatus;
    return civilStatusList[Random().nextInt(civilStatusList.length)];
  }

  /// It generates a random educational background.
  ///
  /// Returns:
  ///   A random educational background from the list of educational backgrounds.
  static String generateRandomEducationalBakground_() {
    List<String> educationalBakgroundList =
        DictionaryDatabase.educationBackground;
    return educationalBakgroundList[
        Random().nextInt(educationalBakgroundList.length)];
  }

  /// It returns a random religion from the list of religions in the database
  ///
  /// Returns:
  ///   A random religion from the list of religions.
  static String generateRandomReligion_() {
    List<String> religionList = DictionaryDatabase.religionsList;
    return religionList[Random().nextInt(religionList.length)];
  }

  /// It generates a random disease history from the disease history list
  ///
  /// Returns:
  ///   A random disease history from the diseaseHistoryList.
  static String generateRandomDiseaseHistory_() {
    List<String> diseaseHistoryList = DictionaryDatabase.diseaseHistory;
    return diseaseHistoryList[Random().nextInt(diseaseHistoryList.length)];
  }

  /// * Generate a random employment status from the list of employment status in the database
  ///
  /// Returns:
  ///   A random employment status from the list of employment status.
  static String generateRandomEmploymentStatus_() {
    List<String> employmentStatusList = DictionaryDatabase.employmentStatus;
    return employmentStatusList[Random().nextInt(employmentStatusList.length)];
  }

  /// It generates a random occupation from the occupation list.
  ///
  /// Returns:
  ///   A random occupation from the occupationList.
  static String generateRandomOccupation_() {
    List<String> occupationList = DictionaryDatabase.occupation;
    return occupationList[Random().nextInt(occupationList.length)];
  }

  /// It returns a random vehicle from the list of vehicles in the database
  ///
  /// Returns:
  ///   A random vehicle from the vehicleList.
  static String generateRandomVehicle_() {
    List<String> vehicleList = DictionaryDatabase.vehicleList;
    return vehicleList[Random().nextInt(vehicleList.length)];
  }

  /// * Generate a random number between 0 and the length of the hobbies list.
  /// * Return the hobby at the index of the random number
  ///
  /// Returns:
  ///   A random hobby from the hobbiesList.
  static String generateRandomHobbies_() {
    List<String> hobbiesList = DictionaryDatabase.hobbiesList;
    return hobbiesList[Random().nextInt(hobbiesList.length)];
  }

  /// It generates a random food from the foodList.
  ///
  /// Returns:
  ///   A random food from the foodList.
  static String generateRandomFavFood_() {
    List<String> favFoodList = DictionaryDatabase.foodList;
    return favFoodList[Random().nextInt(favFoodList.length)];
  }

  /// It generates a random sport from the list of sports in the database.
  ///
  /// Returns:
  ///   A random sport from the list of sports in the DictionaryDatabase.
  static String generateRandomFavSports_() {
    List<String> favSportsList = DictionaryDatabase.sports;
    return favSportsList[Random().nextInt(favSportsList.length)];
  }

  /// * Generate a random number between 0 and the length of the list of colors, then return the color at
  /// that index
  ///
  /// Returns:
  ///   A random color from the colorList.

  static String generateRandomFavColor_() {
    List<String> favColorList = DictionaryDatabase.colorList;
    return favColorList[Random().nextInt(favColorList.length)];
  }

  /// It generates a random music genre from the list of music genres in the database.
  ///
  /// Returns:
  ///   A random music genre from the list of music genres.

  static String generateRandomFavMusic_() {
    List<String> favMusicList = DictionaryDatabase.musicGenre;
    return favMusicList[Random().nextInt(favMusicList.length)];
  }

  /// It generates a random movie genre from the list of movie genres.
  ///
  /// Returns:
  ///   A random movie genre from the list of movie genres.

  static String generateRandomFavMovie_() {
    List<String> favMovieList = DictionaryDatabase.movieGenre;
    return favMovieList[Random().nextInt(favMovieList.length)];
  }

  /// * Generate a random number between 0 and the length of the list of books.
  /// * Return the book at the index of the random number
  ///
  /// Returns:
  ///   A random book from the list of books in the DictionaryDatabase.booksList.
  static String generateRandomFavBook_() {
    List<String> favBookList = DictionaryDatabase.booksList;
    return favBookList[Random().nextInt(favBookList.length)];
  }

  /// It generates a random favourite genre for the user.
  ///
  /// Returns:
  ///   A random movie genre from the list of movie genres in the DictionaryDatabase class.
  static String generateFavouriteGenre_() {
    List<String> favGenreList = DictionaryDatabase.movieGenre;
    return favGenreList[Random().nextInt(favGenreList.length)];
  }

  /// It returns a random device detail from the list of device details
  ///
  /// Returns:
  ///   A random device detail from the devicesList.
  static String generateRandomDeviceDetail_() {
    List<String> deviceDetail = DictionaryDatabase.devicesList;
    return deviceDetail[Random().nextInt(deviceDetail.length)];
  }
}
