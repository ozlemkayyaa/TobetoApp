import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class NotAuthenticated extends AuthState {
  String? errorMessage;

  NotAuthenticated({this.errorMessage});
}

class Authenticated extends AuthState {
  User? user;
  String? userName; // Kullanıcı adını tutmak için

  Authenticated({this.user, this.userName});
}
