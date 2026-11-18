import 'package:dio/dio.dart';
import 'package:exam_app_team_1/core/storage/token_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;

  AuthInterceptor(this._tokenStorage);

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final token = await _tokenStorage.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers['token'] = token;
    }

    handler.next(options);
  }
}