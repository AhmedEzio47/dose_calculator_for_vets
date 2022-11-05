import 'drug_route_entity.dart';

class DrugEntity {
  final String name;
  final List<String>? tags;
  final List<DrugRouteEntity> routes;

  DrugEntity({
    required this.name,
    this.tags,
    required this.routes,
  });
}
