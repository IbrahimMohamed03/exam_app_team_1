

import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/home/domain/entities/subject_entity.dart';
import 'package:exam_app_team_1/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOneSubjectUsecase {
  final HomeRepository homeRepository;

  GetOneSubjectUsecase(this.homeRepository);

  Future<BaseResponse<SubjectEntity>> call(String subjectId) async {
    return await homeRepository.getOneSubject(subjectId);
  }
}