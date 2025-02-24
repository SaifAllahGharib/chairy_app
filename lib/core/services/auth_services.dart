import 'package:chairy_app/features/auth/data/models/user_response_model.dart';

abstract class AuthServices {
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
