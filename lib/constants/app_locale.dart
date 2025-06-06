import 'dart:ui';

enum AppLocale { en, ar }

extension AppLocaleExtension on AppLocale {
  String get label {
    switch (this) {
      case AppLocale.en:
        return 'English';
      case AppLocale.ar:
        return 'العربية';
    }
  }

  Locale get toLocale {
    switch (this) {
      case AppLocale.en:
        return const Locale('en');
      case AppLocale.ar:
        return const Locale('ar');
    }
  }
}

String getLocaleLabel(String code) {
  switch (code) {
    case 'en':
      return 'English';
    case 'ar':
      return 'العربية';
    case 'fr':
      return 'Français';
    default:
      return code;
  }
}
