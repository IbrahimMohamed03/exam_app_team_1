import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginOptionsRow extends StatelessWidget {
  const LoginOptionsRow({
    super.key,
    required this.rememberMe,
    required this.onRememberMeChanged,
  });

  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) {
            onRememberMeChanged(value ?? false);
          },
        ),
        Text(
          UiStrings.RememberMe,
          style: theme.textTheme.titleSmall
              ?.copyWith(color: AppColors.appBarTitle),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.push(Routes.forgotPassword);
          },
          child: Text(
            UiStrings.ForgetPassword,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}