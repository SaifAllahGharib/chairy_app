import 'package:hive/hive.dart';

class HiveService {
  Future<void> initBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<T>(boxName);
    }
  }

  Box<T> getBox<T>(String boxName) {
    return Hive.box<T>(boxName);
  }

  Future<void> addData<T>(String boxName, T values) async {
    var box = getBox<T>(boxName);
    await box.add(values);
  }

  Future<void> addAllData<T>(String boxName, List<T> values) async {
    var box = getBox<T>(boxName);
    await box.addAll(values);
  }

  List<T> getAllValues<T>(String boxName) {
    var box = getBox<T>(boxName);
    return box.values.toList();
  }

  Future<void> clearBox<T>(String boxName) async {
    var box = getBox<T>(boxName);
    await box.clear();
  }

  bool isBoxEmpty<T>(String boxName) {
    var box = getBox<T>(boxName);
    return box.isEmpty;
  }
}
