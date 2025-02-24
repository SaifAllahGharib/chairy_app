import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/auth/domain/entities/user_entity.dart';
import 'package:chairy_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class Register {
  final AuthRepository _authRepository;

  Register(this._authRepository);

  Future<Either<Failure, UserEntity>> call(
    String name,
    String lastName,
    String email,
    String password,
  ) async {
    return await _authRepository.register(
      name,
      lastName,
      email,
      password,
    );
  }
}
