import 'package:chairy_app/core/utils/hive_service.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';

sealed class ProductsCategoryLocalDataSource {
  Future<void> cacheProducts(List<ProductEntity> products);

  List<ProductEntity> getCachedProducts();
}

class ProductsCategoryLocalDataSourceImpl
    implements ProductsCategoryLocalDataSource {
  final HiveService _hiveService;
  final String _boxName = "products_box";

  ProductsCategoryLocalDataSourceImpl(this._hiveService);

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
