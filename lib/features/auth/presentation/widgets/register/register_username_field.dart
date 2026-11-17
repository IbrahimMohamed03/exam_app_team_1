
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:flutter/material.dart';

class RegisterUsernameField extends StatelessWidget {
  const RegisterUsernameField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: RegexHandler.validateUsername,
      decoration: const InputDecoration(
        labelText: UiStrings.UserName,
        hintText: UiStrings.EnterYourUserName,
      ),
    );
  }
}
