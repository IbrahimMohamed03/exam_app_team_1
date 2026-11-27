
import 'package:dio/dio.dart';
import 'package:exam_app_team_1/core/constants/app_endpoints.dart';
import 'package:exam_app_team_1/features/home/subject/data/models/responses/one_subject_response.dart';
import 'package:exam_app_team_1/features/home/subject/data/models/responses/subject_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'home_api_client.g.dart';

@RestApi()
@LazySingleton()
abstract class HomeApiClient{
@factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;
@GET(AppEndpoints.getAllSubjects)
  Future<SubjectResponse> getAllSubjects();


}
