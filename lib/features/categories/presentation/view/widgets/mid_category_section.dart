import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class MidCategorySection extends StatelessWidget {
  final bool isDark;
  final String title;

  const MidCategorySection({
    super.key,
    required this.isDark,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: Dimensions.height277 * 1.3,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Image.asset(
                AppAssets.ourCategory1,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${S.of(context).all} $title",
                    style: Styles.textStyle36.copyWith(
                        color: isDark ? AppColors.white : AppColors.black),
                  ),
                  Text(
                    S.of(context).sofasArmchairs,
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isDark ? AppColors.white : AppColors.lightBlack,
                    ),
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
