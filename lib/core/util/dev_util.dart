import 'dart:math';

class DevUtil {
  static String generateRandomString() {
    var r = Random();
    var length = r.nextInt(8) + 4;
    return String.fromCharCodes(
      List.generate(length, (index) => r.nextInt(33) + 89),
    );
  }
}
