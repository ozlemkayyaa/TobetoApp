abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  String email;
  String password;

  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  String name;
  String surname;
  String email;
  String phone;
  String password;
  String confirmPassword;
  RegisterEvent({
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });
}

class LogoutEvent extends AuthEvent {}

class ForgotPassword extends AuthEvent {
  String email;
  ForgotPassword({
    required this.email,
  });
}

class ChangePassword extends AuthEvent {
  String newPassword;
  String confirmNewPassword;
  ChangePassword({
    required this.newPassword,
    required this.confirmNewPassword,
  });
}

class DeleteUserEmail extends AuthEvent {}
