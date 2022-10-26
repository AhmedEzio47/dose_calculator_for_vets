abstract class HiveDataSource {
  Future<void> init();
  Future<void> putInBox(String boxName, Map something);
  Future<Map> get(String boxName, int index);
  Future<List> getAll(String boxName);
  Future<void> delete(String boxName, int id);
}
