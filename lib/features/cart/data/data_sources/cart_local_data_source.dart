import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/hive_service.dart';

sealed class CartLocalDataSource {
  List<CartEntity> getCashedItems();

  Future<void> removeItemFromCart(int itemId);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final HiveService _hiveService;
  final String _boxName = "cart_box";

  CartLocalDataSourceImpl(this._hiveService);

  @override
  List<CartEntity> getCashedItems() {
    return _hiveService.getAllValues<CartEntity>(_boxName);
  }

  @override
  Future<void> removeItemFromCart(int itemId) async {
    var cartItems = _hiveService.getAllValues<CartEntity>(_boxName);

    int itemIndex = cartItems.indexWhere((item) => item.id == itemId);

    if (itemIndex != -1) {
      await _hiveService.deleteData<CartEntity>(_boxName, itemIndex);
    }
  }
}
