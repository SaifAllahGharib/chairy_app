import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final bool isDark;

  const CustomTabBar({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      enableFeedback: false,
      splashFactory: NoSplash.splashFactory,
      dividerColor: Colors.transparent,
      unselectedLabelColor: isDark ? AppColors.white : AppColors.black,
      labelColor: AppColors.primaryColor,
      indicator: BoxDecoration(
        color: isDark ? AppColors.darkColor : AppColors.secColor,
        border: Border(
          bottom: BorderSide(
            color: AppColors.primaryColor,
            width: Dimensions.height10 * 0.35,
          ),
        ),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: AppColors.primaryColor,
      indicatorWeight: Dimensions.height10 * 0.35,
      dividerHeight: 0,
      labelStyle: Styles.textStyle18.copyWith(color: AppColors.primaryColor),
      unselectedLabelStyle: Styles.textStyle18.copyWith(
        fontWeight: FontWeight.w300,
        color: isDark ? AppColors.white : AppColors.black,
      ),
      tabs: [
        Tab(text: S.of(context).signIn),
        Tab(text: S.of(context).signUp),
      ],
    );
  }
}
