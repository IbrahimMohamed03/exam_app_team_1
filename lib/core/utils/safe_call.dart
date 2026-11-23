import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';

Future<BaseResponse<T>> safeCall<T>(Future<T> Function() apiCall) async {
  try {
    final result = await apiCall();
    return SuccessBaseResponse<T>(result);
  } catch (e) {
    return ErrorBaseResponse<T>(errorObj: e);

  }
}
