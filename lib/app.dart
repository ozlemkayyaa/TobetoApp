import 'package:flutter/material.dart';
import 'package:tobeto/features/authentication/screens/onboarding/onboarding.dart';
import 'package:tobeto/ozlem/themes/app_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization(null);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 5));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      // system sayesinde telefonun moduna göre tema değişiyor.
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      home: const Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
