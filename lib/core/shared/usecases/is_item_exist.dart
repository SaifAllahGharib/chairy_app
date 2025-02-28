import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_details_repository.dart';
import 'package:dartz/dartz.dart';

class IsItemExist {
  final ProductDetailsRepository _productDetailsRepository;

  IsItemExist(this._productDetailsRepository);

  Future<Either<Failure, bool>> call(String? token, int productId) async {
    return await _productDetailsRepository.isItemExistToCart(token, productId);
  }
}
