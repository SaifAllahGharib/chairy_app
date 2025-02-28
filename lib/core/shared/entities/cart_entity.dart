import 'package:hive/hive.dart';

part 'cart_entity.g.dart';

@HiveType(typeId: 2)
class CartEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final num price;
  @HiveField(3)
  final int quantity;
  @HiveField(4)
  final num subTotal;

  CartEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.subTotal,
  });
}
