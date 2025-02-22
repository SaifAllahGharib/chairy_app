import 'package:chairy_app/features/categories/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.title,
    required super.description,
    required super.image,
    required super.status,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      status: json['status'],
    );
  }
}
