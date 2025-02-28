import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/cart/domain/usecases/get_cashed_item_from_cart.dart';
import 'package:chairy_app/features/cart/domain/usecases/remove_item_from_cart.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final GetCashedItemFromCart _getCashedItemFromCart;
  final RemoveItemFromCart _removeItemFromCart;
  final MySharedPreferences _mySharedPreferences;

  CartCubit(
    this._getCashedItemFromCart,
    this._removeItemFromCart,
    this._mySharedPreferences,
  ) : super(CartInitState());

  Future<void> getItemFromCart(String? token) async {
    emit(CartLoadingState());

    final response = await _getCashedItemFromCart.call(token);

    response.fold(
      (error) => emit(CartFailureState(error)),
      (items) => emit(CartGetItemsFromCartState(items)),
    );
  }

  Future<void> removeItemFromCart(String? token, int itemId) async {
    emit(CartLoadingState());

    final response = await _removeItemFromCart.call(token, itemId);

    response.fold(
      (error) => emit(CartFailureState(error)),
      (_) async {
        await Future.wait([
          _mySharedPreferences.removeKeysContaining("countOfItem"),
          getItemFromCart(token),
        ]);

        emit(CartRemoveItemFromCartState());
      },
    );
  }
}
