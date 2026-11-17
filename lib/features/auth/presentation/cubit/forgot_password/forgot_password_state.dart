
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:exam_app_team_1/config/base_state/base_state.dart';
import 'package:exam_app_team_1/features/auth/data/models/forget_password_response.dart';

part 'forgot_password_state.freezed.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default('') String email,
    @Default(BaseState<ForgetPasswordResponse>())
    BaseState<ForgetPasswordResponse> forgotPasswordState,
    @Default(BaseState<ForgetPasswordResponse>())
    BaseState<ForgetPasswordResponse> verifyCodeState,
    @Default(BaseState<ForgetPasswordResponse>())
    BaseState<ForgetPasswordResponse> resetPasswordState,
  }) = _ForgotPasswordState;
}
