import 'package:chairy_app/core/shared/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.id,
    required super.title,
    required super.price,
    required super.quantity,
    required super.subTotal,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      title: json['name'],
      price: json['price'],
      quantity: json['qty'],
      subTotal: json['subtotal'],
    );
  }
}
