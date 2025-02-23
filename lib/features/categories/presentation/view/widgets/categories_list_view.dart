import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/products_category_view.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/categories_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesListView extends StatelessWidget {
  final List<CategoryEntity> categories;
  final bool isDark;

  const CategoriesListView({
    super.key,
    required this.categories,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => GoRouter.of(context)
              .push(ProductsCategoryView.id, extra: categories[index]),
          child: CategoriesItemListView(
            category: categories[index],
            isDark: isDark,
          ),
        );
      },
    );
  }
}
