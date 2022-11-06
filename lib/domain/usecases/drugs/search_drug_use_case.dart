import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/core/failures.dart';
import 'package:dose_calculator_for_vets/core/use_case.dart';
import 'package:dose_calculator_for_vets/domain/entities/drug_entity.dart';
import 'package:dose_calculator_for_vets/domain/repositories/drugs_repo.dart';

class SearchDrugUseCase extends UseCase<List<DrugEntity>, SearchDrugParams> {
  final DrugsRepo drugsRepo;

  SearchDrugUseCase(this.drugsRepo);
  @override
  Future<Either<Failure, List<DrugEntity>>> call(
      SearchDrugParams params) async {
    return await drugsRepo.searchDrugs(params.query);
  }
}

class SearchDrugParams {
  final String query;

  SearchDrugParams(this.query);
}
