import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartEntity>>> getCartItems(String? token);

  Future<Either<Failure, void>> removeItemFromCart(int itemId);
}
