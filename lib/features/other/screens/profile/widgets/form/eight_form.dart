import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class EightForm extends StatelessWidget {
  const EightForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        // Password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: TTexts.signPassword,
            prefixIcon: Icon(Iconsax.lock),
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: TTexts.signPassword,
            prefixIcon: Icon(Iconsax.lock),
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        // Password Again
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: TTexts.signPasswordAgain,
            prefixIcon: Icon(Iconsax.lock),
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        const SizedBox(height: TSizes.defaultSpace),
        SizedBox(
          width: 300,
          child: ElevatedButton(
              onPressed: () {}, child: const Text(TTexts.submit)),
        ),
        const SizedBox(height: TSizes.defaultSpace),
        SizedBox(
          width: 300,
          child: ElevatedButton(
              onPressed: () {}, child: const Text(TTexts.submit)),
        ),
      ],
    ));
  }
}
