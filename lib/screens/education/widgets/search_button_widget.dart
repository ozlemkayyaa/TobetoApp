import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({
    super.key,
    required this.buttonName,
    required this.icon,
  });

  final String buttonName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(TSizes.xs),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
              left: TSizes.sm,
              right: TSizes.sm,
              top: TSizes.xs,
              bottom: TSizes.xs),
          child: Form(
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: dark ? TColors.darkGrey : TColors.grey,
                  suffixIcon: const Icon(CupertinoIcons.search),
                  suffixIconColor: TColors.darkerGrey,
                  labelText: "Arama",
                  labelStyle: const TextStyle(color: TColors.black)),
            ),
          ),
        ),
      ),
    );
  }
}
