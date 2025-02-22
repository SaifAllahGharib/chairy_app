class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPrice;
  final int quantity;
  final String imageUrl;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPrice,
    required this.quantity,
    required this.imageUrl,
  });
}
