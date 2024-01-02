import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';

class TDrawerTheme {
  TDrawerTheme._();

  static const lightDrawerTheme = DrawerThemeData(
    backgroundColor: TColors.white,
    elevation: 0,
  );

  static const darkDrawerTheme = DrawerThemeData(
    backgroundColor: TColors.black,
    elevation: 0,
  );
}
