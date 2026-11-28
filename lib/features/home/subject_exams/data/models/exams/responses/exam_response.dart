import 'package:exam_app_team_1/features/home/subject_exams/data/models/exams/exam.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:exam_app_team_1/config/models/metadata_model.dart';

part 'exam_response.freezed.dart';
part 'exam_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class ExamResponse with _$ExamResponse {
  const factory ExamResponse({
    @JsonKey(name: "message")
    required String message,

    @JsonKey(name: "metadata")
    required MetadataModel metadata,

    @JsonKey(name: "exams")
    required List<Exam> exams,
  }) = _ExamResponse;

  factory ExamResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseFromJson(json);
}