import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/widgets/custom_error_widget.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/dir_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/mid_category_section.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/products_grid_view.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/top_section_category_view.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_cubit.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsProductsCategoryViewBody extends StatefulWidget {
  final CategoryEntity category;

  const ProductsProductsCategoryViewBody({super.key, required this.category});

  @override
  State<ProductsProductsCategoryViewBody> createState() =>
      _ProductsProductsCategoryViewBodyState();
}

class _ProductsProductsCategoryViewBodyState
    extends State<ProductsProductsCategoryViewBody> {
  bool get _isDark => context.watch<ThemeCubit>().isDark;

  @override
  void initState() {
    _fetchProductsCategory();
    super.initState();
  }

  void _fetchProductsCategory() {
    context.read<ProductsCategoryCubit>().fetchProducts(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCategoryCubit, ProductsCategoryState>(
      builder: (context, state) {
        if (state is ProductsCategorySuccessState) {
          return CustomScrollView(
            slivers: [
              TopSectionProductsCategoryView(
                isDark: _isDark,
                image: widget.category.image,
              ),
              SliverToBoxAdapter(
                child: DirWidget(firstText: widget.category.title),
              ),
              SliverToBoxAdapter(child: SizedBox(height: Dimensions.height12)),
              MidCategorySection(
                isDark: _isDark,
                title: widget.category.title,
              ),
              SliverToBoxAdapter(child: SizedBox(height: Dimensions.height36)),
              ProductsGridView(
                products: state.products,
                isDark: _isDark,
              ),
            ],
          );
        } else if (state is ProductsCategoryFailureState) {
          return CustomErrorWidget(error: state.failure.message);
        } else {
          return const Loading();
        }
      },
    );
  }
}
