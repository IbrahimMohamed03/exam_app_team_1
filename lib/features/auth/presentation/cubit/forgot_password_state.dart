import 'package:exam_app_team_1/config/base_state/base_state.dart';
import 'package:exam_app_team_1/features/auth/data/models/forget_password_response.dart';

class ForgotPasswordState {
  final String email;
  final BaseState<ForgetPasswordResponse>? forgotPasswordState;
  final BaseState<ForgetPasswordResponse>? verifyCodeState;
  final BaseState<ForgetPasswordResponse>? resetPasswordState;

  ForgotPasswordState({
    this.email = '',
    BaseState<ForgetPasswordResponse>? forgotPasswordState,
    BaseState<ForgetPasswordResponse>? verifyCodeState,
    BaseState<ForgetPasswordResponse>? resetPasswordState,
  })  : forgotPasswordState =
            forgotPasswordState ?? BaseState<ForgetPasswordResponse>(),
        verifyCodeState =
            verifyCodeState ?? BaseState<ForgetPasswordResponse>(),
        resetPasswordState =
            resetPasswordState ?? BaseState<ForgetPasswordResponse>();

  ForgotPasswordState copyWith({
    String? email,
    BaseState<ForgetPasswordResponse>? forgotPasswordState,
    BaseState<ForgetPasswordResponse>? verifyCodeState,
    BaseState<ForgetPasswordResponse>? resetPasswordState,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      forgotPasswordState: forgotPasswordState ?? this.forgotPasswordState,
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
    );
  }
}
