import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/home/subject_exams/domain/entities/exam_entity.dart';

abstract class SubjectExamsRepository{

  Future<BaseResponse<List<ExamEntity>>> getExamsBySubject(String subjectId);

}