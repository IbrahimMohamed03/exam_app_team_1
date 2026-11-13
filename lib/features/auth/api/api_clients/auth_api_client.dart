import 'package:dio/dio.dart';
import 'package:exam_app_team_1/core/constants/app_endpoints.dart';
import 'package:exam_app_team_1/features/auth/data/models/login_request.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../data/models/auth_response.dart';
import '../../data/models/register_request.dart';

part 'auth_api_client.g.dart';

@RestApi()
@LazySingleton()

abstract class AuthApiClient{
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(AppEndpoints.login)
  Future<AuthResponse> login(@Body() LoginRequest request);

  @POST(AppEndpoints.register)
  Future<AuthResponse> register(@Body() RegisterRequest request);

  @GET(AppEndpoints.logout)
  Future<AuthResponse> logout();
}