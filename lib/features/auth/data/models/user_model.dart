import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app_team_1/features/auth/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? createdAt;

  UserModel({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toDomain() {
    return UserEntity(
      id: id ?? '',
      username: username ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      phone: phone ?? '',
      role: role ?? '',
      isVerified: isVerified ?? false,
      createdAt: createdAt ?? '',
    );
  }
}