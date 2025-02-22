import 'package:chairy_app/features/categories/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<String, List<Product>>> getProductsByCategoryId(int categoryId);

  Future<Either<String, Product>> getProductDetail(int productId);
}
