import 'package:exam_app_team_1/config/base_state/base_state.dart';

class SplashState {
  final BaseState<bool> loginState;

  SplashState({BaseState<bool>? loginState})
      : loginState = loginState ?? BaseState<bool>();

  SplashState copyWith({BaseState<bool>? loginState}) {
    return SplashState(loginState: loginState ?? this.loginState);
  }
}