import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto/api/repositories/auth_repo.dart';
import 'package:tobeto/api/repositories/user_repo.dart';
import 'package:tobeto/firebase_options.dart';
import 'package:tobeto/screens/start/start_page.dart';
import 'package:tobeto/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(AuthRepository(), UserRepository()),
      ),
    ],
    child: MaterialApp(
      themeMode: ThemeMode.system,
      theme: TobetoAppTheme.lightTheme,
      darkTheme: TobetoAppTheme.darkTheme,
      home: const StartPage(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
