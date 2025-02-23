import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/custom_page_view.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class PageViewSection extends StatelessWidget {
  final bool isDark;

  const PageViewSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: isDark ? AppColors.darkColor : AppColors.lightColor,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.height30,
          horizontal: Dimensions.width34,
        ),
        child: Column(
          children: [
            Text(
              S.of(context).someOfOUR,
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width63),
              child: Text(
                S.of(context).featuersWeOfferToYou,
                textAlign: TextAlign.center,
                style: Styles.textStyle36.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isDark ? AppColors.white : AppColors.darkGray,
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
