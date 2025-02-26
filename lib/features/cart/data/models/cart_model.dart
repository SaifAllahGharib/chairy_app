import 'package:chairy_app/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.id,
    required super.name,
    required super.quantity,
    required super.price,
    required super.subTotal,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      name: json['name'],
      quantity: json['qty'],
      price: json['price'].toDouble(),
      subTotal: json['subtotal'],
    );
  }
}
