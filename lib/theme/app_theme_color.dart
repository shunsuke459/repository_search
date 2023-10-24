import 'dart:ui';

enum AppThemeColor {
  black,
  white,
  red,
  text,
  primaryMain,
}

extension AppThemeColorExtension on AppThemeColor {
  Color get color {
    switch (this) {
      case AppThemeColor.black:
        return const Color(0xFF000000);
      case AppThemeColor.white:
        return const Color(0xFFFFFFFF);
      case AppThemeColor.red:
        return const Color(0xFFDA430D);
      case AppThemeColor.text:
        return const Color(0xFF333333);
      case AppThemeColor.primaryMain:
        return const Color(0xFFAC9C6D);
    }
  }
}
