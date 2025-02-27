import 'package:chairy_app/core/shared/cubits/product_count/product_count_cubit.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_category_icon_button.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/custom_button_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterAndShareWidget extends StatefulWidget {
  final bool isDark;
  final ProductEntity product;

  const CounterAndShareWidget({
    super.key,
    required this.isDark,
    required this.product,
  });

  @override
  State<CounterAndShareWidget> createState() => _CounterAndShareWidgetState();
}

class _CounterAndShareWidgetState extends State<CounterAndShareWidget> {
  int get countOfProducts =>
      context.watch<ProductCountCubit>().getCount(widget.product.id!);

  void _incrementCount(BuildContext context) {
    context.read<ProductCountCubit>().increment(
          widget.product.id!,
          widget.product.price!,
          widget.product.quantity!,
        );
  }

  void _decrementCount(BuildContext context) {
    context.read<ProductCountCubit>().decrement(
          widget.product.id!,
          widget.product.price!,
        );
  }

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
                  isDark: widget.isDark,
                  color: widget.isDark ? AppColors.white : AppColors.gray,
                  icon: Icons.add,
                  onClick: () => _incrementCount(context),
                ),
                SizedBox(width: Dimensions.width30),
                Text(
                  "$countOfProducts",
                  style: Styles.textStyle36.copyWith(
                    color: widget.isDark
                        ? AppColors.white
                        : AppColors.midnightBlue,
                  ),
                ),
                SizedBox(width: Dimensions.width30),
                CustomCategoryIconButton(
                  isDark: widget.isDark,
                  color: widget.isDark ? AppColors.white : AppColors.gray,
                  icon: Icons.remove,
                  onClick: () => _decrementCount(context),
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
