part of 'calculator_bloc.dart';

class CalculatorState {
  final BlocStatus status;
  final String? finalDose;
  final String? failureMessage;
  final CalculationEntity? calculation;
  final List<DrugEntity> searchResults;
  final DrugRouteEntity? selectedRoute;
  final DrugEntity? selectedDrug;
  CalculatorState({
    this.status = BlocStatus.initial,
    this.finalDose,
    this.failureMessage,
    this.calculation,
    this.searchResults = const [],
    this.selectedRoute,
    this.selectedDrug,
  });

  CalculatorState copyWith({
    BlocStatus? status,
    String? finalDose,
    String? failureMessage,
    CalculationEntity? calculation,
    List<DrugEntity>? searchResults,
    DrugRouteEntity? selectedRoute,
    DrugEntity? selectedDrug,
  }) {
    return CalculatorState(
      status: status ?? this.status,
      finalDose: finalDose,
      failureMessage: failureMessage,
      calculation: calculation,
      searchResults: searchResults ?? this.searchResults,
      selectedRoute: selectedRoute ?? this.selectedRoute,
      selectedDrug: selectedDrug ?? this.selectedDrug,
    );
  }
}
