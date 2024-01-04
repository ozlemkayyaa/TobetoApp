import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/theme/custom_themes/text_theme.dart';

class TBottomNavigationTheme {
  TBottomNavigationTheme._();

  // Light Tema
  static final lightBottomNavigationTheme = BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: TColors.primary,
    unselectedItemColor: TColors.darkGrey,
    elevation: 0,
    selectedLabelStyle: TTextTheme.lightTextTheme.labelLarge,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  );

  // Dark Tema

  static final darkBottomNavigationTheme = BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: TColors.primary,
    unselectedItemColor: TColors.darkGrey,
    elevation: 0,
    selectedLabelStyle: TTextTheme.lightTextTheme.labelMedium,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  );
}
