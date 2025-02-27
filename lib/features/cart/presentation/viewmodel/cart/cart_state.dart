import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';

abstract class CartState {}

class CartInitState extends CartState {}

class CartLoadingState extends CartState {}

class CartGetItemsFromState extends CartState {
  final List<CartEntity> cart;

  CartGetItemsFromState(this.cart);
}

class CartRemoveItemFromCartState extends CartState {}

class CartFailureState extends CartState {
  final Failure failure;

  CartFailureState(this.failure);
}
