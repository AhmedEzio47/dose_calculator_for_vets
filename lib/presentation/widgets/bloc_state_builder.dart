import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/enums.dart';
import '../../core/constants/text_styles.dart';
import '../../core/locale/app_localization.dart';
import '../../core/locale/translation_keys.dart';

class BlocStateBuilder extends StatelessWidget {
  const BlocStateBuilder({
    Key? key,
    required this.status,
    required this.readyWidget,
    this.emptyWidget,
    this.failureMessage,
    this.errorWidget,
  }) : super(key: key);
  final BlocStatus status;
  final Widget readyWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final String? failureMessage;
  @override
  Widget build(BuildContext context) {
    switch (status) {
      case BlocStatus.initial:
        return const SizedBox();
      case BlocStatus.empty:
        return emptyWidget ??
            Center(
              child: Text(
                  AppLocalizations.instance.translate(TranslationKeys.noData),
                  style: TextStyles.bold.copyWith(fontSize: 18)),
            );
      case BlocStatus.failure:
        return Center(
          child: errorWidget ??
              Text(
                failureMessage ?? '',
                style: TextStyles.medium,
              ),
        );
      case BlocStatus.loading:
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        );
      case BlocStatus.success:
        return readyWidget;
      case BlocStatus.loadingMore:
        return readyWidget;
      default:
        return const SizedBox();
    }
  }
}
