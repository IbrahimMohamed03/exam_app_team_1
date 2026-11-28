import 'package:exam_app_team_1/config/di/di.dart';
import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/nav_bar/main_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/splash/splash_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/login_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/register_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/splash_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/verification_code_screen.dart';
import 'package:exam_app_team_1/features/fake_profile_screen.dart';
import 'package:exam_app_team_1/features/home/subject/presentation/cubit/home_events.dart';
import 'package:exam_app_team_1/features/home/subject/presentation/cubit/home_view_model.dart';
import 'package:exam_app_team_1/features/home/subject/presentation/screens/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<SplashCubit>(),
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: const RegisterScreen(),
        ),
      ),

      ShellRoute(
        builder: (context, state, child) => BlocProvider(
          create: (_) => getIt<ForgotPasswordCubit>(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: Routes.forgotPassword,
            builder: (context, state) => const ForgotPasswordScreen(),
          ),
          GoRoute(
            path: Routes.verificationCode,
            builder: (context, state) => const VerificationCodeScreen(),
          ),
          GoRoute(
            path: Routes.resetPassword,
            builder: (context, state) => const ResetPasswordScreen(),
          ),
        ],
      ),

      // GoRoute(
      //   path: Routes.homeScreen,
      //   builder: (context, state) =>  BlocProvider(
      //       create: (_)=>getIt<HomeCubit>()..onEvent(SubjectsEvent()),
      //     child: HomeScreen(),
      //   ),
      // ),
      
      ShellRoute(
        builder: (context,state,child){
          return MainScaffold(child: child);
        },
          routes: [
            GoRoute(
                path: Routes.homeScreen,
              builder: (context, state) => BlocProvider(
                create: (_) => getIt<HomeCubit>()..onEvent(SubjectsEvent()),
                child: HomeScreen(),
              ),
            ),
            GoRoute(
              path: Routes.profile,
              builder: (context,state)=>  ProfileScreen()
            )

      ])
    ],
  );
}