
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/exams/responses/exam_response.dart';



abstract class SubjectExamsDataSource{
  Future<BaseResponse<ExamResponse>> getExamsBySubject(String subjectId);
}