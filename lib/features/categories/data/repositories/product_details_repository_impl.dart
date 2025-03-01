import 'package:chairy_app/core/errors/errore_handler.dart';
import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/internet_connectivity.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/categories/data/data_sources/product_details_local_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/products_details_remote_data_source.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_details_repository.dart';
import 'package:dartz/dartz.dart';

class ProductDetailsRepositoryImpl extends ProductDetailsRepository {
  final ProductDetailsLocalDataSource _productDetailsLocalDataSource;
  final ProductsDetailsRemoteDataSource _productsDetailsRemoteDataSource;
  final InternetConnectivity _internetConnectivity;
  final MySharedPreferences _mySharedPreferences;

  ProductDetailsRepositoryImpl(
    this._productDetailsLocalDataSource,
    this._productsDetailsRemoteDataSource,
    this._internetConnectivity,
    this._mySharedPreferences,
  );

  @override
  Future<Either<Failure, void>> addItemToCart(
      CartEntity product, String? token) async {
    try {
      if ((_mySharedPreferences.getBool("con") ?? false) &&
          _mySharedPreferences.userIsLogin()) {
        final response = await _productsDetailsRemoteDataSource.addItemToCart(
          product,
          token,
        );

        print("RESPONSE ADD ITEM TO API CART");

        return right(response);
      }

      final response =
          await _productDetailsLocalDataSource.cacheItemToCart(product);

      print("RESPONSE ADD ITEM TO LOCAL CART");

      return right(response);
    } catch (e) {
      print("RESPONSE ERROR TO ADD ITEMS TO CART: $e");
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> increaseItemToCart(
      String? token, int productId) async {
    try {
      if ((_mySharedPreferences.getBool("con") ?? false) &&
          _mySharedPreferences.userIsLogin()) {
        return right(
          await _productsDetailsRemoteDataSource.increaseItemToCart(
            token,
            productId,
          ),
        );
      }

      return right(
          await _productDetailsLocalDataSource.increaseItemToCart(productId));
    } catch (e) {
      print("ERROR TO INC ITEM TO CART: $e");
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> decreaseItemToCart(
      String? token, int productId) async {
    try {
      if ((_mySharedPreferences.getBool("con") ?? false) &&
          _mySharedPreferences.userIsLogin()) {
        return right(
          await _productsDetailsRemoteDataSource.decreaseItemToCart(
            token,
            productId,
          ),
        );
      }

      return right(
          await _productDetailsLocalDataSource.decreaseItemToCart(productId));
    } catch (e) {
      print("ERROR TO DEC ITEM TO CART: $e");
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> isItemExistToCart(
      String? token, int productId) async {
    try {
      return right(
          await _productDetailsLocalDataSource.isItemExistToCart(productId));
    } catch (e) {
      print("ERROR TO GET IS ITEM EXIST ITEM TO CART: $e");
      return left(ErrorHandler.handleError(e));
    }
  }
}
