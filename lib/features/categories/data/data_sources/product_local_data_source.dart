import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/hive_service.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';

sealed class ProductLocalDataSource {
  Future<void> cacheProducts(List<ProductEntity> products);

  List<ProductEntity> getCachedProducts();

  Future<void> cacheItemToCart(CartEntity cart);

  Future<bool> isItemExistToCart(int itemId);

  Future<void> increaseItemToCart(int itemId, double? productPrice);

  Future<void> decreaseItemToCart(int itemId, double? productPrice);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final HiveService _hiveService;
  final String _boxName = "products_box";
  final String _cartBox = "cart_box";

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

  @override
  Future<void> cacheItemToCart(CartEntity cart) async {
    await _hiveService.addData<CartEntity>(
      _cartBox,
      cart,
    );
  }

  @override
  Future<bool> isItemExistToCart(int itemId) async {
    var cartItems = _hiveService.getAllValues<CartEntity>(_cartBox);
    return cartItems.any((item) => item.id == itemId);
  }

  @override
  Future<void> increaseItemToCart(int itemId, double? productPrice) async {
    var cartItems = _hiveService.getAllValues<CartEntity>(_cartBox);

    int itemIndex = cartItems.indexWhere((item) => item.id == itemId);

    if (itemIndex != -1) {
      CartEntity updatedItem = cartItems[itemIndex].copyWith(
        quantity: cartItems[itemIndex].quantity + 1,
        subTotal: productPrice! * (cartItems[itemIndex].quantity + 1),
      );

      await _hiveService.updateData<CartEntity>(
          _cartBox, itemIndex, updatedItem);
    }
  }

  @override
  Future<void> decreaseItemToCart(int itemId, double? productPrice) async {
    var cartItems = _hiveService.getAllValues<CartEntity>(_cartBox);

    int itemIndex = cartItems.indexWhere((item) => item.id == itemId);

    if (itemIndex != -1) {
      CartEntity currentItem = cartItems[itemIndex];

      if (currentItem.quantity > 1) {
        CartEntity updatedItem = currentItem.copyWith(
          quantity: currentItem.quantity - 1,
          subTotal: productPrice! * (currentItem.quantity - 1),
        );

        await _hiveService.updateData<CartEntity>(
            _cartBox, itemIndex, updatedItem);
      } else {
        await _hiveService.deleteData<CartEntity>(_cartBox, itemIndex);
      }
    }
  }
}
