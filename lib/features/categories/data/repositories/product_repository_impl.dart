import 'package:chairy_app/features/categories/data/data_sources/product_remote_data_source.dart';
import 'package:chairy_app/features/categories/domain/entities/product.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductRepositoryImpl(this._productRemoteDataSource);

  @override
  Future<Either<String, List<Product>>> getProductsByCategoryId(
      int categoryId) async {
    try {
      return right(
          await _productRemoteDataSource.getProductsByCategory(categoryId));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Product>> getProductDetail(int productId) {
    // TODO: implement getProductDetail
    throw UnimplementedError();
  }
}
