import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Tema
  static final ThemeData lightTheme = ThemeData(
      textTheme: GoogleFonts.robotoFlexTextTheme(),
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: Colors.white,
        primary: Color.fromARGB(240, 153, 51, 255),
        secondary: Colors.black,
      ));

  // Dark Tema
  static final ThemeData darkTheme = ThemeData(
      textTheme: GoogleFonts.ralewayTextTheme(),
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        background: Colors.black,
        primary: Color.fromARGB(240, 153, 51, 255),
        secondary: Colors.white,
      ));
}
