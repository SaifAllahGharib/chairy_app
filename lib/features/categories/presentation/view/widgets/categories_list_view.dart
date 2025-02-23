import 'package:chairy_app/features/categories/domain/entities/category.dart';
import 'package:chairy_app/features/categories/presentation/view/products_category_view.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/categories_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesListView extends StatelessWidget {
  final List<Category> categories;

  const CategoriesListView({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => GoRouter.of(context)
              .push(ProductsCategoryView.id, extra: categories[index].id),
          child: CategoriesItemListView(category: categories[index]),
        );
      },
    );
  }
}
