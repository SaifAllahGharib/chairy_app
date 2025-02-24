import 'package:chairy_app/core/services/api_services.dart';
import 'package:chairy_app/core/services/auth_services.dart';
import 'package:chairy_app/core/services/constants.dart' as constants;
import 'package:chairy_app/features/auth/data/models/user_response_model.dart';
import 'package:dio/dio.dart';

class ApiAuthServices extends AuthServices {
  final ApiService _apiService;

  ApiAuthServices(this._apiService);

  @override
  Future<UserResponseModel> register(
      String name, String lastName, String email, String password) async {
    try {
      final response = await _apiService.post(
        constants.register,
        FormData.fromMap({
          "name": name,
          "lastname": lastName,
          "email": email,
          "password": password,
        }),
        {"User-Type": "personal"},
      );

      return UserResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }

  @override
  Future<UserResponseModel> login(String email, String password) async {
    try {
      final response = await _apiService.post(
        constants.login,
        FormData.fromMap({
          "email": email,
          "password": password,
        }),
        {"User-Type": "personal"},
      );

      return UserResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
