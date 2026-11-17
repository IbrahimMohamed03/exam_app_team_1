

import 'package:exam_app_team_1/config/base_state/base_state.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState{
  const factory AuthState({
    @Default(BaseState<UserEntity>())
  BaseState<UserEntity>userState,
}) = _AuthState;
}