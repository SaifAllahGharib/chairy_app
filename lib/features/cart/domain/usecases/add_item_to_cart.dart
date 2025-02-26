import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/cart/domain/entities/cart_entity.dart';
import 'package:chairy_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class AddItemToCart {
  final CartRepository _cartRepository;

  AddItemToCart(this._cartRepository);

  Future<Either<Failure, void>> call(CartEntity item, String? token) async {
    return await _cartRepository.addItemToCart(item, token);
  }
}
