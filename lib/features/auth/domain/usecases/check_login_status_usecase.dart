import 'package:exam_app_team_1/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckLoginStatusUsecase {
  final AuthRepository authRepository;

  CheckLoginStatusUsecase(this.authRepository);

  Future<bool> call() async {
    return await authRepository.isLoggedIn();
  }
}