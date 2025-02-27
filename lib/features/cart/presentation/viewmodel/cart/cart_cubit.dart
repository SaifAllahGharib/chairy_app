import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/cart/domain/usecases/get_items_from_cart.dart';
import 'package:chairy_app/features/cart/domain/usecases/remove_item_from_cart.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final GetItemsFromCart _getItemsFromCart;
  final RemoveItemFromCart _removeItemFromCart;
  final MySharedPreferences _mySharedPreferences;

  CartCubit(
    this._getItemsFromCart,
    this._removeItemFromCart,
    this._mySharedPreferences,
  ) : super(CartInitState());

  Future<void> getItemsFromCart(String? token) async {
    emit(CartLoadingState());
    final response = await _getItemsFromCart.call(token);

    response.fold(
      (error) => emit(CartFailureState(error)),
      (cart) => emit(CartGetItemsFromState(cart)),
    );
  }

  Future<void> removeItemFromCart(int itemId) async {
    emit(CartLoadingState());
    final response = await _removeItemFromCart.call(itemId);

    response.fold(
      (error) => emit(CartFailureState(error)),
      (_) {
        _mySharedPreferences.removeKey("item$itemId");
        emit(CartRemoveItemFromCartState());
      },
    );
  }
}
