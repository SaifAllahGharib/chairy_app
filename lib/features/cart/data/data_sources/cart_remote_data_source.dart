import 'package:chairy_app/core/services/db_services.dart';
import 'package:chairy_app/features/cart/domain/entities/cart_entity.dart';

sealed class CartRemoteDataSource {
  Future<void> addToCart(CartEntity item, String? token);

  Future<List<CartEntity>> getCart(String? token);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final DBServices _dbServices;

  CartRemoteDataSourceImpl(this._dbServices);

  @override
  Future<void> addToCart(CartEntity item, String? token) async {
    await _dbServices.addItemToCart(item, token);
  }

  @override
  Future<List<CartEntity>> getCart(String? token) async {
    return await _dbServices.getCartItems(token);
  }
}
