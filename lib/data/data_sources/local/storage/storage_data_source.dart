abstract class StorageDataSource {
  Future<String?> read(String key);
  Future<void> write({required String key, required String value});
  Future<void> delete(String key);
  Future<void> deleteAll();
}
