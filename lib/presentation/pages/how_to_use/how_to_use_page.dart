import 'package:dose_calculator_for_vets/core/constants/text_styles.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:flutter/material.dart';

import '../../../core/locale/app_localization.dart';

class HowToUsePage extends StatelessWidget {
  const HowToUsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.instance.translate(TranslationKeys.howToUse),
          style: TextStyles.medium.copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          AppLocalizations.instance.translate(TranslationKeys.howToUseDetails),
          style: TextStyles.medium.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
