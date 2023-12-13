import 'package:flutter/material.dart';

class AppTheme {
  // Light Tema
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: Colors.white,
        primary: Color.fromARGB(240, 153, 51, 255),
        secondary: Colors.black,
      ));

  // Dark Tema
  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        background: Colors.black,
        primary: Color.fromARGB(240, 153, 51, 255),
        secondary: Colors.white,
      ));
}
