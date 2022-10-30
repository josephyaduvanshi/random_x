// ignore_for_file: unused_element

import '../../../random_x.dart';

class CompleteUserDetailsModel {
  /// A model class for the complete user details.
  final String name;
  final String gender;
  final String race;
  final String religion;
  final String birthDay;
  final String zodiacSign;
  final String email;
  final String streetAddress;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String phoneNumber;
  final String ssn;
  final String height;
  final String weight;
  final String hairColor;
  final String eyeColor;
  final String bloodType;
  final String civilStatus;
  final String educationalBackground;
  final String diseaseHistory;
  final String employmentStatus;
  final String monthlySalary;
  final String occupation;
  final String vehicle;
  final String hobbies;
  final String favoriteColor;
  final String favoriteFood;
  final String favoriteMusic;
  final String favoriteMovie;
  final String favoriteBook;
  final String favoriteSports;
  final String favoriteGenre;
  final String creditCardNumber;
  final String creditCardType;
  final String creditCardExpirationDate;
  final String creditCardCVV;
  final String username;
  final String password;
  final String website;
  final String device;
  final String ipAddress;
  final String macAddress;

  /// A constructor.
  CompleteUserDetailsModel({
    required this.name,
    required this.gender,
    required this.race,
    required this.religion,
    required this.birthDay,
    required this.zodiacSign,
    required this.email,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.phoneNumber,
    required this.ssn,
    required this.height,
    required this.weight,
    required this.hairColor,
    required this.eyeColor,
    required this.bloodType,
    required this.civilStatus,
    required this.educationalBackground,
    required this.diseaseHistory,
    required this.employmentStatus,
    required this.monthlySalary,
    required this.occupation,
    required this.vehicle,
    required this.hobbies,
    required this.favoriteColor,
    required this.favoriteFood,
    required this.favoriteMusic,
    required this.favoriteMovie,
    required this.favoriteBook,
    required this.favoriteSports,
    required this.favoriteGenre,
    required this.creditCardNumber,
    required this.creditCardType,
    required this.creditCardExpirationDate,
    required this.creditCardCVV,
    required this.username,
    required this.password,
    required this.website,
    required this.device,
    required this.ipAddress,
    required this.macAddress,
  });

  /// A getter.
  String get _name => name;
  String get _gender => gender;
  String get _race => race;
  String get _religion => religion;
  String get _birthDay => birthDay;
  String get _zodiacSign => zodiacSign;
  String get _email => email;
  String get _streetAddress => streetAddress;
  String get _city => city;
  String get _state => state;
  String get _country => country;
  String get _postalCode => postalCode;
  String get _phoneNumber => phoneNumber;
  String get _ssn => ssn;
  String get _height => height;
  String get _weight => weight;
  String get _hairColor => hairColor;
  String get _eyeColor => eyeColor;
  String get _bloodType => bloodType;
  String get _civilStatus => civilStatus;
  String get _educationalBackground => educationalBackground;
  String get _diseaseHistory => diseaseHistory;
  String get _employmentStatus => employmentStatus;
  String get _monthlySalary => monthlySalary;
  String get _occupation => occupation;
  String get _vehicle => vehicle;
  String get _hobbies => hobbies;
  String get _favoriteColor => favoriteColor;
  String get _favoriteFood => favoriteFood;
  String get _favoriteMusic => favoriteMusic;
  String get _favoriteMovie => favoriteMovie;
  String get _favoriteBook => favoriteBook;
  String get _favoriteSports => favoriteSports;
  String get _favoriteGenre => favoriteGenre;
  String get _creditCardNumber => creditCardNumber;
  String get _creditCardType => creditCardType;
  String get _creditCardExpirationDate => creditCardExpirationDate;
  String get _creditCardCVV => creditCardCVV;
  String get _username => username;
  String get _password => password;
  String get _website => website;
  String get _device => device;
  String get _ipAddress => ipAddress;
  String get _macAddress => macAddress;

