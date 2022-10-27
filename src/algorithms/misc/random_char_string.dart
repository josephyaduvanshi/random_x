import 'dart:math';

class RandomCharString {
  static final RandomCharString _singleton = RandomCharString._internal();
  RandomCharString._internal();
  factory RandomCharString() {
    return _singleton;
  }

  String randString(String type, int length) {
    if (length <= 0) {
      throw Exception("Invalid length in RandString($type, $length)");
    }
    if (type == "uppercase") {
      String response = "";
      for (int i = 0; i < length; i++) {
        int code = Random().nextInt(90 - 65) + 65;
        response += String.fromCharCode(code);
      }
      return response;
    } else if (type == "lowercase") {
      String response = "";
      for (int i = 0; i < length; i++) {
        int code = Random().nextInt(122 - 97) + 97;
        response += String.fromCharCode(code);
      }
      return response;
    } else if (type == "upperlower") {
      String response = "";
      int code = 0;
      for (int i = 0; i < length; i++) {
        int choice = Random().nextInt(1);
        if (choice == 0) {
          code = Random().nextInt(90 - 65) + 65;
        } else {
          code = Random().nextInt(122 - 97) + 97;
        }
        response += String.fromCharCode(code);
      }
      return response;
    } else if (type == "alphanumerical") {
      String response = "";
      int code = 0;
      for (int i = 0; i < length; i++) {
        int choice = Random().nextInt(2);
        if (choice == 0) {
          code = Random().nextInt(90 - 65) + 65;
        } else if (choice == 1) {
          code = Random().nextInt(122 - 97) + 97;
        } else {
          code = Random().nextInt(57 - 48) + 48;
        }
        response += String.fromCharCode(code);
      }
      return response;
    } else if (type == "ascii") {
      String response = "";
      for (int i = 0; i < length; i++) {
        int code = Random().nextInt(126 - 33) + 33;
        response += String.fromCharCode(code);
      }
      return response;
    } else {
      throw Exception("Invalid type in RandString($type, $length)");
    }
  }

  String randStringFromList_({required List list, required int length}) {
    if (length <= 0) {
      throw Exception("Invalid length in RandStringFromList($list, $length)");
    }
    String response = "";
    for (int i = 0; i < length; i++) {
      response += list[Random().nextInt(list.length)];
    }
    return response;
  }

  String randStringFromListWithSeparator_(
      {required List list, required int length, required String separator}) {
    if (length <= 0) {
      throw Exception(
          "Invalid length in RandStringFromListWithSeparator($list, $length, $separator)");
    }
    String response = "";
    for (int i = 0; i < length; i++) {
      response += list[Random().nextInt(list.length)];
      if (i != length - 1) {
        response += separator;
      }
    }
    return response;
  }

  String randStringFromListWithSeparatorAndRepeat_(
      {required List list, required int length, required String separator}) {
    if (length <= 0) {
      throw Exception(
          "Invalid length in RandStringFromListWithSeparatorAndRepeat($list, $length, $separator)");
    }
    String response = "";
    for (int i = 0; i < length; i++) {
      response += list[Random().nextInt(list.length)];
      if (i != length - 1) {
        response += separator;
      }
    }
    return response;
  }

  String randomiseString_({
    required String string,
    int? length,
  }) {
    length ??= string.length;
    if (length <= 0) {
      throw Exception("Invalid length in randomiseString($string, $length)");
    }
    String randomisedText = "";
    List<String> list = string.split("");
    for (int i = 0; i < length; i++) {
      randomisedText += list.removeAt(Random().nextInt(list.length));
    }
    return randomisedText;
  }

  randomiseList_({
    required List list,
    int? length,
  }) {
    length ??= list.length;
    if (length <= 0) {
      throw Exception("Invalid length in randomiseList($list, $length)");
    }
    List randomisedList = [];
    for (int i = 0; i < length; i++) {
      randomisedList.add(list.removeAt(Random().nextInt(list.length)));
    }
    return randomisedList;
  }
}
