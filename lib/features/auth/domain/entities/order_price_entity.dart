class OrderPriceEntity {
  final double subtotal;
  final double tax;
  final double shippingCharge;
  final double discount;
  final double grandTotal;

  OrderPriceEntity({
    required this.subtotal,
    required this.tax,
    required this.shippingCharge,
    required this.discount,
    required this.grandTotal,
  });
}
