import 'package:chairy_app/features/categories/presentation/view/widgets/category_view_body.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  static const String id = '/category_view';

  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CategoryViewBody());
  }
}
