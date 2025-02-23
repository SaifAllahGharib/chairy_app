import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/viewmodels/local_cubit/local.dart';
import 'package:chairy_app/core/viewmodels/theme_cubit/theme_cubit.dart';
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
  bool get _isDark => context.watch<ThemeCubit>().isDark;

  bool get _isArabic => context.watch<LocalCubit>().isArabic;

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
              OurCategoryWidget(
                isDark: _isDark,
                isArabic: _isArabic,
              ),
              SliverToBoxAdapter(child: SizedBox(height: Dimensions.height10)),
              CategoriesListView(
                categories: state.categories,
                isDark: _isDark,
              ),
              MidWidget(isDark: _isDark),
              PageViewSection(isDark: _isDark),
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
