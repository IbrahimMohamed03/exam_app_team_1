import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/data/models/login_request.dart';
import 'package:exam_app_team_1/features/auth/data/models/register_request.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app_team_1/features/auth/domain/params/login_params.dart';
import 'package:exam_app_team_1/features/auth/domain/params/register_params.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserEntity>> login(LoginParams request);
  Future<BaseResponse<UserEntity>> register(RegisterParams request);
}