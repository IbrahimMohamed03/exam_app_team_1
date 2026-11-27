import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/core/utils/safe_call.dart';
import 'package:exam_app_team_1/features/home/subject/data/datasources/home_data_source.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/responses/one_subject_response.dart';
import 'package:exam_app_team_1/features/home/subject_exams/api/api_clients/subject_exams_api_client.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/data_sources/subject_exams_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeDataSource)
class SubjectExamDataSourceImp implements SubjectExamsDataSource {
  final SubjectExamsApiClient subjectExamsApiClient;

  SubjectExamDataSourceImp(this.subjectExamsApiClient);



  @override
  Future<BaseResponse<OneSubjectResponse>> getOneSubject(String subjectId) {
    return safeCall(() => subjectExamsApiClient.getOneSubject(subjectId));
  }
}
