import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class ButtonStyles {
  static ButtonStyle customButtonStyle(bool dark, BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: dark ? TColors.darkGrey : TColors.grey,
      padding: const EdgeInsets.symmetric(vertical: TSizes.iconXs),
      side: BorderSide(color: dark ? TColors.darkGrey : TColors.grey),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.defaultSpace),
      ),
    );
  }
}
