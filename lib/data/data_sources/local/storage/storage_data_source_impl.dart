import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage_data_source.dart';

class StorageDataSourceImpl implements StorageDataSource {
  StorageDataSourceImpl(this.storage);

  final FlutterSecureStorage storage;
  @override
  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  @override
  Future<String?> read(String key) async {
    String? value = await storage.read(key: key);
    return value;
  }

  @override
  Future<void> write({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }
}
