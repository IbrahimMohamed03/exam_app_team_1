

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/data/models/login_request.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app_team_1/features/auth/domain/params/login_params.dart';
import 'package:exam_app_team_1/features/auth/domain/params/register_params.dart';
import 'package:exam_app_team_1/features/auth/domain/usecases/login_usecase.dart';
import 'package:exam_app_team_1/features/auth/domain/usecases/register_usecase.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState>{
  LoginUsecase loginUsecase;
  RegisterUsecase registerUsecase;


  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerUsernameController = TextEditingController();
  TextEditingController registerFirstNameController = TextEditingController();
  TextEditingController registerLastNameController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();

  AuthCubit(this.loginUsecase,this.registerUsecase):super(AuthState());

  void onEvent(AuthEvents event)async{
    switch(event){

      case LoginEvent(:final email,:final password):
        _login(email, password);
        return;
      case RegisterEvent(
          :final email,
          :final password,
          :final username,
          :final phone,
          :final firstName,
          :final lastName,
          :final rePassword,
      ):
        await _register(
        email,
        password,
        username,
        phone,
        firstName,
        lastName,
        rePassword,
        );
        return;
      case LogoutEvent():
        // TODO: Handle this case.
    }
  }
  void getData()async{

  }

  Future<void> _login(String email, String password)async{
    final request = LoginParams(email: email, password: password);


    emit(state.copyWith(userState: state.userState?.copyWith(
      isLoading: true,errMsg: null
    )));

    BaseResponse<UserEntity>? response = await loginUsecase(request);
    switch(response){

      case SuccessBaseResponse<UserEntity>():
        emit(state.copyWith(userState: state.userState?.copyWith(
            data: response.data,
          isLoading: false,
          errMsg: null,
        )));
      case ErrorBaseResponse<UserEntity>():
        emit(state.copyWith(userState: state.userState?.copyWith(
            errMsg: response.errorMsg,isLoading: false
        )));
        // return;
    }
  }

  Future<void> _register(String email,String password,String username,String phone, String firstName, String lastName,String rePassword)async{

    final request = RegisterParams(email: email, password: password, username: username, phone: phone, firstName: firstName, lastName: lastName, rePassword: rePassword);
    emit(state.copyWith(userState: state.userState?.copyWith(
        isLoading: true,errMsg: null
    )));

    BaseResponse<UserEntity>? response = await registerUsecase(request);
    switch(response){

      case SuccessBaseResponse<UserEntity>():
        emit(state.copyWith(userState: state.userState?.copyWith(
            data: response.data
        )));
        print(response.data);
      case ErrorBaseResponse<UserEntity>():
        emit(state.copyWith(userState: state.userState?.copyWith(
            errMsg: response.errorMsg,isLoading: false
        )));
        print(response.errorMsg);
    }
  }
}
