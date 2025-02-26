import 'package:chairy_app/core/errors/errore_handler.dart';
import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/data/data_sources/product_local_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/product_remote_data_source.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;
  final ProductLocalDataSource _productLocalDataSource;

  ProductRepositoryImpl(
      this._productRemoteDataSource, this._productLocalDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategoryId(
      int categoryId) async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;

    try {
      if (!isConnected) {
        return right(await _productLocalDataSource.getCachedProducts());
      }

      final products =
          await _productRemoteDataSource.getProductsByCategory(categoryId);
      await _productLocalDataSource.cacheProducts(products);
      return right(products);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductDetail(int productId) {
    throw UnimplementedError();
  }
}
