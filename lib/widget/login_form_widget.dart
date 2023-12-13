import 'package:flutter/material.dart';
import 'package:tobeto/constants/text_const.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordShown = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(
          icon: Icons.person_outline_outlined,
          controller: _usernameController,
          hintText: userCodeHint,
        ),
        const SizedBox(height: 15.0),
        _buildPasswordTextField(),
      ],
    );
  }

// Kullanıcı Kodu kutucuğunun özellikleri
  Widget _buildTextField({
    required IconData icon,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 40,
      child: Row(
        children: [
          const SizedBox(width: 5.0),
          Icon(
            icon,
            color: Colors.black87,
          ),
          const SizedBox(width: 5.0),

          // Kullanıcı Kodu bölümü
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: userCodeHint,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Parola kutucuğunun özellikleri
  Widget _buildPasswordTextField() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 40,
      child: Row(
        children: [
          const SizedBox(width: 5.0),
          const Icon(
            Icons.lock_outline,
            color: Colors.black87,
          ),
          const SizedBox(width: 5.0),

          //Parola bölümü
          Expanded(
            child: TextField(
              controller: _passwordController,
              obscureText: isPasswordShown,
              decoration: InputDecoration(
                hintText: userPasswordHint,
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),

          // Parolanın gözükmesi ya da gözükmemesi ile iligli
          IconButton(
            onPressed: () {
              setState(() {
                isPasswordShown = !isPasswordShown;
              });
            },
            icon: Icon(isPasswordShown
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined),
            color: Colors.black87,
          )
        ],
      ),
    );
  }
}
