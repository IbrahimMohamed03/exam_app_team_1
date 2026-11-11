
import 'package:exam_app_team_1/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme{

  static ThemeData get lightTheme{
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,

      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        surface: AppColors.background,
        error: AppColors.error,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
            fontSize: 20,color: AppColors.appBarTitle),
      ),

      textTheme: TextTheme(

        headlineLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
        titleSmall: TextStyle(
          fontSize: 13,
          color: AppColors.textPrimary,
        ),

        bodySmall: TextStyle(
          fontSize: 12,
          color: AppColors.textPrimary,
        ),

      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states){
          if(states.contains(WidgetState.selected)){
            return AppColors.primary;
    }
           return Colors.transparent;
        }),
      side: const BorderSide(color: AppColors.border)
      )

    );
  }
}