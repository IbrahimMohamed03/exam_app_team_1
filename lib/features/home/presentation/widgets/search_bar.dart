


import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class SearchBarWidget extends StatefulWidget {
  SearchBarWidget({super.key, required this.onSearchChanged});
   final ValueChanged<String> onSearchChanged;
  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    AppBarTheme theme;
    return  Container(
      child:TextField(
        controller: searchController,
        onChanged: (value) {
          widget.onSearchChanged(value);
        },
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.searchIcon,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.searchIcon,
            size: 20,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.border,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.border,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.primary,
            ),
          ),
        ),
      ),

    );
  }
}