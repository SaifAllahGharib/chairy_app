import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/more_info_widget.dart';
import 'package:flutter/material.dart';

class MidWidget extends StatelessWidget {
  const MidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppAssets.ourCategory2),
            Align(
              alignment: Alignment.center,
              child: Image.asset(AppAssets.bgImageCategories),
            ),
            SizedBox(
              height: Dimensions.height500,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width20),
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
    );
  }
}
