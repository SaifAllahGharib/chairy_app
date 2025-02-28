import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class GetCashedItemFromCart {
  final CartRepository _cartRepository;

  GetCashedItemFromCart(this._cartRepository);

  Future<Either<Failure, List<CartEntity>>> call(String? token) async {
    return await _cartRepository.getCashedItemFromCart(token);
  }
}
