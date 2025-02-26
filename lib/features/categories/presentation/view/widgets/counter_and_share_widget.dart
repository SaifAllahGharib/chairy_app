import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/shared/cubits/product_count/product_count_cubit.dart';
import 'package:chairy_app/core/shared/cubits/product_count/product_count_state.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_category_icon_button.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/custom_button_share.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterAndShareWidget extends StatelessWidget {
  final bool isDark;
  final int productId;
  final int productQuantity;

  const CounterAndShareWidget({
    super.key,
    required this.isDark,
    required this.productId,
    required this.productQuantity,
  });

  void _incrementCount(BuildContext context) {
    final String? msg = context.read<ProductCountCubit>().increment(
      productId,
      productQuantity,
      [
        S.of(context).thisQuantityIsOnlyAvailable,
        S.of(context).outOfStock,
      ],
    );

    if (msg != null) {
      snackBar(context: context, text: msg);
    }
  }

  void _decrementCount(BuildContext context) {
    context.read<ProductCountCubit>().decrement(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ProductCountCubit, ProductCountState>(
              builder: (context, state) {
                final count =
                    context.watch<ProductCountCubit>().getCount(productId);

                return Row(
                  children: [
                    CustomCategoryIconButton(
                      isDark: isDark,
                      color: isDark ? AppColors.white : AppColors.gray,
                      icon: Icons.add,
                      onClick: () => _incrementCount(context),
                    ),
                    SizedBox(width: Dimensions.width30),
                    Text(
                      "$count",
                      style: Styles.textStyle36.copyWith(
                        color:
                            isDark ? AppColors.white : AppColors.midnightBlue,
                      ),
                    ),
                    SizedBox(width: Dimensions.width30),
                    CustomCategoryIconButton(
                      isDark: isDark,
                      color: isDark ? AppColors.white : AppColors.gray,
                      icon: Icons.remove,
                      onClick: () => _decrementCount(context),
                    ),
                  ],
                );
              },
            ),
            const CustomButtonShare(),
          ],
        )
      ],
    );
  }
}
