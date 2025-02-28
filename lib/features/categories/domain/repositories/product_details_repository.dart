import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, void>> addItemToCart(
    CartEntity product,
    String? token,
  );

  Future<Either<Failure, void>> increaseItemToCart(
      String? token, int productId);

  Future<Either<Failure, void>> decreaseItemToCart(
      String? token, int productId);

  Future<Either<Failure, bool>> isItemExistToCart(String? token, int productId);
}
