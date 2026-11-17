
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:flutter/material.dart';

class ForgotPasswordTitle extends StatelessWidget {
  const ForgotPasswordTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Center(
          child: Text(
            UiStrings.ForgetPassword,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.appBarTitle,
              fontWeight: FontWeight.w500,
              fontSize: 18
            ),
          ),
        ),
        SizedBox(height: context.screenHeight * 0.015),
        Center(
          child: Text(
            UiStrings.PleaseEnterYourEmailAssociated,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
