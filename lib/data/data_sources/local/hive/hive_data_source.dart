abstract class HiveDataSource {
  Future<void> init();
  Future<void> putInBox(String boxName, dynamic something);
  Future<dynamic> get(String boxName, int index);
  Future<List> getAll(String boxName);
  Future<void> delete(String boxName, int index);
}
