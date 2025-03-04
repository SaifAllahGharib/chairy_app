import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/core/widgets/empty_widget.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/cart/presentation/view/widgets/bottom_sec_cart_view.dart';
import 'package:chairy_app/features/cart/presentation/view/widgets/cart_list_view.dart';
import 'package:chairy_app/features/cart/presentation/view/widgets/top_section_cart_view.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_cubit.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_state.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  bool get _isDark => context.watch<ThemeCubit>().isDark;

  String? get _token => getIt.get<MySharedPreferences>().getUserToken();

  List<CartEntity> get cart => BlocProvider.of<CartCubit>(context).cart;

  double totalPrice = 0;

  @override
  void initState() {
    _getItemsFromCart();

    super.initState();
  }

  void _getItemsFromCart() {
    context.read<CartCubit>().getItemFromCart(_token);
  }

  void _getItemsFromCartSuccess(state) {
    if (cart.isNotEmpty) {
      totalPrice = 0;

      for (CartEntity item in cart) {
        getIt.get<MySharedPreferences>().storeInt(
              "countOfItem${item.id}",
              item.quantity,
            );

        totalPrice += item.subTotal;
      }
    }
  }

  void _handleState(state) {
    print("CURRENT STATE: $state");

    if (state is CartGetItemsFromCartState) {
      _getItemsFromCartSuccess(state);
    } else if (state is CartFailureState) {
      snackBar(
        context: context,
        text: S.of(context).failedToGetCashedItems,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Loading();
        }

        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CustomAppBar(darkLogo: true)),
            TopSectionCartView(isDark: _isDark),
            if (cart.isNotEmpty)
              CartListView(
                isDark: _isDark,
                items: cart,
              )
            else
              const SliverToBoxAdapter(child: EmptyWidget()),
            if (cart.isNotEmpty)
              BottomSecCartView(
                isDark: _isDark,
                cart: cart,
                totalPrice: totalPrice,
              )
          ],
        );
      },
    );
  }
}
