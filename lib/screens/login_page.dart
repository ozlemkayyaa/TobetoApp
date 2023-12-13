import 'package:flutter/material.dart';
import 'package:tobeto/constants/text_const.dart';
import 'package:tobeto/widget/login_button.dart';
import 'package:tobeto/widget/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordShown = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // Arka plan resmi eklendi
            image: AssetImage(backgroundgImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(28.0),
                width: double.infinity,
                height: 380, // Beyaz kutunun boyutu
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tobeto logosu eklendi.
                    Image.asset(
                      logoImage,
                      width: 150,
                    ),
                    const SizedBox(height: 15.0),

                    //Login -> Kullanıcı Kodu ve Parola bu widget'ın içinde tutulur.
                    const LoginFormWidget(),

                    // Giriş ve Parolamı Unuttum Butonları bu widget içinde tutulur.
                    LoginButton(
                        usernameController: _usernameController,
                        passwordController: _passwordController)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
