import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class Initial extends AuthState {}

class NotAuthenticated extends AuthState {
  String? errorMessage;

  NotAuthenticated({this.errorMessage});
}

class Authenticated extends AuthState {
  User? user;
  String? userName; // Kullanıcı adını tutmak için

  Authenticated({this.user, this.userName});
}

class RememberMeState extends AuthState {
  final bool rememberMe;

  RememberMeState({required this.rememberMe});
}
