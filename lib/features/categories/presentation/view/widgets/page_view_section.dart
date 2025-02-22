import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';

class PageViewSection extends StatelessWidget {
  const PageViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
            const CustomPageView(),
          ],
        ),
      ),
    );
  }
}
