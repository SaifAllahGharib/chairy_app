import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/dir_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/mid_category_section.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/products_grid_view.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/top_section_category_view.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_cubit.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_state.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewBody extends StatefulWidget {
  final int categoryId;

  const CategoryViewBody({super.key, required this.categoryId});

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().fetchProducts(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccessState) {
          return CustomScrollView(
            slivers: [
              const TopSectionCategoryView(),
              SliverToBoxAdapter(
                child: DirWidget(firstText: S.of(context).livingRoom),
              ),
              SliverToBoxAdapter(child: SizedBox(height: Dimensions.height12)),
              const MidCategorySection(),
              SliverToBoxAdapter(child: SizedBox(height: Dimensions.height36)),
              ProductsGridView(products: state.products),
            ],
          );
        }

        if (state is ProductsFailureState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
