import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:flutter/material.dart';

class TitlePriceDescProductWidget extends StatelessWidget {
  const TitlePriceDescProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Baltsar Chair",
              style: Styles.textStyle36.copyWith(color: AppColors.midnightBlue),
            ),
            PriceWidget(
              fontSizeIcon: Dimensions.fontSize20,
              fontSizePrice: Dimensions.fontSize30,
            ),
          ],
        ),
        Text(
          "As the name suggests it, this is the ‘jack of all trades’ of chairs; it goes in any room, with any design and serves multiple purposes that go with all upholstery options. L45 x D47 x H90 cm ",
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.lightBlack,
          ),
        ),
      ],
    );
  }
}
