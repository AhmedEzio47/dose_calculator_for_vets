part of 'calculator_bloc.dart';

abstract class CalculatorEvent {}

class CalculateEvent extends CalculatorEvent {
  final String concentration;
  final String quantity;
  final String dosePerUnitMass;
  final String animalMass;

  CalculateEvent({
    required this.concentration,
    required this.quantity,
    required this.dosePerUnitMass,
    required this.animalMass,
  });
}

class SaveCalculationEvent extends CalculatorEvent {
  final String? description;

  SaveCalculationEvent(this.description);
}

class RecalculateEvent extends CalculatorEvent {
  final CalculationEntity calculation;

  RecalculateEvent(this.calculation);
}
