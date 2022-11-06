import 'package:dose_calculator_for_vets/data/models/drug_route_model.dart';
import 'package:dose_calculator_for_vets/domain/entities/drug_entity.dart';

class DrugModel extends DrugEntity {
  DrugModel({
    required super.name,
    required super.routes,
    super.tags,
  });

  factory DrugModel.fromJson(Map<String, dynamic> json) {
    var routes = (json['routes'] as List);

    return DrugModel(
        name: json['name'],
        routes: routes.map((e) => DrugRouteModel.fromJson(e)).toList());
  }
}
