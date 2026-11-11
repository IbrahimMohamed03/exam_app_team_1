
import 'package:dio/dio.dart';
import 'package:exam_app_team_1/core/constant/api_constants.dart';

sealed class BaseResponse<T>{}

class SuccessBaseResponse<T> extends BaseResponse<T> {
  T data;
  SuccessBaseResponse(this.data);
}

class ErrorBaseResponse<T>  extends BaseResponse<T> {
  String errorMsg;
  Object? errorObj;
  ErrorBaseResponse({this.errorObj }):errorMsg= errorObj==null? ApiConstants.defaultErrorMsg : _getErrorMsg(errorObj);

  static String _getErrorMsg(Object? errorObj) {
    if (errorObj is DioException) {
      switch (errorObj.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return "No Internet";

        case DioExceptionType.badCertificate:
          return "Bad Certificate";

        case DioExceptionType.badResponse:
          int? statusCode = errorObj.response?.statusCode;
          return _getStatusCode(statusCode);

        case DioExceptionType.cancel:
          return "Request cancelled";

        case DioExceptionType.unknown:
          return "Unknown error";

        case DioExceptionType.transformTimeout:
          return "Request transformation timed out";
      }


    }

    return ApiConstants.defaultErrorMsg;
  }

  static String _getStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad Request";
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return "Not Found";
      case 405:
        return "Method Not Allowed";
      case 408:
        return "Request Timeout";
      case 422:
        return "Unprocessable Entity";
      case 429:
        return "Too Many Requests";
      case 500:
        return "Internal Server Error";
      case 502:
        return "Bad Gateway";
      case 503:
        return "Service Unavailable";
      case 504:
        return "Gateway Timeout";
      default:
        return ApiConstants.defaultErrorMsg;
    }
  }
}