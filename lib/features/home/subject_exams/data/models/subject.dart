import 'package:exam_app_team_1/features/home/subject/domain/entities/subject_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

@freezed
abstract class SubjectModel with _$SubjectModel {
  const factory SubjectModel({
    @JsonKey(name: "_id")
    required String id,
    required String name,
    required String icon,
    @JsonKey(name: "createdAt")
    required DateTime createdAt,
  }) = _SubjectModel;

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);
}

extension SubjectModelMapper on SubjectModel {
  SubjectEntity toDomain() {
    return SubjectEntity(
      id: id,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }
}