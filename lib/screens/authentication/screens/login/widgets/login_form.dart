import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // BlocProvider eklemeyi unutmayın
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/blocs/auth_bloc/auth_bloc.dart'; // AuthBloc'u import edin
import 'package:tobeto/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto/screens/authentication/screens/password/forgot_password.dart';
import 'package:tobeto/screens/authentication/screens/signup/signup_screen.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

@override
class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: emailController, // Email denetleyicisi
              decoration: const InputDecoration(
                prefixIcon: Icon(CupertinoIcons.mail),
                labelText: TTexts.userEmail,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              controller: passwordController, // Şifre denetleyicisi
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.lock),
                labelText: TTexts.userPassword,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // Remember Me and Forgot Password
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                final bool rememberMeEnabled =
                    state is RememberMeState ? state.rememberMe : false;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Remember Me
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMeEnabled,
                          onChanged: (value) {
                            context.read<AuthBloc>().add(
                                RememberMeChanged(rememberMe: value ?? false));
                          },
                        ),
                        const Text(TTexts.rememeberMe),
                      ],
                    ),

                    // Forgot Password
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()),
                        );
                      },
                      child: const Text(TTexts.passwordForgot),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Login Button
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Giriş butonu tıklandığında AuthBloc'a giriş olayını ilet
                      context.read<AuthBloc>().add(Login(
                          email: emailController.text,
                          password: passwordController.text));
                    },
                    child: const Text(TTexts.loginButton),
                  ),
                );
              },
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Register Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()),
                  );
                },
                child: const Text(TTexts.registerButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
