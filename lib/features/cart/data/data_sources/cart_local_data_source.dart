import 'package:chairy_app/core/utils/hive_service.dart';
import 'package:chairy_app/features/cart/domain/entities/cart_entity.dart';

sealed class CartLocalDataSource {
  Future<void> cacheItemToCart(CartEntity item);

  List<CartEntity> getCashedItems();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final HiveService _hiveService;
  final String _boxName = "cart_box";

  CartLocalDataSourceImpl(this._hiveService);

  @override
  Future<void> cacheItemToCart(CartEntity item) async {
    await _hiveService.addData<CartEntity>(_boxName, item);
  }

  @override
  List<CartEntity> getCashedItems() {
    return _hiveService.getAllValues<CartEntity>(_boxName);
  }
}
