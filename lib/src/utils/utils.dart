import 'dart:math' as math;

class Utils {
  static int generateListLength() {
    math.Random random = math.Random();
    return random.nextInt(900);
  }

  static int generateImageId() {
    math.Random random = math.Random();
    return random.nextInt(900);
  }
}
