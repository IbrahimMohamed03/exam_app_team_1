
import 'package:exam_app_team_1/config/base_state/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState({
    @Default(BaseState<bool>())
    BaseState<bool> loginState,
  }) = _SplashState;
}
