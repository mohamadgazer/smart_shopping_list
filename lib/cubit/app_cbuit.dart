import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shopping_list/cubit/app_state.dart';
import 'package:smart_shopping_list/exports.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final themeStr = prefs.getString('theme') ?? 'system';
    final themeMode = _parseTheme(themeStr);

    final localeCode = prefs.getString('locale') ?? 'en';
    final locale = Locale(localeCode);

    emit(state.copyWith(themeMode: themeMode, locale: locale));
  }

  Future<void> changeLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
    emit(state.copyWith(locale: locale));
  }

  Future<void> toggleTheme() async {
    final isDark = state.themeMode == ThemeMode.dark;
    final newMode = isDark ? ThemeMode.light : ThemeMode.dark;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', newMode.name);

    emit(state.copyWith(themeMode: newMode));
  }

  ThemeMode _parseTheme(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
