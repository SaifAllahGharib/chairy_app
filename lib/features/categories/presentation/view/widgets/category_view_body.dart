import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/viewmodels/local_cubit/local.dart';
import 'package:chairy_app/core/widgets/custom_close_button.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/dir_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/mid_category_section.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/products_grid_view.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/top_section_category_view.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Align(
            alignment: context.read<LocalCubit>().isArabic
                ? Alignment.topRight
                : Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: Dimensions.height50,
                left: Dimensions.height20,
                right: Dimensions.height20,
              ),
              child: const CustomCloseButton(),
            ),
          ),
        ),
        const TopSectionCategoryView(),
        SliverToBoxAdapter(
          child: DirWidget(firstText: S.of(context).livingRoom),
        ),
        SliverToBoxAdapter(child: SizedBox(height: Dimensions.height12)),
        const MidCategorySection(),
        SliverToBoxAdapter(child: SizedBox(height: Dimensions.height36)),
        const ProductsGridView(),
      ],
    );
  }
}
