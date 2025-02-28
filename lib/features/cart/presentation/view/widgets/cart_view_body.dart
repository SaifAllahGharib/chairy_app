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

  List<CartEntity> items = [];

  @override
  void initState() {
    _getItemsFromCart();

    super.initState();
  }

  void _getItemsFromCart() {
    context.read<CartCubit>().getItemFromCart(_token);
  }

  void _handleState(state) {
    if (state is CartGetItemsFromCartState) {
      if (state.items.isNotEmpty) {
        items = state.items;

        for (CartEntity item in items) {
          getIt.get<MySharedPreferences>().storeInt(
                "countOfItem${item.id}",
                item.quantity,
              );
        }
      }
    } else if (state is CartFailureState) {
      snackBar(
        context: context,
        text: "Failed to get cashed items",
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
            if (items.isNotEmpty)
              CartListView(
                isDark: _isDark,
                items: items,
              )
            else
              const SliverToBoxAdapter(child: EmptyWidget()),
            if (items.isNotEmpty)
              BottomSecCartView(
                isDark: _isDark,
                cart: items,
              )
          ],
        );
      },
    );
  }
}
