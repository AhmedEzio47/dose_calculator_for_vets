import 'species_entity.dart';

class DrugRouteEntity {
  final String route;
  final List<SpeciesEntity> species;
  DrugRouteEntity({
    required this.route,
    required this.species,
  });

  DrugRouteEntity copyWith({String? route, List<SpeciesEntity>? species}) {
    return DrugRouteEntity(
      route: route ?? this.route,
      species: species ?? this.species,
    );
  }
}
