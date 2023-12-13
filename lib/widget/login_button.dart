import 'package:flutter/material.dart';
import 'package:tobeto/constants/text_const.dart';

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
    // Giriş Butonu çağırıldı.
    return Column(
      children: [
        const SizedBox(height: 15.0),
        SizedBox(
          width: double.infinity,
          child: _buildLoginButton(context),
        ),

        // Çizgi
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 20),
        ),

        // Parolamı Unuttum bölümü
        TextButton(
          onPressed: () {
            // TODO: Parolamı unuttum işlevi buraya gelecek
          },
          child: const Text(
            passwordForgot,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          ),
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
      child: const Text(loginButton,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    // Kullanıcı adı ve şifre kontrolü
    if (usernameController.text == 'kullanici' &&
        passwordController.text == 'sifre') {
      // Giriş başarılı
      _showDialog(context, succesfulLogin, succesfulMessage);
    } else {
      // Giriş başarısız
      _showDialog(context, failedLogin, failedMessage);
    }
  }

// Başarılı veya başarısız giriş yazısının çıkması
  Future<void> _showDialog(
      BuildContext context, String title, String content) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(failedButton),
            ),
          ],
        );
      },
    );
  }
}
