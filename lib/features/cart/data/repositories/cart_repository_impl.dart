import 'package:chairy_app/core/errors/errore_handler.dart';
import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/cart/data/data_sources/cart_local_data_source.dart';
import 'package:chairy_app/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:chairy_app/features/cart/domain/entities/cart_entity.dart';
import 'package:chairy_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;
  final CartLocalDataSource _cartLocalDataSource;
  final MySharedPreferences _mySharedPreferences;

  CartRepositoryImpl(
    this._cartRemoteDataSource,
    this._cartLocalDataSource,
    this._mySharedPreferences,
  );

  @override
  Future<Either<Failure, void>> addItemToCart(
      CartEntity item, String? token) async {
    try {
      if (_mySharedPreferences.userIsLogin()) {
        return right(await _cartRemoteDataSource.addToCart(item, token));
      } else {
        return right(await _cartLocalDataSource.cacheItemToCart(item));
      }
    } catch (e) {
      print("ERROR CART REPOSITORY: $e");
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> getCartItems(String? token) async {
    try {
      if (_mySharedPreferences.userIsLogin()) {
        return right(await _cartRemoteDataSource.getCart(token));
      } else {
        return right(_cartLocalDataSource.getCashedItems());
      }
    } catch (e) {
      print("Error: $e");
      return left(ErrorHandler.handleError(e));
    }
  }
}
