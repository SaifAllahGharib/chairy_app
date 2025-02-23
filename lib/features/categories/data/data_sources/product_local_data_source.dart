import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:hive/hive.dart';

sealed class ProductLocalDataSource {
  Future<void> cacheProducts(List<ProductEntity> products);

  Future<List<ProductEntity>> getCachedProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  static const String boxName = "products_box";

  @override
  Future<void> cacheProducts(List<ProductEntity> products) async {
    final box = await Hive.openBox<ProductEntity>(boxName);
    await box.clear();
    await box.addAll(products);
  }

  @override
  Future<List<ProductEntity>> getCachedProducts() async {
    final box = await Hive.openBox<ProductEntity>(boxName);
    return box.values.toList();
  }
}
