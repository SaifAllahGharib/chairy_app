import 'package:hive/hive.dart';

part 'category_entity.g.dart';

@HiveType(typeId: 0)
class CategoryEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final int status;

  const CategoryEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.status,
  });
}
