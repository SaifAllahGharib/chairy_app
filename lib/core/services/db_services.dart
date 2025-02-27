import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/cart/data/models/cart_model.dart';
import 'package:chairy_app/features/categories/data/models/category_model.dart';
import 'package:chairy_app/features/categories/data/models/product_model.dart';

abstract class DBServices {
  Future<List<CategoryModel>> getCategories();

  Future<List<ProductModel>> getProductsByCategoryId(int categoryId);

  Future<ProductModel> getProductDetail(String productId);

  Future<void> addItemToCart(CartEntity cart, String? token);

  Future<List<CartModel>> getCartItems(String? token);
}
