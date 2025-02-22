import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/categories_list_view.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/mid_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/our_category_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/page_view_section.dart';
import 'package:flutter/material.dart';

class CategoriesViewBody extends StatefulWidget {
  const CategoriesViewBody({super.key});

  @override
  State<CategoriesViewBody> createState() => _CategoriesViewBodyState();
}

class _CategoriesViewBodyState extends State<CategoriesViewBody> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const OurCategoryWidget(),
        SliverToBoxAdapter(child: SizedBox(height: Dimensions.height10)),
        const CategoriesListView(),
        const MidWidget(),
        const PageViewSection(),
      ],
    );
  }
}
