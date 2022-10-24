import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'locale_constants.dart';

class AppLocalizations {
  AppLocalizations();

  late Map<String, String> _localizedMap;

  static Locale langToLocale(String lang) {
    switch (lang) {
      case 'en':
        return const Locale('en', 'US');
      case 'ar':
        return const Locale('ar', '');
      default:
        return kDefaultLocale;
    }
  }

  Future<bool> load(Locale locale) async {
    if (locale == null) {
      return false;
    }

    final String data = await rootBundle.loadString(supportedLocaleMap[locale]);
    final Map<String, dynamic> jsonMap = json.decode(data);

    _localizedMap = jsonMap.map((String key, dynamic value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(dynamic key, {String param1 = ''}) {
    return (_localizedMap[key] ?? key).replaceAll('{PARAM1}', param1);
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static AppLocalizations get instance => _AppLocalizationsDelegate
      .instance; //For the sake of no context translation

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  static late AppLocalizations
      instance; //For the sake of no context translation

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localizations = AppLocalizations();
    await localizations.load(locale);
    instance = localizations; //For the sake of no context translation
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
