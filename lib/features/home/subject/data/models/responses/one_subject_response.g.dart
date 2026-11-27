// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OneSubjectResponse _$OneSubjectResponseFromJson(Map<String, dynamic> json) =>
    _OneSubjectResponse(
      message: json['message'] as String,
      category: SubjectModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OneSubjectResponseToJson(_OneSubjectResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'category': instance.category,
    };
