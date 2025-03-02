import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/search_type.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/categories_list_view.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/core/widgets/empty_widget.dart';
import 'package:chairy_app/core/widgets/products_grid_view.dart';
import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/categories/categories_cubit.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_cubit.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:chairy_app/features/search/presentation/view/widgets/top_section_search.dart';
import 'package:chairy_app/features/search/presentation/viewmodel/search/search_cubit.dart';
import 'package:chairy_app/features/search/presentation/viewmodel/search/search_state.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  final SearchType? searchType;

  const SearchViewBody({
    super.key,
    required this.searchType,
  });

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  bool get _isDark => context.watch<ThemeCubit>().isDark;

  bool get _isSearching => context.watch<SearchCubit>().isSearching;

  List<CategoryEntity> _categories = [];
  List<ProductEntity> _products = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchGetCategoriesState) {
          _categories = state.categories;
        } else if (state is SearchGetProductsState) {
          _products = state.products;
        }
      },
      builder: (context, state) {
        final categoriesCategoryCubit =
            context.watch<CategoriesCubit>().categories;
        final productsCategoryCubit =
            context.watch<ProductsCategoryCubit>().products;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                darkLogo: true,
                bottom: Dimensions.height50,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: Dimensions.height30)),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height20,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    TopSectionSearch(isDark: _isDark),
                    SizedBox(height: Dimensions.height50),
                    TextField(
                      onChanged: (value) {
                        context.read<SearchCubit>().search(
                              categoriesCategoryCubit,
                              productsCategoryCubit,
                              value,
                              widget.searchType,
                            );
                      },
                      style: TextStyle(
                        color: _isDark ? AppColors.white : AppColors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width63),
                        hintText: S.of(context).search,
                        hintStyle: Styles.hintStyle.copyWith(
                          color: _isDark ? AppColors.white : AppColors.black,
                        ),
                        filled: true,
                        fillColor:
                            _isDark ? AppColors.darkColor : AppColors.white,
                        suffixIcon: CustomIconButton(
                          onClick: () {},
                          icon: _isDark
                              ? AppAssets.lightSearch
                              : AppAssets.darkSearch,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20 * 20),
                          borderSide: const BorderSide(
                            color: AppColors.primaryColor,
                            width: 0.3,
                          ),
                          // gapPadding: Dimensions.height10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20 * 20),
                          borderSide: const BorderSide(
                            color: AppColors.primaryColor,
                            width: 0.3,
                          ),
                          // gapPadding: Dimensions.height10,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height50),
                  ],
                ),
              ),
            ),
            widget.searchType != null && _isSearching
                ? widget.searchType == SearchType.categories
                    ? _categories.isNotEmpty
                        ? CategoriesListView(
                            isDark: _isDark,
                            categories: _categories,
                          )
                        : emptyWidget()
                    : widget.searchType == SearchType.products
                        ? _products.isNotEmpty
                            ? ProductsGridView(
                                isDark: _isDark,
                                products: _products,
                              )
                            : emptyWidget()
                        : staticImage()
                : staticImage(),
          ],
        );
      },
    );
  }

  Widget staticImage() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.height20,
      ),
      sliver: SliverToBoxAdapter(
        child: Image.asset(
          _isDark ? AppAssets.bgDarkSearchView : AppAssets.bgLightSearchView,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget emptyWidget() {
    return const SliverToBoxAdapter(
      child: EmptyWidget(),
    );
  }
}
