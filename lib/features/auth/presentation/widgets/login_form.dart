import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_state.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool isPasswordObscured = true;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: context.screenHeight * 0.025),

            // Back button and title
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 12),
                Text(
                  UiStrings.Login,
                  style: theme.textTheme.headlineLarge,
                ),
              ],
            ),

            SizedBox(height: context.screenHeight * 0.025),

            // Email
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

            // Password
            TextFormField(
              controller: loginPasswordController,
              obscureText: isPasswordObscured,
              validator: RegexHandler.validatePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: UiStrings.EnterYourPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordObscured = !isPasswordObscured;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: context.screenHeight * 0.015),

            // Remember me and Forgot password
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value ?? false;
                    });
                  },
                ),
                const Text(UiStrings.RememberMe),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.forgotPassword);
                  },
                  child: Text(
                    UiStrings.ForgetPassword,
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
              ],
            ),

            SizedBox(height: context.screenHeight * 0.075),

            // Login button
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final isLoading = state.userState?.isLoading ?? false;

                return SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context.read<AuthCubit>().onEvent(
                                    LoginEvent(
                                      email: loginEmailController.text.trim(),
                                      password: loginPasswordController.text,
                                    ),
                                  );
                            }
                          },
                    child: isLoading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            UiStrings.Login,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                );
              },
            ),

            SizedBox(height: context.screenHeight * 0.02),

            // Sign up link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(UiStrings.DontHaveAnAccount),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.register);
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
