
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:flutter/material.dart';

class RegisterPasswordField extends StatefulWidget {
  const RegisterPasswordField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final FormFieldValidator<String>? validator;

  @override
  State<RegisterPasswordField> createState() =>
      _RegisterPasswordFieldState();
}

class _RegisterPasswordFieldState
    extends State<RegisterPasswordField> {
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isPasswordObscured,
      validator: widget.validator ?? RegexHandler.validatePassword,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: UiStrings.EnterYourPassword,
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () {
            setState(() {
              _isPasswordObscured = !_isPasswordObscured;
            });
          },
        ),
      ),
    );
  }
}
