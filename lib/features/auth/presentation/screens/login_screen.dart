
import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
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
        child: Scaffold(
          body: SafeArea(
            child: LoginForm(),
          ),
        ),

    );
  }
}
