import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/auth/domain/entities/user_entity.dart';
import 'package:chairy_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class Login {
  final AuthRepository _authRepository;

  Login(this._authRepository);

  Future<Either<Failure, UserEntity>> call(
    String email,
    String password,
  ) async {
    return await _authRepository.login(
      email,
      password,
    );
  }
}
