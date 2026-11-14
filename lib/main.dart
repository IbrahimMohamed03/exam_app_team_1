import 'package:exam_app_team_1/config/routing/app_router.dart';
import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/theme/app_theme.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

import 'config/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp( MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  AppRouter appRouter;
   MyApp({super.key,required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      onGenerateRoute: appRouter.generateRoutes,
    );
  }
}

