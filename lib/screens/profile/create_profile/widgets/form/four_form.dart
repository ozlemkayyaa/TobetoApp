import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class FourForm extends StatelessWidget {
  const FourForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: Column(
        children: [
          // Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.old,
              prefixIcon: Icon(Iconsax.lock),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.newPassword,
              prefixIcon: Icon(Iconsax.lock),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Password Again
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.newAgain,
              prefixIcon: Icon(Iconsax.lock),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),

          const SizedBox(height: TSizes.defaultSpace),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: const Text(TTexts.changePassword)),
          ),
          const SizedBox(height: TSizes.defaultSpace),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.error,
                  side: const BorderSide(color: TColors.error)),
              onPressed: () {},
              child: const Text(TTexts.end),
            ),
          ),
        ],
      ),
    ));
  }
}
