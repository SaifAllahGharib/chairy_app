import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategoryId(
    int categoryId,
  );

  Future<Either<Failure, ProductEntity>> getProductDetail(int productId);

  Future<Either<Failure, void>> addItemToCart(
    CartEntity cart,
    String? token,
  );

  Future<Either<Failure, bool>> isItemExistToCart(int itemId);

  Future<Either<Failure, void>> increaseItemToCart(
    int itemId,
    double? productPrice,
  );

  Future<Either<Failure, void>> decreaseItemToCart(
    int itemId,
    double? productPrice,
  );
}
