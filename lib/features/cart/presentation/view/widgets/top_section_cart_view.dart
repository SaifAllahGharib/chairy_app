import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class TopSectionCartView extends StatelessWidget {
  final bool isDark;

  const TopSectionCartView({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Center(child: Image.asset(AppAssets.bgCart)),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: Dimensions.height100),
                Text(
                  S.of(context).yourCart,
                  style: Styles.textStyle36.copyWith(
                    color: isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                Text(
                  S.of(context).reviewYourItems,
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
    );
  }
}
