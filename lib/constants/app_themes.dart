import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: AppColors.lightScheme,
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightScheme.surface,
    textTheme: Typography.englishLike2018,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightScheme.primary,
      foregroundColor: AppColors.lightScheme.onPrimary,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightScheme.secondary,
      foregroundColor: AppColors.lightScheme.onSecondary,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: AppColors.darkScheme,
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkScheme.surface,
    textTheme: Typography.englishLike2018,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkScheme.primary,
      foregroundColor: AppColors.darkScheme.onPrimary,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkScheme.secondary,
      foregroundColor: AppColors.darkScheme.onSecondary,
    ),
  );
}
