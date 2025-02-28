import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  bool get _isDark => context.watch<ThemeCubit>().isDark;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            darkLogo: true,
            bottom: Dimensions.height50,
          ),
          SizedBox(height: Dimensions.height30),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height20,
            ),
            child: Column(
              children: [
                SizedBox(height: Dimensions.height50),
                Text(
                  S.of(context).chicStore,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle32.copyWith(
                    color: _isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                SizedBox(height: Dimensions.height10),
                Text(
                  S.of(context).discoverRoom,
                  style: Styles.textStyle20.copyWith(
                    color: _isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                SizedBox(height: Dimensions.height50),
                TextField(
                  style: const TextStyle(color: AppColors.black),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width63),
                    hintText: S.of(context).search,
                    hintStyle: Styles.hintStyle.copyWith(
                      color: _isDark ? AppColors.white : AppColors.black,
                    ),
                    filled: true,
                    fillColor: _isDark ? AppColors.darkColor : AppColors.white,
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
                Image.asset(
                  _isDark
                      ? AppAssets.bgDarkSearchView
                      : AppAssets.bgLightSearchView,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
