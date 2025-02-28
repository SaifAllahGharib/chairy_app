class OrderEntity {
  final int id;
  final String orderNumber;
  final double grandTotal;
  final String paymentMethod;
  final String sessionUrl;

  OrderEntity({
    required this.id,
    required this.orderNumber,
    required this.grandTotal,
    required this.paymentMethod,
    required this.sessionUrl,
  });
}
