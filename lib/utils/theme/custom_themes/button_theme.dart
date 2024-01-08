import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class ButtonStyles {
  static ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      elevation: 10,
      backgroundColor: TColors.white,
      padding: const EdgeInsets.symmetric(vertical: TSizes.iconXs),
      side: const BorderSide(
        color: TColors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.defaultSpace),
      ),
    );
  }
}
