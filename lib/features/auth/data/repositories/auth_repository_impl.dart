import 'package:exam_app_team_1/core/storage/token_storage.dart';
import 'package:exam_app_team_1/features/auth/domain/params/login_params.dart';
import 'package:exam_app_team_1/features/auth/domain/params/register_params.dart';
import 'package:injectable/injectable.dart';
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/data/datasources/auth_data_source.dart';
import 'package:exam_app_team_1/features/auth/data/models/auth_response.dart';
import 'package:exam_app_team_1/features/auth/data/models/login_request.dart';
import 'package:exam_app_team_1/features/auth/data/models/register_request.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app_team_1/features/auth/domain/repositories/auth_repository.dart';

import '../../domain/params/forgot_password_params.dart';
import '../../domain/params/reset_password_params.dart';
import '../../domain/params/verify_reset_code_params.dart';
import '../models/forget_password_response.dart';
import '../models/forgot_password_request.dart';
import '../models/reset_password_request.dart';
import '../models/verify_reset_code_request.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final TokenStorage tokenStorage;

  AuthRepositoryImpl(this.authDataSource, this.tokenStorage);

  LoginRequest LoginParamsToRequest(LoginParams params) {
    return LoginRequest(email: params.email, password: params.password);
  }

  RegisterRequest RegisterParamsToRequest(RegisterParams params) {
    return RegisterRequest(
      username: params.username,
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
      password: params.password,
      rePassword: params.rePassword,
      phone: params.phone,
    );
  }

  @override
  Future<BaseResponse<UserEntity>> login(LoginParams params) async {
    LoginRequest request = LoginParamsToRequest(params);
    final response = await authDataSource.login(request);

    switch (response) {
      case SuccessBaseResponse<AuthResponse>():
        final token = response.data.token;
        print('DEBUG login token=${token != null ? "exists" : "null"} rememberMe=${params.rememberMe}');
        if (token != null) {
          await tokenStorage.saveToken(token, persist: params.rememberMe);
        }
        final userEntity = response.data.user!.toDomain();
        return SuccessBaseResponse<UserEntity>(userEntity);

      case ErrorBaseResponse<AuthResponse>():
        return ErrorBaseResponse<UserEntity>(errorObj: response.errorObj);
    }
  }

  @override
  Future<BaseResponse<UserEntity>> register(RegisterParams params) async {
    RegisterRequest request = RegisterParamsToRequest(params);
    final response = await authDataSource.register(request);

    switch (response) {
      case SuccessBaseResponse<AuthResponse>():
        final token = response.data.token;
        if (token != null) {
          await tokenStorage.saveToken(token, persist: false);
        }
        final userEntity = response.data.user!.toDomain();
        return SuccessBaseResponse<UserEntity>(userEntity);

      case ErrorBaseResponse<AuthResponse>():
        return ErrorBaseResponse<UserEntity>(errorObj: response.errorObj);
    }
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> forgotPassword(
      ForgotPasswordParams params) async {
    final request = ForgotPasswordRequest(email: params.email);
    return await authDataSource.forgotPassword(request);
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> verifyResetCode(
      VerifyResetCodeParams params) async {
    final request = VerifyResetCodeRequest(resetCode: params.resetCode);
    return await authDataSource.verifyResetCode(request);
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> resetPassword(
      ResetPasswordParams params) async {
    final request = ResetPasswordRequest(
      email: params.email,
      newPassword: params.newPassword,
    );
    return await authDataSource.resetPassword(request);
  }

  @override
  Future<String?> getToken() => tokenStorage.getToken();

  @override
  Future<bool> isLoggedIn() async {
    final token = await tokenStorage.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> logout() async {
    try {
      await authDataSource.logout();
    } catch (_) {
      // حتى لو الـ API فشل، لازم نمسح التوكن من الجهاز
    }
    await tokenStorage.clearToken();
  }
}