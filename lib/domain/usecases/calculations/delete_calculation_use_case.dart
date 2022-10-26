import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/core/failures.dart';
import 'package:dose_calculator_for_vets/core/use_case.dart';
import 'package:dose_calculator_for_vets/domain/repositories/calculations_repo.dart';

class DeleteCalculationUseCase extends UseCase<void, DeleteCalculationParams> {
  final CalculationsRepo calculationsRepo;

  DeleteCalculationUseCase(this.calculationsRepo);
  @override
  Future<Either<Failure, void>> call(DeleteCalculationParams params) async {
    return await calculationsRepo.delete(params.id);
  }
}

class DeleteCalculationParams {
  final int id;

  DeleteCalculationParams(this.id);
}
