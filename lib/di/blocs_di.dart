import 'package:dose_calculator_for_vets/di/di.dart';
import 'package:dose_calculator_for_vets/presentation/pages/app_view/blocs/locale/locale_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/app_view/blocs/theme/theme_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/app_view/blocs/url_launcher/url_launcher_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/history/bloc/history_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/home/bloc/calculator_bloc.dart';

void initBlocs() {
  di.registerFactory(
      () => ThemeBloc(changeThemeUseCase: di(), getThemeUseCase: di()));
  di.registerFactory(
      () => LocaleBloc(changeLocaleUseCase: di(), getLocaleUseCase: di()));
  di.registerFactory(() => CalculatorBloc(di()));
  di.registerFactory(() =>
      HistoryBloc(getCalculationsUseCase: di(), deleteCalculateUseCase: di()));
  di.registerFactory(() => UrlLauncherBloc(launchUrlUseCase: di()));
}
