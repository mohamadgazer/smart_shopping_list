import 'package:flutter/material.dart';

class AppColors {
  // ✅ Light Theme Colors
  static const ColorScheme lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF009688), // Teal
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFB2DFDB),
    onPrimaryContainer: Colors.black,

    secondary: Color(0xFFFFC107), // Amber
    onSecondary: Colors.black,
    secondaryContainer: Color(0xFFFFECB3),
    onSecondaryContainer: Colors.black,

    tertiary: Color(0xFF8BC34A), // Light Green
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFFC5E1A5),
    onTertiaryContainer: Colors.black,

    error: Colors.red,
    onError: Colors.white,
    errorContainer: Color(0xFFFFCDD2),
    onErrorContainer: Colors.black,

    surface: Colors.white,
    onSurface: Colors.black,
    surfaceContainerHighest: Color(0xFFE0E0E0),
    onSurfaceVariant: Colors.black87,

    outline: Color(0xFFBDBDBD),
    outlineVariant: Color(0xFFE0E0E0),

    inverseSurface: Colors.black,
    onInverseSurface: Colors.white,
    inversePrimary: Color(0xFF80CBC4),

    shadow: Colors.black54,
    scrim: Colors.black45,
  );

  // 🌙 Dark Theme Colors
  static const ColorScheme darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF80CBC4), // Lighter Teal
    onPrimary: Colors.black,
    primaryContainer: Color(0xFF004D40),
    onPrimaryContainer: Colors.white,

    secondary: Color(0xFFFFD54F), // Lighter Amber
    onSecondary: Colors.black,
    secondaryContainer: Color(0xFFFF8F00),
    onSecondaryContainer: Colors.white,

    tertiary: Color(0xFFAED581), // Lighter Green
    onTertiary: Colors.black,
    tertiaryContainer: Color(0xFF33691E),
    onTertiaryContainer: Colors.white,

    error: Color(0xFFEF5350),
    onError: Colors.black,
    errorContainer: Color(0xFFB71C1C),
    onErrorContainer: Colors.white,

    surface: Color(0xFF1E1E1E),
    onSurface: Colors.white,
    surfaceContainerHighest: Color(0xFF2C2C2C),
    onSurfaceVariant: Colors.white70,

    outline: Color(0xFF424242),
    outlineVariant: Color(0xFF616161),

    inverseSurface: Colors.white,
    onInverseSurface: Colors.black,
    inversePrimary: Color(0xFF004D40),

    shadow: Colors.black,
    scrim: Colors.black54,
  );
}
