import 'package:dose_calculator_for_vets/domain/entities/calculation_entity.dart';

class CalculationModel extends CalculationEntity {
  CalculationModel(
      {super.id,
      super.description,
      required super.concentration,
      required super.quantity,
      required super.dosePerUnitMass,
      required super.animalMass});

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'concentration': concentration,
      'quantity': quantity,
      'dosePerUnitMass': dosePerUnitMass,
      'animalMass': animalMass,
    };
  }

  factory CalculationModel.fromJson(Map json) {
    return CalculationModel(
        id: json['id'],
        concentration: json['concentration'],
        quantity: json['quantity'],
        dosePerUnitMass: json['dosePerUnitMass'],
        animalMass: json['animalMass'],
        description: json['description']);
  }
}
