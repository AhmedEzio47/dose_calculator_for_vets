import 'package:dose_calculator_for_vets/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/locale/app_localization.dart';
import '../../../core/locale/translation_keys.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
            AppLocalizations.instance.translate(TranslationKeys.termsOfUse)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          AppLocalizations.instance
              .translate(TranslationKeys.termsOfUseDetails),
          style: TextStyles.semiBold.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
