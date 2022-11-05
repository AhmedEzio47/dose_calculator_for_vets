import 'package:dose_calculator_for_vets/domain/entities/species_entity.dart';

class SpeciesModel extends SpeciesEntity {
  SpeciesModel({
    required super.name,
    required super.dosage,
    super.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dosage': dosage,
      'comment': comment,
    };
  }

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    return SpeciesModel(
      name: json['name'],
      dosage: json['dosage'],
      comment: json['comment'],
    );
  }
}
