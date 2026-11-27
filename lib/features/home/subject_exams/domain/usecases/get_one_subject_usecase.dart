

import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/config/entities/subject_entity.dart';
import 'package:exam_app_team_1/features/home/subject_exams/domain/repositories/subject_exams_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOneSubjectUsecase {
  final SubjectExamsRepository subjectExamsRepository;

  GetOneSubjectUsecase(this.subjectExamsRepository);

  Future<BaseResponse<SubjectEntity>> call(String subjectId) async {
    return await subjectExamsRepository.getOneSubject(subjectId);
  }
}