import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/data/models/login_request.dart';
import 'package:exam_app_team_1/features/auth/data/models/register_request.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app_team_1/features/auth/domain/params/login_params.dart';
import 'package:exam_app_team_1/features/auth/domain/params/register_params.dart';

import '../../data/models/forget_password_response.dart';
import '../params/forgot_password_params.dart';
import '../params/reset_password_params.dart';
import '../params/verify_reset_code_params.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserEntity>> login(LoginParams request);
  Future<BaseResponse<UserEntity>> register(RegisterParams request);
  Future<BaseResponse<ForgetPasswordResponse>> forgotPassword(
      ForgotPasswordParams params);
  Future<BaseResponse<ForgetPasswordResponse>> verifyResetCode(
      VerifyResetCodeParams params);
  Future<BaseResponse<ForgetPasswordResponse>> resetPassword(
      ResetPasswordParams params);
  Future<void> logout();
  Future<bool> isLoggedIn();
  Future<String?> getToken();
}