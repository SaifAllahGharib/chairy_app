import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/widgets/custom_error_widget.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/dir_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/mid_category_section.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/products_grid_view.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/top_section_category_view.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_cubit.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_state.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsProductsCategoryViewBody extends StatefulWidget {
  final int categoryId;

  const ProductsProductsCategoryViewBody({super.key, required this.categoryId});

  @override
  State<ProductsProductsCategoryViewBody> createState() =>
      _ProductsProductsCategoryViewBodyState();
}

class _ProductsProductsCategoryViewBodyState
    extends State<ProductsProductsCategoryViewBody> {
  @override
  void initState() {
    _fetchProductsCategory();
    super.initState();
  }

  void _fetchProductsCategory() {
    context.read<ProductsCategoryCubit>().fetchProducts(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCategoryCubit, ProductsCategoryState>(
      builder: (context, state) {
        if (state is ProductsCategorySuccessState) {
          return CustomScrollView(
            slivers: [
              const TopSectionProductsCategoryView(),
              SliverToBoxAdapter(
                child: DirWidget(firstText: S.of(context).livingRoom),
              ),
              SliverToBoxAdapter(child: SizedBox(height: Dimensions.height12)),
              const MidCategorySection(),
              SliverToBoxAdapter(child: SizedBox(height: Dimensions.height36)),
              ProductsGridView(products: state.products),
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
