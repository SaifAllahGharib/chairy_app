import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/auth/domain/entities/order_entity.dart';
import 'package:chairy_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class CreateOrder {
  final AuthRepository _authRepository;

  CreateOrder(this._authRepository);

  Future<Either<Failure, OrderEntity>> call(
    String? token,
    String shippingStreetAddress,
    String shippingState,
    String shippingCountry,
    String paymentMethod,
  ) async {
    return await _authRepository.createOrder(
      token,
      shippingStreetAddress,
      shippingState,
      shippingCountry,
      paymentMethod,
    );
  }
}
