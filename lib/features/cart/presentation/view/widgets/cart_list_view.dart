import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/cart/presentation/view/widgets/custom_item_cart_list_view.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  final bool isDark;
  final List<CartEntity> items;

  const CartListView({
    super.key,
    required this.isDark,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      sliver: SliverList.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomItemCartListView(
            isDark: isDark,
            item: items[index],
          );
        },
      ),
    );
  }
}
