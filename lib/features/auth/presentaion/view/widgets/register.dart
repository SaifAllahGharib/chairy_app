import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final bool isDark;

  const Register({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width50),
            child: Column(
              children: [
                Text(
                  "Welcome to Our store",
                  textAlign: TextAlign.center,
                  style: Styles.textStyle36.copyWith(
                    color: isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                Text(
                  "Bringing Your Style Home",
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16.copyWith(
                    color: isDark ? AppColors.white : AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.height20),
          TabBar(
            enableFeedback: false,
            splashFactory: NoSplash.splashFactory,
            dividerColor: Colors.transparent,
            unselectedLabelColor: AppColors.black,
            labelColor: AppColors.primaryColor,
            indicator: BoxDecoration(
              color: AppColors.secColor,
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
            labelStyle:
                Styles.textStyle18.copyWith(color: AppColors.primaryColor),
            unselectedLabelStyle:
                Styles.textStyle18.copyWith(fontWeight: FontWeight.w300),
            tabs: const [
              Tab(text: "Sign in"),
              Tab(text: "Sign up"),
            ],
          ),
          IntrinsicHeight(
            child: TabBarView(
              children: [
                Center(
                    child: Text(
                  "Sign in Page",
                  style: Styles.textStyle18,
                )),
                Center(
                  child: Text(
                    "Sign up Page",
                    style: Styles.textStyle18,
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
