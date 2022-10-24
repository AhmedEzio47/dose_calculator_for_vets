import 'package:bloc/bloc.dart';
import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:dose_calculator_for_vets/domain/entities/calculation_entity.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/exceptions.dart';
import '../../../../domain/usecases/calculations/save_calculation_use_case.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final SaveCalculationUseCase saveCalculationUseCase;
  CalculatorBloc(this.saveCalculationUseCase) : super(CalculatorState()) {
    on<CalculateEvent>(_onCalculateEvent);
    on<SaveCalculationEvent>(_onSaveCalculationEvent);
    on<RecalculateEvent>(_onRecalculateEvent);
  }

  _onRecalculateEvent(RecalculateEvent event, emit) {
    lastCalculation = event.calculation;
    emit(state.copyWith(calculation: event.calculation));
  }

  _onSaveCalculationEvent(SaveCalculationEvent event, emit) async {
    lastCalculation.copyWith(
        description:
            event.description?.isEmpty ?? true ? null : event.description);
    final result =
        await saveCalculationUseCase(SaveCalculationParams(lastCalculation));
    result.fold(
      (failure) => emit(CalculatorState(
          status: BlocStatus.failure,
          failureMessage: AppLocalizations.instance
              .translate(TranslationKeys.errorSavingCalculation))),
      (success) => emit(CalculatorState(
        status: BlocStatus.success,
      )),
    );
  }

  late CalculationEntity lastCalculation;
  _onCalculateEvent(CalculateEvent event, emit) {
    emit(state.copyWith(status: BlocStatus.loading));
    late num finalDose;
    try {
      if (event.concentration.isEmpty ||
          event.quantity.isEmpty ||
          event.dosePerUnitMass.isEmpty ||
          event.animalMass.isEmpty) {
        throw EmptyInputException();
      }

      final num concentration = num.parse(event.concentration);
      final num quantity = num.parse(event.quantity);
      final num dosePerUnitMass = num.parse(event.dosePerUnitMass);
      final num animalMass = num.parse(event.animalMass);

      lastCalculation = CalculationEntity(
        concentration: concentration,
        quantity: quantity,
        dosePerUnitMass: dosePerUnitMass,
        animalMass: animalMass,
      );

      finalDose = (quantity * dosePerUnitMass * animalMass) / concentration;
      emit(CalculatorState(
          status: BlocStatus.success, finalDose: finalDose.toStringAsFixed(2)));
    } on FormatException {
      emit(CalculatorState(
          status: BlocStatus.failure,
          failureMessage: AppLocalizations.instance
              .translate(TranslationKeys.invalidInput)));
    } on EmptyInputException {
      emit(CalculatorState(
          status: BlocStatus.failure,
          failureMessage:
              AppLocalizations.instance.translate(TranslationKeys.emptyInput)));
    }
  }
}
