import 'package:dose_calculator_for_vets/core/constants/app_assets.dart';
import 'package:dose_calculator_for_vets/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import 'typing_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        margin: const EdgeInsets.only(bottom: 64, top: 16),
        decoration: const BoxDecoration(color: AppColors.primaryColor),
        child: Row(
          children: [
            Image.asset(AppAssets.appIcon),
            const SizedBox(
              width: 16,
            ),
            const TypingText(
              text: AppConstants.appName,
              textColor: AppColors.lightText,
            )
          ],
        ));
  }
}
