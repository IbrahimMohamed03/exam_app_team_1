import 'package:bloc/bloc.dart';
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/config/base_state/base_state.dart';
import 'package:exam_app_team_1/features/auth/data/models/forget_password_response.dart';
import 'package:exam_app_team_1/features/auth/domain/params/forgot_password_params.dart';
import 'package:exam_app_team_1/features/auth/domain/params/reset_password_params.dart';
import 'package:exam_app_team_1/features/auth/domain/params/verify_reset_code_params.dart';
import 'package:exam_app_team_1/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:exam_app_team_1/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:exam_app_team_1/features/auth/domain/usecases/verify_reset_code_usecase.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUsecase forgotPasswordUsecase;
  final VerifyResetCodeUsecase verifyResetCodeUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;

  ForgotPasswordCubit(
      this.forgotPasswordUsecase,
      this.verifyResetCodeUsecase,
      this.resetPasswordUsecase,
      ) : super(ForgotPasswordState());

  void onEvent(ForgotPasswordEvents event) async {
    switch (event) {
      case SubmitEmailEvent(:final email):
        _forgotPassword(email);
        return;

      case VerifyResetCodeEvent(:final resetCode):
        _verifyResetCode(resetCode);
        return;

      case SubmitResetPasswordEvent(:final newPassword):
        _resetPassword(newPassword);
        return;
    }
  }

  Future<void> _forgotPassword(String email) async {
    emit(state.copyWith(
      email: email,
      forgotPasswordState: BaseState<ForgetPasswordResponse>(isLoading: true),
    ));

    final response = await forgotPasswordUsecase(
      ForgotPasswordParams(email: email),
    );

    switch (response) {
      case SuccessBaseResponse<ForgetPasswordResponse>():
        emit(state.copyWith(
          forgotPasswordState: BaseState<ForgetPasswordResponse>(
            data: response.data,
          ),
        ));

      case ErrorBaseResponse<ForgetPasswordResponse>():
        emit(state.copyWith(
          forgotPasswordState: BaseState<ForgetPasswordResponse>(
            errMsg: response.errorMsg,
          ),
        ));
    }
  }

  Future<void> _verifyResetCode(String resetCode) async {
    emit(state.copyWith(
      verifyCodeState: BaseState<ForgetPasswordResponse>(isLoading: true),
    ));

    final response = await verifyResetCodeUsecase(
      VerifyResetCodeParams(resetCode: resetCode),
    );

    switch (response) {
      case SuccessBaseResponse<ForgetPasswordResponse>():
        emit(state.copyWith(
          verifyCodeState: BaseState<ForgetPasswordResponse>(
            data: response.data,
          ),
        ));

      case ErrorBaseResponse<ForgetPasswordResponse>():
        emit(state.copyWith(
          verifyCodeState: BaseState<ForgetPasswordResponse>(
            errMsg: response.errorMsg,
          ),
        ));
    }
  }

  Future<void> _resetPassword(String newPassword) async {
    emit(state.copyWith(
      resetPasswordState: BaseState<ForgetPasswordResponse>(isLoading: true),
    ));

    final response = await resetPasswordUsecase(
      ResetPasswordParams(
        email: state.email,
        newPassword: newPassword,
      ),
    );

    switch (response) {
      case SuccessBaseResponse<ForgetPasswordResponse>():
        emit(state.copyWith(
          resetPasswordState: BaseState<ForgetPasswordResponse>(
            data: response.data,
          ),
        ));

      case ErrorBaseResponse<ForgetPasswordResponse>():
        emit(state.copyWith(
          resetPasswordState: BaseState<ForgetPasswordResponse>(
            errMsg: response.errorMsg,
          ),
        ));
    }
  }
}