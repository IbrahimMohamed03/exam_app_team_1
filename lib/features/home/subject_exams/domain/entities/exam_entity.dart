
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_entity.freezed.dart';

@freezed
abstract class ExamEntity with _$ExamEntity {
  const factory ExamEntity({
    required String id,
    required String title,
    required int duration,
    required String subject,
    required int numberOfQuestions,
    required bool active,
    required DateTime createdAt,
  }) = _ExamEntity;
}