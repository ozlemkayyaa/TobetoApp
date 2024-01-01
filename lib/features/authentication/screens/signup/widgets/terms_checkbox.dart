import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
            height: 24,
            width: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(width: TSizes.sm),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: TTexts.privacy,
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                    ),
              ),
              TextSpan(
                  text: '${TTexts.andSign} ',
                  style: Theme.of(context).textTheme.labelMedium),
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                    ),
              ),
              TextSpan(
                  text: '${TTexts.agree} ',
                  style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ),
      ],
    );
  }
}
