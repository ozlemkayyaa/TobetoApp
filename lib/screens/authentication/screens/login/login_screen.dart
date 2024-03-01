import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto/screens/authentication/models/spacing_styles.dart';
import 'package:tobeto/screens/authentication/models/login_signup/form_divider.dart';
import 'package:tobeto/screens/authentication/models/login_signup/social_buttons.dart';
import 'package:tobeto/screens/authentication/screens/login/widgets/login_form.dart';
import 'package:tobeto/screens/authentication/screens/login/widgets/login_header.dart';
import 'package:tobeto/navigation_menu.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class LoginScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
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
            return const SingleChildScrollView(
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
            );
          }
        },
      ),
    );
  }
}
