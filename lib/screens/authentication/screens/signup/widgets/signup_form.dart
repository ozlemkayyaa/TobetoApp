import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto/model/user_model.dart';
import 'package:tobeto/screens/authentication/screens/login/login_screen.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/validators/validation.dart';

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

  final _formKey = GlobalKey<FormState>();
  final UserModel _user = UserModel();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Ad
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onSaved: (value) {
                    _user.name = value!;
                  },
                  validator: TValidator.validateName,
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
                  onSaved: (value) {
                    _user.surname = value!;
                  },
                  validator: TValidator.validateName,
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
            onSaved: (value) {
              _user.email = value!;
            },
            validator: TValidator.validateEmail,
            controller: emailController,
            decoration: const InputDecoration(
              labelText: TTexts.signEmail,
              prefixIcon: Icon(CupertinoIcons.mail),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          //Phone Number
          TextFormField(
            onSaved: (value) {
              _user.phone = value!;
            },
            validator: TValidator.validatePhoneNumber,
            controller: phoneController,
            decoration: const InputDecoration(
              labelText: TTexts.signPhoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            validator: TValidator.validatePassword,
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
            validator: TValidator.validatePassword,
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
              Text(TTexts.registerText,
                  style: Theme.of(context).textTheme.bodySmall),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Text(TTexts.loginButton,
                      style: Theme.of(context).textTheme.bodyLarge))
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
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<AuthBloc>().add(RegisterEvent(
                              name: _user.name!,
                              surname: _user.surname!,
                              email: _user.email!,
                              phone: _user.phone!,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                            ));
                      }
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
