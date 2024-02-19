import 'package:flutter/material.dart';
import 'package:tobeto/screens/authentication/models/spacing_styles.dart';
import 'package:tobeto/screens/authentication/screens/login/login_screen.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

/* Bu sayfa mail onaylama linkine tıklandıktan sonra gözüken sayfadır, ondan dolayı herhangi bir yere bağlamadım. 
   Onaylandı yazısından sonra Giriş yap butonuna tıklanınca login sayfasına gider. */
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            // Image
            Image(
              image: const AssetImage(TImages.done),
              width: THelperFunctions.screenWidth(context),
            ),
            const SizedBox(height: TSizes.spaceBtwSections + 30),

            // Title
            Text(
              TTexts.activation,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwSections + 30),

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
                child: const Text(TTexts.loginButton),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
