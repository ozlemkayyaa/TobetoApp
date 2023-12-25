import 'package:flutter/material.dart';
import 'package:tobeto/constants/text_const.dart';
import 'package:tobeto/widget/login_button.dart';
import 'package:tobeto/widget/login_form_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Color backgroundColor;
  late String logoImage;
  bool isPasswordShown = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    backgroundColor =
        theme.brightness == Brightness.light ? Colors.white : Colors.black;
    logoImage =
        theme.brightness == Brightness.light ? lightLogoImage : darkLogoImage;

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
                  color: backgroundColor,
                ),
                padding: const EdgeInsets.all(28.0),
                width: double.infinity,
                height: 370, // Beyaz kutunun boyutu
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tobeto logosu eklendi.
                    Image.asset(
                      logoImage,
                      width: 150,
                    ),
                    const SizedBox(height: 30.0),

                    //Login -> Kullanıcı Kodu ve Parola bu widget'ın içinde tutulur.
                    const LoginFormWidget(),

                    // Giriş ve Parolamı Unuttum Butonları bu widget içinde tutulur.
                    LoginButton(
                        usernameController: _usernameController,
                        passwordController: _passwordController),
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
