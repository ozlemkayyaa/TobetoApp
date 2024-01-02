import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/authentication/screens/login/login_screen.dart';
import 'package:tobeto/features/authentication/screens/signup/widgets/terms_checkbox.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.signName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.signSurname,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // E-Mail
          TextFormField(
            decoration: const InputDecoration(
              labelText: TTexts.signEmail,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Phone Number
          // TextFormField(
          //   decoration: const InputDecoration(
          //     labelText: TTexts.signPhoneNumber,
          //     prefixIcon: Icon(Iconsax.call),
          //   ),
          // ),
          // const SizedBox(height: TSizes.spaceBtwInputFields),

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

          // Terms and Conditions Checkbox

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TTexts.registerText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    TTexts.loginButton,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ))
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          // Sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const Dialog(
                            child:
                                SizedBox(height: 450, child: TermsCheckbox()),
                          );
                        });
                  },
                  child: const Text(TTexts.registerButton))),
        ],
      ),
    );
  }
}
