import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveItemFromCart {
  final CartRepository _cartRepository;

  RemoveItemFromCart(this._cartRepository);

  Future<Either<Failure, void>> call(String? token, int itemId) async {
    return await _cartRepository.removeItemFromCart(token, itemId);
  }
}
