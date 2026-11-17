
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:flutter/material.dart';

class VerificationErrorMessage extends StatelessWidget {
  const VerificationErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        UiStrings.InvalidCode,
        style: TextStyle(
          color: AppColors.error,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
