import 'package:smart_shopping_list/exports.dart';

class AppState {
  final ThemeMode themeMode;
  final Locale locale;

  AppState({required this.themeMode, required this.locale});

  // ✅ نسخة مبدئية من الحالة (قبل تحميل الإعدادات الفعلية)
  factory AppState.initial() {
    return AppState(themeMode: ThemeMode.system, locale: const Locale('en'));
  }

  // ✅ نسخة منسوخة (تحديث جزئي)
  AppState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  // ✅ اختياري: للمقارنة والاختبارات
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          themeMode == other.themeMode &&
          locale == other.locale;

  @override
  int get hashCode => themeMode.hashCode ^ locale.hashCode;
}
