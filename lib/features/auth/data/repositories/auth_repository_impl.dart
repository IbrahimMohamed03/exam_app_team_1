import 'package:injectable/injectable.dart';
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/data/datasources/auth_data_source.dart';
import 'package:exam_app_team_1/features/auth/data/models/auth_response.dart';
import 'package:exam_app_team_1/features/auth/data/models/login_request.dart';
import 'package:exam_app_team_1/features/auth/data/models/signup_request.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app_team_1/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<BaseResponse<UserEntity>> login(LoginRequest request) async {
    final response = await authDataSource.login(request);

    switch (response) {
      case SuccessBaseResponse<AuthResponse>():
        final userEntity = response.data.user!.toDomain();
        return SuccessBaseResponse<UserEntity>(userEntity);

      case ErrorBaseResponse<AuthResponse>():
        return ErrorBaseResponse<UserEntity>(errorObj: response.errorObj);
    }
  }

  @override
  Future<BaseResponse<UserEntity>> signup(SignupRequest request) async {
    final response = await authDataSource.signup(request);

    switch (response) {
      case SuccessBaseResponse<AuthResponse>():
        final userEntity = response.data.user!.toDomain();
        return SuccessBaseResponse<UserEntity>(userEntity);

      case ErrorBaseResponse<AuthResponse>():
        return ErrorBaseResponse<UserEntity>(errorObj: response.errorObj);
    }
  }
}
