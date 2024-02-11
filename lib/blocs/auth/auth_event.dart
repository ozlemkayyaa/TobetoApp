abstract class AuthEvent {}

class Login extends AuthEvent {
  String email;
  String password;

  Login({required this.email, required this.password});
}

class Register extends AuthEvent {
  String name;
  String surname;
  String email;
  String phone;
  String password;
  String confirmPassword;
  Register({
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });
}

class Logout extends AuthEvent {}

class RememberMeChanged extends AuthEvent {
  final bool rememberMe;

  RememberMeChanged({required this.rememberMe});
}
