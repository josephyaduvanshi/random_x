import 'dart:math';

import '../../random_x.dart';

class RandomCreditCards {
  /// A private variable.
  final String _creditCardNumber;
  final String _cvv;
  final String _expiryDate;
  final String _cardType;

  /// A constructor.
  RandomCreditCards(
      this._creditCardNumber, this._cvv, this._expiryDate, this._cardType);

  /// A getter.
  String get ccn => _creditCardNumber;

  String get cvv => _cvv;

  String get expiryDate => _expiryDate;

  String get cardType => _cardType;

  /// The `toString()` function returns a string representation of the object
  ///
  /// Returns:
  ///   A string representation of the object.
  @override
  String toString() {
    return 'Card{_ccn: $_creditCardNumber, _cvv: $_cvv, _expiryDate: $_expiryDate, _cardType: $_cardType}';
  }

  /// It generates a random number of the specified size and returns it as a string
  ///
  /// Args:
  ///   size (int): The number of digits in the card number.
  ///
  /// Returns:
  ///   A string of numbers
  static String _generateCvv({required int size}) {
    String cvv = '';
    for (int i = 0; i < size; i++) {
      cvv += Random().nextInt(10).toString();
    }
    return cvv;
  }

  /// It generates a random expiry date for a credit card
  ///
  /// Returns:
  ///   A string with a random month and year.
  static String _generateExpiryDate() {
    int year = DateTime.now().year + Random().nextInt(6);
    int month = Random().nextInt(12) + 1;

    return '$month/$year';
  }
}

class CardGenerator {
  /// A list of card types.
  static const List<String> _cardTypes = [
    'American Express',
    'Diners Club',
    'Discover',
    'JCB',
    'MasterCard',
    'Visa'
  ];

  /// A map of card types and their prefixes.
  static const Map<String, List<String>> _cardPrefixes = {
    'American Express': ['34', '37'],
    'Diners Club': ['300', '301', '302', '303', '304', '305', '36'],
    'Discover': [
      '6011',
      '622126',
      '622127',
      '622128',
      '622129',
      '62213',
      '62214',
      '62215',
      '62216',
      '62217',
      '62218',
      '62219',
      '6222',
      '6223',
      '6224',
      '6225',
      '6226',
      '6227',
      '6228',
      '62290',
      '62291',
      '622920',
      '622921',
      '622922',
      '622923',
      '622924',
      '622925',
      '644',
      '645',
      '646',
      '647',
      '648',
      '649',
      '65'
    ],
    'JCB': ['3528', '3529', '353', '354', '355', '356', '357', '358'],
    'MasterCard': ['51', '52', '53', '54', '55'],
    'Visa': ['4']
  };

  /// A map of card types and their lengths.
  static const Map<String, int> _cardLengths = {
    'American Express': 15,
    'Diners Club': 14,
    'Discover': 16,
    'JCB': 16,
    'MasterCard': 16,
    'Visa': 16
  };

  /// A map of card types and their cvv lengths.
  static const Map<String, int> _cvvLengths = {
    'American Express': 4,
    'Diners Club': 3,
    'Discover': 3,
    'JCB': 3,
    'MasterCard': 3,
    'Visa': 3
  };

  /// If the card number starts with any of the prefixes for a given card type, return that card type
  ///
  /// Args:
  ///   cardNumber (String): The card number to identify.
  ///
  /// Returns:
  ///   A string that is the card type.
  static String identifyCardType(String cardNumber) {
    for (String cardType in _cardTypes) {
      for (String prefix in _cardPrefixes[cardType]!) {
        if (cardNumber.startsWith(prefix)) {
          return cardType;
        }
      }
    }
    return 'Unknown';
  }

