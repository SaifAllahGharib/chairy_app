import 'package:chairy_app/core/services/api_db-services.dart';
import 'package:chairy_app/features/categories/data/models/product_model.dart';

sealed class ProductRemoteDataSource {
  Future<List<ProductModel>> getProductsByCategory(int categoryId);

  Future<ProductModel> getProductDetail(String productId);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiDBServices _apiDBServices;

  ProductRemoteDataSourceImpl(this._apiDBServices);

  @override
  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    return await _apiDBServices.getProductsByCategoryId(categoryId);
  }

  @override
  Future<ProductModel> getProductDetail(String productId) async {
    return await _apiDBServices.getProductDetail(productId);
  }
}
