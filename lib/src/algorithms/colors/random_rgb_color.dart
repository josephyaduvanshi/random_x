import 'dart:math';
import 'dart:ui';

class RandomRGBColor {
  static Color generate() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}

// void main(List<String> args) {
//   print(RandomRGBColor.generate());
// }
