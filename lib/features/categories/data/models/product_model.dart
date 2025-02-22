import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required int id,
    required String title,
    required String description,
    required double price,
    required double discountPrice,
    required int quantity,
    required String imageUrl,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          discountPrice: discountPrice,
          quantity: quantity,
          imageUrl: imageUrl,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price']),
      discountPrice: double.parse(json['discount_Price']),
      quantity: json['quantity'],
      imageUrl: json['productimage'][0]['link'],
    );
  }
}
