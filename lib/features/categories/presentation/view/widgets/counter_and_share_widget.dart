import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_category_icon_button.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/custom_button_share.dart';
import 'package:flutter/material.dart';

class CounterAndShareWidget extends StatelessWidget {
  final bool isDark;

  const CounterAndShareWidget({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomCategoryIconButton(
                  isDark: isDark,
                  color: isDark ? AppColors.white : AppColors.gray,
                  icon: Icons.add,
                  onClick: () {},
                ),
                SizedBox(width: Dimensions.width30),
                Text(
                  "1",
                  style: Styles.textStyle36.copyWith(
                    color: isDark ? AppColors.white : AppColors.midnightBlue,
                  ),
                ),
                SizedBox(width: Dimensions.width30),
                CustomCategoryIconButton(
                  isDark: isDark,
                  color: isDark ? AppColors.white : AppColors.gray,
                  icon: Icons.remove,
                  onClick: () {},
                ),
              ],
            ),
            const CustomButtonShare(),
          ],
        )
      ],
    );
  }
}
