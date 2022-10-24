import 'package:dose_calculator_for_vets/core/constants/enums.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/app_snack_bar.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/edit_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/locale/app_localization.dart';
import '../../../../core/locale/translation_keys.dart';
import '../../../widgets/general_btn.dart';
import '../bloc/calculator_bloc.dart';

class SaveCalculationDialog extends StatelessWidget {
  SaveCalculationDialog({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculatorBloc, CalculatorState>(
      listener: (context, state) {
        if (state.status == BlocStatus.success) {
          AppSnackBar.show(
              context: context,
              message: AppLocalizations.instance
                  .translate(TranslationKeys.savedSuccessfully),
              snackBarType: SnackBarTypes.success);
        } else if (state.status == BlocStatus.failure) {
          AppSnackBar.show(
              context: context,
              message: state.failureMessage,
              snackBarType: SnackBarTypes.error);
        }
        Navigator.of(context).pop();
      },
      child: Center(
        child: Dialog(
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
                EditField(
                    controller: _controller,
                    lines: 2,
                    hint: AppLocalizations.instance
                        .translate(TranslationKeys.description)),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GeneralBtn(
                      onPressed: () => context
                          .read<CalculatorBloc>()
                          .add(SaveCalculationEvent(_controller.text)),
                      text: AppLocalizations.instance
                          .translate(TranslationKeys.save),
                      height: 45,
                      width: 70,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GeneralBtn(
                      onPressed: () => Navigator.of(context).pop(),
                      text: AppLocalizations.instance
                          .translate(TranslationKeys.cancel),
                      height: 45,
                      width: 70,
                      fontSize: 18,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
