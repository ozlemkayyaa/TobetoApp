import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:tobeto/utils/theme/custom_themes/outlined_button_theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(Iconsax.direct_right, color: Colors.grey),
                labelText: TTexts.userEmail,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.lock, color: Colors.grey),
                labelText: TTexts.userPassword,
                suffixIcon: const Icon(Iconsax.eye_slash, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // Remember Me and Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememeberMe),
                  ],
                ),

                // Forgot Password
                TextButton(
                  onPressed: () {},
                  child: const Text(TTexts.passwordForgot),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Login Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: dark
                    ? TElevatedButtonTheme.darkElevatedButtonTheme.style
                    : TElevatedButtonTheme.lightElevatedButtonTheme.style,
                onPressed: () {},
                child: const Text(TTexts.loginButton),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Register Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: dark
                    ? TOutlineButtonTheme.darkOutlinedButtonTheme.style
                    : TOutlineButtonTheme.lightOutlinedButtonTheme.style,
                onPressed: () {},
                child: const Text(TTexts.registerButton),
              ),
            ),
            //const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
