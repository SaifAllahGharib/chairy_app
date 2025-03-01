import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/auth/data/models/order_model.dart';
import 'package:chairy_app/features/cart/data/models/cart_model.dart';
import 'package:chairy_app/features/categories/data/models/category_model.dart';
import 'package:chairy_app/features/categories/data/models/product_model.dart';

abstract class DBServices {
  Future<List<CategoryModel>> getCategories();

  Future<List<ProductModel>> getProductsByCategoryId(int categoryId);

  Future<ProductModel> getProductDetail(String productId);

  Future<void> addItemToCart(CartEntity cart, String? token);

  Future<List<CartModel>> getCartItems(String? token);

  Future<void> increaseItemToCart(String? token, int itemId);

  Future<void> decreaseItemToCart(String? token, int itemId);

  Future<void> removeItemFromCart(String? token, int itemId);

  Future<OrderModel> createOrder(
    String? token,
    String shippingStreetAddress,
    String shippingState,
    String shippingCountry,
    String paymentMethod,
  );

  Future<bool> isItemInCart(String? token, int itemId);
}
