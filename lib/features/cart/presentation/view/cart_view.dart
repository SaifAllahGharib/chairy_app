import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/cart/domain/usecases/get_cashed_item_from_cart.dart';
import 'package:chairy_app/features/cart/domain/usecases/remove_item_from_cart.dart';
import 'package:chairy_app/features/cart/presentation/view/widgets/cart_view_body.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(
        getIt.get<GetCashedItemFromCart>(),
        getIt.get<RemoveItemFromCart>(),
        getIt.get<MySharedPreferences>(),
      ),
      child: const Scaffold(body: CartViewBody()),
    );
  }
}
