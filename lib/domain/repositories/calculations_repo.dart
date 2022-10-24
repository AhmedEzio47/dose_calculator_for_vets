import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/domain/entities/calculation_entity.dart';

import '../../core/failures.dart';

abstract class CalculationsRepo {
  Future<Either<Failure, void>> save(CalculationEntity calculation);
  Future<Either<Failure, void>> delete(int index);
  Future<Either<Failure, List<CalculationEntity>>> getCalculations();
}
