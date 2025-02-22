import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double? fontSizePrice;
  final double? fontSizeIcon;

  const PriceWidget({
    super.key,
    this.fontSizePrice,
    this.fontSizeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "€",
          style: Styles.textStyle10.copyWith(
            color: AppColors.midnightBlue,
            fontWeight: FontWeight.bold,
            fontSize: fontSizeIcon,
          ),
        ),
        Text(
          "325",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.midnightBlue,
            fontSize: fontSizePrice,
          ),
        ),
      ],
    );
  }
}
