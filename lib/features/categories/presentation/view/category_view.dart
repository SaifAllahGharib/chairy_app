import 'package:chairy_app/core/services/api_db-services.dart';
import 'package:chairy_app/core/services/api_services.dart';
import 'package:chairy_app/features/categories/data/data_sources/product_remote_data_source.dart';
import 'package:chairy_app/features/categories/data/repositories/product_repository_impl.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_products_by_category_id.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/category_view_body.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  static const String id = '/category_view';
  final int categoryId;

  const CategoryView({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        GetProductsByCategoryId(
          ProductRepositoryImpl(
            ProductRemoteDataSourceImpl(
              ApiDBServices(
                ApiService(),
              ),
            ),
          ),
        ),
      ),
      child: Scaffold(
        body: CategoryViewBody(
          categoryId: categoryId,
        ),
      ),
    );
  }
}
