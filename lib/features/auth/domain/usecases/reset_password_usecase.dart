import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/data/models/forget_password_response.dart';
import 'package:exam_app_team_1/features/auth/domain/params/reset_password_params.dart';
import 'package:exam_app_team_1/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetPasswordUsecase {
  final AuthRepository authRepository;

  ResetPasswordUsecase(this.authRepository);

  Future<BaseResponse<ForgetPasswordResponse>> call(
      ResetPasswordParams params) async {
    return await authRepository.resetPassword(params);
  }
}
