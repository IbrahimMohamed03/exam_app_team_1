// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubjectResponse _$SubjectResponseFromJson(Map<String, dynamic> json) =>
    _SubjectResponse(
      message: json['message'] as String,
      metadata: MetadataModel.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectResponseToJson(_SubjectResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'subjects': instance.subjects,
    };
