import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_cached_network_image.dart';
import 'package:chairy_app/core/widgets/custom_category_icon_button.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:flutter/material.dart';

class ProductsItemGridView extends StatelessWidget {
  final List<ProductEntity> products;
  final int index;
  final bool isDark;

  const ProductsItemGridView({
    super.key,
    required this.products,
    required this.index,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCachedNetworkImage(image: products[index].imageUrl),
        SizedBox(height: Dimensions.height20),
        Text(
          products[index].title,
          style: Styles.textStyle12.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.medGray,
          ),
        ),
        Text(
          products[index].title,
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.white : AppColors.midnightBlue,
          ),
        ),
        SizedBox(height: Dimensions.height44),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PriceWidget(
              isDark: isDark,
              price: products[index].price,
            ),
            CustomCategoryIconButton(
              isDark: isDark,
              color: isDark ? AppColors.white : AppColors.midnightBlue,
              icon: Icons.add,
              onClick: () {},
            ),
          ],
        ),
      ],
    );
  }
}
