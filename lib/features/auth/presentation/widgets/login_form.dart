
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  bool rememberMe = false;

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
                'Login',
                style: theme.textTheme.headlineLarge,
              ),
            ],
          ),

          SizedBox(height: context.screenHeight * 0.025),

          // Email
          TextField(
            controller: loginEmailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
          ),

          SizedBox(height: context.screenHeight * 0.025),

          // Password
          TextField(
            controller: loginPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
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

              const Text('Remember me'),

              const Spacer(),

              GestureDetector(
                onTap: () {
                  // TODO
                },
                child: Text(
                  'Forgot password?',
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
                    context.read<AuthCubit>().onEvent(
                      LoginEvent(
                        email: loginEmailController.text.trim(),
                        password: loginPasswordController.text,
                      ),
                    );
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
                    'Login',
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

          // Sign up
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account? "),

              GestureDetector(
                onTap: () {
                  // TODO
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
