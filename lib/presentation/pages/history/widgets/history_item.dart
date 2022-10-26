import 'package:dose_calculator_for_vets/core/constants/app_colors.dart';
import 'package:dose_calculator_for_vets/core/constants/app_constants.dart';
import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:dose_calculator_for_vets/domain/entities/calculation_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/constants/text_styles.dart';
import '../../app_view/blocs/units/units_bloc.dart';
import '../../home/bloc/calculator_bloc.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem(
      {Key? key, required this.calculation, required this.onDelete})
      : super(key: key);
  final CalculationEntity calculation;
  final Function onDelete;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 3,
            onPressed: (_) {
              Navigator.of(context).pop();
              context.read<CalculatorBloc>().add(RecalculateEvent(calculation));
            },
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            icon: Icons.restart_alt,
            label: AppLocalizations.instance
                .translate(TranslationKeys.recalculate),
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (_) => onDelete(),
            backgroundColor: AppColors.errorColor,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: AppLocalizations.instance.translate(TranslationKeys.delete),
          ),
        ],
      ),
      child: BlocBuilder<UnitsBloc, UnitsState>(
        builder: (context, state) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (calculation.description != null)
                        Text(
                          '${calculation.description}',
                          style: TextStyles.semiBold.copyWith(fontSize: 20),
                        ),
                      if (calculation.description != null)
                        const SizedBox(
                          height: 5,
                        ),
                      Text(
                        '${AppLocalizations.instance.translate(TranslationKeys.drugConcentration)}: ${calculation.concentration.toStringAsFixed(AppConstants.decimalPrecision)}',
                        style: TextStyles.regular.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${AppLocalizations.instance.translate(TranslationKeys.quantity)}: ${calculation.quantity.toStringAsFixed(AppConstants.decimalPrecision)}',
                        style: TextStyles.regular.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${AppLocalizations.instance.translate(
                          TranslationKeys.dosePerUnitMass,
                          param1: state.toString(),
                        )}: ${calculation.dosePerUnitMass.toStringAsFixed(AppConstants.decimalPrecision)}',
                        style: TextStyles.regular.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${AppLocalizations.instance.translate(TranslationKeys.animalMass, param1: state.toString())}: ${calculation.animalMass.toStringAsFixed(AppConstants.decimalPrecision)}',
                        style: TextStyles.regular.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${AppLocalizations.instance.translate(
                          TranslationKeys.finalDose,
                        )}: ${context.read<CalculatorBloc>().calculate(calculation).toStringAsFixed(AppConstants.decimalPrecision)}',
                        style: TextStyles.regular.copyWith(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
