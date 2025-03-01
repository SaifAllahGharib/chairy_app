import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomItemListViewShopping extends StatelessWidget {
  final CartEntity cart;
  final bool isDark;

  const CustomItemListViewShopping({
    super.key,
    required this.cart,
    required this.isDark,
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
              Text(
                cart.title,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isDark ? AppColors.white : AppColors.lightBlack,
                ),
              ),
              Text(
                S.of(context).aboutTheChair,
                style: Styles.textStyle10.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isDark ? AppColors.white : AppColors.lightBlack,
                ),
              ),
              SizedBox(height: Dimensions.height36),
              PriceWidget(
                isDark: isDark,
                price: cart.subTotal,
                fontSizeIcon: Dimensions.fontSize14,
                fontSizePrice: Dimensions.fontSize20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
