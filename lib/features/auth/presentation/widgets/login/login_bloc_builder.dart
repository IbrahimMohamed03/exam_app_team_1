import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth/auth_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth/auth_cubit.dart';

class LoginBlocBuilder extends StatelessWidget {
  LoginBlocBuilder({super.key, required this.loginEmailController, required this.loginPasswordController, required this.formKey, required this.rememberMe});
  final GlobalKey<FormState> formKey;
  final TextEditingController loginEmailController ;
  final TextEditingController loginPasswordController;
  final bool rememberMe;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isLoading = state.userState?.isLoading ?? false;

        return SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
              if (formKey.currentState?.validate() ?? false) {
                context.read<AuthCubit>().onEvent(
                  LoginEvent(
                    email: loginEmailController.text.trim(),
                    password: loginPasswordController.text,
                    rememberMe: rememberMe,
                  ),
                );
              }
            },
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
              UiStrings.Login,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
