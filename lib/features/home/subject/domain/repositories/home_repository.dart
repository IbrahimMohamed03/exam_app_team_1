
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/home/subject/domain/entities/subject_entity.dart';

abstract class HomeRepository{

  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects();
  Future<BaseResponse<SubjectEntity>> getOneSubject(String subjectId);

}