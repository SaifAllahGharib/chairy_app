import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/cart/domain/usecases/get_items_from_cart.dart';
import 'package:chairy_app/features/cart/domain/usecases/remove_item_from_cart.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final GetItemsFromCart _getItemsFromCart;
  final RemoveItemFromCart _removeItemFromCart;
  final MySharedPreferences _mySharedPreferences;

  List<CartEntity> _list = [];

  CartCubit(
    this._getItemsFromCart,
    this._removeItemFromCart,
    this._mySharedPreferences,
  ) : super(CartInitState());

  Future<void> getItemFromCart(String? token) async {
    emit(CartLoadingState());

    final response = await _getItemsFromCart.call(token);

    response.fold(
      (error) => emit(CartFailureState(error)),
      (items) {
        _list = items;
        emit(CartGetItemsFromCartState(_list));
      },
    );
  }

  Future<void> removeItemFromCart(String? token, int itemId) async {
    emit(CartLoadingState());

    final response = await _removeItemFromCart.call(token, itemId);

    response.fold(
      (error) => emit(CartFailureState(error)),
      (_) async {
        emit(CartRemoveItemFromCartState());

        await Future.wait([
          _mySharedPreferences.removeKeysContaining("countOfItem"),
          getItemFromCart(token),
        ]);
      },
    );
  }

  List<CartEntity> get cart => _list;
}
