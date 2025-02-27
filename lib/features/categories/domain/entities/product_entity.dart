import 'package:hive/hive.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 1)
class ProductEntity {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final double? price;
  @HiveField(4)
  final double? discountPrice;
  @HiveField(5)
  final int? quantity;
  @HiveField(6)
  final String? imageUrl;

  const ProductEntity({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPrice,
    this.quantity,
    this.imageUrl,
  });
}
