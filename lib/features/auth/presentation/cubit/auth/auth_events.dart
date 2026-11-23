import 'package:exam_app_team_1/features/auth/domain/params/login_params.dart';
import 'package:exam_app_team_1/features/auth/domain/params/register_params.dart';

sealed class AuthEvents {}

final class LoginEvent extends AuthEvents {
  final LoginParams params;

  LoginEvent({required this.params});
}

final class RegisterEvent extends AuthEvents {
  final RegisterParams params;

  RegisterEvent({required this.params});
}

final class LogoutEvent extends AuthEvents {}