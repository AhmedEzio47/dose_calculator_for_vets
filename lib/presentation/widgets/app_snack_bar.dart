import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/locale/app_localization.dart';
import '../../core/locale/translation_keys.dart';

class AppSnackBar {
  static SnackBar _kDefaultSnackBar(
      {required String message, bool error = false}) {
    return _snackBar(
        message: message,
        backgroundColor: error ? AppColors.errorColor : AppColors.primaryColor);
  }

  static SnackBar _snackBar({
    required String message,
    Color? backgroundColor,
    bool floating = true,
    EdgeInsets? padding,
  }) {
    return SnackBar(
      behavior: floating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      margin: floating
          ? const EdgeInsets.symmetric(vertical: 8, horizontal: 8)
          : null,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
          bottom: Radius.circular(15),
        ),
      ),
      duration: const Duration(seconds: 2),
      elevation: 3.0,
      padding: padding,
      content: Text(
        message,
        textAlign: TextAlign.start,
        maxLines: 2,
        style: TextStyles.regular.copyWith(
          color: AppColors.lightText,
          fontSize: 14,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static void show({
    required BuildContext context,
    String? message,
    SnackBarTypes snackBarType = SnackBarTypes.success,
  }) {
    late SnackBar snackBar;
    switch (snackBarType) {
      case SnackBarTypes.success:
        snackBar = _kDefaultSnackBar(
            message: message ??
                AppLocalizations.of(context)!
                    .translate(TranslationKeys.generalSuccessMessage),
            error: false);
        break;
      case SnackBarTypes.error:
        snackBar = _kDefaultSnackBar(
            message: message ??
                AppLocalizations.of(context)!
                    .translate(TranslationKeys.generalError),
            error: true);
        break;
    }
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

enum SnackBarTypes { success, error }
