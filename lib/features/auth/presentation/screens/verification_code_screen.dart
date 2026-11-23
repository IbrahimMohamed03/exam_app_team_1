
import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/verification_code/resend_code_section.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/verification_code/verification_code_fields.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/verification_code/verification_continue_button.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/verification_code/verification_error_message.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/verification_code/verification_header.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/verification_code/verification_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() =>
      _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  static const int _codeLength = 6;

  final List<TextEditingController> _controllers = List.generate(_codeLength, (_) => TextEditingController());

  final List<FocusNode> _focusNodes = List.generate(_codeLength, (_) => FocusNode());

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
    if (cubit.state.verifyCodeState?.isLoading ?? false) return;

    cubit.onEvent(
      VerifyResetCodeEvent(resetCode: _currentCode),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listenWhen: (p, c) => p.verifyCodeState != c.verifyCodeState,
          listener: (context, state) {
            final s = state.verifyCodeState;

            if (s?.errMsg != null) {
              setState(() => _hasError = true);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(s!.errMsg!), backgroundColor: Colors.red,
                ),
              );
            } else if (s?.data != null) {
              context.push(Routes.resetPassword);
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
                const SnackBar(
                  content: Text(UiStrings.VerificationCodeResent),
                ),
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

                const VerificationHeader(),

                SizedBox(height: context.screenHeight * 0.03),

                const VerificationTitle(),

                SizedBox(height: context.screenHeight * 0.04),

                VerificationCodeFields(controllers: _controllers, focusNodes: _focusNodes, hasError: _hasError, onDigitChanged: _onDigitChanged,
                ),

                if (_hasError) ...[
                  const SizedBox(height: 12), const VerificationErrorMessage(),
                ],

                SizedBox(height: context.screenHeight * 0.04),

                const ResendCodeSection(),

                SizedBox(height: context.screenHeight * 0.075),

                VerificationContinueButton(currentCode: _currentCode, codeLength: _codeLength, onVerify: _verifyCode,
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
