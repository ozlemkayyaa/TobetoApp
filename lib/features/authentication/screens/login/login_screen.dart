import 'package:flutter/material.dart';
import 'package:tobeto/common/styles/spacing_styles.dart';
import 'package:tobeto/common/widgets.login_signup/form_divider.dart';
import 'package:tobeto/common/widgets.login_signup/social_buttons.dart';
import 'package:tobeto/features/authentication/screens/login/widgets/login_form.dart';
import 'package:tobeto/features/authentication/screens/login/widgets/login_header.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title, SubTitle
              LoginHeader(dark: dark),

              // Form
              const LoginForm(),

              // Divider
              LoginDivider(dark: dark, dividerText: TTexts.orSign),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Footer
              LoginSocialButtons(dark: dark),
            ],
          ),
        ),
      ),
    );
  }
}
