import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';
import 'package:tobeto/utils/theme/custom_themes/button_theme.dart';

class AZButtonWidget extends StatelessWidget {
  const AZButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(TSizes.xs),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyles.customButtonStyle(dark, context),
          child: Text(
            TTexts.az,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: dark ? TColors.white : TColors.black),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
