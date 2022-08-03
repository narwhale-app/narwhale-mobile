import 'dart:math';
import 'dart:ui';
import 'dart:io' show Platform;

enum PlatformType {
  web,
  android,
  ios,
  unknown
}

class Utils {
  static final random = Random.secure();

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static List<int> shuffleSecure(List<int> items) {
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    return items;
  }

  static int getTime() {
    return (DateTime
        .now()
        .millisecondsSinceEpoch / 1000).round();
  }

  static int getTimeMs() {
    return DateTime
        .now()
        .millisecondsSinceEpoch;
  }

  static List<String> splitStringByChunk(String str, int chunkSize) {
    List<String> data = [];
    for (int i = 0; i < str.length; i+= chunkSize) {
      int maxSize = i + chunkSize;
      if (maxSize >= str.length) {
        maxSize = str.length;
      }
      data.add(str.substring(i, maxSize));
    }
    return data;
  }

  static PlatformType? _platformType;
  static PlatformType getPlatformType() {
    if (_platformType != null) {
      return _platformType!;
    }
    try {
      if (Platform.isIOS) {
        return PlatformType.ios;
      }
      if (Platform.isAndroid) {
        return PlatformType.android;
      }
    }
    catch (e) {
      return PlatformType.web;
    }
    return PlatformType.unknown;
  }

  static String getPlatformName() {
    PlatformType type = getPlatformType();
    if (type == PlatformType.ios) {
      return 'ios';
    }
    if (type == PlatformType.android) {
      return 'android';
    }
    if (type == PlatformType.web) {
      return 'web';
    }
    return 'unknown';
  }

  static isIOS() {
    return (getPlatformType() == PlatformType.ios);
  }

  static isWeb() {
    return (getPlatformType() == PlatformType.web);
  }

  static String getRandomString(int len) {
    String text = '';
    const String possible = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

    for (int i = 0; i < len; i++) {
      int idx = (Random.secure().nextDouble() * possible.length).floor();
      text += possible [idx];
    }
    return text;
  }

  static String formatBTC(double val) {
    double x = val / 100000000;
    return x.toString() + '\u{00A0}BTC';
  }
}