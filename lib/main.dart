import 'package:flutter/material.dart';
import 'package:tobeto/ozlem/screens/home_screen.dart';
import 'package:tobeto/ozlem/screens/login/login_screen.dart';
import 'package:tobeto/ozlem/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      // system sayesinde telefonun moduna göre tema değişiyor.
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
