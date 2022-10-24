import 'package:dartz/dartz.dart';

import '../../../core/failures.dart';
import '../../../core/use_case.dart';
import '../../repositories/settings_repo.dart';

class GetThemeUseCase extends UseCase<String?, NoParams> {
  final SettingsRepo settingsRepo;

  GetThemeUseCase(this.settingsRepo);
  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    return await settingsRepo.getTheme();
  }
}
