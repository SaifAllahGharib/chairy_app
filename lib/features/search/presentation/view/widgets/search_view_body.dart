import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.height20,
          vertical: Dimensions.height50,
        ),
        child: Column(
          children: [
            const CustomAppBar(searchOrMenu: true),
            SizedBox(height: Dimensions.height50),
            Text(
              S.of(context).chicStore,
              style: Styles.textStyle32,
            ),
            SizedBox(height: Dimensions.height10),
            Text(
              S.of(context).discoverRoom,
              style: Styles.textStyle20,
            ),
            SizedBox(height: Dimensions.height50),
            TextField(
              style: const TextStyle(color: AppColors.black),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: Dimensions.width63),
                hintText: S.of(context).search,
                hintStyle: Styles.hintStyle,
                suffixIcon: CustomIconButton(
                  onClick: () {},
                  icon: AppAssets.darkSearch,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius20 * 20),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 0.3,
                  ),
                  // gapPadding: Dimensions.height10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius20 * 20),
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
              AppAssets.bgSearchView,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
