
sealed class AuthEvents {}

final class LoginEvent extends AuthEvents {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

final class RegisterEvent extends AuthEvents {
  final String email;
  final String password;
  final String username;
  final String phone;
  final String firstName;
  final String lastName;
  final String rePassword;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.username,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.rePassword,
  });
}

final class LogoutEvent extends AuthEvents {}
