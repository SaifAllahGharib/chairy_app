import 'package:chairy_app/core/services/db_services.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/categories/data/models/product_model.dart';

sealed class ProductRemoteDataSource {
  Future<List<ProductModel>> getProductsByCategory(int categoryId);

  Future<ProductModel> getProductDetail(String productId);

  Future<void> addToCart(CartEntity cart, String? token);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final DBServices _dbServices;

  ProductRemoteDataSourceImpl(this._dbServices);

  @override
  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    return await _dbServices.getProductsByCategoryId(categoryId);
  }

  @override
  Future<ProductModel> getProductDetail(String productId) async {
    return await _dbServices.getProductDetail(productId);
  }

  @override
  Future<void> addToCart(CartEntity cart, String? token) async {
    await _dbServices.addItemToCart(cart, token);
  }
}
