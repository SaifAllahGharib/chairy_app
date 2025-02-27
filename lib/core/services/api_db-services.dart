import 'package:chairy_app/core/services/api_services.dart';
import 'package:chairy_app/core/services/constants.dart';
import 'package:chairy_app/core/services/db_services.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/cart/data/models/cart_model.dart';
import 'package:chairy_app/features/categories/data/models/category_model.dart';
import 'package:chairy_app/features/categories/data/models/product_model.dart';

class ApiDBServices extends DBServices {
  final ApiService _apiService;

  ApiDBServices(this._apiService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _apiService.get(endpoint: getAllCategories);
      final List<dynamic> data = response.data['data'];
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategoryId(int categoryId) async {
    try {
      final response = await _apiService.get(
        endpoint: getProductsCategoryById,
        queryParameters: {"category_id": categoryId},
      );
      final List<dynamic> data = response.data['data'];
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  @override
  Future<ProductModel> getProductDetail(String productId) async {
    try {
      final response =
          await _apiService.get(endpoint: getProductDetailsById + productId);
      final data = response.data['data'];
      return ProductModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  @override
  Future<void> addItemToCart(CartEntity cart, String? token) async {
    try {
      final response = await _apiService.post(
        endpoint: addItemToTheCart,
        data: {
          "item_id": cart.id,
          "qty": cart.quantity,
        },
        token: token,
      );

      print("ADD ITEM TO CART: ${response}");
    } catch (e) {
      throw Exception('Failed to add item to cart: $e');
    }
  }

  @override
  Future<List<CartModel>> getCartItems(String? token) async {
    try {
      final response =
          await _apiService.get(endpoint: getItemsFromCart, token: token);

      final cartItems = response.data["data"]["cart_items"];

      print("GET ITEM FROM CART: $cartItems");

      if (cartItems is List) {
        return cartItems.map((json) => CartModel.fromJson(json)).toList();
      } else {
        throw Exception('Invalid response format: Expected a List');
      }
    } catch (e) {
      print("ERROR GET ITEM FROM CART: $e");
      throw Exception('Failed to get items from cart: $e');
    }
  }
}
