class SpeciesEntity {
  final String name;
  final num dosage;
  final String? comment;

  SpeciesEntity({
    required this.name,
    required this.dosage,
    this.comment,
  });

  SpeciesEntity copyWith({String? name, num? dosage, String? comment}) {
    return SpeciesEntity(
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      comment: comment ?? this.comment,
    );
  }
}
