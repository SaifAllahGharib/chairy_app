import 'dart:ui';

import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/viewmodels/local_cubit/local.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/more_info_widget.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left:
                  context.read<LocalCubit>().isArabic ? 0 : Dimensions.height20,
              right:
                  context.read<LocalCubit>().isArabic ? Dimensions.height20 : 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Our\nCategories",
                  style: Styles.textStyle42,
                ),
                Expanded(child: Image.asset(AppAssets.ourCategory1)),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: Dimensions.height10)),
        SliverList.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.height73),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radius23),
                    child: Image.asset(AppAssets.test),
                  ),
                  SizedBox(height: Dimensions.height30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).livingRoom,
                          style: Styles.textStyle24,
                        ),
                        SizedBox(height: Dimensions.height20),
                        Text(
                          "Sofas, loveseats, armchairs, coffee tables, end tables, entertainment centers, bookshelves.",
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.w300,
                            color: AppColors.darkGray,
                          ),
                        ),
                        SizedBox(height: Dimensions.height14),
                        const MoreInfoWidget(),
                        SizedBox(height: Dimensions.height20),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppAssets.ourCategory2),
                Image.asset(AppAssets.bgImageCategories),
                SizedBox(
                  height: Dimensions.height500,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Furnish Your Dreams, Choose Wisely",
                              style: Styles.textStyle36.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGray,
                              ),
                            ),
                            SizedBox(height: Dimensions.height10 * 0.4),
                            Text(
                              "Discover quality furniture, curated styles, and exceptional service at Our Store. We make furnishing your home easy and enjoyable.",
                              style: Styles.textStyle16.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGray,
                              ),
                            ),
                            SizedBox(height: Dimensions.height10),
                            const MoreInfoWidget(),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: Dimensions.height50 * 2.5,
                        child: Image.asset(AppAssets.ourCategory3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: AppColors.lightColor,
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.height30,
              horizontal: Dimensions.width34,
            ),
            child: Column(
              children: [
                Text(
                  "SOME OF OUR",
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width63),
                  child: Text(
                    "Featuers We Offer To You",
                    textAlign: TextAlign.center,
                    style: Styles.textStyle36.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkGray,
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height15),
                Stack(
                  children: [
                    Image.asset(AppAssets.bgSlider),
                    Positioned(
                      top: Dimensions.height132 * 1.35,
                      right: Dimensions.height132 * 1.1,
                      child: Container(
                        width: Dimensions.height66,
                        height: Dimensions.height66,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height63 / 2),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 11, sigmaY: 11),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Dimensions.height30,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width18,
                        ),
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height63 / 2),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 11, sigmaY: 11),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width63),
                              child: Column(
                                children: [
                                  SizedBox(height: Dimensions.height44),
                                  Text(
                                    "Extensive Catalog",
                                    textAlign: TextAlign.center,
                                    style: Styles.textStyle18,
                                  ),
                                  SizedBox(height: Dimensions.height30),
                                  Text(
                                    "A wide selection of furniture styles, categories, and price points.",
                                    textAlign: TextAlign.center,
                                    style: Styles.textStyle14.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.darkGray,
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height63),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
