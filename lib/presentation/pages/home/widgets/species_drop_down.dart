import 'package:dose_calculator_for_vets/domain/entities/species_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/text_styles.dart';
import '../../../../core/locale/app_localization.dart';
import '../../../../core/locale/translation_keys.dart';
import '../bloc/calculator_bloc.dart';

class SpeciesDropDown extends StatelessWidget {
  const SpeciesDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${AppLocalizations.instance.translate(TranslationKeys.species)}: ',
          style: TextStyles.medium.copyWith(fontSize: 18),
        ),
        const SizedBox(
          width: 10,
        ),
        BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            return DropdownButton<SpeciesEntity>(
              hint: Text(AppLocalizations.instance
                  .translate(TranslationKeys.selectSpecies)),
              value:
                  state.selectedSpecies ?? state.selectedRoute!.species.first,
              items: state.selectedRoute!.species
                  .map((e) => DropdownMenuItem<SpeciesEntity>(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: (species) => context.read<CalculatorBloc>().add(
                    SpeciesIndexChanged(
                      state.selectedRoute!.species
                          .indexWhere((element) => element == species),
                    ),
                  ),
            );
          },
        ),
      ],
    );
  }
}
