import 'package:dose_calculator_for_vets/core/constants/text_styles.dart';
import 'package:dose_calculator_for_vets/presentation/pages/home/widgets/save_calculation_dialog.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/app_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../core/locale/app_localization.dart';
import '../../../../core/locale/translation_keys.dart';
import '../../../widgets/general_btn.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog({Key? key, required this.finalDose}) : super(key: key);
  final String finalDose;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 330,
        height: 180,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                AppLocalizations.instance.translate(
                  TranslationKeys.finalDoseResult,
                  param1: finalDose.toString(),
                ),
                textAlign: TextAlign.center,
                style: TextStyles.semiBold.copyWith(fontSize: 22)),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GeneralBtn(
                  onPressed: () => Navigator.of(context).pop(),
                  text: AppLocalizations.instance.translate(TranslationKeys.ok),
                  height: 45,
                  width: 70,
                  fontSize: 18,
                ),
                const SizedBox(
                  width: 10,
                ),
                GeneralBtn(
                  onPressed: () {
                    Navigator.of(context).pop();
                    AppDialog.show(
                        context: context, child: SaveCalculationDialog());
                  },
                  text:
                      AppLocalizations.instance.translate(TranslationKeys.save),
                  height: 45,
                  width: 70,
                  fontSize: 18,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
