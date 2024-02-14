import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/blocs/auth/auth_bloc.dart';
import 'package:tobeto/blocs/auth/auth_state.dart';
import 'package:tobeto/features/authentication/models/login_signup/form_divider.dart';
import 'package:tobeto/features/authentication/models/login_signup/social_buttons.dart';
import 'package:tobeto/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:tobeto/navigation_menu.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                    // Title
                    Text(TTexts.signUp,
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Form
                    SignupForm(),
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
