import 'package:dose_calculator_for_vets/data/data_sources/local/hive/hive_data_source.dart';
import 'package:dose_calculator_for_vets/data/data_sources/local/hive/hive_data_source_impl.dart';
import 'package:dose_calculator_for_vets/data/data_sources/local/storage/storage_data_source_impl.dart';
import 'package:dose_calculator_for_vets/di/di.dart';

import '../data/data_sources/local/storage/storage_data_source.dart';

void initDataSources() {
  di.registerLazySingleton<StorageDataSource>(
      () => StorageDataSourceImpl(di()));
  di.registerLazySingleton<HiveDataSource>(() => HiveDataSourceImpl()..init());
}
