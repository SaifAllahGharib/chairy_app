import 'package:hive/hive.dart';

import '../../domain/entities/category_entity.dart';

sealed class CategoryLocalDataSource {
  Future<void> cacheCategories(List<CategoryEntity> categories);

  Future<List<CategoryEntity>> getCachedCategories();
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  static const String boxName = "categories_box";

  @override
  Future<void> cacheCategories(List<CategoryEntity> categories) async {
    final box = await Hive.openBox<CategoryEntity>(boxName);
    await box.clear();
    await box.addAll(categories);
  }

  @override
  Future<List<CategoryEntity>> getCachedCategories() async {
    final box = await Hive.openBox<CategoryEntity>(boxName);
    return box.values.toList();
  }
}
