import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_state.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isRePasswordObscured = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _phoneController.dispose();
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
                  UiStrings.SignUp,
                  style: theme.textTheme.headlineLarge,
                ),
              ],
            ),

            SizedBox(height: context.screenHeight * 0.025),

            // Username
            TextFormField(
              controller: _usernameController,
              validator: RegexHandler.validateUsername,
              decoration: const InputDecoration(
                labelText: UiStrings.UserName,
                hintText: UiStrings.EnterYourUserName,
              ),
            ),

            SizedBox(height: context.screenHeight * 0.02),

            // First Name & Last Name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _firstNameController,
                    validator: (val) => RegexHandler.validateName(val, 'first name'),
                    decoration: const InputDecoration(
                      labelText: UiStrings.FirstName,
                      hintText: UiStrings.EnterFirstName,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _lastNameController,
                    validator: (val) => RegexHandler.validateName(val, 'last name'),
                    decoration: const InputDecoration(
                      labelText: UiStrings.LastName,
                      hintText: UiStrings.EnterLastName,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: context.screenHeight * 0.02),

            // Email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: RegexHandler.validateEmail,
              decoration: const InputDecoration(
                labelText: UiStrings.Email,
                hintText: UiStrings.EnterYourEmail,
              ),
            ),

            SizedBox(height: context.screenHeight * 0.02),

            // Password
            TextFormField(
              controller: _passwordController,
              obscureText: _isPasswordObscured,
              validator: RegexHandler.validatePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: UiStrings.EnterYourPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordObscured = !_isPasswordObscured;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: context.screenHeight * 0.02),

            // Confirm Password
            TextFormField(
              controller: _rePasswordController,
              obscureText: _isRePasswordObscured,
              validator: (val) =>
                  RegexHandler.validateConfirmPassword(val, _passwordController.text),
              decoration: InputDecoration(
                labelText: UiStrings.ConfirmPassword,
                hintText: UiStrings.EnterYourPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isRePasswordObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _isRePasswordObscured = !_isRePasswordObscured;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: context.screenHeight * 0.02),

            // Phone Number
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              validator: RegexHandler.validatePhone,
              decoration: const InputDecoration(
                labelText: UiStrings.PhoneNumber,
                hintText: 'Enter your phone number',
              ),
            ),

            SizedBox(height: context.screenHeight * 0.04),

            // Sign Up button
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
                                    RegisterEvent(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text,
                                      username: _usernameController.text.trim(),
                                      phone: _phoneController.text.trim(),
                                      firstName: _firstNameController.text.trim(),
                                      lastName: _lastNameController.text.trim(),
                                      rePassword: _rePasswordController.text,
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
                            UiStrings.SignUp,
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

            // Already have an account? Sign in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(UiStrings.AlreadyHaveAnAccount),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  child: Text(
                    UiStrings.Login,
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
