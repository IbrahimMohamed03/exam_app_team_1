import 'package:dio/dio.dart';
import 'package:exam_app_team_1/core/constant/app_endpoints.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/signup_request.dart';

part 'home_api_client.g.dart';

@RestApi()
@LazySingleton()

abstract class AuthApiClient{
  @factoryMethod
  factory AuthApiClient(Dio dio,{String? baseUrl}) = _AuthApiClient;

  @POST(AppEndpoints.login)
  Future<AuthResponse> login(@Body() loginRequest request);

  @POST(AppEndpoints.signup)
  Future<AuthResponse> signup(@Body() SignupRequest request);

  @GET(AppEndpoints.logout)
  Future<AuthResponse> logout();
}