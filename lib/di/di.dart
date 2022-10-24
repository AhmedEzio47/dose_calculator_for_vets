import 'package:dose_calculator_for_vets/di/blocs_di.dart';
import 'package:dose_calculator_for_vets/di/data_sources_di.dart';
import 'package:dose_calculator_for_vets/di/externals_di.dart';
import 'package:dose_calculator_for_vets/di/repositories_di.dart';
import 'package:dose_calculator_for_vets/di/use_cases_di.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance;

void init() async {
  initExternals();
  initDataSources();
  initRepositories();
  initUseCases();
  initBlocs();
}
