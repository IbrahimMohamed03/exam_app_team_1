import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/ui_strings.dart';
import '../cubit/auth/auth_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        final userState = state.userState;

        if (userState.data != null) {
          final messenger = ScaffoldMessenger.of(context);
          messenger.clearSnackBars();
          messenger.showSnackBar(
            const SnackBar(
              content: Text(UiStrings.AccountCreated),
              backgroundColor: Colors.green,
            ),
          );
          context.go(Routes.login);
        } else if (userState.errMsg != null) {
          final messenger = ScaffoldMessenger.of(context);
          messenger.clearSnackBars();
          messenger.showSnackBar(
            SnackBar(
              content: Text(userState.errMsg!),
              backgroundColor: Colors.red,
            ),
          );
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
