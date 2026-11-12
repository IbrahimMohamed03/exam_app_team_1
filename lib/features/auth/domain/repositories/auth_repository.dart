import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/data/models/login_request.dart';
import 'package:exam_app_team_1/features/auth/data/models/signup_request.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserEntity>> login(LoginRequest request);
  Future<BaseResponse<UserEntity>> signup(SignupRequest request);
}