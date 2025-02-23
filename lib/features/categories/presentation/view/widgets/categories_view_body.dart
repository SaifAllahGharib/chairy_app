import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/widgets/custom_error_widget.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/categories_list_view.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/mid_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/our_category_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/page_view_section.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/categories/categories_cubit.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/categories/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesViewBody extends StatefulWidget {
  const CategoriesViewBody({super.key});

  @override
  State<CategoriesViewBody> createState() => _CategoriesViewBodyState();
}

class _CategoriesViewBodyState extends State<CategoriesViewBody> {
  @override
  void initState() {
    _fetchCategories();
    super.initState();
  }

  void _fetchCategories() {
    context.read<CategoriesCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          return CustomScrollView(
            slivers: [
              const OurCategoryWidget(),
              SliverToBoxAdapter(child: SizedBox(height: Dimensions.height10)),
              CategoriesListView(categories: state.categories),
              const MidWidget(),
              const PageViewSection(),
            ],
          );
        } else if (state is CategoriesFailureState) {
          return CustomErrorWidget(error: state.failure.message);
        } else {
          return const Loading();
        }
      },
    );
  }
}
