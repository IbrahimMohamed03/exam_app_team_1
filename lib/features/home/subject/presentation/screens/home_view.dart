
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/home/subject/presentation/cubit/home_state.dart';
import 'package:exam_app_team_1/features/home/subject/presentation/cubit/home_view_model.dart';
import 'package:exam_app_team_1/features/home/subject/presentation/widgets/home_bloc_builder.dart';
import 'package:exam_app_team_1/features/home/subject/presentation/widgets/search_bar.dart';
import 'package:exam_app_team_1/features/home/subject/presentation/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   String searchQuery ='';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          UiStrings.Survey,
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
            SearchBarWidget(
              onSearchChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
             SizedBox(height: context.screenHeight*0.1),

            // Browse by subject
            Text(
              UiStrings.SearchBySubject,
              style: theme.textTheme.headlineLarge?.copyWith(
                color: AppColors.appBarTitle,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
             SizedBox(height: context.screenHeight*0.042),
            // Subjects
            Expanded(
              child: HomeBlocBuilder(searchQuery: searchQuery,)
            ),
          ],
        ),
      ),
    );
  }
}
