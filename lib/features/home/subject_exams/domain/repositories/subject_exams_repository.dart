import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/config/entities/subject_entity.dart';

abstract class SubjectExamsRepository{

  Future<BaseResponse<SubjectEntity>> getOneSubject(String subjectId);

}