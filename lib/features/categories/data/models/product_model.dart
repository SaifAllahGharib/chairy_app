import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.discountPrice,
    required super.quantity,
    required super.imageUrl,
  });

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
