import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_state.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        final userState = state.userState;

        if (userState?.errMsg != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(userState!.errMsg!),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (userState?.data != null) {
          Navigator.pushReplacementNamed(context, Routes.homeScreen);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: RegisterForm(),
            ),
          ),
        );
      },
    );
  }
}
