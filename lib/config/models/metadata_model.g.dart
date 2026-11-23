// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetadataModel _$MetadataModelFromJson(Map<String, dynamic> json) =>
    _MetadataModel(
      currentPage: (json['currentPage'] as num).toInt(),
      numberOfPages: (json['numberOfPages'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$MetadataModelToJson(_MetadataModel instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };
