import 'package:equatable/equatable.dart';

import 'drug_route_entity.dart';

class DrugEntity extends Equatable {
  final String name;
  final List<String>? tags;
  final List<DrugRouteEntity> routes;

  const DrugEntity({
    required this.name,
    this.tags,
    required this.routes,
  });

  @override
  List<Object?> get props => [name];
}
