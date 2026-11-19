import 'package:bloc/bloc.dart';
import 'package:exam_app_team_1/config/base_state/base_state.dart';
import 'package:exam_app_team_1/features/auth/domain/usecases/check_login_status_usecase.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/splash/splash_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/splash/splash_state.dart';

import 'package:injectable/injectable.dart';

@Injectable()
class SplashCubit extends Cubit<SplashState> {
  final CheckLoginStatusUsecase checkLoginStatusUsecase;

  SplashCubit(this.checkLoginStatusUsecase) : super(SplashState());

  void onEvent(SplashEvents event) {
    switch (event) {
      case CheckLoginEvent():
        _checkLogin();
        return;
    }
  }

  Future<void> _checkLogin() async {
    emit(state.copyWith(loginState: BaseState<bool>(isLoading: true)));


    await Future.delayed(const Duration(seconds: 1));

    try {
      final isLoggedIn = await checkLoginStatusUsecase();
      emit(state.copyWith(loginState: BaseState<bool>(data: isLoggedIn)));
    } catch (_) {
      emit(state.copyWith(loginState: BaseState<bool>(data: false)));
    }
  }
}