  /// It returns a string representation of the object
  ///
  /// Returns:
  ///   A string representation of the object.
  @override
  String toString() {
    return 'CompleteUserDetailsModel{name: $name, gender: $gender, race: $race, religion: $religion, birthDay: $birthDay, zodiacSign: $zodiacSign, email: $email, streetAddress: $streetAddress, city: $city, state: $state, country: $country, postalCode: $postalCode, phoneNumber: $phoneNumber, ssn: $ssn, height: $height, weight: $weight, hairColor: $hairColor, eyeColor: $eyeColor, bloodType: $bloodType, civilStatus: $civilStatus, educationalBackground: $educationalBackground, diseaseHistory: $diseaseHistory, employmentStatus: $employmentStatus, monthlySalary: $monthlySalary, occupation: $occupation, vehicle: $vehicle, hobbies: $hobbies, favoriteColor: $favoriteColor, favoriteFood: $favoriteFood, favoriteMusic: $favoriteMusic, favoriteMovie: $favoriteMovie, favoriteBook: $favoriteBook, favoriteSports: $favoriteSports, favoriteGenre: $favoriteGenre, creditCardNumber: $creditCardNumber, creditCardType: $creditCardType, creditCardExpirationDate: $creditCardExpirationDate, creditCardCVV: $creditCardCVV, username: $username, password: $password, website: $website, device: $device, ipAddress: $ipAddress, macAddress: $macAddress}';
  }
}

/// It generates a random user details.
class CompleteUserDetailsGen {
  static CompleteUserDetailsModel generate() {
    return CompleteUserDetailsModel(
      name: RndX.generateName().toString(),
      gender: RndX.randomSex().toString(),
      race: RndX.randomRace().toString(),
      religion: RndX.randomReligion().toString(),
      birthDay: RndX.randomBirthday().toString(),
      zodiacSign: RndX.randomZodiacSign().toString(),
      email: RndX.generateEmail().toString(),
      streetAddress: RndX.generateRandomStreetAddress().toString(),
      city: RndX.generateRandomCity().toString(),
      state: RndX.generateRandomState().toString(),
      country: 'United States',
      postalCode: RndX.randomPostalCode().toString(),
      phoneNumber: RndX.generatePhoneNumber().toString(),
      ssn: RndX.randomSSN(withdashes: true).toString(),
      height: RndX.randomHeight().toString(),
      weight: RndX.randomWeight().toString(),
      hairColor: RndX.randomHairColor().toString(),
      eyeColor: RndX.randomEyeColor().toString(),
      bloodType: RndX.randomBloodGroup().toString(),
      civilStatus: RndX.randomCivilStatus().toString(),
      educationalBackground: RndX.randomEducationalBackground().toString(),
      diseaseHistory: RndX.randomDiseaseHistory().toString(),
      employmentStatus: RndX.randomEmploymentStatus().toString(),
      monthlySalary: RndX.randomSalary().toString(),
      occupation: RndX.randomOccupation().toString(),
      vehicle: RndX.randoVehicle().toString(),
      hobbies: RndX.randomHobbies().toString(),
      favoriteColor: RndX.randomFavoriteColor().toString(),
      favoriteFood: RndX.randomFavoriteFood().toString(),
      favoriteMusic: RndX.randomFavoriteMusic().toString(),
      favoriteMovie: RndX.randomFavoriteMovie().toString(),
      favoriteBook: RndX.randomFavoriteBook().toString(),
      favoriteSports: RndX.randomFavoriteSports().toString(),
      favoriteGenre: RndX.randomFavoriteGenre().toString(),
      creditCardNumber: RndX.randomFullCreditCard().ccn,
      creditCardType: RndX.randomFullCreditCard().cardType,
      creditCardExpirationDate: RndX.randomFullCreditCard().expiryDate,
      creditCardCVV: RndX.randomFullCreditCard().cvv,
      username: RndX.generateUsername().toString(),
      password: RndX.generatePassword().toString(),
      website: RndX.randomWebsite().toString(),
      ipAddress: RndX.generateRandomIPV6().toString(),
      macAddress: RndX.generateRandomMAC().toString(),
      device: RndX.randomDeviceDetail().toString(),
    );
  }
}
