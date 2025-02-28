import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_details_repository.dart';
import 'package:dartz/dartz.dart';

class AddItemToCart {
  final ProductDetailsRepository _productDetailsRepository;

  AddItemToCart(this._productDetailsRepository);

  Future<Either<Failure, void>> call(CartEntity item, String? token) async {
    return _productDetailsRepository.addItemToCart(item, token);
  }
}
