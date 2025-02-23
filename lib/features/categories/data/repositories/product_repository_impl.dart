import 'package:chairy_app/core/errors/errore_handler.dart';
import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/data/data_sources/product_remote_data_source.dart';
import 'package:chairy_app/features/categories/domain/entities/product.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductRepositoryImpl(this._productRemoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategoryId(
      int categoryId) async {
    try {
      return right(
          await _productRemoteDataSource.getProductsByCategory(categoryId));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetail(int productId) {
    throw UnimplementedError();
  }
}
