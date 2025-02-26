import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/cart/domain/entities/cart_entity.dart';
import 'package:chairy_app/features/cart/presentation/view/widgets/custom_cart_icon_button.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomItemCartListView extends StatelessWidget {
  final bool isDark;
  final CartEntity product;

  const CustomItemCartListView({
    super.key,
    required this.isDark,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppAssets.chair,
          width: Dimensions.height132,
          height: Dimensions.height132,
        ),
        SizedBox(width: Dimensions.width20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${product.name}",
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w500,
                        color: isDark ? AppColors.white : AppColors.lightBlack,
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width30),
                  PriceWidget(
                    isDark: isDark,
                    price: product.subTotal,
                    fontSizeIcon: Dimensions.fontSize14,
                    fontSizePrice: Dimensions.fontSize20,
                  ),
                ],
              ),
              Text(
                "About the Chair",
                style: Styles.textStyle10.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isDark ? AppColors.white : AppColors.lightBlack,
                ),
              ),
              Row(
                children: [
                  CustomIconButton(
                    onClick: () {},
                    icon: AppAssets.delete,
                  ),
                  SizedBox(width: Dimensions.width34),
                  CustomCartIconButton(
                    onClick: () {},
                    icon: Icons.add,
                  ),
                  SizedBox(width: Dimensions.width20),
                  Text(
                    "1",
                    style: Styles.textStyle12.copyWith(
                      color: isDark ? AppColors.white : AppColors.black,
                    ),
                  ),
                  SizedBox(width: Dimensions.width20),
                  CustomCartIconButton(
                    onClick: () {},
                    icon: Icons.remove,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
