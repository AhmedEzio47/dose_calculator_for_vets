import 'package:dose_calculator_for_vets/core/constants/text_styles.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:dose_calculator_for_vets/domain/entities/drug_route_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/locale/app_localization.dart';
import '../bloc/calculator_bloc.dart';

class DrugRouteDropDown extends StatelessWidget {
  const DrugRouteDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${AppLocalizations.instance.translate(TranslationKeys.route)}: ',
          style: TextStyles.medium.copyWith(fontSize: 18),
        ),
        const SizedBox(
          width: 10,
        ),
        BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            return DropdownButton<DrugRouteEntity>(
              hint: Text(AppLocalizations.instance
                  .translate(TranslationKeys.selectRoute)),
              value: state.selectedRoute ?? state.selectedDrug!.routes.first,
              items: state.selectedDrug!.routes
                  .map((e) => DropdownMenuItem<DrugRouteEntity>(
                        value: e,
                        child: Text(e.route),
                      ))
                  .toList(),
              onChanged: (route) => context.read<CalculatorBloc>().add(
                    DrugRouteIndexChanged(
                      state.selectedDrug!.routes
                          .indexWhere((element) => element == route),
                    ),
                  ),
            );
          },
        ),
      ],
    );
  }
}
