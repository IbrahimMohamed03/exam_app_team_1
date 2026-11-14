import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata_model.freezed.dart';
part 'metadata_model.g.dart';

@freezed
abstract class MetadataModel with _$MetadataModel{
  const factory MetadataModel({
    required int currentPage,
    required int numberOfPages,
    required int limit,
  }) = _MetadataModel;

  factory MetadataModel.fromJson(Map<String, dynamic> json) =>
      _$MetadataModelFromJson(json);
}