import 'package:chairy_app/core/errors/errore_handler.dart';
import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/utils/internet_connectivity.dart';
import 'package:chairy_app/features/categories/data/data_sources/products_category_local_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/products_category_remote_data_source.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/domain/repositories/products_category_repository.dart';
import 'package:dartz/dartz.dart';

class ProductsCategoryRepositoryImpl implements ProductsCategoryRepository {
  final ProductsCategoryRemoteDataSource _productRemoteDataSource;
  final ProductsCategoryLocalDataSource _productLocalDataSource;
  final InternetConnectivity _connectivity;

  ProductsCategoryRepositoryImpl(
    this._productRemoteDataSource,
    this._productLocalDataSource,
    this._connectivity,
  );

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategoryId(
      int categoryId) async {
    try {
      if (!await _connectivity.isConnected) {
        return right(_productLocalDataSource.getCachedProducts());
      }

      final products =
          await _productRemoteDataSource.getProductsByCategory(categoryId);
      await _productLocalDataSource.cacheProducts(products);
      return right(products);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
