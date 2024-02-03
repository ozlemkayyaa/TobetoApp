import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class Initial extends AuthState {}

class NotAuthenticated extends AuthState {}

class Authenticated extends AuthState {}
