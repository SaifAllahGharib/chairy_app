import 'package:chairy_app/core/services/db_services.dart';
import 'package:chairy_app/features/categories/data/models/product_model.dart';

sealed class ProductsCategoryRemoteDataSource {
  Future<List<ProductModel>> getProductsByCategory(int categoryId);
}

class ProductsCategoryRemoteDataSourceImpl
    implements ProductsCategoryRemoteDataSource {
  final DBServices _dbServices;

  ProductsCategoryRemoteDataSourceImpl(this._dbServices);

  @override
  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    return await _dbServices.getProductsByCategoryId(categoryId);
  }
}
