import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/blocs/auth/auth_bloc.dart';
import 'package:tobeto/blocs/auth/auth_state.dart';
import 'package:tobeto/features/authentication/models/spacing_styles.dart';
import 'package:tobeto/features/authentication/models/login_signup/form_divider.dart';
import 'package:tobeto/features/authentication/models/login_signup/social_buttons.dart';
import 'package:tobeto/features/authentication/screens/login/widgets/login_form.dart';
import 'package:tobeto/features/authentication/screens/login/widgets/login_header.dart';
import 'package:tobeto/navigation_menu.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
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
                padding: TSpacingStyle.paddingWithAppBarHeight,
                child: Column(
                  children: [
                    // Logo, Title, SubTitle
                    const LoginHeader(),

                    // Form
                    LoginForm(),

                    // Divider
                    const FormDivider(dividerText: TTexts.orSign),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Footer
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
