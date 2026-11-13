

import 'package:bloc/bloc.dart';
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/data/models/login_request.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app_team_1/features/auth/domain/params/login_params.dart';
import 'package:exam_app_team_1/features/auth/domain/params/register_params.dart';
import 'package:exam_app_team_1/features/auth/domain/usecases/login_usecase.dart';
import 'package:exam_app_team_1/features/auth/domain/usecases/register_usecase.dart';
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

  AuthCubit(this.loginUsecase,this.registerUsecase):super(AuthState()){

  }

  Future<void> login(String email, String password)async{
    final request = LoginParams(email: email, password: password);


    emit(state.copyWith(userState: state.userState?.copyWith(
      isLoading: true,errMsg: null
    )));

    BaseResponse<UserEntity>? response = await loginUsecase(request);
    switch(response){

      case SuccessBaseResponse<UserEntity>():
        emit(state.copyWith(userState: state.userState?.copyWith(
            data: response.data
        )));
      case ErrorBaseResponse<UserEntity>():
        emit(state.copyWith(userState: state.userState?.copyWith(
            errMsg: response.errorMsg,isLoading: false
        )));
    }
  }

  Future<void> register(String email,String password,String username,String phone, String firstName, String lastName,String rePassword)async{

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
      case ErrorBaseResponse<UserEntity>():
        emit(state.copyWith(userState: state.userState?.copyWith(
            errMsg: response.errorMsg,isLoading: false
        )));
    }
  }
}
