import 'package:exam_app_team_1/config/models/metadata_model.dart';
import 'package:exam_app_team_1/features/home/data/models/subject.dart';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_response.freezed.dart';
part 'subject_response.g.dart';

@freezed
abstract class SubjectResponse with _$SubjectResponse {
  const factory SubjectResponse({
    @JsonKey(name: "message")
    required String message,

    @JsonKey(name: "metadata")
    required MetadataModel metadata,

    @JsonKey(name: "subjects")
    required List<SubjectModel> subjects,
  }) = _SubjectResponse;

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseFromJson(json);
}