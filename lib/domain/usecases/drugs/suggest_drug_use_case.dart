import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/core/failures.dart';
import 'package:dose_calculator_for_vets/core/use_case.dart';
import 'package:dose_calculator_for_vets/domain/repositories/drugs_repo.dart';

class SuggestDrugUseCase extends UseCase<void, SuggestDrugParams> {
  final DrugsRepo drugsRepo;

  SuggestDrugUseCase(this.drugsRepo);

  @override
  Future<Either<Failure, void>> call(SuggestDrugParams params) async {
    return await drugsRepo.suggestDrug(name: params.name, notes: params.notes);
  }
}

class SuggestDrugParams {
  final String name;
  final String notes;

  SuggestDrugParams({required this.name, required this.notes});
}
