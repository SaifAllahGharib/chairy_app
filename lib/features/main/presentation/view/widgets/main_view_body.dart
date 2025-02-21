import 'package:chairy_app/features/cart/presentation/view/cart_view.dart';
import 'package:chairy_app/features/categories/presentation/view/categories_view.dart';
import 'package:chairy_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  final int index;

  const MainViewBody({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: const [
        HomeView(),
        CategoriesView(),
        CartView(),
      ],
    );
  }
}
