
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/forgot_password/forgot_password_button.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/forgot_password/forgot_password_email_field.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/forgot_password/forgot_password_header.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/forgot_password/forgot_password_title.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  bool _isTouched = false;
  bool _isValidEmail = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _validateInput(String value) {
    setState(() {
      _isTouched = true;
      _isValidEmail = value.trim().isNotEmpty &&
          RegexHandler.validateEmail(value) == null;
    });
  }

  void _submit() {
    if (!_isValidEmail) return;

    context.read<ForgotPasswordCubit>().onEvent(
      SubmitEmailEvent(
        email: _emailController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emailError = _isTouched && !_isValidEmail
        ? UiStrings.ThisEmailIsNotValid
        : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.screenHeight * 0.02),

            const ForgotPasswordHeader(),

            SizedBox(height: context.screenHeight * 0.03),

            const ForgotPasswordTitle(),

            SizedBox(height: context.screenHeight * 0.04),

            ForgotPasswordEmailField(
              controller: _emailController,
              emailError: emailError,
              onChanged: _validateInput,
            ),

            SizedBox(height: context.screenHeight * 0.075),

            ForgotPasswordButton(
              isValidEmail: _isValidEmail,
              onPressed: _submit,
            ),

            SizedBox(height: context.screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
