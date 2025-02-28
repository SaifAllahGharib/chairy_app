import 'package:chairy_app/core/services/db_services.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';

sealed class CartRemoteDataSource {
  Future<List<CartEntity>> getCartItems(String? token);

  Future<void> removeItemFromCart(String? token, int itemId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final DBServices _dbServices;

  CartRemoteDataSourceImpl(this._dbServices);

  @override
  Future<List<CartEntity>> getCartItems(String? token) async {
    return _dbServices.getCartItems(token);
  }

  @override
  Future<void> removeItemFromCart(String? token, int itemId) {
    return _dbServices.removeItemFromCart(token, itemId);
  }
}
