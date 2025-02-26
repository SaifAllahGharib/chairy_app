import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:chairy_app/features/auth/domain/entities/user_entity.dart';
import 'package:chairy_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> register(
    String name,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      final response = await _authRemoteDataSource.register(
        name,
        lastName,
        email,
        password,
      );

      print("MESSAGE: ${response.message}");

      return right(response.data);
    } catch (e) {
      return left(const AuthFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      final response = await _authRemoteDataSource.login(
        email,
        password,
      );

      getIt
          .get<MySharedPreferences>()
          .storeString("token", response.data.token ?? "");

      print("MESSAGE: ${response.message}");
      print("TOKEN: ${response.data.token}");

      return right(response.data);
    } catch (e) {
      return left(const AuthFailure());
    }
  }
}
