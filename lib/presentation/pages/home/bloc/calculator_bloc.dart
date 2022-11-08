import 'package:bloc/bloc.dart';
import 'package:dose_calculator_for_vets/core/constants/app_constants.dart';
import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:dose_calculator_for_vets/core/utils/converters.dart';
import 'package:dose_calculator_for_vets/domain/entities/calculation_entity.dart';
import 'package:dose_calculator_for_vets/domain/entities/drug_entity.dart';
import 'package:dose_calculator_for_vets/domain/entities/drug_route_entity.dart';
import 'package:dose_calculator_for_vets/domain/entities/species_entity.dart';
import 'package:dose_calculator_for_vets/domain/usecases/drugs/search_drug_use_case.dart';
import 'package:dose_calculator_for_vets/presentation/pages/app_view/blocs/units/units_bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/exceptions.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../domain/usecases/calculations/save_calculation_use_case.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final SearchDrugUseCase searchDrugUseCase;
  final SaveCalculationUseCase saveCalculationUseCase;
  CalculatorBloc({
    required this.saveCalculationUseCase,
    required this.searchDrugUseCase,
  }) : super(CalculatorState()) {
    on<CalculateEvent>(_onCalculateEvent);
    on<SaveCalculationEvent>(_onSaveCalculationEvent);
    on<RecalculateEvent>(_onRecalculateEvent);
    on<SearchDrugEvent>(onSearchDrugEvent);
    on<DrugRouteIndexChanged>(_onDrugRouteIndexChanged);
    on<DrugIndexChanged>(_onDrugIndexChanged);
    on<SpeciesIndexChanged>(_onSpeciesIndexChanged);
  }

  void _onRecalculateEvent(RecalculateEvent event, emit) {
    lastCalculation = event.calculation;
    emit(state.copyWith(calculation: event.calculation));
  }

  void _onDrugRouteIndexChanged(DrugRouteIndexChanged event, emit) {
    emit(
        state.copyWith(selectedRoute: state.selectedDrug!.routes[event.index]));
    add(SpeciesIndexChanged(0));
  }

  void _onDrugIndexChanged(DrugIndexChanged event, emit) {
    emit(state.copyWith(selectedDrug: state.searchResults[event.index]));
    add(DrugRouteIndexChanged(0));
  }

  void _onSpeciesIndexChanged(SpeciesIndexChanged event, emit) {
    late num dosePerUnitMass;
    if (AppConstants.massUnit == MassUnitValues.lb) {
      dosePerUnitMass = Converters.convertMgPerKgToMgPerLb(
          state.selectedRoute!.species[event.index].dosage);
    } else {
      dosePerUnitMass = state.selectedRoute!.species[event.index].dosage;
    }
    emit(state.copyWith(
      status: BlocStatus.initial,
      selectedSpecies: state.selectedRoute!.species[event.index],
      dosePerUnitMass: Formatters.formatDecimals(dosePerUnitMass),
      comment: state.selectedRoute!.species[event.index].comment,
    ));
  }

  Future<List<DrugEntity>> onSearchDrugEvent(
      SearchDrugEvent event, emit) async {
    final result = await searchDrugUseCase(SearchDrugParams(event.query));
    List<DrugEntity> _results = [];
    result.fold(
      (failure) => null,
      (results) {
        if (emit != null) {
          emit(state.copyWith(
            searchResults: results,
          ));
        }
        _results = results;
      },
    );
    return _results;
  }

  void _onSaveCalculationEvent(SaveCalculationEvent event, emit) async {
    lastCalculation = lastCalculation.copyWith(
        description:
            event.description?.isEmpty ?? true ? null : event.description);
    final result = await saveCalculationUseCase(SaveCalculationParams(
        AppConstants.massUnit == MassUnitValues.kg
            ? lastCalculation
            : Converters.convertLbCalToKgCal(lastCalculation)));
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
  void _onCalculateEvent(CalculateEvent event, emit) {
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
        id: null,
        concentration: concentration,
        quantity: quantity,
        dosePerUnitMass: dosePerUnitMass,
        animalMass: animalMass,
      );

      finalDose = calculate(lastCalculation);
      emit(CalculatorState(
          status: BlocStatus.success,
          finalDose: Formatters.formatDecimals(finalDose)));
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

  num calculate(CalculationEntity calculation) {
    var finalDose = (calculation.quantity *
            calculation.dosePerUnitMass *
            calculation.animalMass) /
        calculation.concentration;
    return finalDose;
  }
}
