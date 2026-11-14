import 'package:exam_app_team_1/config/di/di.dart';
import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/login_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/register_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/verification_code_screen.dart';
import 'package:exam_app_team_1/features/home/presentation/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthCubit>(),
            child: const RegisterScreen(),
          ),
        );

      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );

      case Routes.verificationCode:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthCubit>(),
            child: const VerificationCodeScreen(),
          ),
        );

      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthCubit>(),
            child: const ResetPasswordScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        return null;
    }
  }
}
