import 'package:chairy_app/features/auth/domain/entities/order_price_entity.dart';

class OrderPriceModel extends OrderPriceEntity {
  OrderPriceModel({
    required super.subtotal,
    required super.tax,
    required super.shippingCharge,
    required super.discount,
    required super.grandTotal,
  });

  factory OrderPriceModel.fromMap(Map<String, dynamic> map) {
    return OrderPriceModel(
      subtotal: (map['subtotal'] ?? 0).toDouble(),
      tax: (map['tax'] ?? 0).toDouble(),
      shippingCharge: (map['shipping_charge'] ?? 0).toDouble(),
      discount: (map['discount'] ?? 0).toDouble(),
      grandTotal: (map['grand_total'] ?? 0).toDouble(),
    );
  }
}
