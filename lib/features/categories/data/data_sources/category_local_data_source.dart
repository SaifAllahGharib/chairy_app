import 'package:chairy_app/core/utils/hive_service.dart';

import '../../domain/entities/category_entity.dart';

sealed class CategoryLocalDataSource {
  Future<void> cacheCategories(List<CategoryEntity> categories);

  List<CategoryEntity> getCachedCategories();

  List<CategoryEntity> searchCategories(
      String query, List<CategoryEntity> list);
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final HiveService _hiveService;
  final String _boxName = "categories_box";

  CategoryLocalDataSourceImpl(this._hiveService);

  @override
  Future<void> cacheCategories(List<CategoryEntity> categories) async {
    await Future.wait([
      _hiveService.clearBox<CategoryEntity>(_boxName),
      _hiveService.addAllData<CategoryEntity>(_boxName, categories),
    ]);
  }

  @override
  List<CategoryEntity> getCachedCategories() {
    final result = _hiveService.getAllValues<CategoryEntity>(_boxName);
    print("CACHED CATEGORY 1: $result");
    return result;
  }

  @override
  List<CategoryEntity> searchCategories(
      String query, List<CategoryEntity> list) {
    return list
        .where(
          (category) =>
              category.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
