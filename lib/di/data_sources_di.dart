import 'package:dose_calculator_for_vets/data/data_sources/local/hive/hive_data_source.dart';
import 'package:dose_calculator_for_vets/data/data_sources/local/hive/hive_data_source_impl.dart';
import 'package:dose_calculator_for_vets/data/data_sources/local/storage/storage_data_source_impl.dart';
import 'package:dose_calculator_for_vets/data/data_sources/remote/firestore/firestore/firestore_data_source.dart';
import 'package:dose_calculator_for_vets/data/data_sources/remote/firestore/firestore/firestore_data_source_impl.dart';
import 'package:dose_calculator_for_vets/data/data_sources/remote/network/network_data_source_impl.dart';
import 'package:dose_calculator_for_vets/di/di.dart';

import '../data/data_sources/local/storage/storage_data_source.dart';
import '../data/data_sources/remote/network/network_data_source.dart';

Future initDataSources() async {
  di.registerLazySingleton<StorageDataSource>(
      () => StorageDataSourceImpl(di()));
  di.registerLazySingleton<HiveDataSource>(() => HiveDataSourceImpl()..init());
  di.registerLazySingleton<NetworkDataSource>(() => NetworkDataSourceImpl());
  di.registerLazySingleton<FirestoreDataSource>(
      () => FirestoreDataSourceImpl());
  await di<FirestoreDataSource>().init();
}
