import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/cart/domain/entities/cart_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<Failure, void>> addItemToCart(CartEntity item, String? token);

  Future<Either<Failure, List<CartEntity>>> getCartItems(String? token);
}
