
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:flutter/material.dart';

class RegisterNameFields extends StatelessWidget {
  const RegisterNameFields({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: firstNameController,
            validator: (value) =>
                RegexHandler.validateName(value, 'first name'),
            decoration: const InputDecoration(
              labelText: UiStrings.FirstName,
              hintText: UiStrings.EnterFirstName,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            controller: lastNameController,
            validator: (value) =>
                RegexHandler.validateName(value, 'last name'),
            decoration: const InputDecoration(
              labelText: UiStrings.LastName,
              hintText: UiStrings.EnterLastName,
            ),
          ),
        ),
      ],
    );
  }
}
