
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/responses/one_subject_response.dart';
import 'package:exam_app_team_1/features/home/subject/data/models/responses/subject_response.dart';


abstract class SubjectExamsDataSource{
  Future<BaseResponse<OneSubjectResponse>> getOneSubject(String subjectId);
}