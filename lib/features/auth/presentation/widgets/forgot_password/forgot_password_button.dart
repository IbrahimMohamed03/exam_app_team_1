
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
    required this.isValidEmail,
    required this.onPressed,
  });

  final bool isValidEmail;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) =>
      previous.forgotPasswordState.isLoading !=
          current.forgotPasswordState.isLoading,
      builder: (context, state) {
        final isLoading = state.forgotPasswordState.isLoading;

        return SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isValidEmail && !isLoading ? onPressed : null,
            child: isLoading
                ? const SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
                : const Text(
              UiStrings.Continue,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
