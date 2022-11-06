import 'package:dose_calculator_for_vets/core/constants/app_colors.dart';
import 'package:dose_calculator_for_vets/domain/entities/drug_entity.dart';
import 'package:dose_calculator_for_vets/presentation/pages/home/widgets/active_principle_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../bloc/calculator_bloc.dart';
import 'drug_route_drop_down.dart';

class ActivePrincipleBottomSheet extends StatefulWidget {
  ActivePrincipleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ActivePrincipleBottomSheet> createState() =>
      _ActivePrincipleBottomSheetState();
}

class _ActivePrincipleBottomSheetState
    extends State<ActivePrincipleBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TypeAheadFormField(
                  minCharsForSuggestions: 3,
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                        hintText: 'Search active principles',
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
                  itemBuilder: (context, suggestion) => ActivePrincipleItem(
                      text: (suggestion as DrugEntity).name),
                  onSuggestionSelected: (drug) {
                    _controller.text = (drug as DrugEntity).name;
                    context.read<CalculatorBloc>().add(DrugIndexChanged(state
                        .searchResults
                        .indexWhere((element) => element.name == drug.name)));
                  }),
              const SizedBox(
                height: 16,
              ),
              if (state.selectedDrug != null) const DrugRouteDropDown(),
            ],
          ),
        );
      },
    );
  }
}
