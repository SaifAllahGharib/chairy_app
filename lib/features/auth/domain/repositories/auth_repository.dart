import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/auth/domain/entities/order_entity.dart';
import 'package:chairy_app/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(
    String name,
    String lastName,
    String email,
    String password,
  );

  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  );

  Future<Either<Failure, void>> syncCartWithServer(
    List<CartEntity> cart,
    String? token,
  );

  Future<Either<Failure, OrderEntity>> createOrder(
    String? token,
    String shippingStreetAddress,
    String shippingState,
    String shippingCountry,
    String paymentMethod,
  );
}
