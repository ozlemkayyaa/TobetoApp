import 'package:flutter/material.dart';
import 'package:tobeto/ozlem/screens/login/login_screen.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed ile belirli bir süre sonra işlem gerçekleştirelim
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: isDarkMode(context)
                ? const AssetImage(TImages.tLogoWhite)
                : const AssetImage(TImages.tLogoMor),
          ),
        ),
      ),
    );
  }
}
