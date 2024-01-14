import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class ButtonStyles {
  static ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      elevation: 5,
      backgroundColor: const Color.fromARGB(255, 188, 185, 185),
      padding: const EdgeInsets.symmetric(vertical: TSizes.iconXs),
      side: const BorderSide(
        color: Color.fromARGB(255, 188, 185, 185),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.defaultSpace),
      ),
    );
  }
}
