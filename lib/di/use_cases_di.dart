import 'package:dose_calculator_for_vets/domain/usecases/ads/load_ad_unit_use_case.dart';
import 'package:dose_calculator_for_vets/domain/usecases/calculations/delete_calculation_use_case.dart';
import 'package:dose_calculator_for_vets/domain/usecases/calculations/get_calculations_use_case.dart';
import 'package:dose_calculator_for_vets/domain/usecases/drugs/search_drug_use_case.dart';
import 'package:dose_calculator_for_vets/domain/usecases/drugs/suggest_drug_use_case.dart';
import 'package:dose_calculator_for_vets/domain/usecases/locale/get_locale_use_case.dart';
import 'package:dose_calculator_for_vets/domain/usecases/themes/change_theme_use_case.dart';
import 'package:dose_calculator_for_vets/domain/usecases/themes/get_theme_use_case.dart';
import 'package:dose_calculator_for_vets/domain/usecases/units/change_mass_unit_use_case.dart';
import 'package:dose_calculator_for_vets/domain/usecases/units/get_mass_unit_use_case.dart';
import 'package:dose_calculator_for_vets/domain/usecases/url_launcher/launch_url_use_case.dart';

import '../domain/usecases/calculations/save_calculation_use_case.dart';
import '../domain/usecases/locale/change_locale_use_case.dart';
import 'di.dart';

void initUseCases() {
  di.registerLazySingleton(
    () => ChangeThemeUseCase(di()),
  );
  di.registerLazySingleton(
    () => GetThemeUseCase(di()),
  );
  di.registerLazySingleton(
    () => GetLocaleUseCase(di()),
  );
  di.registerLazySingleton(
    () => GetMassUnitUseCase(di()),
  );
  di.registerLazySingleton(
    () => ChangeLocaleUseCase(di()),
  );
  di.registerLazySingleton(
    () => SaveCalculationUseCase(di()),
  );
  di.registerLazySingleton(
    () => GetCalculationsUseCase(di()),
  );
  di.registerLazySingleton(
    () => DeleteCalculationUseCase(di()),
  );
  di.registerLazySingleton(
    () => LaunchUrlUseCase(di()),
  );
  di.registerLazySingleton(
    () => ChangeMassUnitUseCase(di()),
  );
  di.registerLazySingleton(
    () => SearchDrugUseCase(di()),
  );
  di.registerLazySingleton(
    () => SuggestDrugUseCase(di()),
  );
  di.registerLazySingleton(
    () => LoadAdUnitUseCase(di()),
  );
}
