
import 'package:exam_app_team_1/config/di/di.dart';
import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/screens/login_screen.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/login_form.dart';
import 'package:exam_app_team_1/features/home/presentation/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter{
  Route? generateRoutes(RouteSettings settings){
    switch(settings.name){
      case Routes.login:
        return MaterialPageRoute(
            builder: (_)=>BlocProvider(
          create: (_)=>getIt<AuthCubit>(),
              child: LoginScreen(),));

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context)=>HomeScreen());
      default:
        return null;
    }
  }
}