import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password_cubit.dart'; //
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password_events.dart'; //
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password_state.dart'; //
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; //

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  bool _isNewPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ForgotPasswordCubit>().onEvent(
        SubmitResetPasswordEvent(newPassword: _newPasswordController.text),
      );
    }
  }

  InputDecoration _fieldDecoration({
    required String label,
    required bool obscured,
    required VoidCallback onToggle,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: UiStrings.EnterYourPassword,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      suffixIcon: IconButton(
        icon: Icon(
          obscured
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: AppColors.textSecondary,
        ),
        onPressed: onToggle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (p, c) => p.resetPasswordState != c.resetPasswordState,
      listener: (context, state) {
        final s = state.resetPasswordState;
        if (s?.errMsg != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(s!.errMsg!), backgroundColor: Colors.red),
          );
        } else if (s?.data != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password reset successfully! Please log in.'),
              backgroundColor: AppColors.success,
            ),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.login,
                (route) => false,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.resetPasswordState?.isLoading ?? false; //

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.screenHeight * 0.02),

                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 18,
                                  color: AppColors.textPrimary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Password',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: context.screenHeight * 0.03),

                    Center(
                      child: Text(
                        UiStrings.ResetPassword,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: context.screenHeight * 0.015),

                    Center(
                      child: Text(
                        UiStrings.PasswordMust,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),

                    SizedBox(height: context.screenHeight * 0.04),

                    TextFormField(
                      controller: _newPasswordController,
                      obscureText: _isNewPasswordObscured,
                      validator: RegexHandler.validatePassword,
                      decoration: _fieldDecoration(
                        label: UiStrings.NewPassword,
                        obscured: _isNewPasswordObscured,
                        onToggle: () => setState(() {
                          _isNewPasswordObscured = !_isNewPasswordObscured;
                        }),
                      ),
                    ),

                    SizedBox(height: context.screenHeight * 0.025),

                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _isConfirmPasswordObscured,
                      validator: (val) => RegexHandler.validateConfirmPassword(
                        val,
                        _newPasswordController.text,
                      ),
                      decoration: _fieldDecoration(
                        label: UiStrings.ConfirmPassword,
                        obscured: _isConfirmPasswordObscured,
                        onToggle: () => setState(() {
                          _isConfirmPasswordObscured =
                          !_isConfirmPasswordObscured;
                        }),
                      ),
                    ),

                    SizedBox(height: context.screenHeight * 0.075),

                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _onSubmit,
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
                          UiStrings.Continue,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: context.screenHeight * 0.03),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}