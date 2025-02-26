import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/cart/domain/entities/cart_entity.dart';
import 'package:chairy_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class GetItemsFromCart {
  final CartRepository _cartRepository;

  GetItemsFromCart(this._cartRepository);

  Future<Either<Failure, List<CartEntity>>> call(String? token) async {
    return _cartRepository.getCartItems(token);
  }
}
