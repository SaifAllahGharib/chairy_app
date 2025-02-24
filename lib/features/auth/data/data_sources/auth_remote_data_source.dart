import 'package:chairy_app/core/services/auth_services.dart';
import 'package:chairy_app/features/auth/data/models/user_response_model.dart';

sealed class AuthRemoteDataSource {
  Future<UserResponseModel> register(
    String name,
    String lastName,
    String email,
    String password,
  );

  Future<UserResponseModel> login(
    String email,
    String password,
  );
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final AuthServices _authServices;

  AuthRemoteDataSourceImpl(this._authServices);

  @override
  Future<UserResponseModel> register(
      String name, String lastName, String email, String password) async {
    return await _authServices.register(name, lastName, email, password);
  }

  @override
  Future<UserResponseModel> login(String email, String password) async {
    return await _authServices.login(email, password);
  }
}
