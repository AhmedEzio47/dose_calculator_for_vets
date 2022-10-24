import 'package:flutter/material.dart';

import 'app_localization.dart';
import 'locale_constants.dart';

Locale getSelectedLang(Locale? locale, Iterable<Locale> supportedLocales) {
  if (locale != null) {
    return AppLocalizations.langToLocale(locale.languageCode);
  }
  return kDefaultLocale;
}
