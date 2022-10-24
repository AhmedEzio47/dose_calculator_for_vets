import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/data/data_sources/local/hive/hive_constants.dart';
import 'package:dose_calculator_for_vets/data/data_sources/local/hive/hive_data_source.dart';
import 'package:dose_calculator_for_vets/data/models/calculation_model.dart';
import 'package:dose_calculator_for_vets/domain/repositories/calculations_repo.dart';

import '../../core/failures.dart';
import '../../domain/entities/calculation_entity.dart';

class CalculationsRepoImpl implements CalculationsRepo {
  final HiveDataSource hiveDataSource;

  CalculationsRepoImpl(this.hiveDataSource);

  @override
  Future<Either<Failure, void>> save(CalculationEntity calculation) async {
    try {
      CalculationModel model = CalculationModel(
        concentration: calculation.concentration,
        quantity: calculation.quantity,
        dosePerUnitMass: calculation.dosePerUnitMass,
        animalMass: calculation.animalMass,
        description: calculation.description,
      );
      await hiveDataSource.putInBox(
          HiveConstants.calculationBox, model.toJson());
      return const Right(null);
    } catch (ex) {
      return Left(CacheFailure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CalculationEntity>>> getCalculations() async {
    try {
      final result = await hiveDataSource.getAll(
        HiveConstants.calculationBox,
      );
      return Right(
          result.map((e) => CalculationModel.fromJson(e as Map)).toList());
    } catch (ex) {
      return Left(CacheFailure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> delete(int index) async {
    try {
      await hiveDataSource.delete(HiveConstants.calculationBox, index);
      return const Right(null);
    } catch (ex) {
      return Left(CacheFailure(message: ex.toString()));
    }
  }
}
