
import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/reset_password/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) =>
      previous.resetPasswordState != current.resetPasswordState,
      listener: (context, state) {
        final resetState = state.resetPasswordState;

        if (resetState.errMsg != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(resetState.errMsg!),
              backgroundColor: Colors.red,
            ),
          );
        } else if (resetState.data != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                UiStrings.PasswordResetSuccess,
              ),
              backgroundColor: AppColors.success,
            ),
          );

          context.go(Routes.login);
        }
      },
      child: const ResetPasswordForm(),
    );
  }
}
