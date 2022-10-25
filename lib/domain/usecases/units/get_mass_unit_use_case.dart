import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/core/failures.dart';
import 'package:dose_calculator_for_vets/core/use_case.dart';
import 'package:dose_calculator_for_vets/domain/repositories/settings_repo.dart';

class GetMassUnitUseCase extends UseCase<String?, NoParams> {
  final SettingsRepo settingsRepo;

  GetMassUnitUseCase(this.settingsRepo);

  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    return await settingsRepo.getMassUnit();
  }
}
