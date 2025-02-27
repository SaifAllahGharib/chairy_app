import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/categories/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class AddItemToCart {
  final ProductRepository _productRepository;

  AddItemToCart(this._productRepository);

  Future<Either<Failure, void>> call(CartEntity cart, String? token) async {
    return await _productRepository.addItemToCart(cart, token);
  }
}
