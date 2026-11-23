import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/login/login_bloc_builder.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/login/login_options_row.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/login/login_password_field.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  bool rememberMe = false;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: context.screenHeight * 0.025),

            Row(
              children: [
                const SizedBox(width: 12),
                Text(
                  UiStrings.Login,
                  style: theme.textTheme.headlineLarge,
                ),
              ],
            ),

            SizedBox(height: context.screenHeight * 0.025),

            TextFormField(
              controller: loginEmailController,
              keyboardType: TextInputType.emailAddress,
              validator: RegexHandler.validateEmail,
              decoration: const InputDecoration(
                labelText: UiStrings.Email,
                hintText: UiStrings.EnterYourEmail,
              ),
            ),

            SizedBox(height: context.screenHeight * 0.025),
            LoginPasswordField(controller: loginPasswordController),
            SizedBox(height: context.screenHeight * 0.015),

            LoginOptionsRow(
              rememberMe: rememberMe,
              onRememberMeChanged: (val) {
                setState(() {
                  rememberMe = val;
                });
              },
            ),

            SizedBox(height: context.screenHeight * 0.075),

            LoginBlocBuilder(
              loginPasswordController: loginPasswordController,
              loginEmailController: loginEmailController,
              formKey: _formKey,
              rememberMe: rememberMe,
              onFailedSubmit: () {
                if (_autovalidateMode != AutovalidateMode.onUserInteraction) {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.onUserInteraction;
                  });
                }
              },
            ),

            SizedBox(height: context.screenHeight * 0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  UiStrings.DontHaveAnAccount,
                  style: theme.textTheme.headlineSmall,
                ),
                GestureDetector(
                  onTap: () {
                    context.push(Routes.register);
                  },
                  child: Text(
                    UiStrings.SignUp,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: context.screenHeight * 0.025),
          ],
        ),
      ),
    );
  }
}
