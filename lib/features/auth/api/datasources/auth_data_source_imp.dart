import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/api/api_clients/auth_api_client.dart';
import 'package:exam_app_team_1/features/auth/data/models/login_request.dart';
import 'package:exam_app_team_1/features/auth/data/models/register_request.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/auth_response.dart';
import '../../data/datasources/auth_data_source.dart';
import '../../data/models/forget_password_response.dart';
import '../../data/models/forgot_password_request.dart';
import '../../data/models/reset_password_request.dart';
import '../../data/models/verify_reset_code_request.dart';

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImp implements AuthDataSource {
  final AuthApiClient authApiClient;
  AuthDataSourceImp(this.authApiClient);

  @override
  Future<BaseResponse<AuthResponse>> login(LoginRequest request) async {
    try {
      final response = await authApiClient.login(request);
      return SuccessBaseResponse(response);
    } catch (e) {
      return ErrorBaseResponse(errorObj: e);
    }
  }

  @override
  Future<BaseResponse<AuthResponse>> register(RegisterRequest request) async {
    try {
      final response = await authApiClient.register(request);
      return SuccessBaseResponse(response);
    } catch (e) {
      return ErrorBaseResponse(errorObj: e);
    }
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request) async {
    try {
      final response = await authApiClient.forgotPassword(request);
      return SuccessBaseResponse(response);
    } catch (e) {
      return ErrorBaseResponse(errorObj: e);
    }
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> verifyResetCode(
      VerifyResetCodeRequest request) async {
    try {
      final response = await authApiClient.verifyResetCode(request);
      return SuccessBaseResponse(response);
    } catch (e) {
      return ErrorBaseResponse(errorObj: e);
    }
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> resetPassword(
      ResetPasswordRequest request) async {
    try {
      final response = await authApiClient.resetPassword(request);
      return SuccessBaseResponse(response);
    } catch (e) {
      return ErrorBaseResponse(errorObj: e);
    }
  }

  @override
  Future<void> logout() async {
    await authApiClient.logout();
  }
}