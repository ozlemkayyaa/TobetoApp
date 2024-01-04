import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class TAppBarTheme {
  TAppBarTheme._();

  // Light Theme
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: TColors.primary,
    surfaceTintColor: TColors.primary,
    iconTheme: IconThemeData(color: TColors.grey, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: TColors.grey, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: TColors.black),
  );

  // Dark Theme
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: TColors.grey, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: TColors.grey, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: TColors.white),
  );
}
