import 'package:chairy_app/core/shared/cubits/counter/counter_cubit.dart';
import 'package:chairy_app/core/shared/cubits/counter/counter_state.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/cart/presentation/view/widgets/custom_cart_icon_button.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_cubit.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomItemCartListView extends StatefulWidget {
  final bool isDark;
  final CartEntity item;

  const CustomItemCartListView({
    super.key,
    required this.isDark,
    required this.item,
  });

  @override
  State<CustomItemCartListView> createState() => _CustomItemCartListViewState();
}

class _CustomItemCartListViewState extends State<CustomItemCartListView> {
  String get _token => getIt.get<MySharedPreferences>().getUserToken() ?? "";

  void _getItemsFromCart() {
    context.read<CartCubit>().getItemFromCart(_token);
  }

  void _handleState(state) {
    if (state is CounterIncrementState || state is CounterDecrementState) {
      _getItemsFromCart();
    }
  }

  void _increment() {
    context
        .read<CounterCubit>()
        .increment(_token, widget.item.id, widget.item.quantity);
  }

  void _decrement() {
    context.read<CounterCubit>().decrement(_token, widget.item.id);
  }

  void _removeItemFromCart() {
    context.read<CartCubit>().removeItemFromCart(_token, widget.item.id);
    context.read<CounterCubit>().resetCount(widget.item.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state is CounterLoadingState) return const Loading();

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
                          widget.item.title,
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
                        price: widget.item.subTotal,
                        fontSizeIcon: Dimensions.fontSize14,
                        fontSizePrice: Dimensions.fontSize20,
                      ),
                    ],
                  ),
                  Text(
                    S.of(context).aboutTheChair,
                    style: Styles.textStyle10.copyWith(
                      fontWeight: FontWeight.w400,
                      color: widget.isDark
                          ? AppColors.white
                          : AppColors.lightBlack,
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
                        onClick: () => _increment(),
                        icon: Icons.add,
                      ),
                      SizedBox(width: Dimensions.width20),
                      Text(
                        "${widget.item.quantity}",
                        style: Styles.textStyle12.copyWith(
                          color:
                              widget.isDark ? AppColors.white : AppColors.black,
                        ),
                      ),
                      SizedBox(width: Dimensions.width20),
                      CustomCartIconButton(
                        onClick: () => _decrement(),
                        icon: Icons.remove,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
