import 'package:dose_calculator_for_vets/data/models/species_model.dart';
import 'package:dose_calculator_for_vets/domain/entities/drug_route_entity.dart';

class DrugRouteModel extends DrugRouteEntity {
  DrugRouteModel({required super.route, required super.species});

  Map<String, dynamic> toJson() {
    return {
      'route': route,
      'species': species
          .map((e) => SpeciesModel(
                name: e.name,
                dosage: e.dosage,
                comment: e.comment,
              ).toJson())
          .toList()
    };
  }

  factory DrugRouteModel.fromJson(Map<String, dynamic> json) {
    var species = json['species'] as List<Map<String, dynamic>>;
    return DrugRouteModel(
        route: json['route'],
        species: species.map((e) => SpeciesModel.fromJson(e)).toList());
  }
}
