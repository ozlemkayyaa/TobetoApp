import 'package:flutter/material.dart';
import 'package:tobeto/common/styles/spacing_styles.dart';
import 'package:tobeto/common/widgets.login_signup/form_divider.dart';
import 'package:tobeto/common/widgets.login_signup/social_buttons.dart';
import 'package:tobeto/features/authentication/screens/login/widgets/login_form.dart';
import 'package:tobeto/features/authentication/screens/login/widgets/login_header.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title, SubTitle
              LoginHeader(),

              // Form
              LoginForm(),

              // Divider
              FormDivider(dividerText: TTexts.orSign),
              SizedBox(height: TSizes.spaceBtwSections),

              // Footer
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
