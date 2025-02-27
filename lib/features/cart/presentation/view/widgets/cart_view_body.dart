import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
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
  List<CartEntity> products = [];

  @override
  void initState() {
    _getItems();

    super.initState();
  }

  void _getItems() {
    context
        .read<CartCubit>()
        .getItemsFromCart(getIt.get<MySharedPreferences>().getUserToken());
  }

  void _handleState(state) {
    if (state is CartGetItemsFromState) {
      products.clear();
      products = state.cart;
    } else if (state is CartRemoveItemFromCartState) {
      snackBar(
        context: context,
        text: "Remove item successfully",
        color: AppColors.primaryColor,
      );

      _getItems();
    } else if (state is CartFailureState) {
      snackBar(
        context: context,
        text: state.failure.message,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state is CartLoadingState) return const Loading();

        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CustomAppBar(darkLogo: true)),
            TopSectionCartView(isDark: _isDark),
            if (products.isNotEmpty)
              CartListView(
                isDark: _isDark,
                products: products,
              )
            else
              const SliverToBoxAdapter(child: EmptyWidget()),
            if (products.isNotEmpty) BottomSecCartView(isDark: _isDark)
          ],
        );
      },
    );
  }
}
