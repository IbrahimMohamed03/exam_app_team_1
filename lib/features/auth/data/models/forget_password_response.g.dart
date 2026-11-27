// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponse _$ForgetPasswordResponseFromJson(
  Map<String, dynamic> json,
) => ForgetPasswordResponse(
  statusMsg: json['statusMsg'] as String?,
  message: json['message'] as String?,
  token: json['token'] as String?,
);

Map<String, dynamic> _$ForgetPasswordResponseToJson(
  ForgetPasswordResponse instance,
) => <String, dynamic>{
  'statusMsg': instance.statusMsg,
  'message': instance.message,
  'token': instance.token,
};
