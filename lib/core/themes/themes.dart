import 'package:dose_calculator_for_vets/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Google fonts constant setting: https://fonts.google.com/
class Themes {
  static const String darkTheme = 'darkTheme';
  static const String lightTheme = 'lightTheme';

  /// Build the App Theme
  static ThemeData buildTheme(
      {required BuildContext context, String theme = Themes.darkTheme}) {
    var isDarkTheme = theme == Themes.darkTheme;

    var fontFamily = 'Roboto';
    if (isDarkTheme) {
      return buildDarkTheme(context, fontFamily);
    }
    return buildLightTheme(context, fontFamily);
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static ThemeData buildDarkTheme(BuildContext context,
      [String fontFamily = 'Roboto']) {
    const iconTheme = IconThemeData(color: AppColors.lightText);
    final appBarTheme = AppBarTheme(
        color: AppColors.primaryColor,
        iconTheme: iconTheme,
        centerTitle: true,
        toolbarTextStyle: TextStyles.semiBold
            .copyWith(fontSize: 18, color: AppColors.lightText),
        titleTextStyle: TextStyles.semiBold
            .copyWith(fontSize: 18, color: AppColors.lightText));
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.primaryColor,
      appBarTheme: appBarTheme,
      iconTheme: iconTheme,
      scaffoldBackgroundColor: AppColors.darkBackground,
      buttonTheme: _buttonTheme(context),
      elevatedButtonTheme: _elevatedButtonTheme,
      cardColor: AppColors.darkCard,
      drawerTheme:
          const DrawerThemeData(backgroundColor: AppColors.darkBackground),
      sliderTheme: _sliderTheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkBottomNavBar),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor),
    );
  }

  static ThemeData buildLightTheme(BuildContext context,
      [String fontFamily = 'Roboto']) {
    const iconTheme = IconThemeData(color: AppColors.primaryColor);
    final appBarTheme = AppBarTheme(
        color: AppColors.primaryColor,
        centerTitle: true,
        iconTheme: iconTheme,
        toolbarTextStyle: TextStyles.semiBold
            .copyWith(fontSize: 18, color: AppColors.lightText),
        titleTextStyle: TextStyles.semiBold
            .copyWith(fontSize: 18, color: AppColors.darkText));
    return ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      appBarTheme: appBarTheme,
      scaffoldBackgroundColor: AppColors.lightBackground,
      buttonTheme: _buttonTheme(context),
      elevatedButtonTheme: _elevatedButtonTheme,
      cardColor: AppColors.lightCard,
      iconTheme: iconTheme,
      drawerTheme:
          const DrawerThemeData(backgroundColor: AppColors.lightBackground),
      sliderTheme: _sliderTheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightBottomNavBar,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor),
    );
  }

  static const _sliderTheme = SliderThemeData(
    activeTrackColor: AppColors.primaryColor,
    thumbColor: AppColors.primaryColor,
  );

  static _buttonTheme(context) => ButtonTheme.of(context).copyWith(
      buttonColor: AppColors.primaryColor, textTheme: ButtonTextTheme.primary);

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    primary: AppColors.primaryColor,
  ));
}
