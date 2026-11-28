import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/core/utils/safe_call.dart';
import 'package:exam_app_team_1/features/home/subject/api/api_clients/home_api_client.dart';
import 'package:exam_app_team_1/features/home/subject/data/datasources/home_data_source.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/responses/one_subject_response.dart';
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


}
