import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/data/models/register_request.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app_team_1/features/auth/domain/params/register_params.dart';
import 'package:exam_app_team_1/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterUsecase {
  final AuthRepository authRepository;

  RegisterUsecase(this.authRepository);

  Future<BaseResponse<UserEntity>> call(RegisterParams request) async {
    return await authRepository.register(request);
  }
}