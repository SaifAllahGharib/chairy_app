import 'package:hive/hive.dart';

part 'cart_entity.g.dart';

@HiveType(typeId: 2)
class CartEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final int quantity;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final num? subTotal;

  CartEntity({
    required this.id,
    this.name,
    required this.quantity,
    this.price,
    this.subTotal,
  });
}
