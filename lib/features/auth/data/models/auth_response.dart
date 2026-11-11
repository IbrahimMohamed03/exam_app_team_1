import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart';

part 'auth_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthResponse {
  final String? message;
  final String? token;
  final UserModel? user;

  AuthResponse({this.message, this.token, this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}