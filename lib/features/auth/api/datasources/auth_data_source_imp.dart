import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/features/auth/api/api_clients/auth_api_client.dart';
import 'package:exam_app_team_1/features/auth/data/models/login_request.dart';
import 'package:exam_app_team_1/features/auth/data/models/register_request.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/auth_response.dart';
import '../../data/datasources/auth_data_source.dart';

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImp implements AuthDataSource{

  final AuthApiClient authApiClient;
  AuthDataSourceImp(this.authApiClient);

  @override
  Future<BaseResponse<AuthResponse>> login(LoginRequest request)async{
   try{
     final response = await authApiClient.login(request);
     return SuccessBaseResponse(response);
   }catch(e){
     return ErrorBaseResponse(errorObj: e);
   }
  }

  @override
  Future<BaseResponse<AuthResponse>> register(RegisterRequest request)async{
    try{
      final response = await authApiClient.register(request);
      return SuccessBaseResponse(response);
    }catch(e){
      return ErrorBaseResponse(errorObj: e);
    }

  }


  @override
  Future<void> logout() async {
    await authApiClient.logout();
  }

}