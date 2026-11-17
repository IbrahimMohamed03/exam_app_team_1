
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationContinueButton extends StatelessWidget {
  final String currentCode;
  final int codeLength;
  final VoidCallback onVerify;

  const VerificationContinueButton({
    super.key,
    required this.currentCode,
    required this.codeLength,
    required this.onVerify,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        final isLoading = state.verifyCodeState?.isLoading ?? false;

        return SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: currentCode.length == codeLength && !isLoading
                ? onVerify
                : null,
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
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
