import 'package:smart_shopping_list/exports.dart';

class AppState {
  final ThemeMode themeMode;
  final Locale locale;

  AppState({required this.themeMode, required this.locale});

  AppState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
