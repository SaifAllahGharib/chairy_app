import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/custom_category_icon_button.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:flutter/material.dart';

class ProductsItemGridView extends StatelessWidget {
  const ProductsItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AppAssets.chair,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        SizedBox(height: Dimensions.height20),
        Text(
          "Chair",
          style: Styles.textStyle12.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.medGray,
          ),
        ),
        Text(
          "Anjay Chair",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.midnightBlue,
          ),
        ),
        SizedBox(height: Dimensions.height44),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PriceWidget(),
            CustomCategoryIconButton(
              color: AppColors.midnightBlue,
              icon: Icons.add,
              onClick: () {},
            ),
          ],
        ),
      ],
    );
  }
}
