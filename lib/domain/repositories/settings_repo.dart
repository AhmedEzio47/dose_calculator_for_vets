import 'package:dartz/dartz.dart';

import '../../core/failures.dart';

abstract class SettingsRepo {
  Future<Either<Failure, String?>> getLocale();
  Future<Either<Failure, void>> changeLocale(String locale);

  Future<Either<Failure, String?>> getTheme();
  Future<Either<Failure, void>> changeTheme(String theme);
}
