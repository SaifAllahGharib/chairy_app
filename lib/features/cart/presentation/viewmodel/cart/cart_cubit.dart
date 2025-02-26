import 'package:chairy_app/features/cart/domain/entities/cart_entity.dart';
import 'package:chairy_app/features/cart/domain/usecases/add_item_to_cart.dart';
import 'package:chairy_app/features/cart/domain/usecases/get_items_from_cart.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final AddItemToCart _addItemToCart;
  final GetItemsFromCart _getItemsFromCart;

  CartCubit(this._addItemToCart, this._getItemsFromCart)
      : super(CartInitState());

  Future<void> addItemToCart(CartEntity item, String? token) async {
    emit(CartLoadingState());
    final response = await _addItemToCart.call(item, token);

    response.fold(
      (error) => emit(CartFailureState(error)),
      (r) => emit(CartAddItemToCartState()),
    );
  }

  Future<void> getItemsFromCart(String? token) async {
    emit(CartLoadingState());
    final response = await _getItemsFromCart.call(token);

    response.fold(
      (error) => emit(CartFailureState(error)),
      (cart) => emit(CartGetItemsFromState(cart)),
    );
  }
}
