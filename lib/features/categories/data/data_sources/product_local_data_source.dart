import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/core/utils/hive_service.dart';

sealed class ProductLocalDataSource {
  Future<void> cacheProducts(List<ProductEntity> products);

  List<ProductEntity> getCachedProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final HiveService _hiveService;
  final String _boxName = "products_box";

  ProductLocalDataSourceImpl(this._hiveService);

  @override
  Future<void> cacheProducts(List<ProductEntity> products) async {
    await Future.wait([
      _hiveService.clearBox<ProductEntity>(_boxName),
      _hiveService.addAllData<ProductEntity>(_boxName, products),
    ]);
  }

  @override
  List<ProductEntity> getCachedProducts() {
    return _hiveService.getAllValues<ProductEntity>(_boxName);
  }
}
