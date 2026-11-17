
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/reset_password/password_input_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordFields extends StatelessWidget {
  const ResetPasswordFields({
    super.key,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PasswordInputField(
          controller: newPasswordController,
          label: UiStrings.NewPassword,
          validator: RegexHandler.validatePassword,
        ),

        const SizedBox(height: 25),

        PasswordInputField(
          controller: confirmPasswordController,
          label: UiStrings.ConfirmPassword,
          validator: (value) =>
              RegexHandler.validateConfirmPassword(
                value,
                newPasswordController.text,
              ),
        ),
      ],
    );
  }
}
