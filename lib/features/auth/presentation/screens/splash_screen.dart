import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/splash/splash_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/splash/splash_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().onEvent(CheckLoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listenWhen: (p, c) => p.loginState != c.loginState,
      listener: (context, state) {
        final isLoggedIn = state.loginState.data;
        if (isLoggedIn == null) return; // لسه بيفحص

        Navigator.pushReplacementNamed(
          context,
          isLoggedIn ? Routes.homeScreen : Routes.login,
        );
      },
      child: const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      ),
    );
  }
}