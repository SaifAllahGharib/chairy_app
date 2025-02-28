import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_details_repository.dart';
import 'package:dartz/dartz.dart';

class DecreaseItem {
  final ProductDetailsRepository _productDetailsRepository;

  DecreaseItem(this._productDetailsRepository);

  Future<Either<Failure, void>> call(String? token, int productId) async {
    return await _productDetailsRepository.decreaseItemToCart(token, productId);
  }
}