  /// It generates a random credit card number, cvv, and expiry date based on the card type you pass in
  ///
  /// Args:
  ///   withCustomBin (bool): If you want to generate a card with a custom bin, set this to true. Defaults
  /// to false
  ///   customBin (String): This is the first 6 digits of the credit card number. Defaults to 52247
  ///   ccnType (CreditCardType): This is the type of credit card you want to generate. Defaults to
  /// CreditCardType
  ///
  /// Returns:
  ///   A RandomCreditCards object
  static RandomCreditCards generateFullCC({
    bool withCustomBin = false,
    String customBin = '52247',
    CreditCardType ccnType = CreditCardType.random,
  }) {
    String cardType = '';
    String ccn = '';
    String cvv = '';
    String expiryDate = '';
    if (withCustomBin) {
      ccn = _generateCardBasedOnBIn(bin: customBin);
      cvv = RandomCreditCards._generateCvv(size: _cvvLengths[ccn]!);
      expiryDate = RandomCreditCards._generateExpiryDate();
      cardType = identifyCardType(ccn);
      return RandomCreditCards(ccn, cvv, expiryDate, cardType);
    } else if (ccnType == CreditCardType.masterCard) {
      ccn = _generateRandomCreditCardNumber();
      if (identifyCardType(ccn) == 'MasterCard') {
        cvv = RandomCreditCards._generateCvv(
            size: _cvvLengths[identifyCardType(ccn)]!);
        expiryDate = RandomCreditCards._generateExpiryDate();
        cardType = identifyCardType(ccn);
        return RandomCreditCards(ccn, cvv, expiryDate, cardType);
      } else {
        return generateFullCC(ccnType: CreditCardType.masterCard);
      }
    } else if (ccnType == CreditCardType.visa) {
      ccn = _generateRandomCreditCardNumber();
      if (identifyCardType(ccn) == 'Visa') {
        cvv = RandomCreditCards._generateCvv(
            size: _cvvLengths[identifyCardType(identifyCardType(ccn))]!);
        expiryDate = RandomCreditCards._generateExpiryDate();
        cardType = identifyCardType(ccn);
        return RandomCreditCards(ccn, cvv, expiryDate, cardType);
      } else {
        return generateFullCC(ccnType: CreditCardType.visa);
      }
    } else if (ccnType == CreditCardType.americanExpress) {
      ccn = _generateRandomCreditCardNumber();
      if (identifyCardType(ccn) == 'American Express') {
        cvv = RandomCreditCards._generateCvv(
            size: _cvvLengths[identifyCardType(ccn)]!);
        expiryDate = RandomCreditCards._generateExpiryDate();
        cardType = identifyCardType(ccn);
        return RandomCreditCards(ccn, cvv, expiryDate, cardType);
      } else {
        return generateFullCC(ccnType: CreditCardType.americanExpress);
      }
    } else if (ccnType == CreditCardType.dinersClub) {
      ccn = _generateRandomCreditCardNumber();
      if (identifyCardType(ccn) == 'Diners Club') {
        cvv = RandomCreditCards._generateCvv(
            size: _cvvLengths[identifyCardType(ccn)]!);
        expiryDate = RandomCreditCards._generateExpiryDate();
        cardType = identifyCardType(ccn);
        return RandomCreditCards(ccn, cvv, expiryDate, cardType);
      } else {
        return generateFullCC(ccnType: CreditCardType.dinersClub);
      }
    } else if (ccnType == CreditCardType.discover) {
      ccn = _generateRandomCreditCardNumber();
      if (identifyCardType(ccn) == 'Discover') {
        cvv = RandomCreditCards._generateCvv(
            size: _cvvLengths[identifyCardType(ccn)]!);
        expiryDate = RandomCreditCards._generateExpiryDate();
        cardType = identifyCardType(ccn);
        return RandomCreditCards(ccn, cvv, expiryDate, cardType);
      }
    } else if (ccnType == CreditCardType.jCB) {
      ccn = _generateRandomCreditCardNumber();
      if (identifyCardType(ccn) == 'JCB') {
        cvv = RandomCreditCards._generateCvv(
            size: _cvvLengths[identifyCardType(ccn)]!);
        expiryDate = RandomCreditCards._generateExpiryDate();
        cardType = identifyCardType(ccn);
        return RandomCreditCards(ccn, cvv, expiryDate, cardType);
      } else {
        return generateFullCC(ccnType: CreditCardType.jCB);
      }
    } else if (ccnType == CreditCardType.random) {
      ccn = _generateRandomCreditCardNumber();
      cvv = RandomCreditCards._generateCvv(
          size: _cvvLengths[identifyCardType(ccn)]!);
      expiryDate = RandomCreditCards._generateExpiryDate();
      cardType = identifyCardType(ccn);
      return RandomCreditCards(ccn, cvv, expiryDate, cardType);
    }
    return RandomCreditCards(ccn, cvv, expiryDate, cardType);
  }

  /// It takes a bin number as a parameter, appends 11 random digits to it and returns the result
  ///
  /// Args:
  ///   bin (String): The first 6 digits of the card number. Defaults to 52247
  ///
  /// Returns:
  ///   A random card number based on the bin number.
  static _generateCardBasedOnBIn({String bin = "52247"}) {
    String cardNumber = bin;
    for (int i = 0; i < 11; i++) {
      cardNumber += Random().nextInt(10).toString();
    }
    return cardNumber;
  }

  /// It generates a list of credit cards.
  ///
  /// Args:
  ///   numberOfCards (int): The number of cards you want to generate. Defaults to 10
  ///   withCustomBin (bool): If you want to use a custom bin, set this to true. Defaults to false
  ///   customBin (String): This is the first 6 digits of the credit card number. Defaults to 52247
  ///   ccnType (CreditCardType): CreditCardType.random,. Defaults to CreditCardType
  ///
  /// Returns:
  ///   A list of RandomCreditCards objects.
  static List<RandomCreditCards> generateBulkFullCC({
    int numberOfCards = 10,
    bool withCustomBin = false,
    String customBin = '52247',
    CreditCardType ccnType = CreditCardType.random,
  }) {
    List<RandomCreditCards> cards = [];
    for (int i = 0; i < numberOfCards; i++) {
      cards.add(generateFullCC(
          withCustomBin: withCustomBin,
          customBin: customBin,
          ccnType: ccnType));
    }
    return cards;
  }

  /// Generates a random credit card number.
  /// Returns:
  ///   A random credit card number.
  static String _generateRandomCreditCardNumber() {
    String cardType = _cardTypes[Random().nextInt(_cardTypes.length)];
    String cardPrefix = _cardPrefixes[cardType]![
        Random().nextInt(_cardPrefixes[cardType]!.length)];
    int cardLength = _cardLengths[cardType]!;
    String cardNumber = cardPrefix;

    /// Generating the middle digits of the card number.
    for (int i = 0; i < cardLength - cardPrefix.length - 1; i++) {
      cardNumber += Random().nextInt(10).toString();
    }
    int sum = 0;

    /// Calculating the check digit for the card number.
    for (int i = 0; i < cardNumber.length; i++) {
      int digit = int.parse(cardNumber[i]);
      if (i % 2 == 0) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
    }
    int checkDigit = (10 - sum % 10) % 10;

    /// Appending the check digit to the card number.
    cardNumber += checkDigit.toString();
    return cardNumber;
  }
}
