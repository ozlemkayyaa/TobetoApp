abstract class AuthEvent {}

class Login extends AuthEvent {
  String email;
  String password;

  Login({required this.email, required this.password});
}

class Register extends AuthEvent {}
