import 'package:chairy_app/features/categories/presentation/view/widgets/category_item_list_view.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return const CategoryItemListView();
      },
    );
  }
}
