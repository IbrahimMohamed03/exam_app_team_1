import '../models/auth_response.dart';
import '../models/forget_password_response.dart';
import '../models/forgot_password_request.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';

import '../models/reset_password_request.dart';
import '../models/verify_reset_code_request.dart';

abstract class AuthDataSource {
  Future<BaseResponse<AuthResponse>> login(LoginRequest request);
  Future<BaseResponse<AuthResponse>> register(RegisterRequest request);
  Future<BaseResponse<ForgetPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request);
  Future<BaseResponse<ForgetPasswordResponse>> verifyResetCode(
      VerifyResetCodeRequest request);
  Future<BaseResponse<ForgetPasswordResponse>> resetPassword(
      ResetPasswordRequest request);
  Future<void> logout();
}

