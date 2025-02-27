import 'package:chairy_app/core/errors/errore_handler.dart';
import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/categories/data/data_sources/product_local_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/product_remote_data_source.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;
  final ProductLocalDataSource _productLocalDataSource;
  final MySharedPreferences _mySharedPreferences;

  ProductRepositoryImpl(
    this._productRemoteDataSource,
    this._productLocalDataSource,
    this._mySharedPreferences,
  );

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategoryId(
      int categoryId) async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;

    try {
      if (!isConnected) {
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

  @override
  Future<Either<Failure, ProductEntity>> getProductDetail(int productId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> addItemToCart(
    CartEntity cart,
    String? token,
  ) async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;

    try {
      if (_mySharedPreferences.userIsLogin() && isConnected) {
        return right(await _productRemoteDataSource.addToCart(cart, token));
      } else {
        await _mySharedPreferences.storeInt("item${cart.id}", cart.quantity);
        final response = _productLocalDataSource.cacheItemToCart(cart);
        return right(response);
      }
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> isItemExistToCart(int itemId) async {
    try {
      return right(await _productLocalDataSource.isItemExistToCart(itemId));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> increaseItemToCart(
    int itemId,
    double? productPrice,
  ) async {
    try {
      final response = await _productLocalDataSource.increaseItemToCart(
          itemId, productPrice);

      print("RESPONSE SUCCESS INC LOCAL");

      return right(response);
    } catch (e) {
      print("RESPONSE FAILURE INC LOCAL: $e");
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> decreaseItemToCart(
    int itemId,
    double? productPrice,
  ) async {
    try {
      final response = await _productLocalDataSource.decreaseItemToCart(
          itemId, productPrice);

      print("RESPONSE SUCCESS DEC LOCAL");

      return right(response);
    } catch (e) {
      print("RESPONSE FAILURE DEC LOCAL: $e");
      return left(ErrorHandler.handleError(e));
    }
  }
}
