import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/shared/cubits/product_count/product_count_cubit.dart';
import 'package:chairy_app/core/shared/cubits/product_count/product_count_state.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_cached_network_image.dart';
import 'package:chairy_app/core/widgets/custom_category_icon_button.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsItemGridView extends StatelessWidget {
  final ProductEntity product;
  final bool isDark;

  const ProductsItemGridView({
    super.key,
    required this.product,
    required this.isDark,
  });

  void _incrementCount(BuildContext context) {
    final String? msg = context.read<ProductCountCubit>().increment(
      product.id,
      product.quantity,
      [
        S.of(context).thisQuantityIsOnlyAvailable,
        S.of(context).outOfStock,
      ],
    );

    if (msg != null) {
      snackBar(context: context, text: msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCachedNetworkImage(image: product.imageUrl),
        SizedBox(height: Dimensions.height20),
        Text(
          product.title,
          style: Styles.textStyle12.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.medGray,
          ),
        ),
        Text(
          product.title,
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.white : AppColors.midnightBlue,
          ),
        ),
        SizedBox(height: Dimensions.height44),
        BlocBuilder<ProductCountCubit, ProductCountState>(
          builder: (context, state) {
            final count =
                context.watch<ProductCountCubit>().getCount(product.id);

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceWidget(
                  isDark: isDark,
                  price: product.price,
                ),
                count == 0
                    ? CustomCategoryIconButton(
                        isDark: isDark,
                        color:
                            isDark ? AppColors.white : AppColors.midnightBlue,
                        icon: Icons.add,
                        onClick: () => _incrementCount(context),
                      )
                    : Container(
                        padding: EdgeInsets.all(Dimensions.height15 * 0.8),
                        decoration: BoxDecoration(
                          color:
                              isDark ? AppColors.white : AppColors.midnightBlue,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "$count",
                          style: Styles.textStyle20.copyWith(
                            color: isDark ? AppColors.black : AppColors.white,
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ],
    );
  }
}
