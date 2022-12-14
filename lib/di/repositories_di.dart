import 'package:dose_calculator_for_vets/data/repositories/settings_repo_impl.dart';
import 'package:dose_calculator_for_vets/data/repositories/url_launcher_repo_impl.dart';
import 'package:dose_calculator_for_vets/di/di.dart';
import 'package:dose_calculator_for_vets/domain/repositories/calculations_repo.dart';
import 'package:dose_calculator_for_vets/domain/repositories/settings_repo.dart';
import 'package:dose_calculator_for_vets/domain/repositories/url_launcher_repo.dart';

import '../data/repositories/calculations_repo_impl.dart';

void initRepositories() {
  di.registerLazySingleton<SettingsRepo>(() => SettingsRepoImpl(di()));
  di.registerLazySingleton<CalculationsRepo>(() => CalculationsRepoImpl(di()));
  di.registerLazySingleton<UrlLauncherRepo>(() => UrlLauncherRepoImpl());
}
