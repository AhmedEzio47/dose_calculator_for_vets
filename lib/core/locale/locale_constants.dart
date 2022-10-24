import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localization.dart';

enum SupportedLocale {
  en,
  ar,
}

const String kDefaultLanguage = kEnglishLanguage;
const String kEnglishLanguage = 'en';
const String kArabicLanguage = 'ar';
const Locale kDefaultLocale = Locale(kDefaultLanguage, '');
String currentLanguage = kDefaultLanguage;
Map supportedLocaleMap = {
  const Locale.fromSubtags(
    languageCode: 'en',
    countryCode: 'US',
  ): 'assets/locale/en.json',
  const Locale.fromSubtags(
    languageCode: 'ar',
  ): 'assets/locale/ar.json',
};

List<Locale> supportedLocale = [
  const Locale.fromSubtags(
    languageCode: 'en',
    countryCode: 'US',
  ),
  const Locale.fromSubtags(
    languageCode: 'ar',
  ),
];

List<LocalizationsDelegate<dynamic>> localizationDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  DefaultCupertinoLocalizations.delegate,
];
