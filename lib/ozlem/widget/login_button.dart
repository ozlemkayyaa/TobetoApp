import 'package:flutter/material.dart';
import 'package:tobeto/ozlem/constants/text_const.dart';
import 'package:tobeto/ozlem/screens/home_screen.dart';
import 'package:tobeto/ozlem/screens/login/forgot_password_screen.dart';
import 'package:tobeto/ozlem/screens/login/sign_up_screen.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    // Giriş Butonu Çağırıldı
    return Column(
      children: [
        const SizedBox(height: 10.0),
        SizedBox(
          width: double.infinity,
          child: _buildLoginButton(context),
        ),

        // Şifremi Unuttum Bölümü
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ForgotPasswordScreen()),
            );
          },
          child: const Text(
            passwordForgot,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ),

        // Kayıt Ol Butonu ve yanındaki  yazı
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(registerText),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: const Text(
                registerButton,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Giriş Butonu
  ElevatedButton _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(240, 153, 51, 255),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () => _handleLogin(context),
      child: const Text(
        loginButton,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
      ),
    );
  }

// Giriş Butonuna Tıklandığında HomeScreen sayfasına gider.
  void _handleLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
