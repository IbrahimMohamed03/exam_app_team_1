import 'package:bloc/bloc.dart';
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app_team_1/features/auth/domain/params/login_params.dart';
import 'package:exam_app_team_1/features/auth/domain/params/register_params.dart';
import 'package:exam_app_team_1/features/auth/domain/usecases/login_usecase.dart';
import 'package:exam_app_team_1/features/auth/domain/usecases/register_usecase.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth/auth_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerUsernameController = TextEditingController();
  TextEditingController registerFirstNameController = TextEditingController();
  TextEditingController registerLastNameController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();

  AuthCubit(this.loginUsecase, this.registerUsecase) : super(AuthState());

  Future<void> onEvent(AuthEvents event) async {
    switch (event) {
      case LoginEvent():
        await _login(event.params);
        return;

      case RegisterEvent():
        await _register(event.params);
        return;

      case LogoutEvent():
        return;
    }
  }

  Future<void> _login(LoginParams params) async {

    emit(state.copyWith(
        userState: state.userState.copyWith(isLoading: true, errMsg: null)));

    BaseResponse<UserEntity>? response = await loginUsecase(params);
    switch (response) {
      case SuccessBaseResponse<UserEntity>():
        emit(state.copyWith(
            userState: state.userState.copyWith(
              data: response.data,
              isLoading: false,
              errMsg: null,
            )));
      case ErrorBaseResponse<UserEntity>():
        emit(state.copyWith(
            userState: state.userState
                .copyWith(errMsg: response.errorMsg, isLoading: false)));
    }
  }

  Future<void> _register(RegisterParams params) async {

    emit(state.copyWith(userState: state.userState.copyWith(isLoading: true, errMsg: null)));

    BaseResponse<UserEntity>? response = await registerUsecase(params);
    switch (response) {
      case SuccessBaseResponse<UserEntity>():
        emit(state.copyWith(
            userState: state.userState.copyWith(
              data: response.data,
              isLoading: false,
              errMsg: null,
            )));
        print(response.data);
      case ErrorBaseResponse<UserEntity>():
        emit(state.copyWith(
            userState: state.userState
                .copyWith(errMsg: response.errorMsg, isLoading: false)));
        print(response.errorMsg);
    }
  }
}