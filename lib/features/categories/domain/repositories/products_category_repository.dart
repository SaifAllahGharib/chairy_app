import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsCategoryRepository {
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategoryId(
    int categoryId,
  );

  List<ProductEntity> searchCategories(
    String query,
    List<ProductEntity> list,
  );
}
