import 'package:chairy_app/features/auth/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.orderNumber,
    required super.grandTotal,
    required super.paymentMethod,
    required super.sessionUrl,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? 0,
      orderNumber: json['Order_Number'] ?? '',
      grandTotal: double.tryParse(json['Grand_Total'].toString()) ?? 0.0,
      paymentMethod: json['Payment_Method'] ?? '',
      sessionUrl: json['session_url'] ?? '',
    );
  }
}
