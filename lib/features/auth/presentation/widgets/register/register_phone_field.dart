
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:flutter/material.dart';

class RegisterPhoneField extends StatelessWidget {
  const RegisterPhoneField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: RegexHandler.validatePhone,
      decoration: const InputDecoration(
        labelText: UiStrings.PhoneNumber,
        hintText: 'Enter your phone number',
      ),
    );
  }
}
