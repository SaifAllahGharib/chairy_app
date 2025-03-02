import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/products_category_view_body.dart';
import 'package:flutter/material.dart';

class ProductsCategoryView extends StatelessWidget {
  static const String id = '/category_view';
  final CategoryEntity category;

  const ProductsCategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductsProductsCategoryViewBody(
        category: category,
      ),
    );
  }
}
