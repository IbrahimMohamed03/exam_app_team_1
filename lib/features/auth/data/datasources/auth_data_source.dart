import '../models/auth_response.dart';
import '../models/login_request.dart';
import '../models/signup_request.dart';
import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';

abstract class AuthDataSource{
  Future<BaseResponse<AuthResponse>>login (LoginRequest request);
  Future<BaseResponse<AuthResponse>>signup (SignupRequest request);
  Future<void> logout();
}