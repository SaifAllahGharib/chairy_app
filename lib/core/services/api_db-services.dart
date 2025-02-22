import 'package:chairy_app/core/services/api_services.dart';
import 'package:chairy_app/core/services/constants.dart';
import 'package:chairy_app/core/services/db_services.dart';
import 'package:chairy_app/features/categories/data/models/category_model.dart';
import 'package:chairy_app/features/categories/data/models/product_model.dart';

class ApiDBServices extends DBServices {
  final ApiService _apiService;

  ApiDBServices(this._apiService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _apiService.get(getAllCategories);
      final List<dynamic> data = response.data['data'];
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategoryId(int categoryId) async {
    try {
      final response = await _apiService
          .get(getProductsCategoryById, {"category_id": categoryId});
      final List<dynamic> data = response.data['data'];
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  @override
  Future<ProductModel> getProductDetail(String productId) async {
    try {
      final response = await _apiService.get(getProductDetailsById + productId);
      final data = response.data['data'];
      return ProductModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}
