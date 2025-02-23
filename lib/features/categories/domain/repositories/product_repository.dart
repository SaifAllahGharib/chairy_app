import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProductsByCategoryId(
      int categoryId);

  Future<Either<Failure, Product>> getProductDetail(int productId);
}
