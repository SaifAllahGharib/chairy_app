import 'package:chairy_app/core/shared/cubits/product_count/product_count_cubit.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/cart/presentation/view/widgets/custom_cart_icon_button.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_cubit.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomItemCartListView extends StatefulWidget {
  final bool isDark;
  final CartEntity product;

  const CustomItemCartListView({
    super.key,
    required this.isDark,
    required this.product,
  });

  @override
  State<CustomItemCartListView> createState() => _CustomItemCartListViewState();
}

class _CustomItemCartListViewState extends State<CustomItemCartListView> {
  int get _countOfProducts =>
      BlocProvider.of<ProductCountCubit>(context).getCount(widget.product.id);

  void _getCart() {
    context
        .read<CartCubit>()
        .getItemsFromCart(getIt.get<MySharedPreferences>().getUserToken());
  }

  void _incrementProductCount() {
    context.read<ProductCountCubit>().increment(
          widget.product.id,
          getIt
                  .get<MySharedPreferences>()
                  .getDouble("productPrice${widget.product.id}") ??
              0,
          _countOfProducts,
        );

    _getCart();
  }

  void _decrementProductCount() {
    context.read<ProductCountCubit>().decrement(
          widget.product.id,
          getIt
                  .get<MySharedPreferences>()
                  .getDouble("productPrice${widget.product.id}") ??
              0,
        );

    _getCart();
  }

  void _removeItemFromCart() {
    context.read<CartCubit>().removeItemFromCart(widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppAssets.chair,
          width: Dimensions.height132,
          height: Dimensions.height132,
        ),
        SizedBox(width: Dimensions.width20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${widget.product.name}",
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w500,
                        color: widget.isDark
                            ? AppColors.white
                            : AppColors.lightBlack,
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width30),
                  PriceWidget(
                    isDark: widget.isDark,
                    price: widget.product.subTotal,
                    fontSizeIcon: Dimensions.fontSize14,
                    fontSizePrice: Dimensions.fontSize20,
                  ),
                ],
              ),
              Text(
                "About the Chair",
                style: Styles.textStyle10.copyWith(
                  fontWeight: FontWeight.w400,
                  color: widget.isDark ? AppColors.white : AppColors.lightBlack,
                ),
              ),
              Row(
                children: [
                  CustomIconButton(
                    onClick: () => _removeItemFromCart(),
                    icon: AppAssets.delete,
                  ),
                  SizedBox(width: Dimensions.width34),
                  CustomCartIconButton(
                    onClick: () => _incrementProductCount(),
                    icon: Icons.add,
                  ),
                  SizedBox(width: Dimensions.width20),
                  Text(
                    "${widget.product.quantity}",
                    style: Styles.textStyle12.copyWith(
                      color: widget.isDark ? AppColors.white : AppColors.black,
                    ),
                  ),
                  SizedBox(width: Dimensions.width20),
                  CustomCartIconButton(
                    onClick: () => _decrementProductCount(),
                    icon: Icons.remove,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
