class CalculationEntity {
  final int? id;
  final String? description;
  final num concentration;
  final num quantity;
  final num dosePerUnitMass;
  final num animalMass;

  CalculationEntity({
    required this.id,
    this.description,
    required this.concentration,
    required this.quantity,
    required this.dosePerUnitMass,
    required this.animalMass,
  });

  CalculationEntity copyWith({String? description}) {
    return CalculationEntity(
      id: id,
      description: description ?? this.description,
      concentration: concentration,
      dosePerUnitMass: dosePerUnitMass,
      quantity: quantity,
      animalMass: animalMass,
    );
  }
}
