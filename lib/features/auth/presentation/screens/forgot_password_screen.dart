
import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/forgot_password/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) =>
      previous.forgotPasswordState != current.forgotPasswordState,
      listener: (context, state) {
        final result = state.forgotPasswordState;

        if (result.errMsg != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result.errMsg!),
              backgroundColor: AppColors.error,
            ),
          );
        } else if (result.data != null) {
          context.push(Routes.verificationCode);
        }
      },
      child: const Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: ForgotPasswordForm(),
        ),
      ),
    );
  }
}
