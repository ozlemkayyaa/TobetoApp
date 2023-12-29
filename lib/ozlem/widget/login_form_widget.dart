import 'package:flutter/material.dart';
import 'package:tobeto/ozlem/constants/text_const.dart';

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
    ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    return Column(
      children: [
        _buildTextField(
          icon: Icons.person_outline_outlined,
          controller: _usernameController,
          hintText: userEmail,
          isDarkMode: isDarkMode,
        ),
        const SizedBox(height: 15.0),
        _buildPasswordTextField(isDarkMode: isDarkMode),
      ],
    );
  }

// Kullanıcı Kodu kutucuğunun özellikleri
  Widget _buildTextField({
    required IconData icon,
    required TextEditingController controller,
    required String hintText,
    required bool isDarkMode,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8.0),
        color: isDarkMode ? Colors.white : null,
      ),
      height: 40,
      child: Row(
        children: [
          const SizedBox(width: 5.0),
          Icon(icon, color: Colors.black87),
          const SizedBox(width: 5.0),

          // Kullanıcı Kodu bölümü
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: hintText,
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
  Widget _buildPasswordTextField({required bool isDarkMode}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
        color: isDarkMode ? Colors.white : null,
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
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: userPassword,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
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
            color: isDarkMode ? Colors.black87 : Colors.white,
          )
        ],
      ),
    );
  }
}
