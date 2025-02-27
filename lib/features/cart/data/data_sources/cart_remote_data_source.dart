import 'package:chairy_app/core/services/db_services.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';

sealed class CartRemoteDataSource {
  Future<List<CartEntity>> getCart(String? token);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final DBServices _dbServices;

  CartRemoteDataSourceImpl(this._dbServices);

  @override
  Future<List<CartEntity>> getCart(String? token) async {
    return await _dbServices.getCartItems(token);
  }
}
