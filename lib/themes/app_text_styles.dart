import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Light Tema için Text Sytle
  static final TextStyle displayLargeLight = GoogleFonts.robotoFlex(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54);
  static final TextStyle displayMediumLight = GoogleFonts.robotoFlex(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54);
  static final TextStyle bodyMediumLight = GoogleFonts.robotoFlex(
      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black54);

  // Dark Tema için Text Style
  static final TextStyle displayLargeDark = GoogleFonts.robotoFlex(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
  static final TextStyle displayMediumDark = GoogleFonts.robotoFlex(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  static final TextStyle bodyMediumLDark = GoogleFonts.robotoFlex(
      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white);
}
