
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/config/entities/subject_entity.dart';
import 'package:exam_app_team_1/features/home/subject/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSubjectsUsecase {
  final HomeRepository homeRepository;

  GetSubjectsUsecase(this.homeRepository);

  Future<BaseResponse<List<SubjectEntity>?>> call() async {
    return await homeRepository.getAllSubjects();
  }
}