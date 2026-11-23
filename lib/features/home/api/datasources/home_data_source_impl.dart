import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/core/utils/safe_call.dart';
import 'package:exam_app_team_1/features/home/api/api_client/home_api_client.dart';
import 'package:exam_app_team_1/features/home/data/datasources/remote/home_data_source.dart';
import 'package:exam_app_team_1/features/home/data/models/responses/one_subject_response.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/responses/subject_response.dart';

@LazySingleton(as: HomeDataSource)
class HomeDataSourceImp implements HomeDataSource {
  final HomeApiClient homeApiClient;

  HomeDataSourceImp(this.homeApiClient);

  @override
  Future<BaseResponse<SubjectResponse>> getAllSubjects() {
    return safeCall(() => homeApiClient.getAllSubjects());
  }


  @override
  Future<BaseResponse<OneSubjectResponse>> getOneSubject(String subjectId) {
    return safeCall(() => homeApiClient.getOneSubject(subjectId));
  }
}
