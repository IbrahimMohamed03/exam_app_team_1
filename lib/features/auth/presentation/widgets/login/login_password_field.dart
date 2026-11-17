
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:flutter/material.dart';

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<LoginPasswordField> createState() =>
      _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isPasswordObscured,
      validator: RegexHandler.validatePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: UiStrings.EnterYourPassword,
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () {
            setState(() {
              isPasswordObscured = !isPasswordObscured;
            });
          },
        ),
      ),
    );
  }
}
