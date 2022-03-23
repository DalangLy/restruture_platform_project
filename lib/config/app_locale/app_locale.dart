import 'dart:ui';

enum AppLocale {
  system,
  english,
  khmer,
  spain,
}

final appLocaleData = {
  AppLocale.system: null,
  AppLocale.english: const Locale('en'),
  AppLocale.khmer: const Locale('km'),
  AppLocale.spain: const Locale('es'),
};