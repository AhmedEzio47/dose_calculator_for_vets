import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/locale/app_localization.dart';
import '../../../../core/locale/translation_keys.dart';
import '../../../../domain/entities/drug_entity.dart';
import '../bloc/calculator_bloc.dart';
import 'active_principle_item.dart';

class SearchActivePrinciplesField extends StatelessWidget {
  SearchActivePrinciplesField({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return TypeAheadFormField(
            minCharsForSuggestions: 3,
            textFieldConfiguration: TextFieldConfiguration(
              decoration: InputDecoration(
                  hintText: AppLocalizations.instance
                      .translate(TranslationKeys.searchActivePrinciples),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
              controller: _controller,
            ),
            suggestionsCallback: (query) async {
              final results = await context
                  .read<CalculatorBloc>()
                  .onSearchDrugEvent(
                      SearchDrugEvent(query.toLowerCase()), null);
              context
                  .read<CalculatorBloc>()
                  .emit(state.copyWith(searchResults: results));
              return results;
            },
            itemBuilder: (context, suggestion) =>
                ActivePrincipleItem(text: (suggestion as DrugEntity).name),
            onSuggestionSelected: (drug) {
              _controller.text = (drug as DrugEntity).name;
              context.read<CalculatorBloc>().add(DrugIndexChanged(state
                  .searchResults
                  .indexWhere((element) => element.name == drug.name)));
            });
      },
    );
  }
}
