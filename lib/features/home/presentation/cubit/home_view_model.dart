
import 'package:bloc/bloc.dart';
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/home/domain/entities/subject_entity.dart';
import 'package:exam_app_team_1/features/home/domain/usecases/get_subjects_usecase.dart';
import 'package:exam_app_team_1/features/home/presentation/cubit/home_events.dart';
import 'package:exam_app_team_1/features/home/presentation/cubit/home_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState>{
GetSubjectsUsecase _getSubjectsUsecase;
HomeCubit(this._getSubjectsUsecase):super(HomeState());

onEvent(HomeEvents event){
switch(event){

  case SubjectsEvent():
    _getSubjects();
    return;
}
}

Future<void> _getSubjects()async{
  emit(state.copyWith(subjectsState: state.subjectsState?.copyWith(isLoading: true,errMsg: null)));
  BaseResponse<List<SubjectEntity>?> response = await _getSubjectsUsecase();
  switch(response){

    case SuccessBaseResponse<List<SubjectEntity>?>():
      emit(state.copyWith(subjectsState: state.subjectsState?.copyWith(data: response.data,errMsg: null,isLoading: false)));
    case ErrorBaseResponse<List<SubjectEntity>?>():
      emit(state.copyWith(subjectsState: state.subjectsState?.copyWith(errMsg: response.errorMsg,isLoading: false)));

  }

}
}