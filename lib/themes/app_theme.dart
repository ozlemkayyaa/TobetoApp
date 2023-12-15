import 'package:flutter/material.dart';
import 'package:tobeto/themes/app_colors.dart';
import 'package:tobeto/themes/app_text_styles.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: AppColors.backgroundColorLight,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLargeLight,
      displayMedium: AppTextStyles.displayMediumLight,
      bodyMedium: AppTextStyles.bodyMediumLight,
    ),
    // Diğer tema özellikleri buraya eklenebilir.
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: AppColors.backgroundColorDark,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLargeDark,
      displayMedium: AppTextStyles.displayMediumDark,
      bodyMedium: AppTextStyles.bodyMediumLDark,
    ),
    // Diğer tema özellikleri buraya eklenebilir.
  );
}
