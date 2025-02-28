import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/hive_service.dart';

sealed class ProductDetailsLocalDataSource {
  Future<void> cacheItemToCart(CartEntity product);

  Future<bool> isItemExistToCart(int productId);

  Future<void> increaseItemToCart(int productId);

  Future<void> decreaseItemToCart(int productId);
}

class ProductDetailsLocalDataSourceImpl
    implements ProductDetailsLocalDataSource {
  final HiveService _hiveService;
  final String _boxName = 'cartBox';

  ProductDetailsLocalDataSourceImpl(this._hiveService);

  @override
  Future<void> cacheItemToCart(CartEntity product) async {
    await _hiveService.addData<CartEntity>(_boxName, product);
  }

  @override
  Future<void> increaseItemToCart(int productId) async {
    var box = _hiveService.getBox<CartEntity>(_boxName);
    for (int i = 0; i < box.length; i++) {
      var item = box.getAt(i);
      if (item != null && item.id == productId) {
        var updatedItem = CartEntity(
          id: item.id,
          title: item.title,
          price: item.price,
          quantity: item.quantity + 1,
          subTotal: item.subTotal + (item.subTotal / item.quantity),
        );
        await _hiveService.updateData<CartEntity>(_boxName, i, updatedItem);
        return;
      }
    }
  }

  @override
  Future<void> decreaseItemToCart(int productId) async {
    var box = _hiveService.getBox<CartEntity>(_boxName);
    for (int i = 0; i < box.length; i++) {
      var item = box.getAt(i);
      if (item != null && item.id == productId) {
        if (item.quantity > 1) {
          var updatedItem = CartEntity(
            id: item.id,
            title: item.title,
            price: item.price,
            quantity: item.quantity - 1,
            subTotal: item.subTotal - (item.subTotal / item.quantity),
          );
          await _hiveService.updateData<CartEntity>(_boxName, i, updatedItem);
        } else {
          await _hiveService.deleteData<CartEntity>(_boxName, i);
        }
        return;
      }
    }
  }

  @override
  Future<bool> isItemExistToCart(int productId) async {
    return _hiveService.containsData<CartEntity>(
      _boxName,
      (item) => item.id == productId,
    );
  }
}
