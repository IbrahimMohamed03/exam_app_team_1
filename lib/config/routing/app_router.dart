import 'package:exam_app_team_1/config/di/di.dart';
import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/login_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/register_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/verification_code_screen.dart';
import 'package:exam_app_team_1/features/home/presentation/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/splash/splash_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/splash_screen.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<SplashCubit>(),
            child: const SplashScreen(),
          ),
        );

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

    //  الشاشة الأولى: تنشئ الـ Cubit الجديد
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ForgotPasswordCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );

    //  الشاشة الثانية: تستلم نفس الـ Cubit عن طريق arguments
      case Routes.verificationCode:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: settings.arguments as ForgotPasswordCubit,
            child: const VerificationCodeScreen(),
          ),
        );

    //  الشاشة الثالثة: نفس الشيء
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: settings.arguments as ForgotPasswordCubit,
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