import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
      );

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
      );
}
