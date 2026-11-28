
import 'package:exam_app_team_1/config/base_state/base_state.dart';
import 'package:exam_app_team_1/config/entities/subject_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/http.dart';

part'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState{
 factory HomeState({
  @Default(BaseState<List<SubjectEntity>>() )
  BaseState<List<SubjectEntity>> subjectsState
 })=_HomeState;
}