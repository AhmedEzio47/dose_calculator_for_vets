import 'package:dose_calculator_for_vets/di/di.dart';
import 'package:dose_calculator_for_vets/presentation/pages/app_view/blocs/locale/locale_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/app_view/blocs/theme/theme_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/app_view/blocs/url_launcher/url_launcher_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/history/bloc/history_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/home/bloc/calculator_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/suggest_drug/bloc/suggestion_bloc.dart';

import '../presentation/pages/app_view/blocs/units/units_bloc.dart';

void initBlocs() {
  di.registerFactory(
      () => ThemeBloc(changeThemeUseCase: di(), getThemeUseCase: di()));
  di.registerFactory(
      () => LocaleBloc(changeLocaleUseCase: di(), getLocaleUseCase: di()));
  di.registerFactory(() =>
      CalculatorBloc(saveCalculationUseCase: di(), searchDrugUseCase: di()));
  di.registerFactory(() =>
      HistoryBloc(getCalculationsUseCase: di(), deleteCalculateUseCase: di()));
  di.registerFactory(() => UrlLauncherBloc(launchUrlUseCase: di()));
  di.registerFactory(
      () => UnitsBloc(changeMassUnitUseCase: di(), getMassUnitUseCase: di()));
  di.registerFactory(() => SuggestionBloc(di()));
}
