import 'package:dose_calculator_for_vets/data/data_sources/local/storage/storage_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../../domain/repositories/settings_repo.dart';
import '../data_sources/local/storage/storage_keys.dart';

class SettingsRepoImpl implements SettingsRepo {
  final StorageDataSource storageDataSource;

  SettingsRepoImpl(this.storageDataSource);

  @override
  Future<Either<Failure, void>> changeLocale(String locale) async {
    try {
      await storageDataSource.write(key: StorageKeys.locale, value: locale);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getLocale() async {
    try {
      final locale = await storageDataSource.read(StorageKeys.locale);
      return Right(locale);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> changeTheme(String theme) async {
    try {
      await storageDataSource.write(value: theme, key: StorageKeys.theme);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getTheme() async {
    try {
      final theme = await storageDataSource.read(StorageKeys.theme);
      return Right(theme);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
