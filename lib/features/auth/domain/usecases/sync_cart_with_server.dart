import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SyncCartWithServer {
  final AuthRepository _authRepository;

  SyncCartWithServer(this._authRepository);

  Future<Either<Failure, void>> call(
      List<CartEntity> cart, String? token) async {
    return await _authRepository.syncCartWithServer(cart, token);
  }
}
