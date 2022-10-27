// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:math';

import '../../database/dictionary.dart';
import '../../rndx.dart';

RandomAddressModel randomAddressModelFromMap(String str) =>
    RandomAddressModel.fromMap(json.decode(str));

String randomAddressModelToMap(RandomAddressModel data) =>
    json.encode(data.toMap());

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
  final randomAddressModel = randomAddressModelFromMap(ADDRESSES);

  List<Address> get addresses => randomAddressModel.addresses;

  getRandomAddress({
    int count = 1,
    bool uniqueList = true,
  }) {
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

  Address generateRandomPostalCode() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)]
        .postalCode;
  }

  Address generateRandomCity() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)].city;
  }

  Address generateRandomState() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)].state;
  }

  Address generateRandomAddress1() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)]
        .address1;
  }

  Address generateRandomAddress2() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)]
        .address2;
  }

  Address generateRandomLatitude() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)]
        .coordinates
        .lat;
  }

  Address generateRandomLongitude() {
    return randomAddressModel
        .addresses[Random().nextInt(randomAddressModel.addresses.length)]
        .coordinates
        .lng;
  }

  List<Address> getRandomAddressByPostalCode(
      {required String postalCode, int count = 1}) {
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

  List<Address> getRandomAddressByCity({required String city, int count = 1}) {
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

  List<Address> getRandomAddressByState(
      {required String state, int count = 1}) {
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

  List<Address> getRandomAddressByStreetAddress(
      {required String address1, int count = 1}) {
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

