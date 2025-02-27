import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class IncreaseItemToCart {
  final ProductRepository _productRepository;

  IncreaseItemToCart(this._productRepository);

  Future<Either<Failure, void>> call(int itemId, double? productPrice) async {
    return await _productRepository.increaseItemToCart(itemId, productPrice);
  }
}
