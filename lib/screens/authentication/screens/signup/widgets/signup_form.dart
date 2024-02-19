import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto/screens/authentication/screens/login/login_screen.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Ad
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: nameController,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.signName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              // Soyad
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: surnameController,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.signSurname,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // E-Mail
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: TTexts.signEmail,
              prefixIcon: Icon(CupertinoIcons.mail),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          //Phone Number
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(
              labelText: TTexts.signPhoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            controller: passwordController,
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
            controller: confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.signPasswordAgain,
              prefixIcon: Icon(Iconsax.lock),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Terms and Conditions

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TTexts.registerText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    TTexts.loginButton,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ))
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          // Sign Up Button
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(Register(
                          name: nameController.text,
                          surname: surnameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text));
                    },
                    child: const Text(TTexts.registerButton)),
              );
            },
          ),
        ],
      ),
    );
  }
}
