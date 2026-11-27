import 'package:dio/dio.dart';
import 'package:exam_app_team_1/core/constants/app_endpoints.dart' show AppEndpoints;
import 'package:exam_app_team_1/features/home/subject/data/models/responses/one_subject_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'subject_exams_api_client.g.dart';

@RestApi()

@LazySingleton()

abstract class SubjectExamsApiClient {
  @factoryMethod
  factory SubjectExamsApiClient(Dio dio) = _SubjectExamsApiClient;
  @GET('${AppEndpoints.getAllSubjects}/{id}')
Future<OneSubjectResponse> getOneSubject(@Path('id') String subjectId);
}