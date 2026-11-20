


import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/home/presentation/cubit/home_state.dart';
import 'package:exam_app_team_1/features/home/presentation/cubit/home_view_model.dart';
import 'package:exam_app_team_1/features/home/presentation/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocBuilder extends StatelessWidget {
   HomeBlocBuilder({super.key, required this.searchQuery});

  String searchQuery;
  @override
  Widget build(BuildContext context) {
    AppBarTheme theme;
    return  Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final subjectState = state.subjectsState;
            final subjects = subjectState?.data ?? [];

            if (subjectState?.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (subjectState?.errMsg != null) {
              return Center(
                child: Text(subjectState!.errMsg!),
              );
            }

            final filteredSubjects = subjects.where((subject) {
              return subject.name
                  .toLowerCase()
                  .contains(searchQuery);
            }).toList();

            if (filteredSubjects.isEmpty) {
              return const Center(
                child: Text(UiStrings.NoSubjectsAvailable),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.only(top: 4),
              itemCount: filteredSubjects.length,
              itemBuilder: (context, idx) {
                return SubjectCard(
                  subject: filteredSubjects[idx],
                );
              },
            );
          },
        ),
    );
  }
}