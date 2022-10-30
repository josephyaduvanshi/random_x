import 'dart:math';

import '../../database/dictionary.dart';
import '../../../random_x.dart';

class RandomUA {
  /// It returns a random user agent from the list of user agents.
  ///
  /// Args:
  ///   count (int): The number of user agents you want to get. Defaults to 1
  ///
  /// Returns:
  ///   A list of user agents.
  static getRandomMacUA({int count = 1}) {
    Random random = Random();
    List<String> uaList = DictionaryDatabase.userAgentMac;
    uaList.shuffle(random);
    if (count == 1) {
      return uaList[0];
    }
    if (count > uaList.length) {
      count = uaList.length;
    }
    if (count < 1) {
      throw Exception('count must be greater than 0');
    }
    return uaList.sublist(0, count);
  }

  /// It returns a random user agent from the list of user agents.
  ///
  /// Args:
  ///   count (int): The number of random user agents you want to get. Defaults to 1
  ///
  /// Returns:
  ///   A list of user agent strings.
  static getRandomMobileUa({int count = 1}) {
    List<String> uaLists = DictionaryDatabase.userAgentMobile;
    Random random = Random();
    uaLists.shuffle(random);
    if (count == 1) {
      return uaLists[0];
    }
    if (count > uaLists.length) {
      count = uaLists.length;
    }
    if (count < 1) {
      throw Exception('count must be greater than 0');
    }
    return uaLists.sublist(0, count);
  }

  /// It returns a random user agent string from the list of user agent strings.
  ///
  /// Args:
  ///   count (int): The number of user agents you want to get. Defaults to 1
  ///
  /// Returns:
  ///   A list of user agent strings.
  static getRandomTabletUa({int count = 1}) {
    List<String> uaLists = DictionaryDatabase.userAgentTablet;
    Random random = Random();
    uaLists.shuffle(random);
    if (count == 1) {
      return uaLists[0];
    }
    if (count > uaLists.length) {
      count = uaLists.length;
    }
    if (count < 1) {
      throw Exception('count must be greater than 0');
    }
    return uaLists.sublist(0, count);
  }

  /// It returns a random user agent from the list of user agents.
  ///
  /// Args:
  ///   count (int): The number of user agents you want to get. Defaults to 1
  ///
  /// Returns:
  ///   A list of user agents.
  static getRandomWEBUA({int count = 1}) {
    List<String> uaLists = DictionaryDatabase.userAgentWeb;
    Random random = Random();
    uaLists.shuffle(random);
    if (count == 1) {
      return uaLists[0];
    }
    if (count > uaLists.length) {
      count = uaLists.length;
    }
    if (count < 1) {
      throw Exception('count must be greater than 0');
    }
    return uaLists.sublist(0, count);
  }

  /// It generates a random user agent string.
  ///
  /// Args:
  ///   count (int): The number of random user agents you want to generate. Defaults to 1
  ///
  /// Returns:
  ///   A list of strings.
  static genRandomUAAny({int count = 1}) {
    List<String> randomUa = DictionaryDatabase.userAgentMac +
        DictionaryDatabase.userAgentMobile +
        DictionaryDatabase.userAgentTablet +
        DictionaryDatabase.userAgentTablet;
    Random random = Random();
    randomUa.shuffle(random);
    if (count == 1) {
      return randomUa[0];
    }
    if (count > randomUa.length) {
      count = randomUa.length;
    }
    if (count < 1) {
      throw Exception('count must be greater than 0');
    }
    return randomUa.sublist(0, count);
  }

  /// It returns a random user agent string.
  ///
  /// Args:
  ///   count (int): The number of user agents you want to generate. Defaults to 1
  ///   type (UserAgentType): The type of user agent you want to generate. Defaults to UserAgentType
  ///
  /// Returns:
  ///   A random user agent string.
  static getRandomUA({int count = 1, UserAgentType type = UserAgentType.none}) {
    if (type == UserAgentType.none) {
      return genRandomUAAny(count: count);
    } else if (type == UserAgentType.web) {
      return getRandomWEBUA(count: count);
    } else if (type == UserAgentType.mobile) {
      return getRandomMobileUa(count: count);
    } else if (type == UserAgentType.tablet) {
      return getRandomTabletUa(count: count);
    } else if (type == UserAgentType.macOs) {
      return getRandomMacUA(count: count);
    }
  }
}
