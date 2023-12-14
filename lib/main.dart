import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto/screens/login_page.dart';
import 'package:tobeto/themes/app_theme.dart';
//import 'package:tobeto/widget/drawer_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: AppTheme.lightTheme.copyWith(useMaterial3: true),
        darkTheme: AppTheme.darkTheme.copyWith(useMaterial3: true),
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
