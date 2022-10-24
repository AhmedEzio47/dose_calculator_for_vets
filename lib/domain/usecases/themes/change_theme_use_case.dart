import 'package:dose_calculator_for_vets/core/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../core/failures.dart';
import '../../repositories/settings_repo.dart';

class ChangeThemeUseCase extends UseCase {
  final SettingsRepo settingsRepo;

  ChangeThemeUseCase(this.settingsRepo);

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return await settingsRepo.changeTheme(params.theme);
  }
}

class ThemeParams {
  final String theme;

  ThemeParams({required this.theme});
}
