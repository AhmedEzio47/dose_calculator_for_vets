import 'package:dose_calculator_for_vets/data/data_sources/local/hive/hive_data_source.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDataSourceImpl implements HiveDataSource {
  Future<Box<T>> _openBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      final Box<T> box = await Hive.openBox<T>(boxName);
      return box;
    }
    return Hive.box(boxName);
  }

  @override
  Future<void> putInBox(String boxName, Map something) async {
    final Box box = await _openBox(boxName);
    await box.add(something);
  }

  @override
  Future<Map> get(String boxName, int index) async {
    final Box box = await _openBox(boxName);
    return box.getAt(index);
  }

  @override
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  @override
  Future<List> getAll(String boxName) async {
    List<Map> all = [];
    final Box box = await _openBox(boxName);
    for (int i = 0; i < box.length; i++) {
      Map item = await get(boxName, i);
      List keys = box.keys.toList();
      item.putIfAbsent('id', () => keys[i]);
      all.add(item);
    }
    return all;
  }

  @override
  Future<void> delete(String boxName, int id) async {
    final Box box = await _openBox(boxName);
    await box.delete(id);
  }
}
