import 'package:chairy_app/core/errors/errore_handler.dart';
import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/internet_connectivity.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/cart/data/data_sources/cart_local_data_source.dart';
import 'package:chairy_app/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:chairy_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl extends CartRepository {
  final CartLocalDataSource _cartLocalDataSource;
  final CartRemoteDataSource _cartRemoteDataSource;
  final InternetConnectivity _internetConnectivity;
  final MySharedPreferences _mySharedPreferences;

  CartRepositoryImpl(
    this._cartLocalDataSource,
    this._cartRemoteDataSource,
    this._internetConnectivity,
    this._mySharedPreferences,
  );

  @override
  Future<Either<Failure, List<CartEntity>>> getCashedItemFromCart(
      String? token) async {
    try {
      if (await _internetConnectivity.isConnected &&
          _mySharedPreferences.userIsLogin()) {
        final response = await _cartRemoteDataSource.getCartItems(token);

        print("RESPONSE TO GET ITEMS FROM CART");

        return right(response);
      }
      return right(_cartLocalDataSource.getCashedItemFromCart());
    } catch (e) {
      print("ERROR TO GET ITEMS FROM CART: $e");
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> removeItemFromCart(
    String? token,
    int itemId,
  ) async {
    try {
      if (await _internetConnectivity.isConnected &&
          _mySharedPreferences.userIsLogin()) {
        final response =
            await _cartRemoteDataSource.removeItemFromCart(token, itemId);

        print("RESPONSE TO REMOVE ITEMS FROM CART");

        return right(response);
      }

      return right(_cartLocalDataSource.removeItemFromCart(itemId));
    } catch (e) {
      print("ERROR TO REMOVE ITEMS FROM CART: $e");
      return left(ErrorHandler.handleError(e));
    }
  }
}
