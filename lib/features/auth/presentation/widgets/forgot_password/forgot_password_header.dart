
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:flutter/material.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: AppColors.appBarTitle,
                ),
                const SizedBox(width: 4),
                Text(
                  UiStrings.password,
                  style: TextStyle(
                    color: AppColors.appBarTitle,
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
