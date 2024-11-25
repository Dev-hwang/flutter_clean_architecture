import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get light => base(
        brightness: Brightness.light,
      );

  static ThemeData get dark => base(
        brightness: Brightness.dark,
      );

  static ThemeData base({
    required Brightness brightness,
  }) {
    return ThemeData(
      brightness: brightness,
      fontFamily: 'NotoSansKR',
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
