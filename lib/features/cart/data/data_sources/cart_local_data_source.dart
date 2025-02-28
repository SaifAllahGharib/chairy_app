import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/hive_service.dart';

sealed class CartLocalDataSource {
  List<CartEntity> getCashedItemFromCart();

  Future<void> removeItemFromCart(int itemId);
}

class CartLocalDataSourceImpl extends CartLocalDataSource {
  final HiveService _hiveService;
  final String _boxName = 'cartBox';

  CartLocalDataSourceImpl(this._hiveService);

  @override
  List<CartEntity> getCashedItemFromCart() {
    return _hiveService.getAllValues(_boxName);
  }

  @override
  Future<void> removeItemFromCart(int itemId) async {
    var box = _hiveService.getBox<CartEntity>(_boxName);
    for (int i = 0; i < box.length; i++) {
      var item = box.getAt(i);
      if (item != null && item.id == itemId) {
        await _hiveService.deleteData<CartEntity>(_boxName, i);
        return;
      }
    }
  }
}
