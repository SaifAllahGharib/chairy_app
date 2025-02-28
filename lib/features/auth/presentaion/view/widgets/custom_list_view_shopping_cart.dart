import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_item_list_view_shopping.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomListViewShoppingCart extends StatelessWidget {
  final List<CartEntity> cart;
  final bool isDark;

  const CustomListViewShoppingCart({
    super.key,
    required this.cart,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.height15),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkColor : AppColors.lightGray,
        borderRadius: BorderRadius.circular(Dimensions.radius23),
      ),
      child: Column(
        children: [
          Text(
            "${S.of(context).yourShoppingCart} (${cart.length})",
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: Dimensions.height500,
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return CustomItemListViewShopping(
                  isDark: isDark,
                  cart: cart[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
