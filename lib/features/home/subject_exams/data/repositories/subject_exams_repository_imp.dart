
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/data_sources/subject_exams_data_source.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/exams/responses/exam_response.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/responses/one_subject_response.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/subject.dart';
import 'package:exam_app_team_1/config/entities/subject_entity.dart';
import 'package:exam_app_team_1/features/home/subject_exams/domain/entities/exam_entity.dart';
import 'package:exam_app_team_1/features/home/subject_exams/domain/repositories/subject_exams_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubjectExamsRepository)
class SubjectExamsRepositoryImp implements SubjectExamsRepository{
  SubjectExamsDataSource subjectExamsDataSource;
  SubjectExamsRepositoryImp(this.subjectExamsDataSource);

  @override
  Future<BaseResponse<List<ExamEntity>>> getExamsBySubject(String subjectId)async {
    final response = await subjectExamsDataSource.getExamsBySubject(subjectId);
    switch(response){

      case SuccessBaseResponse<ExamResponse>():
        final exams = response.data.exams.map((exam){
          return exam.toDomain();
        }).toList();

        return SuccessBaseResponse<List<ExamEntity>>(exams);
      case ErrorBaseResponse<ExamResponse>():
        return ErrorBaseResponse<List<ExamEntity>>(errorObj: response.errorObj);

    }
  }

}