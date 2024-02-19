import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                  image: const AssetImage(TImages.email),
                  width: THelperFunctions.screenWidth(context)),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Headings
              Text(TTexts.passwordResetTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.passwordResetText,
                style: Theme.of(context).textTheme.bodySmall,
                //textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Text Fields
              TextFormField(
                decoration: const InputDecoration(
                  labelText: TTexts.signEmail,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    THelperFunctions.showAlert(
                        TTexts.passwordResetTitle, TTexts.resetEmail, context);
                  },
                  child: const Text(TTexts.sendButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
