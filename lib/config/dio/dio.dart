import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/constants/app_endpoints.dart';

@module
abstract class DioModule{
  @singleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),

      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        error: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        compact: true,
        maxWidth: 90,
      )
    );

    return dio;
  }

}