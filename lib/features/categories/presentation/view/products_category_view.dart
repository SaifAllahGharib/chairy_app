import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_products_by_category_id.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/products_category_view_body.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCategoryView extends StatelessWidget {
  static const String id = '/category_view';
  final CategoryEntity category;

  const ProductsCategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCategoryCubit(getIt.get<GetProductsByCategoryId>()),
      child: Scaffold(
        body: ProductsProductsCategoryViewBody(
          category: category,
        ),
      ),
    );
  }
}
