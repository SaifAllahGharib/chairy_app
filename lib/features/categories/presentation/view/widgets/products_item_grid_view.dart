import 'package:chairy_app/core/shared/cubits/product_count/product_count_cubit.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_cached_network_image.dart';
import 'package:chairy_app/core/widgets/custom_category_icon_button.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsItemGridView extends StatefulWidget {
  final ProductEntity product;
  final bool isDark;

  const ProductsItemGridView({
    super.key,
    required this.product,
    required this.isDark,
  });

  @override
  State<ProductsItemGridView> createState() => _ProductsItemGridViewState();
}

class _ProductsItemGridViewState extends State<ProductsItemGridView> {
  int get count =>
      context.watch<ProductCountCubit>().getCount(widget.product.id!);

  void _incrementCount(BuildContext context) {
    context.read<ProductCountCubit>().increment(
          widget.product.id!,
          widget.product.price!,
          widget.product.quantity!,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCachedNetworkImage(image: widget.product.imageUrl!),
        SizedBox(height: Dimensions.height20),
        Text(
          widget.product.title!,
          style: Styles.textStyle12.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.medGray,
          ),
        ),
        Text(
          widget.product.title!,
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
            color: widget.isDark ? AppColors.white : AppColors.midnightBlue,
          ),
        ),
        SizedBox(height: Dimensions.height44),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PriceWidget(
              isDark: widget.isDark,
              price: widget.product.price,
            ),
            count == 0
                ? CustomCategoryIconButton(
                    isDark: widget.isDark,
                    color: widget.isDark
                        ? AppColors.white
                        : AppColors.midnightBlue,
                    icon: Icons.add,
                    onClick: () => _incrementCount(context),
                  )
                : Container(
                    padding: EdgeInsets.all(Dimensions.height15 * 0.8),
                    decoration: BoxDecoration(
                      color: widget.isDark
                          ? AppColors.white
                          : AppColors.midnightBlue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "$count",
                      style: Styles.textStyle20.copyWith(
                        color:
                            widget.isDark ? AppColors.black : AppColors.white,
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
