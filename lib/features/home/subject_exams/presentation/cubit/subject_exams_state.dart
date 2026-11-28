import 'package:exam_app_team_1/config/base_state/base_state.dart';
import 'package:exam_app_team_1/features/home/subject_exams/domain/entities/exam_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_exams_state.freezed.dart';

@freezed
abstract class SubjectExamsState with _$SubjectExamsState {
  const factory SubjectExamsState({
    required BaseState<ExamEntity> examState,
  }) = _SubjectExamsState;
}