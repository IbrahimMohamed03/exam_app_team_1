import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/constants/app_endpoints.dart';

@module
abstract class DioModule{
  @singleton
  Dio get dio => Dio(
      BaseOptions(
        baseUrl: AppEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
  );
}