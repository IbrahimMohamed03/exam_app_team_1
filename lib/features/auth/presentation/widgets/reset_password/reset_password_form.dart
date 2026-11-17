
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/reset_password/reset_password_button.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/reset_password/reset_password_fields.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/reset_password/reset_password_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _newPasswordController =
  TextEditingController();

  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    context.read<ForgotPasswordCubit>().onEvent(
      SubmitResetPasswordEvent(
        newPassword: _newPasswordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.screenHeight * 0.02),

                const ResetPasswordHeader(),

                SizedBox(height: context.screenHeight * 0.03),

                const ResetPasswordTitle(),

                SizedBox(height: context.screenHeight * 0.04),

                ResetPasswordFields(
                  newPasswordController: _newPasswordController,
                  confirmPasswordController: _confirmPasswordController,
                ),

                SizedBox(height: context.screenHeight * 0.075),

                ResetPasswordButton(
                  onPressed: _onSubmit,
                ),

                SizedBox(height: context.screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
