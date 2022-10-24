import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/core/failures.dart';
import 'package:dose_calculator_for_vets/core/use_case.dart';
import 'package:dose_calculator_for_vets/domain/entities/calculation_entity.dart';
import 'package:dose_calculator_for_vets/domain/repositories/calculations_repo.dart';

class SaveCalculationUseCase extends UseCase<void, SaveCalculationParams> {
  final CalculationsRepo calculationsRepo;

  SaveCalculationUseCase(this.calculationsRepo);

  @override
  Future<Either<Failure, void>> call(SaveCalculationParams params) async {
    return await calculationsRepo.save(params.calculation);
  }
}

class SaveCalculationParams {
  final CalculationEntity calculation;

  SaveCalculationParams(this.calculation);
}
