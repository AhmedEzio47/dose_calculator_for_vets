import 'package:dose_calculator_for_vets/core/constants/app_colors.dart';
import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:dose_calculator_for_vets/presentation/pages/app_view/blocs/units/units_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/home/widgets/species_drop_down.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/general_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/text_styles.dart';
import '../bloc/calculator_bloc.dart';
import 'drug_route_drop_down.dart';
import 'search_active_principles_field.dart';

class ActivePrincipleBottomSheet extends StatefulWidget {
  ActivePrincipleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ActivePrincipleBottomSheet> createState() =>
      _ActivePrincipleBottomSheetState();
}

class _ActivePrincipleBottomSheetState
    extends State<ActivePrincipleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchActivePrinciplesField(),
              const SizedBox(
                height: 16,
              ),
              if (state.selectedDrug != null) const DrugRouteDropDown(),
              if (state.selectedRoute != null) const SpeciesDropDown(),
              if (state.selectedSpecies != null)
                const SizedBox(
                  height: 10,
                ),
              if (state.selectedSpecies != null)
                BlocBuilder<UnitsBloc, UnitsState>(
                  builder: (context, unitsState) {
                    return Text(
                      '${AppLocalizations.instance.translate(
                        TranslationKeys.dosePerUnitMass,
                        param1: unitsState.toString(),
                      )}: ${state.dosePerUnitMass}',
                      style: TextStyles.medium.copyWith(fontSize: 18),
                    );
                  },
                ),
              if (state.comment != null)
                const SizedBox(
                  height: 36,
                ),
              if (state.comment != null)
                Text(
                  '${state.comment}',
                  style: TextStyles.medium.copyWith(
                    fontSize: 18,
                    color: AppColors.errorColor,
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              GeneralBtn(
                  onPressed: () => Navigator.of(context).pop(),
                  text: AppLocalizations.instance.translate(
                    TranslationKeys.ok,
                  ))
            ],
          ),
        );
      },
    );
  }
}
