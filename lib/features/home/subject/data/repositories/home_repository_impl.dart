
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/home/subject/data/datasources/home_data_source.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/responses/one_subject_response.dart';
import 'package:exam_app_team_1/features/home/subject/data/models/responses/subject_response.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/subject.dart';
import 'package:exam_app_team_1/config/entities/subject_entity.dart';
import 'package:exam_app_team_1/features/home/subject/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository{
  HomeDataSource homeDataSource;
  HomeRepositoryImpl(this.homeDataSource);

  @override
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects() async{
    final response = await homeDataSource.getAllSubjects();
    switch(response){

      case SuccessBaseResponse<SubjectResponse>():
        final subjects = response.data.subjects
            .map((subject) => subject.toDomain())
            .toList();
        return SuccessBaseResponse<List<SubjectEntity>>(subjects);
      case ErrorBaseResponse<SubjectResponse>():
        return ErrorBaseResponse<List<SubjectEntity>>(errorObj: response.errorObj);

    }
  }

  

}