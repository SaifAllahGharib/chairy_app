import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:flutter/material.dart';

class TitlePriceDescProductWidget extends StatelessWidget {
  final ProductEntity product;
  final bool isDark;

  const TitlePriceDescProductWidget(
      {super.key, required this.isDark, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                product.title!,
                style: Styles.textStyle36.copyWith(
                    color: isDark ? AppColors.white : AppColors.midnightBlue),
              ),
            ),
            PriceWidget(
              isDark: isDark,
              price: product.price,
              fontSizeIcon: Dimensions.fontSize20,
              fontSizePrice: Dimensions.fontSize30,
            ),
          ],
        ),
        SizedBox(height: Dimensions.height10),
        Text(
          product.description!,
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w400,
            color: isDark ? AppColors.white : AppColors.lightBlack,
          ),
        ),
      ],
    );
  }
}
