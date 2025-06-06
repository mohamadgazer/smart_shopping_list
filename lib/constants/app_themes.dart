import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: AppColors.lightScheme,
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightScheme.surface,
    textTheme: _buildTextTheme(AppColors.lightScheme),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightScheme.primary,
      foregroundColor: AppColors.lightScheme.onPrimary,
      elevation: 0,
      titleTextStyle: GoogleFonts.cairo(
        color: AppColors.lightScheme.onPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
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
    textTheme: _buildTextTheme(AppColors.darkScheme),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkScheme.primary,
      foregroundColor: AppColors.darkScheme.onPrimary,
      elevation: 0,
      titleTextStyle: GoogleFonts.cairo(
        color: AppColors.darkScheme.onPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkScheme.secondary,
      foregroundColor: AppColors.darkScheme.onSecondary,
    ),
  );

  /// ✨ Custom TextTheme with Google Fonts and adaptive colors
  static TextTheme _buildTextTheme(ColorScheme scheme) {
    return GoogleFonts.cairoTextTheme().copyWith(
      displayLarge: GoogleFonts.cairo(
        color: scheme.onSurface,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.cairo(
        color: scheme.primary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.cairo(color: scheme.onSurface, fontSize: 16),
      bodyMedium: GoogleFonts.cairo(
        color: scheme.onSurfaceVariant,
        fontSize: 14,
      ),
      labelLarge: GoogleFonts.cairo(
        color: scheme.secondary,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
