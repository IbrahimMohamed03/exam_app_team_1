import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password_cubit.dart'; //
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password_events.dart'; //
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password_state.dart'; //
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; //

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  static const int _codeLength = 6; //  الكود 6 أرقام

  final List<TextEditingController> _controllers =
  List.generate(_codeLength, (_) => TextEditingController()); //
  final List<FocusNode> _focusNodes =
  List.generate(_codeLength, (_) => FocusNode()); //

  bool _hasError = false;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _currentCode =>
      _controllers.map((controller) => controller.text).join();

  //  معدّلة: setState دايماً + 6 خانات
  void _onDigitChanged(int index, String value) {
    setState(() => _hasError = false);

    if (value.isNotEmpty && index < _codeLength - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    if (_currentCode.length == _codeLength) {
      _verifyCode();
    }
  }


  void _verifyCode() {
    final cubit = context.read<ForgotPasswordCubit>();
    if (cubit.state.verifyCodeState?.isLoading ?? false) return; //
    cubit.onEvent(VerifyResetCodeEvent(resetCode: _currentCode));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listenWhen: (p, c) => p.verifyCodeState != c.verifyCodeState,
          listener: (context, state) {
            final s = state.verifyCodeState;
            if (s?.errMsg != null) {
              setState(() => _hasError = true);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(s!.errMsg!),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (s?.data != null) {
              Navigator.pushNamed(
                context,
                Routes.resetPassword,
                arguments: context.read<ForgotPasswordCubit>(),
              );
            }
          },
        ),
        BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listenWhen: (p, c) => p.forgotPasswordState != c.forgotPasswordState,
          listener: (context, state) {
            final s = state.forgotPasswordState;
            if (s?.errMsg != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(s!.errMsg!),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (s?.data != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Verification code resent!')),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    'Verification code',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: context.screenHeight * 0.015),

                Center(
                  child: Column(
                    children: [
                      Text(
                        UiStrings.EmailVerification,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        UiStrings.PleaseEnterYourCode,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: context.screenHeight * 0.04),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    _codeLength,
                        (index) => SizedBox(
                      width: 48,
                      height: 56,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                        onChanged: (val) => _onDigitChanged(index, val),
                        decoration: InputDecoration(
                          counterText: '',
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: _hasError
                                  ? AppColors.error
                                  : AppColors.border,
                              width: _hasError ? 1.5 : 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: _hasError
                                  ? AppColors.error
                                  : AppColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                if (_hasError) ...[
                  const SizedBox(height: 12),
                  const Center(
                    child: Text(
                      UiStrings.InvalidCode,
                      style: TextStyle(
                        color: AppColors.error,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],

                SizedBox(height: context.screenHeight * 0.04),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      UiStrings.DidntReceiveCode,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        final cubit = context.read<ForgotPasswordCubit>();
                        cubit.onEvent(SubmitEmailEvent(email: cubit.state.email));
                      },
                      child: Text(
                        'Resend',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: context.screenHeight * 0.075),

                BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                  builder: (context, state) {
                    final isLoading = state.verifyCodeState?.isLoading ?? false;
                    return SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (_currentCode.length == _codeLength &&
                            !isLoading)
                            ? _verifyCode
                            : null,
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
                    );
                  },
                ),

                SizedBox(height: context.screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}