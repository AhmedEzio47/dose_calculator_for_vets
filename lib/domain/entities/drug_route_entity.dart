import 'package:equatable/equatable.dart';

import 'species_entity.dart';

class DrugRouteEntity extends Equatable {
  final String route;
  final List<SpeciesEntity> species;
  const DrugRouteEntity({
    required this.route,
    required this.species,
  });

  DrugRouteEntity copyWith({String? route, List<SpeciesEntity>? species}) {
    return DrugRouteEntity(
      route: route ?? this.route,
      species: species ?? this.species,
    );
  }

  @override
  List<Object?> get props => [route];
}
