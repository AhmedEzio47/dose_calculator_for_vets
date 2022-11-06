part of 'calculator_bloc.dart';

class CalculatorState {
  final BlocStatus status;
  final String? finalDose;
  final String? failureMessage;
  final CalculationEntity? calculation;
  final List<DrugEntity> searchResults;
  final DrugRouteEntity? selectedRoute;
  final DrugEntity? selectedDrug;
  final SpeciesEntity? selectedSpecies;
  final String dosePerUnitMass;
  final String? comment;
  CalculatorState({
    this.status = BlocStatus.initial,
    this.finalDose,
    this.failureMessage,
    this.calculation,
    this.searchResults = const [],
    this.selectedRoute,
    this.selectedDrug,
    this.selectedSpecies,
    this.dosePerUnitMass = '',
    this.comment,
  });

  CalculatorState copyWith({
    BlocStatus? status,
    String? finalDose,
    String? failureMessage,
    CalculationEntity? calculation,
    List<DrugEntity>? searchResults,
    DrugRouteEntity? selectedRoute,
    DrugEntity? selectedDrug,
    SpeciesEntity? selectedSpecies,
    String? dosePerUnitMass,
    String? comment,
  }) {
    return CalculatorState(
      status: status ?? this.status,
      finalDose: finalDose,
      failureMessage: failureMessage,
      calculation: calculation,
      searchResults: searchResults ?? this.searchResults,
      selectedRoute: selectedRoute ?? this.selectedRoute,
      selectedDrug: selectedDrug ?? this.selectedDrug,
      selectedSpecies: selectedSpecies ?? this.selectedSpecies,
      dosePerUnitMass: dosePerUnitMass ?? this.dosePerUnitMass,
      comment: comment ?? this.comment,
    );
  }
}
