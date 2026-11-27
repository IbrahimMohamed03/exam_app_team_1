
import 'package:exam_app_team_1/config/base_state/base_state.dart';
import 'package:exam_app_team_1/features/home/subject/domain/entities/subject_entity.dart';

class HomeState{
  final BaseState<List<SubjectEntity>?>? subjectsState;
  HomeState({BaseState<List<SubjectEntity>?>? subjectsState }): subjectsState=subjectsState?? BaseState<List<SubjectEntity>?>();
  HomeState copyWith({BaseState<List<SubjectEntity>?>? subjectsState}){
    return HomeState(
      subjectsState: subjectsState?? this.subjectsState
    );
  }
}