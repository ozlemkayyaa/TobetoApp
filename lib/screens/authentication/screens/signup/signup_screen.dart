import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto/screens/authentication/models/login_signup/form_divider.dart';
import 'package:tobeto/screens/authentication/models/login_signup/social_buttons.dart';
import 'package:tobeto/screens/authentication/screens/signup/widgets/signup_form.dart';
import 'package:tobeto/navigation_menu.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          // State'e göre işlem yap
          if (state is Authenticated) {
            // Kullanıcı giriş yapmışsa NavigationMenu sayfasına yönlendir
            return const NavigationMenu();
          } else {
            // Kullanıcı giriş yapmamışsa giriş formunu göster
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      height: 120,
                      width: 270,
                      image: AssetImage(
                          dark ? TImages.darkAppLogo : TImages.lightAppLogo),
                    ),
                    // Title
                    Text(TTexts.signUp,
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Form
                    const SignupForm(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Divider
                    const FormDivider(dividerText: TTexts.orsignUp),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Social Buttons
                    const SocialButtons(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
