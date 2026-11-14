
import 'package:exam_app_team_1/features/home/data/models/subject.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'one_subject_response.freezed.dart';
part 'one_subject_response.g.dart';

@freezed
abstract class OneSubjectResponse with _$OneSubjectResponse {
  const factory OneSubjectResponse({
    required String message,
    @JsonKey(name: 'category')
    required SubjectModel category,
  }) = _OneSubjectResponse;

  factory OneSubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$OneSubjectResponseFromJson(json);
}