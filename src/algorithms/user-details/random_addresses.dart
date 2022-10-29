// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:math';

import '../../database/dictionary.dart';

/// It converts a JSON string into a RandomAddressModel object.
///
/// Args:
///   str (String): The JSON string to be converted to a RandomAddressModel object.
RandomAddressModel randomAddressModelFromMap(String str) =>
    RandomAddressModel.fromMap(json.decode(str));

/// It takes a RandomAddressModel object and returns a JSON string
///
/// Args:
///   data (RandomAddressModel): The data to be converted to JSON.

String randomAddressModelToMap(RandomAddressModel data) =>
    json.encode(data.toMap());

/// A Dart class that is used to parse the JSON response from the API.
class RandomAddressModel {
  RandomAddressModel({
    this.addresses,
  });

  final addresses;

  factory RandomAddressModel.fromMap(Map<String, dynamic> json) =>
      RandomAddressModel(
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "addresses": List<dynamic>.from(addresses.map((x) => x.toMap())),
      };
}

/// `Address` is a class that has a constructor that takes in a map of strings to dynamic values, and
/// has a factory constructor that takes in a map of strings to dynamic values and returns an `Address`
/// object
class Address {
  Address({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postalCode,
    required this.coordinates,
  });

  final address1;
  final address2;
  final city;
  final state;
  final postalCode;
  final Coordinates coordinates;

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postalCode"],
        coordinates: Coordinates.fromMap(json["coordinates"]),
      );

  Map<String, dynamic> toMap() => {
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "postalCode": postalCode,
        "coordinates": coordinates.toMap(),
      };
}

/// `Coordinates` is a class that has two properties: `lat` and `lng`
class Coordinates {
  Coordinates({
    this.lat,
    this.lng,
  });

  final lat;
  final lng;

  factory Coordinates.fromMap(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
      };
}

class RandomAddresses {
  /// Converting the JSON string into a RandomAddressModel object.
  final randomAddressModel =
      randomAddressModelFromMap(DictionaryDatabase.ADDRESSES);

  /// A getter that returns the list of addresses from the RandomAddressModel object.
  List<Address> get addresses => randomAddressModel.addresses;

  /// It returns a random address from the list of addresses.
  ///
  /// Args:
  ///   count (int): The number of addresses you want to generate. Defaults to 1
  ///   uniqueList (bool): If true, the list will not contain duplicates. Defaults to true
  ///
  /// Returns:
  ///   A list of addresses
  getRandomAddress({
    int count = 1,
    bool uniqueList = true,
  }) {
    if (count < 1) {
      throw Exception('Count must be greater than 0');
    }
    List<Address> addresses = <Address>[];
    for (int i = 0; i < count; i++) {
      addresses.add(randomAddressModel
          .addresses[Random().nextInt(randomAddressModel.addresses.length)]);
    }
    if (uniqueList) {
      addresses = addresses.toSet().toList();
    }

    if (count == 1) {
      return addresses[0];
    }

    return addresses;
  }

  /// `generateRandomPostalCode()` returns a random postal code from the list of addresses in the
  /// `randomAddressModel` object
  ///
  /// Returns:
  ///   A random postal code from the list of addresses.
  Address generateRandomPostalCode() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)]
        .postalCode;
  }

  /// `generateRandomCity()` returns a random city from the list of addresses in the `randomAddressModel`
  /// object
  ///
  /// Returns:
  ///   A random city from the list of addresses.
  Address generateRandomCity() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)].city;
  }

  /// It returns a random state from the list of addresses
  ///
  /// Returns:
  ///   A random state from the list of addresses.
  Address generateRandomState() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)].state;
  }

  /// *It returns a random address from the list of addresses in the RandomAddressModel class.*
  ///
  /// Returns:
  ///   A random address from the list of addresses.
  Address generateRandomAddress1() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)]
        .address1;
  }

  /// It generates a random address2 from the list of addresses in the randomAddressModel.
  ///
  /// Returns:
  ///   A random address2 from the list of addresses.
  Address generateRandomAddress2() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)]
        .address2;
  }

  /// *It returns a random latitude from the list of addresses in the RandomAddressModel class.*
  ///
  /// Returns:
  ///   A random latitude from the list of addresses.
  Address generateRandomLatitude() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)]
        .coordinates
        .lat;
  }

  /// It generates a random longitude.
  ///
  /// Returns:
  ///   A double
  Address generateRandomLongitude() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)]
        .coordinates
        .lng;
  }

  /// It returns a list of random addresses with the given postal code
  ///
  /// Args:
  ///   postalCode (String): The postal code of the address you want to get.
  ///   count (int): The number of addresses you want to generate. Defaults to 1
  ///
  /// Returns:
  ///   A list of addresses.
  List<Address> getRandomAddressByPostalCode(
      {required String postalCode, int count = 1}) {
    if (count < 1) {
      throw Exception('Count must be greater than 0');
    }
    final List<Address> addresses = <Address>[];
    for (final Address address in randomAddressModel.addresses) {
      if (address.postalCode == postalCode) {
        addresses.add(address);
      }
    }
    if (addresses.isEmpty) {
      throw Exception('No address found with postal code $postalCode');
    }
    if (count == 1) {
      return <Address>[addresses[Random().nextInt(addresses.length)]];
    }
    return addresses;
  }

  /// It returns a list of random addresses with the specified city
  ///
  /// Args:
  ///   city (String): The city to search for.
  ///   count (int): The number of addresses you want to get. Defaults to 1
  ///
  /// Returns:
  ///   A list of addresses
  List<Address> getRandomAddressByCity({required String city, int count = 1}) {
    if (count < 1) {
      throw Exception('Count must be greater than 0');
    }
    final List<Address> addresses = <Address>[];
    for (final Address address in randomAddressModel.addresses) {
      if (address.city == city) {
        addresses.add(address);
      }
    }
    if (addresses.isEmpty) {
      throw Exception('No address found with city $city');
    }
    if (count == 1) {
      return <Address>[addresses[Random().nextInt(addresses.length)]];
    }
    return addresses;
  }

  /// It returns a list of random addresses with the specified state
  ///
  /// Args:
  ///   state (String): The state you want to get addresses from.
  ///   count (int): The number of addresses you want to get. Defaults to 1
  ///
  /// Returns:
  ///   A list of addresses
  List<Address> getRandomAddressByState(
      {required String state, int count = 1}) {
    if (count < 1) {
      throw Exception('Count must be greater than 0');
    }
    final List<Address> addresses = <Address>[];
    for (final Address address in randomAddressModel.addresses) {
      if (address.state == state) {
        addresses.add(address);
      }
    }
    if (addresses.isEmpty) {
      throw Exception('No address found with state $state');
    }
    if (count == 1) {
      return <Address>[addresses[Random().nextInt(addresses.length)]];
    }
    return addresses;
  }

  /// Return a list of random addresses with the given address1.
  ///
  /// Args:
  ///   address1 (String): The street address of the address you want to get.
  ///   count (int): The number of addresses to return. Defaults to 1
  ///
  /// Returns:
  ///   A list of addresses
  List<Address> getRandomAddressByStreetAddress(
      {required String address1, int count = 1}) {
    if (count < 1) {
      throw Exception('Count must be greater than 0');
    }
    final List<Address> addresses = <Address>[];
    for (final Address address in randomAddressModel.addresses) {
      if (address.address1 == address1) {
        addresses.add(address);
      }
    }
    if (addresses.isEmpty) {
      throw Exception('No address found with address1 $address1');
    }
    if (count == 1) {
      return <Address>[addresses[Random().nextInt(addresses.length)]];
    }
    return addresses;
  }
}
