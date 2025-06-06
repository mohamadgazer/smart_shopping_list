// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: 'Title for language selection section',
      args: [],
    );
  }

  /// `Smart Assistant`
  String get appTitle {
    return Intl.message(
      'Smart Assistant',
      name: 'appTitle',
      desc: 'The title of the app',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get isDarkmode {
    return Intl.message(
      'Dark mode',
      name: 'isDarkmode',
      desc: '',
      args: [],
    );
  }

  /// `Good {timeOfDay}, {name}!`
  String greetUser(Object timeOfDay, Object name) {
    return Intl.message(
      'Good $timeOfDay, $name!',
      name: 'greetUser',
      desc: 'Greeting user based on time of day',
      args: [timeOfDay, name],
    );
  }

  /// `{count, plural, =0{You have nothing to do 🎉} =1{One task left} other{{count} tasks waiting}}`
  String tasksCount(int count) {
    return Intl.plural(
      count,
      zero: 'You have nothing to do 🎉',
      one: 'One task left',
      other: '$count tasks waiting',
      name: 'tasksCount',
      desc: 'How many tasks user has',
      args: [count],
    );
  }

  /// `{day, select, Friday{It's Friday! Time to relax 🍹} Monday{Back to work 💼} other{Just another day}}`
  String dayMood(Object day) {
    return Intl.select(
      day,
      {
        'Friday': 'It\'s Friday! Time to relax 🍹',
        'Monday': 'Back to work 💼',
        'other': 'Just another day',
      },
      name: 'dayMood',
      desc: 'A message based on the day of the week',
      args: [day],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
