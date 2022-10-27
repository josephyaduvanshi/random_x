import 'dart:math';

Random random = Random();
String generateHex() {
  String hexColor = '#';
  for (int j = 0; j < 6; j++) {
    hexColor += random.nextInt(16).toRadixString(16);
  }
  return hexColor;
}



generateRandomHexColorCode_({
  int count = 1,
  bool uniqueList = true,
}) {
  List<String> colors = [];
  for (int i = 0; i < count; i++) {
    colors.add(generateHex());
  }
  if (uniqueList) {
    colors = colors.toSet().toList();
  }
  if (count == 1) {
    return colors[0];
  }
  return colors;
}

hexStringToInt() {
  return int.parse(generateHex().substring(1), radix: 16);
}
