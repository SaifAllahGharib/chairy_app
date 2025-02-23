import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/entities/product.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetProductsByCategoryId {
  final ProductRepository _productRepository;

  GetProductsByCategoryId(this._productRepository);

  Future<Either<Failure, List<Product>>> call(int categoryId) async {
    return await _productRepository.getProductsByCategoryId(categoryId);
  }
}
