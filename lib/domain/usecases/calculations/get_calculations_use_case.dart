import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/core/failures.dart';
import 'package:dose_calculator_for_vets/core/use_case.dart';
import 'package:dose_calculator_for_vets/domain/entities/calculation_entity.dart';
import 'package:dose_calculator_for_vets/domain/repositories/calculations_repo.dart';

class GetCalculationsUseCase
    extends UseCase<List<CalculationEntity>, NoParams> {
  final CalculationsRepo calculationsRepo;

  GetCalculationsUseCase(this.calculationsRepo);

  @override
  Future<Either<Failure, List<CalculationEntity>>> call(NoParams params) async {
    return await calculationsRepo.getCalculations();
  }
}
