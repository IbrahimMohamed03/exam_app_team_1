
import 'package:exam_app_team_1/config/routing/routes.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterLoginLink extends StatelessWidget {
  const RegisterLoginLink({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(UiStrings.AlreadyHaveAnAccount,style: theme.textTheme.headlineSmall,),
        GestureDetector(
          onTap: () {
            context.go(Routes.login);
          },
          child: Text(
            UiStrings.Login,
            style: TextStyle(
              color: theme.colorScheme.primary,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
              fontSize: 16
            ),
          ),
        ),
      ],
    );
  }
}
