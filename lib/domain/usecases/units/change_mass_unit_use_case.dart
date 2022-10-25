import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/core/failures.dart';
import 'package:dose_calculator_for_vets/core/use_case.dart';
import 'package:dose_calculator_for_vets/domain/repositories/settings_repo.dart';

class ChangeMassUnitUseCase extends UseCase<void, ChangeMassUnitParams> {
  final SettingsRepo settingsRepo;

  ChangeMassUnitUseCase(this.settingsRepo);

  @override
  Future<Either<Failure, void>> call(ChangeMassUnitParams params) async {
    return await settingsRepo.changeMassUnit(params.unit);
  }
}

class ChangeMassUnitParams {
  final String unit;

  ChangeMassUnitParams(this.unit);
}
