import 'package:chairy_app/features/categories/presentation/view/category_view.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/categories_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => GoRouter.of(context).push(CategoryView.id),
          child: const CategoriesItemListView(),
        );
      },
    );
  }
}
