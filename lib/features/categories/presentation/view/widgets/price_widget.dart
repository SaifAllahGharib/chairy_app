import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double? fontSizePrice;
  final double? fontSizeIcon;
  final bool isDark;
  final num price;

  const PriceWidget({
    super.key,
    this.fontSizePrice,
    this.fontSizeIcon,
    this.isDark = false,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "€",
          style: Styles.textStyle10.copyWith(
            color: isDark ? AppColors.white : AppColors.midnightBlue,
            fontWeight: FontWeight.bold,
            fontSize: fontSizeIcon,
          ),
        ),
        Text(
          "$price",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.white : AppColors.midnightBlue,
            fontSize: fontSizePrice,
          ),
        ),
      ],
    );
  }
}
