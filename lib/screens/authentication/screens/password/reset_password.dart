import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/authentication/screens/login/login_screen.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

/* Bu sayfa Şifre sıfırlama linkine tıklandıktan sonra gözüken sayfadır, ondan Navigation ile herhangi bir sayfaya bağlamadım. 
   Şifre ve Şifre Tekrarı girilip Gönder butonuna tıklandıktan sonra Login screen sayfasına gider. */

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                  image: const AssetImage(TImages.resetPassword),
                  width: THelperFunctions.screenWidth(context)),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Title and SubTitle
              Text(TTexts.passwordResetTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

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

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(TTexts.sendButton),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
