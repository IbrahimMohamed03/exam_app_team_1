import 'package:exam_app_team_1/features/home/subject_exams/domain/entities/exam_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@freezed
abstract class Exam with _$Exam {
  const Exam._();

  const factory Exam({
    @JsonKey(name: '_id') required String id,
    required String title,
    required int duration,
    required String subject,
    required int numberOfQuestions,
    required bool active,
    required DateTime createdAt,
  }) = _Exam;

  factory Exam.fromJson(Map<String, dynamic> json) =>
      _$ExamFromJson(json);

  ExamEntity toDomain() {
    return ExamEntity(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
      createdAt: createdAt,
    );
  }
}