import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
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
  final PageController pageController = PageController();

  @override
  void initState() {
    context.read<CategoriesCubit>().fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return const CircularProgressIndicator();
        }

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

          return Center(
            child: Image.network(
                "http://test-ecomerce.xn--hrt-w-ova.de/${state.categories[0].image}"),
          );
          return Center(
            child: Text(
              'RESPONSE: ${state.categories[0].image}',
              style: Styles.textStyle20.copyWith(color: Colors.black),
            ),
          );
        }

        // print(state.errorMessage);
        return Center(
            child: Text(
          'ERROR: ',
          style: Styles.textStyle20.copyWith(color: Colors.black),
        ));
        // if (state is CategoriesFailureState) {
        // }
      },
    );
  }
}
