import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto/model/user_model.dart';
import 'package:tobeto/screens/authentication/screens/password/forgotten_password.dart';
import 'package:tobeto/screens/authentication/screens/signup/signup_screen.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/validators/validation.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final UserModel _user = UserModel();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              onSaved: (value) {
                _user.email = value!;
              },
              validator: TValidator.validateEmail,
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(CupertinoIcons.mail),
                labelText: TTexts.userEmail,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              validator: TValidator.validatePassword,
              controller: passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: TTexts.signPassword,
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // Forgot Password
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Forgot Password
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgottenPassword()),
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
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<AuthBloc>().add(LoginEvent(
                              email: _user.email!,
                              password: passwordController.text,
                            ));
                      }
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
