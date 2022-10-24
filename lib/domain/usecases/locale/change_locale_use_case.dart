import 'package:dartz/dartz.dart';

import '../../../core/failures.dart';
import '../../../core/use_case.dart';
import '../../repositories/settings_repo.dart';

class ChangeLocaleUseCase extends UseCase<void, LocaleParams> {
  final SettingsRepo settingsRepo;

  ChangeLocaleUseCase(this.settingsRepo);

  @override
  Future<Either<Failure, void>> call(LocaleParams params) async {
    return await settingsRepo.changeLocale(params.locale);
  }
}

class LocaleParams {
  final String locale;

  LocaleParams({required this.locale});
}
