import 'package:flutter/material.dart';
import 'package:tobeto/features/other/screens/calendar/calendar_screen.dart';
import 'package:tobeto/utils/theme/theme.dart';

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
      theme: TobetoAppTheme.lightTheme,
      // system sayesinde telefonun moduna göre tema değişiyor.
      themeMode: ThemeMode.system,
      darkTheme: TobetoAppTheme.darkTheme,
      home: const CalendarScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
