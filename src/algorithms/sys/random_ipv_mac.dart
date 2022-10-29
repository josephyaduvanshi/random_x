import 'dart:math';

/// Generates a random IPV4 address.
///
/// Returns:
///   A random IPV4 address.
String generateRandomIPV4_() {
  const ipv4Length = 10;
  final ipUnitValue = [];
  int count = 0;
  while (count < ipv4Length) {
    ipUnitValue.add(Random().nextInt(9));
    count++;
  }
  String generatedAddress =
      '${ipUnitValue[0]}${ipUnitValue[1]}${ipUnitValue[2]}.${ipUnitValue[3]}${ipUnitValue[4]}${ipUnitValue[5]}.${ipUnitValue[6]}.${ipUnitValue[7]}${ipUnitValue[8]}${ipUnitValue[9]}';
  return generatedAddress;
}

/// Generates a random IPv6 address.
///
/// Returns:
///   A randomly generated IPv6 address.
String generateRandomIPV6_() {
  int ipv6Length = pow(16, 4).toInt();
  final ipUnitValue = [];
  int count = 0;
  while (count < ipv6Length) {
    ipUnitValue.add(Random().nextInt(16).toRadixString(16));
    count++;
  }
  String generatedAddress =
      '${ipUnitValue[0]}${ipUnitValue[1]}${ipUnitValue[2]}${ipUnitValue[3]}:${ipUnitValue[4]}${ipUnitValue[5]}${ipUnitValue[6]}${ipUnitValue[7]}:${ipUnitValue[8]}${ipUnitValue[9]}${ipUnitValue[10]}${ipUnitValue[11]}:${ipUnitValue[12]}${ipUnitValue[13]}${ipUnitValue[14]}${ipUnitValue[15]}:${ipUnitValue[16]}${ipUnitValue[17]}${ipUnitValue[18]}${ipUnitValue[19]}:${ipUnitValue[20]}${ipUnitValue[21]}${ipUnitValue[22]}${ipUnitValue[23]}:${ipUnitValue[24]}${ipUnitValue[25]}${ipUnitValue[26]}${ipUnitValue[27]}:${ipUnitValue[28]}${ipUnitValue[29]}${ipUnitValue[30]}${ipUnitValue[31]}';
  return generatedAddress;
}

/// Generates a random MAC address.
///
/// Returns:
///   A randomly generated MAC address.
String generateRandomMAC_() {
  int macLength = pow(16, 2).toInt();
  final macUnitValue = [];
  int count = 0;
  while (count < macLength) {
    macUnitValue.add(Random().nextInt(16).toRadixString(16));
    count++;
  }
  String generatedAddress =
      '${macUnitValue[0]}${macUnitValue[1]}:${macUnitValue[2]}${macUnitValue[3]}:${macUnitValue[4]}${macUnitValue[5]}:${macUnitValue[6]}${macUnitValue[7]}:${macUnitValue[8]}${macUnitValue[9]}:${macUnitValue[10]}${macUnitValue[11]}';
  return generatedAddress;
}
