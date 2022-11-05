import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/core/failures.dart';
import 'package:dose_calculator_for_vets/domain/entities/drug_entity.dart';

abstract class DrugsRepo {
  Future<Either<Failure, List<DrugEntity>>> searchDrugs(String query);
}
