

import 'package:exam_app_team_1/config/base_state/base_state.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';

class AuthState{
  final BaseState<UserEntity>? userState;

  AuthState({BaseState<UserEntity>? userState}): userState= userState??BaseState<UserEntity>();

  AuthState copyWith({BaseState<UserEntity>? userState}){
    return AuthState(userState: userState?? this.userState);
  }
}