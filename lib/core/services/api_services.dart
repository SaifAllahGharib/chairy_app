import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://test-ecomerce.xn--hrt-w-ova.de/',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {'Content-Type': 'application/json'},
          ),
        );

  Future<Response> get(String endpoint,
      [Map<String, dynamic>? queryParameters]) async {
    try {
      return await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept-Language':
                getIt.get<MySharedPreferences>().getString("lang") ?? "en"
          },
        ),
      );
    } catch (e) {
      throw Exception('Error in GET: $e');
    }
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      throw Exception('Error in POST: $e');
    }
  }

  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } catch (e) {
      throw Exception('Error in PUT: $e');
    }
  }

  Future<Response> delete(String endpoint) async {
    try {
      return await _dio.delete(endpoint);
    } catch (e) {
      throw Exception('Error in DELETE: $e');
    }
  }
}
