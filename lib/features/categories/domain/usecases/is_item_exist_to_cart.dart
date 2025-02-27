import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class IsItemExistToCart {
  final ProductRepository _productRepository;

  IsItemExistToCart(this._productRepository);

  Future<Either<Failure, bool>> call(int itemId) async {
    return await _productRepository.isItemExistToCart(itemId);
  }
}
