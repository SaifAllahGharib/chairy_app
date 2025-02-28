import 'package:chairy_app/core/services/db_services.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';

sealed class ProductsDetailsRemoteDataSource {
  Future<void> addItemToCart(CartEntity cart, String? token);

  Future<void> increaseItemToCart(String? token, int productId);

  Future<void> decreaseItemToCart(String? token, int productId);

  Future<bool> isItemExistToCart(String? token, int productId);
}

class ProductsDetailsRemoteDataSourceImpl
    implements ProductsDetailsRemoteDataSource {
  final DBServices _dbServices;

  ProductsDetailsRemoteDataSourceImpl(this._dbServices);

  @override
  Future<void> addItemToCart(CartEntity cart, String? token) async {
    await _dbServices.addItemToCart(cart, token);
  }

  @override
  Future<void> increaseItemToCart(String? token, int productId) async {
    await _dbServices.increaseItemToCart(token, productId);
  }

  @override
  Future<void> decreaseItemToCart(String? token, int productId) async {
    await _dbServices.decreaseItemToCart(token, productId);
  }

  @override
  Future<bool> isItemExistToCart(String? token, int productId) {
    // TODO: implement isItemExistToCart
    throw UnimplementedError();
  }
}
