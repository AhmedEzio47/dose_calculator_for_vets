part of 'calculator_bloc.dart';

class CalculatorState {
  final BlocStatus status;
  final String? finalDose;
  final String? failureMessage;
  final CalculationEntity? calculation;

  CalculatorState(
      {this.status = BlocStatus.initial,
      this.finalDose,
      this.failureMessage,
      this.calculation});

  CalculatorState copyWith({
    BlocStatus? status,
    String? finalDose,
    String? failureMessage,
    CalculationEntity? calculation,
  }) {
    return CalculatorState(
      status: status ?? this.status,
      finalDose: finalDose,
      failureMessage: failureMessage,
      calculation: calculation,
    );
  }
}
