



import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/features/home/presentation/cubit/home_state.dart';
import 'package:exam_app_team_1/features/home/presentation/cubit/home_view_model.dart';
import 'package:exam_app_team_1/features/home/presentation/widgets/home_bloc_builder.dart';
import 'package:exam_app_team_1/features/home/presentation/widgets/search_bar.dart';
import 'package:exam_app_team_1/features/home/presentation/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String searchQuery ='';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.screenHeight*0.042),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),
      ),
    );
  }
}
