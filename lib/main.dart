import 'package:exam_app_team_1/core/theme/app_theme.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home:  LoginForm(),
    );
  }
}

