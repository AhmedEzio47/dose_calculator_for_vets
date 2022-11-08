import 'package:dose_calculator_for_vets/core/constants/enums.dart';
import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/app_snack_bar.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/edit_field.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/general_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/suggestion_bloc.dart';

class SuggestDrugPage extends StatelessWidget {
  SuggestDrugPage({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            const Icon(Icons.lightbulb),
            const SizedBox(
              width: 10,
            ),
            Text(AppLocalizations.instance
                .translate(TranslationKeys.suggestDrug)),
          ],
        ),
      ),
      body: BlocListener<SuggestionBloc, SuggestionState>(
        listener: (context, state) {
          if (state.status == BlocStatus.success) {
            Navigator.of(context).pop();
            AppSnackBar.show(
                context: context, snackBarType: SnackBarTypes.success);
          } else if (state.status == BlocStatus.failure) {
            AppSnackBar.show(
              context: context,
              snackBarType: SnackBarTypes.error,
              message: state.failureMessage,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EditField(
                controller: _nameController,
                hint: '',
                label: AppLocalizations.instance
                    .translate(TranslationKeys.drugName),
              ),
              const SizedBox(
                height: 16,
              ),
              EditField(
                controller: _notesController,
                lines: 5,
                hint: '',
                label:
                    AppLocalizations.instance.translate(TranslationKeys.notes),
              ),
              const SizedBox(
                height: 24,
              ),
              GeneralBtn(
                  onPressed: () =>
                      context.read<SuggestionBloc>().add(SuggestionSubmitted(
                            name: _nameController.text,
                            notes: _notesController.text,
                          )),
                  text: AppLocalizations.instance
                      .translate(TranslationKeys.submit)),
            ],
          ),
        ),
      ),
    );
  }
}
