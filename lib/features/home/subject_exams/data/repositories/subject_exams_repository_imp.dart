
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/data_sources/subject_exams_data_source.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/responses/one_subject_response.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/subject.dart';
import 'package:exam_app_team_1/config/entities/subject_entity.dart';
import 'package:exam_app_team_1/features/home/subject_exams/domain/repositories/subject_exams_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubjectExamsRepository)
class SubjectExamsRepositoryImp implements SubjectExamsRepository{
  SubjectExamsDataSource subjectExamsDataSource;
  SubjectExamsRepositoryImp(this.subjectExamsDataSource);

  @override
  Future<BaseResponse<SubjectEntity>> getOneSubject(String subjectId)async {
    final response = await subjectExamsDataSource.getOneSubject(subjectId);
    switch(response){

      case SuccessBaseResponse<OneSubjectResponse>():
        final subject = response.data.category.toDomain();

        return SuccessBaseResponse<SubjectEntity>(subject);
      case ErrorBaseResponse<OneSubjectResponse>():
        return ErrorBaseResponse<SubjectEntity>(errorObj: response.errorObj);

    }
  }

}